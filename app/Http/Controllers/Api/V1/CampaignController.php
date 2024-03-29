<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Campaign;
use App\Models\ItemCampaign;
use Illuminate\Http\Request;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\Validator;

class CampaignController extends Controller
{
    public function get_basic_campaigns(Request $request){
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => 'Zone id is required!']);
            return response()->json([
                'errors' => $errors
            ], 200);
        }
        $zone_id= $request->header('zoneId');
        try {
            $campaigns = Campaign::whereHas('vendors', function($query)use($zone_id){
                $query->where('zone_id', $zone_id);
            })->running()->active()->get();
            
            $campaigns=Helpers::basic_campaign_data_formatting($campaigns, true);
            return response()->json($campaigns, 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }
    public function basic_campaign_details(Request $request){
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => 'Zone id is required!']);
            return response()->json([
                'errors' => $errors
            ], 200);
        }
        $zone_id= $request->header('zoneId');

        $validator = Validator::make($request->all(), [
            'basic_campaign_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }
        try {
            $campaign = Campaign::with(['vendors'=>function($q)use($zone_id){
                $q->where('zone_id', $zone_id);
            }])->running()->active()->whereId($request->basic_campaign_id)->first();
            $campaign['vendors'] = Helpers::restaurant_data_formatting($campaign['vendors'], true);
            return response()->json($campaign, 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }
    public function get_item_campaigns(Request $request){

        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => 'Zone id is required!']);
            return response()->json([
                'errors' => $errors
            ], 200);
        }
        $zone_id= $request->header('zoneId');
        try {
            $campaigns = ItemCampaign::active()->whereHas('vendor', function($query)use($zone_id){
                $query->where('zone_id', $zone_id);
            })->running()->active()->get();
            $campaigns= Helpers::product_data_formatting($campaigns, true);
            return response()->json($campaigns, 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }

    }
}
