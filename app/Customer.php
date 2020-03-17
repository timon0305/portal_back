<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    public $table = 'customer';

    protected $hidden = [
        'password',
        'remember_taken'
    ];

    protected $date = [
        'updated_at',
        'created_at',
        'deleted_at',
        'email_verified_at',
    ];

    protected $fillable = [
        'customer_no',
        'name',
        'email',
        'customer_type',
        'pre_contract',
        'pre_contract_date',
        'purchase_contract',
        'created_at',
        'updated_at',
        'deleted_at',
        'remember_token',
        'email_verified_at',
    ];
}
