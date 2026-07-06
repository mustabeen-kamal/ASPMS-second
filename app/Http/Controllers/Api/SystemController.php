<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;

class SystemController extends Controller
{
    public function health()
    {
        return response()->json([
            'status'=>'OK',
            'message'=>'Backend running'
        ]);
    }
}