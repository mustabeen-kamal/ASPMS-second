<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\PromotionApplication;
use App\Models\Scorecard;
use Illuminate\Support\Str;

class ScorecardController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $scorecards = Scorecard::all();
        $applications = PromotionApplication::with([
            'applicant',
            'employee',
            'cycle',
            'scorecards'
        ])->latest()->get();
    
        return view(
            'scorecards.index',
            compact('applications'), compact('scorecards')
            
        );
    }
    public function create($application)
    {

        $application = PromotionApplication::with([
            'applicant',
            'employee'
        ])->findOrFail($application);


        return view(
            'scorecards.create',
            compact('application')
        );
    }



    public function store(Request $request)
    {

        $validated = $request->validate([

            'application_id' => 'required',

            'research_score' => 'required|integer',

            'teaching_score' => 'required|integer',

            'service_score' => 'required|integer',

            'comment' => 'nullable'

        ]);



        $total = 
            $validated['research_score']
            +
            $validated['teaching_score']
            +
            $validated['service_score'];



        Scorecard::create([

            'scorecard_id' => Str::uuid(),

            'application_id' => $validated['application_id'],

            'evaluator_user_id' => auth()->user()->id,


            'research_score' => $validated['research_score'],

            'teaching_score' => $validated['teaching_score'],

            'service_score' => $validated['service_score'],


            'total_score' => $total,


            'comment' => $validated['comment'] ?? null,


            'evaluated_at' => now(),

            'created_by' => auth()->user()->id

        ]);



        return redirect()
            ->route('scorecards.index')
            ->with(
                'success',
                'Evaluation submitted successfully'
            );

    }



    public function show($id)
{
    $scorecard = Scorecard::where(
        'scorecard_id',
        $id
    )
    ->with([
        'application.applicant'
    ])
    ->firstOrFail();


    return view(
        'scorecards.show',
        compact('scorecard')
    );
}
    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
