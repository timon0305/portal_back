<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class customer_property extends Model
{
    public $table = 'customer_property';

    protected $fillable = [
        'customer_id',
        'property_id',
        'created_at',
        'updated_at',
    ];
}
