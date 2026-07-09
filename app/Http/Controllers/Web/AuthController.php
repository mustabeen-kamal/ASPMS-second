<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use App\Services\AuthService;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    public function __construct(private AuthService $authService)
    {
    }

    public function showLogin()
    {
        return view('auth.login');
    }

    public function login(LoginRequest $request)
    {
        try {

            $data = $this->authService->login($request->validated());

            session([
                'token' => $data['token'],
                'user'  => $data['user'],
            ]);

            return redirect()->route('dashboard');

        } catch (ValidationException $e) {

            return back()
                ->withInput()
                ->withErrors($e->errors());

        } catch (\Exception $e) {

            return back()
                ->withInput()
                ->with('error', $e->getMessage());

        }
    }
}