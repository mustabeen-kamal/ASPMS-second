<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class PromotionApplication extends Model
{
    use HasUuids;

    protected $table = 'promotion_applications';
    protected $primaryKey = 'application_id';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'staff_id',
        'promotion_cycle_id',
        'applicant_user_id',
        'current_rank',
        'target_rank',
        'department_id',
        'faculty_id',
        'department_name_snapshot',
        'faculty_name_snapshot',
        'submission_date',
        'status',
        'remarks',
        'ip_address',
        'created_by',
        'updated_by',
    ];

    public function employee()
    {
        return $this->belongsTo(Employee::class, 'staff_id');
    }

    public function applicant()
    {
        return $this->belongsTo(User::class, 'applicant_user_id');
    }

    public function cycle()
    {
        return $this->belongsTo(PromotionCycle::class, 'promotion_cycle_id', 'cycle_id');
    }

    public function documents()
    {
        return $this->hasMany(PortfolioDocument::class, 'application_id');
    }

    public function assignments()
    {
        return $this->hasMany(CommitteeAssignment::class, 'application_id');
    }

    public function votes()
    {
        return $this->hasMany(Vote::class, 'application_id');
    }

    public function scorecards()
    {
        return $this->hasMany(Scorecard::class, 'application_id');
    }

    public function workflowStates()
    {
        return $this->hasMany(WorkflowState::class, 'application_id');
    }
}