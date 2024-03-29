<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Restaurant;
use App\Models\Service;
use App\Models\Admin;
use App\Models\Discount;
use App\Models\Vendor;
use App\Models\Zone;
use App\Models\AddOn;
use App\Models\WithdrawRequest;
use App\Models\RestaurantWallet;
use App\Models\AdminWallet;
use App\Models\AccountTransaction;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;
use Grimzy\LaravelMysqlSpatial\Types\Point;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use App\CentralLogics\Helpers;
use App\CentralLogics\VendorLogic;
use Rap2hpoutre\FastExcel\FastExcel;


class VendorController extends Controller
{
    public function index()
    {
        return view('admin-views.vendor.index');
    }


    public function store(Request $request)
    {

        





        $validator = Validator::make($request->all(), [
            'f_name' => 'required',
            'l_name' => 'required',
            'address' => 'required',
            // 'kyc' => 'required',
            'aadhaar_card_number' => 'required|numeric',
            'pan_card_number' => 'required|alpha_num',
            'latitude' => 'required',
            'longitude' => 'required',
            'bank_name' => 'required',
            'branch' => 'required',
            'holder_name' => 'required',
            'account_no' => 'required',
            'ifsc_code' => 'required',
            
            'email' => 'required|unique:vendors',
            'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:10|unique:vendors',
            'minimum_delivery_time' => 'required|regex:/^([0-9]{2})$/|min:2|max:2',
            'maximum_delivery_time' => 'required|regex:/^([0-9]{2})$/|min:2|max:2',
            'password' => 'required|min:6',
            'zone_id' => 'required|exists:zones,id',
            'cover_photo' => 'nullable|image|max:3072|mimes:png,jpg,jpeg',
            'aadhaar_back_image' => 'nullable|image|max:3072|mimes:png,jpg,jpeg',
            'aadhaar_front_image' => 'nullable|image|max:3072|mimes:png,jpg,jpeg',
            'pan_card_image' => 'nullable|image|max:3072|mimes:png,jpg,jpeg',
            'logo' => 'required',
            // 'tax' => 'required',
        ], [
            'f_name.required' => trans('messages.first_name_is_required')
        ]);

        // if($request->zone_id)
        // {
        //     $point = new Point($request->latitude, $request->longitude);
        //     $zone = Zone::contains('coordinates', $point)->where('id', $request->zone_id)->first();
        //     if(!$zone){
        //         $validator->getMessageBag()->add('latitude', 'Coordinates out of zone!');
        //         return back()->withErrors($validator)
        //                 ->withInput();
        //     }
        // }
        if ($validator->fails()) {
            return back()
                ->withErrors($validator)
                ->withInput();
        }
        $vendor = new Vendor();
        $vendor->f_name = $request->f_name;
        $vendor->l_name = $request->l_name;
        $vendor->email = $request->email;
        $vendor->phone = $request->phone;
        $vendor->password = bcrypt($request->password);
        // $vendor->kyc = $request->phone;
        $vendor->aadhaar_card_number = $request->phone;
        $vendor->pan_card_number = $request->phone;

        $vendor->bank_name = $request->bank_name;
        $vendor->branch = $request->branch;
        $vendor->holder_name = $request->holder_name;
        $vendor->account_no = $request->account_no;
        $vendor->ifsc_code = $request->ifsc_code;

        $vendor->image = Helpers::upload('restaurant/', 'png', $request->file('logo'));
        $vendor->cover_photo = Helpers::upload('restaurant/cover/', 'png', $request->file('cover_photo'));
        $vendor->address = $request->address;

        $vendor->aadhaar_front_image = Helpers::upload('restaurant/identity/', 'png', $request->file('aadhaar_front_image'));
        $vendor->aadhaar_back_image = Helpers::upload('restaurant/identity/', 'png', $request->file('aadhaar_back_image'));
        $vendor->pan_card_image = Helpers::upload('restaurant/identity/', 'png', $request->file('pan_card_image'));

        $vendor->latitude = $request->latitude;
        $vendor->longitude = $request->longitude;
        $vendor->zone_id = $request->zone_id;
        // $vendor->tax = $request->tax;
        $vendor->delivery_time = $request->minimum_delivery_time .'-'. $request->maximum_delivery_time;
        $vendor->save();

        // $restaurant->zones()->attach($request->zone_ids);
        Toastr::success(trans('messages.vendor').trans('messages.added_successfully'));
        return redirect('admin/vendor/list');
    }

