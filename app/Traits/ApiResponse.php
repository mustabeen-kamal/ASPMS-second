<?php

namespace App\Traits;

trait ApiResponse
{
    public function success($data = null, $message = 'Success')
    {
        return response()->json([
            'success'=>true,
            'message'=>$message,
            'data'=>$data
        ]);
    }

    public function error($message='Error',$code=400)
    {
        return response()->json([
            'success'=>false,
            'message'=>$message
        ],$code);
    }
}