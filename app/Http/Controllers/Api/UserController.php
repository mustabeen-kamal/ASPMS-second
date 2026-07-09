<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use ApiResponse;


class UserController extends Controller
{

    public function index()
    {
        return response()->json(User::all());
    }

    public function show(User $user)
    {
        return response()->json($user);
    }

    public function roles(User $user)
{
    return response()->json(
        $user->getRoleNames()
    );
}
public function permissions(User $user)
{
    return response()->json(
        $user->getAllPermissions()
    );
}


}
