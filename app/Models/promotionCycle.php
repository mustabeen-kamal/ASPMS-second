<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class PromotionCycle extends Model
{
    use HasUuids;

    protected $table = 'promotion_cycles';
    protected $primaryKey = 'cycle_id';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'cycle_id',
        'name_en',
        'name_ar',
        'start_date',
        'end_date',
        'status',
        'research_weight',
        'teaching_weight',
        'service_weight',
        'anonymous_voting',
        'created_by',
        'updated_by'
    ];

    public function applications()
    {
        return $this->hasMany(PromotionApplication::class, 'promotion_cycle_id', 'cycle_id');
    }
}