<?php

namespace App\Http\Controllers\Api\V1\Vendor;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\Service;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;
use App\CentralLogics\Helpers;
use App\CentralLogics\ProductLogic;

class ServiceController extends Controller
{

    public function store(Request $request)
    {
        // if(!$request->vendor->restaurants[0]->food_section)
        // {
        //     return response()->json([
        //         'errors'=>[
        //             ['code'=>'unauthorized', 'message'=>trans('messages.permission_denied')]
        //         ]
        //     ],403);
        // }
        
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'category_id' => 'required',
            'image' => 'required',
            'price' => 'required|numeric|min:0.01',
            'description' => 'max:1000',
            'discount' => 'required|numeric|min:0',
            'veg' => 'required|boolean',
        ], [
            'name.required' => trans('messages.product_name_required'),
            'category_id.required' => trans('messages.category_required'),
        ]);

        if ($request['discount_type'] == 'percent') {
            $dis = ($request['price'] / 100) * $request['discount'];
        } else {
            $dis = $request['discount'];
        }

        if ($request['price'] <= $dis) {
            $validator->getMessageBag()->add('unit_price', trans('messages.discount_can_not_be_more_than_or_equal'));
        }

        if ($request['price'] <= $dis || $validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)]);
        }

        $service = new Service;
        $service->name = $request->name;

        $category = [];
        if ($request->category_id != null) {
            array_push($category, [
                'id' => $request->category_id,
                'position' => 1,
            ]);
        }
        if ($request->sub_category_id != null) {
            array_push($category, [
                'id' => $request->sub_category_id,
                'position' => 2,
            ]);
        }
        if ($request->sub_sub_category_id != null) {
            array_push($category, [
                'id' => $request->sub_sub_category_id,
                'position' => 3,
            ]);
        }
        $service->category_id = $request->sub_category_id?$request->sub_category_id:$request->category_id;
        $service->category_ids = json_encode($category);
        $service->description = $request->description;

        $choice_options = [];
        if ($request->has('choice')) {
            foreach (json_decode($request->choice_no) as $key => $no) {
                $str = 'choice_options_' . $no;
                if ($request[$str][0] == null) {
                    $validator->getMessageBag()->add('name', trans('messages.attribute_choice_option_value_can_not_be_null'));
                    return response()->json(['errors' => Helpers::error_processor($validator)]);
                }
                $item['name'] = 'choice_' . $no;
                $item['title'] = json_decode($request->choice)[$key];
                $item['options'] = explode(',', implode('|', preg_replace('/\s+/', ' ', json_decode($request[$str]))));
                array_push($choice_options, $item);
            }
        }
        $service->choice_options = json_encode($choice_options);
        $variations = [];
        $options = [];
        if ($request->has('choice_no')) {
            foreach (json_decode($request->choice_no) as $key => $no) {
                $name = 'choice_options_' . $no;
                $my_str = implode('|', json_decode($request[$name]));
                array_push($options, explode(',', $my_str));
            }
        }
        //Generates the combinations of customer choice options
        $combinations = Helpers::combinations($options);
        if (count($combinations[0]) > 0) {
            foreach ($combinations as $key => $combination) {
                $str = '';
                foreach ($combination as $k => $item) {
                    if ($k > 0) {
                        $str .= '-' . str_replace(' ', '', $item);
                    } else {
                        $str .= str_replace(' ', '', $item);
                    }
                }
                $item = [];
                $item['type'] = $str;
                $item['price'] = abs($request['price_' . str_replace('.', '_', $str)]);
                array_push($variations, $item);
            }
        }
        //combinations end
        $service->variations = json_encode($variations);
        $service->price = $request->price;
        $service->image = Helpers::upload('service/', 'png', $request->file('image'));
        $service->available_time_starts = $request->available_time_starts;
        $service->available_time_ends = $request->available_time_ends;
        $service->discount = $request->discount_type == 'amount' ? $request->discount : $request->discount;
        $service->discount_type = $request->discount_type;
        $service->attributes = $request->has('attribute_id') ? $request->attribute_id : json_encode([]);
        $service->add_ons = $request->has('addon_ids') ? $request->addon_ids : json_encode([]);
        $service->vendor_id = $request['vendor']->id;
        $service->veg = $request->veg;
        $service->save();

        return response()->json(['message'=>trans('messages.product_added_successfully')], 200);
    }


    public function status(Request $request)
    {
        // if(!$request->vendor->restaurants[0]->food_section)
        // {
        //     return response()->json([
        //         'errors'=>[
        //             ['code'=>'unauthorized', 'message'=>trans('messages.permission_denied')]
        //         ]
        //     ],403);
        // }

        $validator = Validator::make($request->all(), [
            'id' => 'required',
            'status' => 'required|boolean',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $service = Service::find($request->id);
        $service->status = $request->status;
        $service->save();

        return response()->json(['message' => trans('messages.product_status_updated')], 200);
    }

    public function update(Request $request)
    {
        // if(!$request->vendor->restaurants[0]->food_section)
        // {
        //     return response()->json([
        //         'errors'=>[
        //             ['code'=>'unauthorized', 'message'=>trans('messages.permission_denied')]
        //         ]
        //     ],403);
        // }

        $validator = Validator::make($request->all(), [
            'id' => 'required',
            'name' => 'required',
            'category_id' => 'required',
            'price' => 'required|numeric|min:0.01',
            'description' => 'max:1000',
            'discount' => 'required|numeric|min:0',
            'veg' => 'required|boolean',
        ], [
            'name.required' => trans('messages.product_name_required'),
            'category_id.required' => trans('messages.category_required'),
        ]);

        if ($request['discount_type'] == 'percent') {
            $dis = ($request['price'] / 100) * $request['discount'];
        } else {
            $dis = $request['discount'];
        }

        if ($request['price'] <= $dis) {
            $validator->getMessageBag()->add('unit_price', trans('messages.discount_can_not_be_more_than_or_equal'));
        }

        if ($request['price'] <= $dis || $validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)]);
        }

        $p = Service::findOrFail($request->id);

        $p->name = $request->name;

        $category = [];
        if ($request->category_id != null) {
            array_push($category, [
                'id' => $request->category_id,
                'position' => 1,
            ]);
        }
        if ($request->sub_category_id != null) {
            array_push($category, [
                'id' => $request->sub_category_id,
                'position' => 2,
            ]);
        }
        if ($request->sub_sub_category_id != null) {
            array_push($category, [
                'id' => $request->sub_sub_category_id,
                'position' => 3,
            ]);
        }

        $p->category_id = $request->sub_category_id?$request->sub_category_id:$request->category_id;
        $p->category_ids = json_encode($category);
        $p->description = $request->description;

        $choice_options = [];
        if ($request->has('choice')) {
            foreach (json_decode($request->choice_no) as $key => $no) {
                $str = 'choice_options_' . $no;
                if (json_decode($request[$str])[0] == null) {
                    $validator->getMessageBag()->add('name', trans('messages.attribute_choice_option_value_can_not_be_null'));
                    return response()->json(['errors' => Helpers::error_processor($validator)]);
                }
                $item['name'] = 'choice_' . $no;
                $item['title'] = json_decode($request->choice)[$key];
                $item['options'] = explode(',', implode('|', preg_replace('/\s+/', ' ', json_decode($request[$str]))));
                array_push($choice_options, $item);
            }
        }
        $p->choice_options = json_encode($choice_options);
        $variations = [];
        $options = [];
        if ($request->has('choice_no')) {
            foreach (json_decode($request->choice_no) as $key => $no) {
                $name = 'choice_options_' . $no;
                $my_str = implode('|', json_decode($request[$name]));
                array_push($options, explode(',', $my_str));
            }
        }
        //Generates the combinations of customer choice options
        $combinations = Helpers::combinations($options);
        if (count($combinations[0]) > 0) {
            foreach ($combinations as $key => $combination) {
                $str = '';
                foreach ($combination as $k => $item) {
                    if ($k > 0) {
                        $str .= '-' . str_replace(' ', '', $item);
                    } else {
                        $str .= str_replace(' ', '', $item);
                    }
                }
                $item = [];
                $item['type'] = $str;
                $item['price'] = abs($request['price_' . str_replace('.', '_', $str)]);
                array_push($variations, $item);
            }
        }
        //combinations end
        $p->variations = json_encode($variations);
        $p->price = $request->price;
        $p->image = $request->has('image') ? Helpers::update('service/', $p->image, 'png', $request->file('image')) : $p->image;
        $p->available_time_starts = $request->available_time_starts;
        $p->available_time_ends = $request->available_time_ends;
        $p->discount = $request->discount_type == 'amount' ? $request->discount : $request->discount;
        $p->discount_type = $request->discount_type;
        $p->attributes = $request->has('attribute_id') ? $request->attribute_id : json_encode([]);
        $p->add_ons = $request->has('addon_ids') ? $request->addon_ids : json_encode([]);
        $p->veg = $request->veg;
        $p->save();

        return response()->json(['message'=>trans('messages.product_updated_successfully')], 200);
    }

    public function delete(Request $request)
    {
        // if(!$request->vendor->restaurants[0]->food_section)
        // {
        //     return response()->json([
        //         'errors'=>[
        //             ['code'=>'unauthorized', 'message'=>trans('messages.permission_denied')]
        //         ]
        //     ],403);
        // }
        $service = Service::findOrFail($request->id);

        if($service->image)
        {
            if (Storage::disk('public')->exists('service/' . $service['image'])) {
                Storage::disk('public')->delete('service/' . $service['image']);
            }
        }

        $service->delete();

        return response()->json(['message'=>trans('messages.product_deleted_successfully')], 200);
    }


    public function search(Request $request)
    {
        
        $validator = Validator::make($request->all(), [
            'name' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $key = explode(' ', $request['name']);

        $services = Service::active()
        ->with(['rating'])
        ->where('vendor_id', $request['vendor']->id)
        ->when($request->category_id, function($query)use($request){
            $query->whereHas('category',function($q)use($request){
                return $q->whereId($request->category_id)->orWhere('parent_id', $request->category_id);
            });
        })
        // ->when($request->restaurant_id, function($query) use($request){
        //     return $query->where('restaurant_id', $request->restaurant_id);
        // })
        ->where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('name', 'like', "%{$value}%");
            }
        })
        ->limit(50)
        ->get();

        $data = Helpers::product_data_formatting($services, true);
        return response()->json($data, 200);
    }

}
