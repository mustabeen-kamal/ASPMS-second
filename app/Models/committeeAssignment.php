<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class CommitteeAssignment extends Model
{
    use HasUuids;

    protected $table = 'committee_assignments';
    protected $primaryKey = 'assignment_id';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'application_id',
        'user_id',
        'tier',
        'is_chair',
        'status',
        'assigned_at',
        'assigned_by_user_id',
        'created_by',
        'updated_by'
    ];

    public function application()
    {
        return $this->belongsTo(PromotionApplication::class, 'application_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}