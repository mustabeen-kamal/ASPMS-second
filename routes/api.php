<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\PromotionCycleController;
use Illuminate\Http\Request;

Route::middleware('auth:sanctum')->get('/me', function (Request $request) {
    return $request->user();
});

Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::apiResource('promotion-cycles', PromotionCycleController::class);

});

Route::middleware(['auth:sanctum', 'role:admin'])->group(function () {
    Route::get('/admin/dashboard', fn() => 'ok');
});

Route::middleware(['auth:sanctum'])->group(function () {

    Route::apiResource('users', App\Http\Controllers\Api\UserController::class);

});

Route::prefix('v1')->group(function () {

    Route::post('/login',[AuthController::class,'login']);

    Route::middleware('auth:sanctum')->group(function () {

        Route::post('/logout',[AuthController::class,'logout']);

        Route::apiResource('users',UserController::class);

        Route::apiResource('roles',RoleController::class);

    });

});

Route::get('/health',[SystemController::class,'health']);
Route::middleware('auth:sanctum')->group(function () {

    Route::get('/roles',[RoleController::class,'index']);

});
Route::middleware('auth:sanctum')->group(function () {

    Route::get('/permissions',[PermissionController::class,'index']);

});
Route::get('/users/{user}/roles',[UserController::class,'roles']);

Route::get('/users/{user}/permissions',[UserController::class,'permissions']);