    public function edit($id)
    {
        if(env('APP_MODE')=='demo' && $id == 2)
        {
            Toastr::warning(trans('messages.you_can_not_edit_this_restaurant_please_add_a_new_restaurant_to_edit'));
            return back();
        }

        $vendor = Vendor::find($id);
        return view('admin-views.vendor.edit', compact('vendor'));
    }








    public function update(Request $request, Vendor $vendor)
    {
        $validator = Validator::make($request->all(), [
            'f_name' => 'required',
            'l_name' => 'required',
            'email' => 'required|unique:vendors,email,'.$vendor->id,
            'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:10|unique:vendors,phone,'.$vendor->id,
            'zone_id' => 'required|exists:zones,id',
            'latitude' => 'required',
            'longitude' => 'required',
            // 'tax' => 'required',
            'bank_name' => 'required',
            'branch' => 'required',
            'holder_name' => 'required',
            'account_no' => 'required',
            'ifsc_code' => 'required',
            'aadhaar_card_number' => 'required|numeric',
            'pan_card_number' => 'required|alpha_num',
            'password' => 'nullable|min:6',
            'cover_photo' => 'nullable|image|max:3072|mimes:png,jpg,jpeg',
            'aadhaar_back_image' => 'nullable|image|max:3072|mimes:png,jpg,jpeg',
            'aadhaar_front_image' => 'nullable|image|max:3072|mimes:png,jpg,jpeg',
            'pan_card_image' => 'nullable|image|max:3072|mimes:png,jpg,jpeg',
            'logo' => 'nullable|image|max:3072|mimes:png,jpg,jpeg',
            'minimum_delivery_time' => 'required|regex:/^([0-9]{2})$/|min:2|max:2',
            'maximum_delivery_time' => 'required|regex:/^([0-9]{2})$/|min:2|max:2',
        ], [
            'f_name.required' => 'First name is required!',
            'l_name.required' => 'Last name is required!'
        ]);


        // if($request->zone_id)
        // {
        //     $point = new Point($request->latitude, $request->longitude);
        //     $zone = Zone::contains('coordinates', $point)->where('id', $request->zone_id)->first();
        //     if(!$zone){
        //         $validator->getMessageBag()->add('latitude', 'Coordinates out of zone!');
        //         return back()->withErrors($validator)
        //                 ->withInput();
        //     }
        // }

        



        if ($validator->fails()) {
            return back()
                    ->withErrors($validator)
                    ->withInput();
        }
        $vendor = Vendor::findOrFail($vendor->id);
        $vendor->f_name = $request->f_name;
        $vendor->l_name = $request->l_name;
        $vendor->email = $request->email;
        $vendor->phone = $request->phone;
        // $vendor->kyc = $request->kyc;
        $vendor->aadhaar_card_number = $request->aadhaar_card_number;
        $vendor->pan_card_number = $request->pan_card_number;

        $vendor->bank_name = $request->bank_name;
        $vendor->branch = $request->branch;
        $vendor->holder_name = $request->holder_name;
        $vendor->account_no = $request->account_no;
        $vendor->ifsc_code = $request->ifsc_code;

        $vendor->password = strlen($request->password)>1?bcrypt($request->password):$vendor->password;
        $vendor->address = $request->address;
        $vendor->latitude = $request->latitude;
        $vendor->longitude = $request->longitude;
        $vendor->cover_photo = $request->has('cover_photo') ? Helpers::update('restaurant/cover/', $vendor->cover_photo, 'png', $request->file('cover_photo')) : $vendor->cover_photo;

        $vendor->aadhaar_front_image = $request->has('aadhaar_front_image') ? Helpers::update('restaurant/identity/', $vendor->aadhaar_front_image, 'png', $request->file('aadhaar_front_image')) : $vendor->aadhaar_front_image;

        $vendor->aadhaar_back_image = $request->has('aadhaar_back_image') ? Helpers::update('restaurant/identity/', $vendor->aadhaar_back_image, 'png', $request->file('aadhaar_back_image')) : $vendor->aadhaar_back_image;

        $vendor->pan_card_image = $request->has('pan_card_image') ? Helpers::update('restaurant/identity/', $vendor->pan_card_image, 'png', $request->file('pan_card_image')) : $vendor->pan_card_image;

        $vendor->image = $request->has('logo') ? Helpers::update('restaurant/', $vendor->logo, 'png', $request->file('logo')) : $vendor->image;
        // $vendor->tax = $request->tax;
        $vendor->zone_id = $request->zone_id;
        $vendor->delivery_time = $request->minimum_delivery_time .'-'. $request->maximum_delivery_time;
        $vendor->save();

        
        // // $restaurant->zones()->sync($request->zone_ids);
        // $restaurant->save();
        Toastr::success(trans('messages.restaurant').trans('messages.updated_successfully'));
        return redirect('admin/vendor/list');
    }

