<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\CommitteeAssignment;

class CommitteeController extends Controller
{
    public function index()
    {
        $committees = CommitteeAssignment::with([
            'user',
            'request.user'
        ])
        ->whereHas('request')
        ->get();

        return view(
            'committees.index',
            compact('committees')
        );
    }
}