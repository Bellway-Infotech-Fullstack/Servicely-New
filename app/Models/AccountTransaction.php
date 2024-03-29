<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Vendor;
use App\Models\DeliveryMan;

class AccountTransaction extends Model
{
    use HasFactory;

    protected $casts = [
        'amount' => 'float',
        'current_balance' => 'float',
        'created_at' => 'datetime',
        'updated_at' => 'datetime'
    ];

    public function getRestaurantAttribute()
    {
        if($this->from_type == 'vendor'){
            return Vendor::find($this->from_id);
        }
        return null;
    }

    public function vendor(){
        return $this->belongsTo(Vendor::class, 'from_id');
    }

    public function getDeliverymanAttribute()
    {
        if($this->from_type == 'deliveryman'){
            return DeliveryMan::find($this->from_id);
        }
        return null;
    }
    
}