    public function destroy(Request $request, Vendor $vendor)
    {
        if(env('APP_MODE')=='demo' && $vendor->id == 2)
        {
            Toastr::warning(trans('messages.you_can_not_delete_this_restaurant_please_add_a_new_restaurant_to_delete'));
            return back();
        }
        if (Storage::disk('public')->exists('restaurant/' . $restaurant['logo'])) {
            Storage::disk('public')->delete('restaurant/' . $restaurant['logo']);
        }
        $vendor->delete();

        $vendor = Vendor::findOrFail($vendor->id);
        $vendor->delete();
        Toastr::success(trans('messages.restaurant').' '.trans('messages.removed'));
        return back();
    }

    public function view(Vendor $vendor, $tab=null, $sub_tab='cash')
    {
        $wallet = $vendor->wallet;
        if(!$wallet)
        {
            $wallet= new RestaurantWallet(); //using for vendor model
            $wallet->vendor_id = $vendor->id;
            $wallet->total_earning= 0.0;
            $wallet->total_withdrawn=0.0;
            $wallet->pending_withdraw=0.0;
            $wallet->created_at=now();
            $wallet->updated_at=now();
            $wallet->save();
        }
        if($tab == 'settings')
        {
            return view('admin-views.vendor.view.settings', compact('vendor'));
        }
        else if($tab == 'order')
        {
            return view('admin-views.vendor.view.order', compact('vendor'));
        }
        else if($tab == 'service')
        {
            return view('admin-views.vendor.view.product', compact('vendor'));
        }
        else if($tab == 'discount')
        {
            return view('admin-views.vendor.view.discount', compact('vendor'));
        }
        else if($tab == 'transaction')
        {
            return view('admin-views.vendor.view.transaction', compact('vendor', 'sub_tab'));
        }

        else if($tab == 'reviews')
        {
            return view('admin-views.vendor.view.review', compact('vendor', 'sub_tab'));
        }
        return view('admin-views.vendor.view.index', compact('vendor', 'wallet'));
    }

    public function view_tab(Vendor $vendor)
    {

        Toastr::error(trans('messages.unknown_tab'));
        return back();
    }

