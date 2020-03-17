<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Priority extends Model
{
    use SoftDeletes;

    public $table = 'priority';

    protected $dates = [
        'created_at',
        'updated_at',
    ];

    protected $fillable = [
        'owner',
        'contract_start',
        'pea_file',
        'keys',
        'created_at',
        'updated_at',
    ];

    public function tickets()
    {
        return $this->hasMany(Ticket::class, 'priority_id', 'id');
    }
}
