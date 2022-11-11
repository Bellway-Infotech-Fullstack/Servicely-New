<?php

namespace App\Http\Controllers\Api\V1;

use App\CentralLogics\Helpers;
use App\CentralLogics\VendorLogic;
use App\Http\Controllers\Controller;
use App\Models\Restaurant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Review;
use Illuminate\Support\Facades\DB;

class VendorController extends Controller
{
    public function get_restaurants(Request $request, $filter_data="all")
    {
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => trans('messages.zone_id_required')]);
            return response()->json([
                'errors' => $errors
            ], 403);
        }

        $type = $request->query('type', 'all');
        $zone_id= $request->header('zoneId');
        $vendors = VendorLogic::get_restaurants($request['limit'], $request['offset'], $zone_id, $filter_data, $type);
        $vendors['vendors'] = Helpers::restaurant_data_formatting($vendors['vendors'], true);

        return response()->json($vendors, 200);
    }

    public function get_latest_restaurants(Request $request, $filter_data="all")
    {
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => trans('messages.zone_id_required')]);
            return response()->json([
                'errors' => $errors
            ], 403);
        }

        $type = $request->query('type', 'all');

        $zone_id= $request->header('zoneId');
        $vendors = VendorLogic::get_latest_restaurants($request['limit'], $request['offset'], $zone_id, $type);
        $vendors['vendors'] = Helpers::restaurant_data_formatting($vendors['vendors'], true);

        return response()->json($vendors['vendors'], 200);
    }

    public function get_popular_restaurants(Request $request)
    {
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => trans('messages.zone_id_required')]);
            return response()->json([
                'errors' => $errors
            ], 403);
        }

        $type = $request->query('type', 'all');
        $zone_id= $request->header('zoneId');
        $vendors = VendorLogic::get_popular_restaurants($request['limit'], $request['offset'], $zone_id, $type);
        $vendors['vendors'] = Helpers::restaurant_data_formatting($vendors['vendors'], true);

        return response()->json($vendors['vendors'], 200);
    }

    public function get_details($id)
    {
        $vendor = VendorLogic::get_restaurant_details($id);
        if($vendor)
        {
            $category_ids = DB::table('services')
            ->join('categories', 'services.category_id', '=', 'categories.id')
            ->selectRaw('IF((categories.position = "0"), categories.id, categories.parent_id) as categories')
            ->where('services.vendor_id', $id)
            ->where('categories.status',1)
            ->groupBy('categories')
            ->get();
            // dd($category_ids->pluck('categories'));
            $vendor = Helpers::restaurant_data_formatting($vendor);
            $vendor['category_ids'] = array_map('intval', $category_ids->pluck('categories')->toArray());
        }
        return response()->json($vendor, 200);
    }

    public function get_searched_restaurants(Request $request)
    {
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => trans('messages.zone_id_required')]);
            return response()->json([
                'errors' => $errors
            ], 403);
        }
        $validator = Validator::make($request->all(), [
            'name' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }
        
        $type = $request->query('type', 'all');

        $zone_id= $request->header('zoneId');
        $vendors = VendorLogic::search_restaurants($request['name'], $zone_id, $request->category_id,$request['limit'], $request['offset'], $type);
        $vendors['vendors'] = Helpers::restaurant_data_formatting($vendors['vendors'], true);
        return response()->json($vendors, 200);
    }

    public function reviews(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'vendor_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }
        $id = $request['vendor_id'];


        $reviews = Review::with(['customer', 'service'])
        ->whereHas('service', function($query)use($id){
            return $query->where('vendor_id', $id);
        })
        ->active()->get();

        $storage = [];
        foreach ($reviews as $item) {
            $item['attachment'] = json_decode($item['attachment']);
            $item['service_name'] = $item->service->name;
            unset($item['service']);
            array_push($storage, $item);
        }

        return response()->json($storage, 200);
    }

    // public function get_product_rating($id)
    // {
    //     try {
    //         $product = Food::find($id);
    //         $overallRating = ProductLogic::get_overall_rating($product->reviews);
    //         return response()->json(floatval($overallRating[0]), 200);
    //     } catch (\Exception $e) {
    //         return response()->json(['errors' => $e], 403);
    //     }
    // }

}