    public function list(Request $request)
    {
        $zone_id = $request->query('zone_id', 'all');
        $type = $request->query('type', 'all');
        // $vendors = Vendor::when(is_numeric($zone_id), function($query)use($zone_id){
        //         return $query->where('zone_id', $zone_id);
        // })
        // ->with('vendor')->type($type)->latest()->paginate(config('default_pagination'));
        $vendors = Vendor::when(is_numeric($zone_id), function($query)use($zone_id){
                return $query->where('zone_id', $zone_id);
        })
        ->latest()->paginate(config('default_pagination'));
        $zone = is_numeric($zone_id)?Zone::findOrFail($zone_id):null;
        return view('admin-views.vendor.list', compact('vendors', 'zone','type'));
    }

    public function search(Request $request){
        $key = explode(' ', $request['search']);
        $restaurants=Vendor::orWhereHas('vendor',function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('f_name', 'like', "%{$value}%")
                    ->orWhere('l_name', 'like', "%{$value}%")
                    ->orWhere('email', 'like', "%{$value}%")
                    ->orWhere('phone', 'like', "%{$value}%");
            }
        })
        ->where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('name', 'like', "%{$value}%")
                    ->orWhere('email', 'like', "%{$value}%")
                    ->orWhere('phone', 'like', "%{$value}%");
            }
        })->get();
        $total=$restaurants->count();
        return response()->json([
            'view'=>view('admin-views.vendor.partials._table',compact('restaurants'))->render(), 'total'=>$total
        ]);
    }


    public function get_services(Request $request){

        

         $zone_ids = isset($request->zone_ids)?(count($request->zone_ids)>0?$request->zone_ids:[]):0;
        // $data = Vendor::join('zones', 'zones.id', '=', 'vendors.zone_id')
        // ->when($zone_ids, function($query) use($zone_ids){
        //     $query->whereIn('services.zone_id', $zone_ids);
        // })->where('services.name', 'like', '%'.$request->q.'%')->limit(8)->get([DB::raw('services.id as id, CONCAT(vendors.f_name, " (", zones.name,")") as text')]);

        $data = Service::query()
        ->join('vendors', 'vendors.id','services.vendor_id')
        ->whereHas('vendor', function($q) use($zone_ids) {
            $q->when($zone_ids != 0, function($q) use($zone_ids) {
                $q->whereIn('vendors.zone_id', $zone_ids);
            });
        })
        ->when($request->q, function($q) use($request) {
            $q->where('services.name', 'like', '%'.$request->q.'%');
        })
        ->limit(8)
        ->get([DB::raw('services.id as id, CONCAT(vendors.f_name, " (", services.name,")") as text')]);

        if(isset($request->all))
        {
            $data[]=(object)['id'=>'all', 'text'=>'All'];
        }
        return response()->json($data);
    }

    public function get_restaurants(Request $request){
        $zone_ids = isset($request->zone_ids)?(count($request->zone_ids)>0?$request->zone_ids:[]):0;
        $data = Vendor::join('zones', 'zones.id', '=', 'vendors.zone_id')
        ->when($zone_ids, function($query) use($zone_ids){
            $query->whereIn('vendors.zone_id', $zone_ids);
        })->where('vendors.f_name', 'like', '%'.$request->q.'%')->limit(8)->get([DB::raw('vendors.id as id, CONCAT(vendors.f_name, " (", zones.name,")") as text')]);
        if(isset($request->all))
        {
            $data[]=(object)['id'=>'all', 'text'=>'All'];
        }
        return response()->json($data);
    }

    public function status(Vendor $restaurant, Request $request)
    {
        $restaurant->status = $request->status;
        $restaurant->save();
        $vendor = $restaurant->vendor;

        try
        {
            if($request->status == 0)
            {   $vendor->auth_token = null;
                if(isset($vendor->fcm_token))
                {
                    $data = [
                        'title' => trans('messages.suspended'),
                        'description' => trans('messages.your_account_has_been_suspended'),
                        'order_id' => '',
                        'image' => '',
                        'type'=> 'block'
                    ];
                    Helpers::send_push_notif_to_device($vendor->fcm_token, $data);
                    DB::table('user_notifications')->insert([
                        'data'=> json_encode($data),
                        'vendor_id'=>$vendor->id,
                        'created_at'=>now(),
                        'updated_at'=>now()
                    ]);
                }

            }

        }
        catch (\Exception $e) {
            Toastr::warning(trans('messages.push_notification_faild'));
        }

        Toastr::success(trans('messages.restaurant').trans('messages.status_updated'));
        return back();
    }
    
    public function restaurant_status(Vendor $restaurant, Request $request)
    {
        if((($request->menu == "delivery" && $restaurant->take_away==0) || ($request->menu == "take_away" && $restaurant->delivery==0)) &&  $request->status == 0 )
        {
            Toastr::warning(trans('messages.can_not_disable_both_take_away_and_delivery'));
            return back();
        }

        if((($request->menu == "veg" && $restaurant->non_veg==0) || ($request->menu == "non_veg" && $restaurant->veg==0)) &&  $request->status == 0 )
        {
            Toastr::warning(trans('messages.veg_non_veg_disable_warning'));
            return back();
        }

        $restaurant[$request->menu] = $request->status;
        $restaurant->save();
        Toastr::success(trans('messages.restaurant').trans('messages.settings_updated'));
        return back();
    }

    public function discountSetup(Vendor $restaurant, Request $request)
    {
        $message=trans('messages.discount');
        $message .= $restaurant->discount?trans('messages.updated_successfully'):trans('messages.added_successfully');
        $restaurant->discount()->updateOrinsert(
        [
            'restaurant_id' => $restaurant->id
        ],
        [
            'start_date' => $request->start_date,
            'end_date' => $request->end_date,
            'start_time' => $request->start_time,
            'end_time' => $request->end_time,
            'min_purchase' => $request->min_purchase != null ? $request->min_purchase : 0,
            'max_discount' => $request->max_discount != null ? $request->max_discount : 0,
            'discount' => $request->discount_type == 'amount' ? $request->discount : $request['discount'],
            'discount_type' => 'percent'
        ]
        );
        return response()->json(['message'=>$message], 200);
    }

    public function updateVendorSettings(Vendor $restaurant, Request $request)
    {
        $request->validate([
            'minimum_order'=>'required',
            'opening_time'=>'required',
            'closeing_time'=>'required',
            'comission'=>'required',
            'tax'=>'required',
            'minimum_delivery_time' => 'required|regex:/^([0-9]{2})$/|min:2|max:2',
            'maximum_delivery_time' => 'required|regex:/^([0-9]{2})$/|min:2|max:2',
        ]);

        if($request->comission_status)
        {
            $restaurant->comission = $request->comission;
        }
        else{
            $restaurant->comission = null;
        }

        $restaurant->minimum_order = $request->minimum_order;
        $restaurant->opening_time = $request->opening_time;
        $restaurant->closeing_time = $request->closeing_time;
        $restaurant->tax = $request->tax;
        $restaurant->delivery_time = $request->minimum_delivery_time .'-'. $request->maximum_delivery_time;

        $restaurant->save();
        Toastr::success(trans('messages.restaurant').trans('messages.settings_updated'));
        return back();
    }

    public function update_application(Request $request)
    {
        $restaurant = Vendor::findOrFail($request->id);
        $restaurant->status = $request->status;
        $restaurant->save();
        if($request->status) $restaurant->status = 1;
        $restaurant->save();

        Toastr::success(trans('messages.application_status_updated_successfully'));
        return back();
    }

    public function cleardiscount(Vendor $restaurant)
    {
        $restaurant->discount->delete();
        Toastr::success(trans('messages.restaurant').trans('messages.discount_cleared'));
        return back();
    }

    public function withdraw()
    {
        $all = session()->has('withdraw_status_filter') && session('withdraw_status_filter') == 'all' ? 1 : 0;
        $active = session()->has('withdraw_status_filter') && session('withdraw_status_filter') == 'approved' ? 1 : 0;
        $denied = session()->has('withdraw_status_filter') && session('withdraw_status_filter') == 'denied' ? 1 : 0;
        $pending = session()->has('withdraw_status_filter') && session('withdraw_status_filter') == 'pending' ? 1 : 0;

        $withdraw_req =WithdrawRequest::with(['vendor'])
            ->when($all, function ($query) {
                return $query;
            })
            ->when($active, function ($query) {
                return $query->where('approved', 1);
            })
            ->when($denied, function ($query) {
                return $query->where('approved', 2);
            })
            ->when($pending, function ($query) {
                return $query->where('approved', 0);
            })
            ->latest()
            ->paginate(config('default_pagination'));

        return view('admin-views.wallet.withdraw', compact('withdraw_req'));
    }

    public function withdraw_view($withdraw_id, $seller_id)
    {
        $wr = WithdrawRequest::with(['vendor'])->where(['id' => $withdraw_id])->first();
        return view('admin-views.wallet.withdraw-view', compact('wr'));
    }

    public function status_filter(Request $request){
        session()->put('withdraw_status_filter',$request['withdraw_status_filter']);
        return response()->json(session('withdraw_status_filter'));
    }

    public function withdrawStatus(Request $request, $id)
    {
        $withdraw = WithdrawRequest::findOrFail($id);
        $withdraw->approved = $request->approved;
        $withdraw->transaction_note = $request['note'];
        if ($request->approved == 1) {
            RestaurantWallet::where('vendor_id', $withdraw->vendor_id)->increment('total_withdrawn', $withdraw->amount);
            RestaurantWallet::where('vendor_id', $withdraw->vendor_id)->decrement('pending_withdraw', $withdraw->amount);
            $withdraw->save();
            Toastr::success(trans('messages.seller_payment_approved'));
            return redirect()->route('admin.vendor.withdraw_list');
        } else if ($request->approved == 2) {
            RestaurantWallet::where('vendor_id', $withdraw->vendor_id)->decrement('pending_withdraw', $withdraw->amount);
            $withdraw->save();
            Toastr::info(trans('messages.seller_payment_denied'));
            return redirect()->route('admin.vendor.withdraw_list');
        } else {
            Toastr::error(trans('messages.not_found'));
            return back();
        }
    }

    public function get_addons(Request $request)
    {
        $cat = AddOn::where(['vendor_id' => $request->vendor_id])->get();
        $res = '';
        foreach ($cat as $row) {
            $res .= '<option value="' . $row->id.'"';
            if(count($request->data))
            {
                $res .= in_array($row->id, $request->data)?'selected':'';
            }
            $res .=  '>' . $row->name . '</option>';
        }
        return response()->json([
            'options' => $res,
        ]);
    }

    public function get_restaurant_data(Vendor $vendor)
    {
        return response()->json($vendor);
    }

    public function restaurant_filter($id)
    {
        if ($id == 'all') {
            if (session()->has('restaurant_filter')) {
                session()->forget('restaurant_filter');
            }
        } else {
            session()->put('restaurant_filter', Vendor::where('id', $id)->first(['id', 'name']));
        }
        return back();
    }

    public function get_account_data(Vendor $restaurant)
    {
        $wallet = $restaurant->wallet;
        $cash_in_hand = 0;
        $balance = 0;

        if($wallet)
        {
            $cash_in_hand = $wallet->collected_cash;
            $balance = $wallet->total_earning - $wallet->total_withdrawn - $wallet->pending_withdraw - $wallet->collected_cash;
        }
        return response()->json(['cash_in_hand'=>$cash_in_hand, 'earning_balance'=>$balance], 200);

    }

    public function bulk_import_index()
    {
        return view('admin-views.vendor.bulk-import');
    }

    public function bulk_import_data(Request $request)
    {
        try {
            $collections = (new FastExcel)->import($request->file('products_file'));
        } catch (\Exception $exception) {
            Toastr::error(trans('messages.you_have_uploaded_a_wrong_format_file'));
            return back();
        }
        $duplicate_phones = $collections->duplicates('phone');
        $duplicate_emails = $collections->duplicates('email');
        
        // dd(['Phone'=>$duplicate_phones, 'Email'=>$duplicate_emails]);
        if($duplicate_emails->isNotEmpty())
        {
            Toastr::error(trans('messages.duplicate_data_on_column',['field'=>trans('messages.email')]));
            return back();
        }

        if($duplicate_phones->isNotEmpty())
        {
            Toastr::error(trans('messages.duplicate_data_on_column',['field'=>trans('messages.phone')]));
            return back();
        }

        $vendors = [];
        $restaurants = [];
        $vendor = Vendor::orderBy('id', 'desc')->first('id');
        $vendor_id = $vendor?$vendor->id:0;
        foreach ($collections as $key=>$collection) {
                if ($collection['ownerFirstName'] === "" || $collection['ownerLastName'] === "" || $collection['phone'] === "" || $collection['email'] === "" || $collection['latitude'] === "" || $collection['longitude'] === "" || $collection['zone_id'] === "") {
                    Toastr::error(trans('messages.please_fill_all_required_fields'));
                    return back();
                }

                // || empty($collection['openingTime']) === "" || empty($collection['closeingTime']) || 


         array_push($vendors, [
                'id'=>$vendor_id+$key+1,
                'f_name' => $collection['ownerFirstName'],
                'l_name' => $collection['ownerLastName'],
                'password' => bcrypt(12345678),
                'phone' => $collection['phone'],
                'email' => $collection['email'],
                'zone_id' => $collection['zone_id'],
                'latitude' => $collection['latitude'],
                'longitude' => $collection['longitude'],
                'created_at'=>now(),
                'updated_at'=>now()
            ]);
            // array_push($restaurants, [
            //     'name' => $collection['restaurantName'],
            //     'logo' => $collection['logo'],
            //     'phone' => $collection['phone'],
            //     'email' => $collection['email'],
            //     'latitude' => $collection['latitude'],
            //     'longitude' => $collection['longitude'],
            //     'opening_time' => $collection['openingTime'],
            //     'closeing_time' => $collection['closeingTime'],
            //     'vendor_id' => $vendor_id+$key+1,
            //     'zone_id' => $collection['zone_id'],
            //     'created_at'=>now(),
            //     'updated_at'=>now()
            // ]);
        }
        try{
            DB::beginTransaction();
            DB::table('vendors')->insert($vendors);
            // DB::table('restaurants')->insert($restaurants);
            DB::commit();
        }catch(\Exception $e)
        {
            DB::rollBack();
            info($e);
            Toastr::error(trans('messages.failed_to_import_data'));
            return back();
        }

        Toastr::success(trans('messages.restaurant_imported_successfully',['count'=>count($vendors)]));
        return back();
    }

    public function bulk_export_index()
    {
        return view('admin-views.vendor.bulk-export');
    }

    public function bulk_export_data(Request $request)
    {
        $request->validate([
            'type'=>'required',
            'start_id'=>'required_if:type,id_wise',
            'end_id'=>'required_if:type,id_wise',
            'from_date'=>'required_if:type,date_wise',
            'to_date'=>'required_if:type,date_wise'
        ]);
        $vendors = Vendor::when($request['type']=='date_wise', function($query)use($request){
            $query->whereBetween('created_at', [$request['from_date'].' 00:00:00', $request['to_date'].' 23:59:59']);
        })
        ->when($request['type']=='id_wise', function($query)use($request){
            $query->whereBetween('id', [$request['start_id'], $request['end_id']]);
        })
        ->get();

        return (new FastExcel(VendorLogic::format_export_restaurants($vendors)))->download('Vendors.xlsx');
    }
}
