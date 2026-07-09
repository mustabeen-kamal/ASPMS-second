<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class Appeal extends Model
{
    use HasUuids;

    protected $table = 'appeals';

    protected $primaryKey = 'appeal_id';

    public $incrementing = false;

    protected $keyType = 'string';


    protected $fillable = [

        'appeal_id',
        'application_id',
        'appellant_user_id',
        'reason',
        'status',
        'response',
        'reviewed_by_user_id',
        'submitted_at',
        'reviewed_at',
        'created_by',
        'updated_by'

    ];


    public function application()
    {
        return $this->belongsTo(
            PromotionApplication::class,
            'application_id',
            'application_id'
        );
    }


    public function user()
    {
        return $this->belongsTo(
            User::class,
            'appellant_user_id',
            'id'
        );
    }
}