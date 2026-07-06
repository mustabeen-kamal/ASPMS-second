<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class Vote extends Model
{
    use HasUuids;

    protected $table = 'votes';
    protected $primaryKey = 'vote_id';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'application_id',
        'assignment_id',
        'voter_user_id',
        'vote',
        'comment',
        'is_anonymous',
        'cast_at'
    ];

    public function application()
    {
        return $this->belongsTo(PromotionApplication::class, 'application_id');
    }
}