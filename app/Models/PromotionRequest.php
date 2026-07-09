<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use App\Models\PromotionCycle;
use App\Models\User;
use App\Models\Employee;
use App\Models\PortfolioDocument;
use App\Models\WorkflowState;
use App\Models\CommitteeAssignment;

class PromotionRequest extends Model
{
    use HasUuids;

    protected $table = 'promotion_requests';

    protected $primaryKey = 'request_id';

    public $incrementing = false;

    protected $keyType = 'string';

    protected $fillable = [
        'cycle_id',
        'user_id',
        'academic_rank',
        'description',
        'status',
    ];


    public function cycle()
    {
        return $this->belongsTo(
            PromotionCycle::class,
            'cycle_id',
            'cycle_id'
        );
    }
    
    
    public function user()
    {
        return $this->belongsTo(
            User::class,
            'user_id',
            'id'
        );
    }

    public function employee()
{
    return $this->belongsTo(
        Employee::class,
        'user_id',
        'user_id'
    );
}

public function documents()
{
    return $this->hasMany(
        PortfolioDocument::class,
        'application_id',
        'request_id'
    );
}

public function workflowStates()
{
    return $this->hasMany(
        WorkflowState::class,
        'application_id',
        'request_id'
    );
}



public function committees()
{
    return $this->hasMany(
        CommitteeAssignment::class,
        'application_id',
        'request_id'
    );
}



}