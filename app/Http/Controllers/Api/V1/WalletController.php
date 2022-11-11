<?php

namespace App\Http\Controllers\Api\V1;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\Wishlist;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\BusinessSetting;

class WalletController extends Controller
{
    public function fund_wallet()
    {

        $coinOnReferral = BusinessSetting::where('key','minimum_coin_transfer')->first();

        $validator = validator()->make(request()->all(), [
            'amount' => 'required|numeric|min:'.$coinOnReferral->value
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }
       
        auth()->user()->increment('wallet_balance', request('amount'));
        auth()->user()->decrement('coin_balance', request('amount'));

        return response()->json(['message' => 'Wallet has been funded'], 200);
    }

  
}
