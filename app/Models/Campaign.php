<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Campaign extends Model
{
    use HasFactory;
    protected $dates = ['created_at', 'updated_at', 'start_date', 'end_date'];

    // protected $casts = ['start_time'=>'datetime', 'end_time'=>'datetime'];
    protected $casts = [
        'status' => 'integer',
        'admin_id' => 'integer',
    ];

    public function getStartTimeAttribute($value)
    {
        return $value?date('H:i',strtotime($value)):$value;
    }

    public function getEndTimeAttribute($value)
    {
        return $value?date('H:i',strtotime($value)):$value;
    }
    
    // public function restaurants()
    // {
    //     return $this->belongsToMany(Restaurant::class);
    // }


    public function vendors()
    {
        return $this->belongsToMany(Vendor::class);
    }


    public function vendor()
    {
        return $this->belongsTo(Vendor::class);
    }


    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }
    
    public function scopeRunning($query)
    {
        return $query->where(function($q){
                $q->whereDate('end_date', '>=', date('Y-m-d'))->orWhereNull('end_date');
            })->where(function($q){
                $q->whereDate('start_date', '<=', date('Y-m-d'))->orWhereNull('start_date');
            })->where(function($q){
                $q->whereTime('start_time', '<=', date('H:i:s'))->orWhereNull('start_time');
            })->where(function($q){
                $q->whereTime('end_time', '>=', date('H:i:s'))->orWhereNull('end_time');
            });       
    }
}
