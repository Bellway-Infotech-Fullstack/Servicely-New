<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Campaign;
use App\CentralLogics\BannerLogic;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class BannerController extends Controller
{
    public function get_banners(Request $request)
    {
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => trans('messages.zone_id_required')]);
            return response()->json([
                'errors' => $errors
            ], 403);
        }
        $zone_id= $request->header('zoneId');
        $banners = BannerLogic::get_banners($zone_id);
        $campaigns = Campaign::whereHas('vendors', function($query)use($zone_id){
            $query->where('zone_id', $zone_id);
        })->running()->active()->get();
        try {
            return response()->json(['campaigns'=>$campaigns,'banners'=>$banners], 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }
}
