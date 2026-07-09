<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\CommitteeAssignment;
use App\Models\User;
use Illuminate\Support\Str;


class CommitteeAssignmentController extends Controller
{


    public function store(Request $request, string $id)
    {


        $validated = $request->validate([

            'user_id'=>'required',

            'tier'=>'required'

        ]);

        $exists = CommitteeAssignment::where('application_id', $id)
    ->where('user_id', $validated['user_id'])
    ->where('tier', $validated['tier'])
    ->exists();

if ($exists) {
    return back()->with('error', 'This committee member is already assigned.');
}

CommitteeAssignment::create([
    'assignment_id' => Str::uuid(),
    'application_id' => $id,
    'user_id' => $validated['user_id'],
    'tier' => $validated['tier'],
    'is_chair' => $request->has('is_chair'),
    'status' => 'ACTIVE',
    'assigned_at' => now(),
    'assigned_by_user_id' => auth()->user()->id,
    'created_by' => auth()->user()->id,
]);





        return back();

    }

}