<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\PromotionRequest;
use App\Models\WorkflowState;
use Illuminate\Support\Str;


class WorkflowController extends Controller
{


    public function update(Request $request, string $id)
    {


        $request->validate([

            'state'=>'required',

            'comment'=>'nullable'

        ]);



        $promotionRequest = PromotionRequest::where(
            'request_id',
            $id
        )->firstOrFail();



        $lastState = WorkflowState::where(
            'application_id',
            $id
        )
        ->latest()
        ->first();



        WorkflowState::create([


            'state_id'=>Str::uuid(),


            'application_id'=>$id,


            'state'=>$request->state,


            'from_state'=>$lastState?->state,


            'comment'=>$request->comment,


            'performed_by_user_id'=>auth()->user()->id,


            'performed_at'=>now(),


            'created_by'=>auth()->user()->id


        ]);



        $promotionRequest->update([

            'status'=>'PENDING'
        
        ]);



        return back();

    }

}