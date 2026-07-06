<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class PromotionRole extends Model
{
    use HasUuids;

    protected $table = 'promotion_roles';

    protected $fillable = [
        'name',
        'display_name_ar',
        'display_name_en'
    ];
}