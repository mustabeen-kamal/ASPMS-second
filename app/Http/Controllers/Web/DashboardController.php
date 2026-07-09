<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;

class DashboardController extends Controller
{

    public function index()
    {
        $user = auth()->user();

        $roles = $user->roles()
            ->pluck('name')
            ->toArray();


        return view('dashboard', [
            'roles' => $roles
        ]);
    }

}