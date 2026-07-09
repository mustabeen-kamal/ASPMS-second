<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Employee;

class EmployeeController extends Controller
{
    public function index()
    {
        $employees = Employee::all();

        return view('employees.index', compact('employees'));
    }


    public function show(string $id)
    {
        $employee = Employee::where('id', $id)->firstOrFail();

        return view('employees.show', compact('employee'));
    }
}