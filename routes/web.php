<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Web\AuthWebController;
use App\Http\Controllers\Web\DashboardController;
use App\Http\Controllers\Web\PromotionRequestController;
use App\Http\Controllers\Web\EmployeeController;
use App\Http\Controllers\Web\DocumentController;
use App\Http\Controllers\Web\WorkflowController;
use App\Http\Controllers\Web\CommitteeController;
use App\Http\Controllers\Web\CommitteeAssignmentController;
use App\Http\Controllers\Web\ScorecardController;
use App\Http\Controllers\Web\AppealController;
use App\Http\Controllers\Web\ReportController;



/*
|--------------------------------------------------------------------------
| Authentication
|--------------------------------------------------------------------------
*/


Route::get('/', function () {
    return redirect()->route('login.form');
});


Route::get('/login',
    [AuthWebController::class,'showLogin']
)
->name('login.form');


Route::post('/login',
    [AuthWebController::class,'login']
)
->name('web.login');



/*
|--------------------------------------------------------------------------
| Authenticated Routes
|--------------------------------------------------------------------------
*/


Route::middleware('auth')->group(function(){



    /*
    |--------------------------------------------------------------------------
    | Dashboard
    |--------------------------------------------------------------------------
    */


    Route::middleware('auth')->group(function () {


        Route::get('/dashboard',
            [DashboardController::class, 'index']
        )->name('dashboard');
    
    
    });



    /*
    |--------------------------------------------------------------------------
    | Logout
    |--------------------------------------------------------------------------
    */


    Route::post('/logout',
        [AuthWebController::class,'logout']
    )
    ->name('logout');



    /*
    |--------------------------------------------------------------------------
    | Promotions
    |--------------------------------------------------------------------------
    */


    Route::resource(
        'promotions',
        PromotionRequestController::class
    );



    /*
    |--------------------------------------------------------------------------
    | Employees
    |--------------------------------------------------------------------------
    */


    Route::get('/employees',
        [EmployeeController::class,'index']
    )
    ->name('employees.index');


    Route::get('/employees/{employee}',
        [EmployeeController::class,'show']
    )
    ->name('employees.show');



    /*
    |--------------------------------------------------------------------------
    | Documents
    |--------------------------------------------------------------------------
    */


    Route::post(
        '/promotions/{id}/documents',
        [DocumentController::class,'store']
    )
    ->name('documents.store');



    /*
    |--------------------------------------------------------------------------
    | Workflow
    |--------------------------------------------------------------------------
    */


    Route::post(
        '/promotions/{id}/workflow',
        [WorkflowController::class,'update']
    )
    ->name('workflow.update');



    /*
    |--------------------------------------------------------------------------
    | Committees
    |--------------------------------------------------------------------------
    */


    Route::get('/committees',
        [CommitteeController::class,'index']
    )
    ->middleware('role:department_committee,faculty_committee,promotion_admin')
    ->name('committees.index');


    Route::post(
        '/promotions/{id}/committee',
        [CommitteeAssignmentController::class,'store']
    )
    ->middleware('role:promotion_admin')
    ->name('committee.assign');



    /*
    |--------------------------------------------------------------------------
    | Scorecards
    |--------------------------------------------------------------------------
    */


    Route::get('/scorecards',
        [ScorecardController::class,'index']
    )
    ->name('scorecards.index');


    Route::get('/scorecards/{id}',
        [ScorecardController::class,'show']
    )
    ->name('scorecards.show');


    Route::get('/scorecards/{application}/create',
        [ScorecardController::class,'create']
    )
    ->name('scorecards.create');


    Route::post('/scorecards',
        [ScorecardController::class,'store']
    )
    ->name('scorecards.store');



    /*
    |--------------------------------------------------------------------------
    | Appeals
    |--------------------------------------------------------------------------
    */


    Route::get('/appeals',
        [AppealController::class,'index']
    )
    ->name('appeals.index');


    Route::get('/appeals/{id}/create',
        [AppealController::class,'create']
    )
    ->name('appeals.create');


    Route::post('/appeals',
        [AppealController::class,'store']
    )
    ->name('appeals.store');



    /*
    |--------------------------------------------------------------------------
    | Reports
    |--------------------------------------------------------------------------
    */


    Route::get('/reports',
        [ReportController::class,'index']
    )
    ->middleware('role:promotion_admin,university_admin')
    ->name('reports.index');


});