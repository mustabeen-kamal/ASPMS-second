<!DOCTYPE html>
<html lang="{{ $lang ?? 'ar' }}" dir="{{ ($lang ?? 'ar') === 'ar' ? 'rtl' : 'ltr' }}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - UIMP</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .login-container { width: 100%; max-width: 400px; }
        .login-box { background: white; border-radius: 16px; box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3); padding: 40px; }
        .login-header { text-align: center; margin-bottom: 30px; }
        .login-header h1 { font-size: 48px; font-weight: bold; color: #667eea; margin-bottom: 10px; }
        .login-header p { font-size: 14px; color: #64748b; }
        .alert { padding: 12px 16px; border-radius: 8px; margin-bottom: 20px; font-size: 14px; }
        .alert-error { background: #fee2e2; color: #dc2626; border: 1px solid #fecaca; }
        .form-group { margin-bottom: 20px; }
        .form-group label { display: block; font-size: 13px; font-weight: 500; color: #0f172a; margin-bottom: 8px; }
        .form-group input { width: 100%; padding: 12px 16px; border: 1px solid #e2e8f0; border-radius: 8px; font-size: 14px; transition: all 0.2s; }
        .form-group input:focus { outline: none; border-color: #2563eb; box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1); }
        .error-message { color: #dc2626; font-size: 12px; margin-top: 5px; display: block; }
        .btn { width: 100%; padding: 12px 16px; border: none; border-radius: 8px; font-size: 14px; font-weight: 500; cursor: pointer; transition: all 0.2s; }
        .btn-primary { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; }
        .btn-primary:hover { transform: translateY(-2px); box-shadow: 0 10px 30px rgba(102, 126, 234, 0.4); }
        .login-footer { text-align: center; margin-top: 20px; }
        .language-toggle a { color: #64748b; text-decoration: none; padding: 4px 8px; }
        .language-toggle a.active { color: #667eea; font-weight: 600; }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <div class="login-header">
                <h1>ASPMS</h1>
                <p>{{ ($lang ?? 'ar') === 'ar' ? 'نظام إدارة الترقيات' : 'Academic Staff Promotion Management System ' }}</p>
            </div>
            
            @if(session('error'))
<div class="alert alert-error">
    {{ session('error') }}
</div>
@endif

@if($errors->any())
<div class="alert alert-error">
    @foreach($errors->all() as $error)
        {{ $error }}<br>
    @endforeach
</div>
@endif
           

            <form action="{{ route('web.login') }}" method="POST" class="login-form">                @csrf
                
                <div class="form-group">
                    <label for="email">{{ ($lang ?? 'ar') === 'ar' ? 'البريد الإلكتروني' : 'Email Address' }}</label>
                    <input type="email" id="email" name="email" value="{{ old('email') }}" required autofocus>
                    @error('email') <span class="error-message">{{ $message }}</span> @enderror
                </div>
                
                <div class="form-group">
                    <label for="password">{{ ($lang ?? 'ar') === 'ar' ? 'كلمة المرور' : 'Password' }}</label>
                    <input type="password" id="password" name="password" required>
                    @error('password') <span class="error-message">{{ $message }}</span> @enderror
                </div>
                
                <button type="submit" class="btn btn-primary">
                    {{ ($lang ?? 'ar') === 'ar' ? 'تسجيل الدخول' : 'Login' }}
                </button>
            </form>
            
            <div class="login-footer">
                <div class="language-toggle">
                    <a href="?lang=en" class="{{ ($lang ?? 'ar') === 'en' ? 'active' : '' }}">English</a>
                    <span>|</span>
                    <a href="?lang=ar" class="{{ ($lang ?? 'ar') === 'ar' ? 'active' : '' }}">العربية</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>