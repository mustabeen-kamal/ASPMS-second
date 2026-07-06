<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class Scorecard extends Model
{
    use HasUuids;

    protected $table = 'scorecards';
    protected $primaryKey = 'scorecard_id';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'application_id',
        'evaluator_user_id',
        'research_score',
        'teaching_score',
        'service_score',
        'research_sub_scores',
        'teaching_sub_scores',
        'service_sub_scores',
        'total_score',
        'comment',
        'evaluated_at'
    ];

    protected $casts = [
        'research_sub_scores' => 'array',
        'teaching_sub_scores' => 'array',
        'service_sub_scores' => 'array',
    ];
}