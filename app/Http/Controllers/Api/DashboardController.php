<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;

class DashboardController extends Controller
{public function index()
    {
        dd("I AM DASHBOARD CONTROLLER");
    
        $roles = [];
    
        return view('dashboard', compact('roles'));
    }
}