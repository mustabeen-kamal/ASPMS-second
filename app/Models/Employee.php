<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    protected $table = 'employees';

    protected $primaryKey = 'id';

    public $incrementing = false;

    protected $keyType = 'string';


    protected $fillable = [
        'user_id',
        'employee_number',
        'full_name_ar',
        'full_name_en',
        'academic_rank',
        'faculty_name',
        'department_name',
    ];


    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}