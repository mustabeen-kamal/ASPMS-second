<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class WorkflowState extends Model
{
    use HasUuids;

    protected $table = 'workflow_states';

    protected $primaryKey = 'state_id';

    public $incrementing = false;

    protected $keyType = 'string';


    protected $fillable = [

        'state_id',
        'application_id',
        'state',
        'from_state',
        'comment',
        'performed_by_user_id',
        'performed_at',
        'created_by',
        'updated_by'

    ];


    public function request()
    {
        return $this->belongsTo(
            PromotionRequest::class,
            'application_id',
            'request_id'
        );
    }
}