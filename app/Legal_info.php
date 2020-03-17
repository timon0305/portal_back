<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Legal_info extends Model
{
    public $table = 'Legal_info';

    protected $fillable = [
        'pre_contract',
        'pre_contract_date',
        'created_at',
        'updated_at',
    ];
}
