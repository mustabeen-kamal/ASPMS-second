<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PromotionRole extends Model
{

    protected $table = 'promotion_roles';

    protected $primaryKey = 'id';

    public $incrementing = false;


    public function users()
    {
        return $this->belongsToMany(
            User::class,
            'promotion_user_roles',
            'role_id',
            'user_id'
        );
    }

}