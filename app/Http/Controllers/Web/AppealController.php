<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Appeal;
use App\Models\PromotionApplication;
use Illuminate\Support\Str;


class AppealController extends Controller
{


    public function index()
    {
    
        $appeals = Appeal::with([
            'user'
        ])
        ->latest()
        ->get();
    
    
        return view(
            'appeals.index',
            compact('appeals')
        );
    
    }

public function create($id)
{

    $application = PromotionApplication::findOrFail($id);


    return view(
        'appeals.create',
        compact('application')
    );

}



public function store(Request $request)
{


    $data = $request->validate([

        'application_id'=>'required',

        'reason'=>'required'

    ]);



    Appeal::create([

        'appeal_id'=>Str::uuid(),

        'application_id'=>$data['application_id'],

        'appellant_user_id'=>auth()->user()->id,

        'reason'=>$data['reason'],

        'status'=>'PENDING',

        'submitted_at'=>now(),

        'created_by'=>auth()->user()->id

    ]);



    return redirect()
    ->route('appeals.index');

}



}