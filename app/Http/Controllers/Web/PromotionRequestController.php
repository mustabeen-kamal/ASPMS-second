<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\PromotionRequest;
use App\Models\PromotionCycle;
use App\Models\WorkflowState;
use Illuminate\Support\Str;
use App\Models\PromotionApplication;
use App\Models\Employee;

class PromotionRequestController extends Controller
{
   

    public function index()
    {
        $requests = PromotionRequest::with([
            'user',
            'cycle'
        ])->get();
    
    
        $totalRequests = $requests->count();
    
        $pendingCount = $requests
            ->where('status', 'PENDING')
            ->count();
    
        $approvedCount = $requests
            ->where('status', 'APPROVED')
            ->count();
    
        $rejectedCount = $requests
            ->where('status', 'REJECTED')
            ->count();
    
    
        return view('promotions.index', compact(
            'requests',
            'totalRequests',
            'pendingCount',
            'approvedCount',
            'rejectedCount'
        ));
    }
    public function create()
{
    $cycles = PromotionCycle::where('status', 'ACTIVE')->get();

    return view('promotions.create', compact('cycles'));
}
public function store(Request $request)
{
    $validated = $request->validate([
        'cycle_id' => 'required',
        'description' => 'nullable',
    ]);

    // المستخدم الحالي
    $user = auth()->user();

    // بيانات الموظف
    $employee = Employee::where('user_id', $user->id)->firstOrFail();

    // إنشاء Promotion Request
    $promotionRequest = PromotionRequest::create([
        'request_id'     => Str::uuid(),
        'user_id'        => $user->id,
        'cycle_id'       => $validated['cycle_id'],
        'academic_rank'  => $employee->academic_rank,
        'description'    => $validated['description'],
        'status'         => 'PENDING',
    ]);

  

    // إنشاء Promotion Application
    $application = PromotionApplication::create([
        'application_id'            => Str::uuid(),
        'staff_id'                  => $employee->id,
        'promotion_cycle_id'        => $validated['cycle_id'],
        'applicant_user_id'         => $user->id,
        'current_rank'              => $employee->academic_rank,
        'target_rank'               => 'SENIOR_LECTURER',
        'department_name_snapshot'  => $employee->department_name,
        'faculty_name_snapshot'     => $employee->faculty_name,
        'submission_date'           => now(),
        'status'                    => 'SUBMITTED',
        'remarks'                   => $validated['description'],
        'ip_address'                => request()->ip(),
        'created_by'                => $user->id,
    ]);

    // إنشاء أول Workflow State
    WorkflowState::create([
        'state_id'              => Str::uuid(),
        'application_id'        => $application->application_id,
        'state'                 => 'SUBMITTED',
        'from_state'            => null,
        'comment'               => 'Promotion request submitted',
        'performed_by_user_id'  => $user->id,
        'performed_at'          => now(),
        'created_by'            => $user->id,
    ]);

    return redirect()
        ->route('promotions.index')
        ->with('success', 'Promotion request created successfully.');
}

public function show(string $id)
{
    $request = PromotionRequest::with([
        'user',
        'cycle',
        'documents',
        'workflowStates'
    ])
    ->where('request_id', $id)
    ->firstOrFail();


    return view('promotions.show', compact('request'));
}

public function edit(string $id)
{
    $request = PromotionRequest::where('request_id', $id)
        ->firstOrFail();


    $cycles = PromotionCycle::where('status','ACTIVE')->get();


    return view('promotions.edit', compact(
        'request',
        'cycles'
    ));
}

public function update(Request $request, string $id)
{
    $validated = $request->validate([
        
        'description' => 'nullable',
    ]);


    $promotionRequest = PromotionRequest::where('request_id', $id)
        ->firstOrFail();


    $promotionRequest->update([
'academic_rank' => auth()->user()->employee->academic_rank,        'description' => $validated['description'] ?? null,
    ]);


    return redirect()
        ->route('promotions.index')
        ->with('success', 'Promotion request updated successfully');
}

    public function destroy(string $id)
    {
        //
    }
}