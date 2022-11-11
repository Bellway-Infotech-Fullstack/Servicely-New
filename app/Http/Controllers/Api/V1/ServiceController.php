<?php

namespace App\Http\Controllers\Api\V1;

use App\CentralLogics\Helpers;
use App\CentralLogics\ServiceLogic;
use App\CentralLogics\RestaurantLogic;
use App\CentralLogics\VendorLogic;
use App\Http\Controllers\Controller;
use App\Models\Service;
use App\Models\Vendor;
use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class ServiceController extends Controller
{
    public function get_latest_products(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'vendor_id' => 'required',
            'category_id' => 'required',
            'limit' => 'required',
            'offset' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $type = $request->query('type', 'all'); 

        $products = ServiceLogic::get_latest_products($request['limit'], $request['offset'], $request['vendor_id'], $request['category_id'], $type);
        $products['products'] = Helpers::product_data_formatting($products['products'], true);
        return response()->json($products, 200);
    }

    public function get_searched_products(Request $request)
    {
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => 'Zone id is required!']);
            return response()->json([
                'errors' => $errors
            ], 403);
        }
        $validator = Validator::make($request->all(), [
            'name' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }
        $zone_id= $request->header('zoneId');

        $key = explode(' ', $request['name']);
        
        $limit = $request['limit']??10;
        $offset = $request['offset']??1;

        $type = $request->query('type', 'all'); 

        $products = Service::active()->type($type)
        ->with(['rating'])
        ->whereHas('vendor', function($q)use($zone_id){
            $q->where('zone_id', $zone_id);
        })
        ->when($request->category_id, function($query)use($request){
            $query->whereHas('category',function($q)use($request){
                return $q->whereId($request->category_id)->orWhere('parent_id', $request->category_id);
            });
        })
        ->when($request->vendor_id, function($query) use($request){
            return $query->where('vendor_id', $request->vendor_id);
        })
        ->where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('name', 'like', "%{$value}%");
            }
        })
        ->paginate($limit, ['*'], 'page', $offset);

        $data =  [
            'total_size' => $products->total(),
            'limit' => $limit,
            'offset' => $offset,
            'products' => $products->items()
        ];

        $data['products'] = Helpers::product_data_formatting($data['products'], true);
        return response()->json($data, 200);
    }

    public function get_popular_products(Request $request)
    {
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => 'Zone id is required!']);
            return response()->json([
                'errors' => $errors
            ], 403);
        }

        $type = $request->query('type', 'all');

        $zone_id= $request->header('zoneId');
        $products = ServiceLogic::popular_products($zone_id, $request['limit'], $request['offset'], $type);
        $products['products'] = Helpers::product_data_formatting($products['products'], true);
        return response()->json($products, 200);
    }    
    
    public function get_most_reviewed_products(Request $request)
    {
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => 'Zone id is required!']);
            return response()->json([
                'errors' => $errors
            ], 403);
        }

        $type = $request->query('type', 'all');

        $zone_id= $request->header('zoneId');
        $products = ServiceLogic::most_reviewed_products($zone_id, $request['limit'], $request['offset'], $type);
        $products['products'] = Helpers::product_data_formatting($products['products'], true);
        return response()->json($products, 200);
    }

    public function get_product($id)
    {

        try {
            $product = ServiceLogic::get_product($id);
            $product = Helpers::product_data_formatting($product, false);
            return response()->json($product, 200);
        } catch (\Exception $e) {
            return response()->json([
                'errors' => ['code' => 'product-001', 'message' => trans('messages.not_found')]
            ], 404);
        }
    }

    public function get_related_products($id)
    {   
        if (Service::find($id)) {
            $products = ServiceLogic::get_related_products($id);
            $products = Helpers::product_data_formatting($products, true);
            return response()->json($products, 200);
        }
        return response()->json([
            'errors' => ['code' => 'product-001', 'message' => trans('messages.not_found')]
        ], 404);
    }

    public function get_set_menus()
    {
        try {
            $products = Helpers::product_data_formatting(Service::active()->with(['rating'])->where(['set_menu' => 1, 'status' => 1])->get(), true);
            return response()->json($products, 200);
        } catch (\Exception $e) {
            return response()->json([
                'errors' => ['code' => 'product-001', 'message' => 'Set menu not found!']
            ], 404);
        }
    }

    public function get_product_reviews($service_id)
    {
        $reviews = Review::with(['customer'])->where(['service_id' => $service_id])->active()->get();

        $storage = [];
        foreach ($reviews as $item) {
            $item['attachment'] = json_decode($item['attachment']);
            array_push($storage, $item);
        }

        return response()->json($storage, 200);
    }

    public function get_product_rating($id)
    {
        try {
            $service = Service::find($id);
            $overallRating = ServiceLogic::get_overall_rating($service->reviews);
            return response()->json(floatval($overallRating[0]), 200);
        } catch (\Exception $e) {
            return response()->json(['errors' => $e], 403);
        }
    }

    public function submit_product_review(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'service_id' => 'required',
            'order_id' => 'required',
            'comment' => 'required',
            'rating' => 'required|numeric|max:5',
        ]);

        $product = Service::find($request->service_id);
        if (isset($product) == false) {
            $validator->errors()->add('service_id', trans('messages.food_not_found'));
        }

        $multi_review = Review::where(['service_id' => $request->service_id, 'user_id' => $request->user()->id, 'order_id'=>$request->order_id])->first();
        if (isset($multi_review)) {
            return response()->json([
                'errors' => [ 
                    ['code'=>'review','message'=> trans('messages.already_submitted')]
                ]
            ], 403);
        } else {
            $review = new Review;
        }

        if ($validator->errors()->count() > 0) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $image_array = [];
        if (!empty($request->file('attachment'))) {
            foreach ($request->file('attachment') as $image) {
                if ($image != null) {
                    if (!Storage::disk('public')->exists('review')) {
                        Storage::disk('public')->makeDirectory('review');
                    }
                    array_push($image_array, Storage::disk('public')->put('review', $image));
                }
            }
        }

        $review->user_id = $request->user()->id;
        $review->service_id = $request->service_id;
        $review->order_id = $request->order_id;
        $review->comment = $request->comment;
        $review->rating = $request->rating;
        $review->attachment = json_encode($image_array);
        $review->save();

        if($product->vendor)
        {
            $vendor_rating = VendorLogic::update_restaurant_rating(json_decode($product->vendor->rating, true), $request->rating);
            $product->vendor->rating = $vendor_rating;
            $product->vendor->save();
        }

        return response()->json(['message' => 'successfully review submitted!'], 200);
    }
}
