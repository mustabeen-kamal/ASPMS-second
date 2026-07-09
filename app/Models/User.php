<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use App\Models\Employee;
use App\Models\PromotionRole;
class User extends Authenticatable
{
    use HasApiTokens, Notifiable, HasUuids;

    protected $table = 'users';

    protected $primaryKey = 'id';

    public $incrementing = false;

    protected $keyType = 'string';

    protected $fillable = [
        'id',
        'username',
        'email',
        'password',
        'preferred_language',
        'is_locked',
        'failed_attempts',
        'lockout_until',
        'role_id',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected function casts(): array
    {
        return [
            'password' => 'hashed',
            'is_locked' => 'boolean',
            'lockout_until' => 'datetime',
        ];
    }

    public function employee()
{
    return $this->hasOne(
        Employee::class,
        'user_id',
        'id'
    );
}

    public function student()
    {
        return $this->hasOne(Student::class);
    }

    public function role()
{
    return $this->belongsTo(Role::class);
}

public function roles()
{
    return $this->belongsToMany(
        PromotionRole::class,
        'promotion_user_roles',
        'user_id',
        'role_id'
    );
}
}