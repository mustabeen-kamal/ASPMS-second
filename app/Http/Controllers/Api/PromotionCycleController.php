<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StorePromotionCycleRequest;
use App\Http\Requests\UpdatePromotionCycleRequest;
use App\Models\PromotionCycle;
use Illuminate\Support\Str;

class PromotionCycleController extends Controller
{
    public function index()
    {
        return response()->json([
            'success' => true,
            'data' => PromotionCycle::latest()->get()
        ]);
    }

    public function store(StorePromotionCycleRequest $request)
    {
        $cycle = PromotionCycle::create([
            'cycle_id' => Str::uuid(),

            'name_en' => $request->name_en,
            'name_ar' => $request->name_ar,

            'start_date' => $request->start_date,
            'end_date' => $request->end_date,

            'status' => $request->status,

            'research_weight' => $request->research_weight,
            'teaching_weight' => $request->teaching_weight,
            'service_weight' => $request->service_weight,

            'anonymous_voting' => $request->anonymous_voting,

            'created_by' => auth()->id(),
            'updated_by' => auth()->id(),
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Promotion cycle created successfully.',
            'data' => $cycle
        ],201);
    }

    public function show(PromotionCycle $promotion_cycle)
    {
        return response()->json([
            'success'=>true,
            'data'=>$promotion_cycle
        ]);
    }

    public function update(UpdatePromotionCycleRequest $request, PromotionCycle $promotion_cycle)
    {
        $promotion_cycle->update($request->validated());

        return response()->json([
            'success'=>true,
            'message'=>'Promotion cycle updated successfully.',
            'data'=>$promotion_cycle
        ]);
    }

    public function destroy(PromotionCycle $promotion_cycle)
    {
        $promotion_cycle->delete();

        return response()->json([
            'success'=>true,
            'message'=>'Promotion cycle deleted successfully.'
        ]);
    }
}