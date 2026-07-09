<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use App\Models\User;
use App\Models\Employee;

class PromotionApplication extends Model
{
    use HasUuids;

    protected $table = 'promotion_applications';

    protected $primaryKey = 'application_id';

    public $incrementing = false;

    protected $keyType = 'string';

    protected $fillable = [

        'application_id',

        'staff_id',

        'promotion_cycle_id',

        'applicant_user_id',

        'current_rank',

        'target_rank',

        'department_name_snapshot',

        'faculty_name_snapshot',

        'submission_date',

        'status',

        'remarks',

        'ip_address',

        'created_by',

        'updated_by'

    ];

    public function scorecards()
{
    return $this->hasMany(
        Scorecard::class,
        'application_id',
        'application_id'
    );
}


public function applicant()
{
    return $this->belongsTo(
        User::class,
        'applicant_user_id',
        'id'
    );
}

public function employee()
{
    return $this->belongsTo(
        Employee::class,
        'staff_id',
        'id'
    );
}

public function cycle()
{
    return $this->belongsTo(
        PromotionCycle::class,
        'promotion_cycle_id',
        'cycle_id'
    );
}

public function appeals()
{
    return $this->hasMany(
        Appeal::class,
        'application_id',
        'application_id'
    );
}
}