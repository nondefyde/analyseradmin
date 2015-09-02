<!DOCTYPE html>
<html lang="en" class="body-full-height">
<head>
    <!-- META SECTION -->
    <title>:: {{ env('APP_NAME') }} | Login Page ::</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="icon" href="favicon.ico" type="image/x-icon" />
    <!-- END META SECTION -->

    <!-- CSS INCLUDE -->
    <link rel="stylesheet" type="text/css" id="theme" href="{{ asset('/css/theme-default.css') }}"/>
    <!-- EOF CSS INCLUDE -->
</head>
<body>

<div class="login-container">
    <div class="login-box animated fadeInDown">
        <div class="login-logo"></div>
        <div class="login-body">
            <div class="login-title"><strong>Welcome</strong>, Please login</div>

            @include('errors.errors')

            <!-- start: FLASH MESSAGE -->
            @if(Session::has('flash_message'))
                {!! Session::get('flash_message') !!}
            @endif
            <!-- end: FLASH MESSAGE -->

            <form class="form-horizontal" method="post" action="{{ url('auth/login') }}">
                <input type="hidden" name="_token" value="{{ csrf_token() }}">
                <div class="form-group">
                    <div class="col-md-12">
                        <input type="email" class="form-control" placeholder="Email address" name="email" value="{{ old('email') }}" required />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <input type="password" class="form-control" placeholder="Password" name="password" required/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-6">
                        <label class="checkbox-inline" style="color: white">
                            <input type="checkbox" class="square-red" name="remember_token" value="true">
                            Remember Me
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-6">
                        <a href="{{ url('/auth/reset-password') }}" class="btn btn-link btn-block">Forgot your password?</a>
                    </div>
                    <div class="col-md-6">
                        <button class="btn btn-info btn-block" type="submit">Log In</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="login-footer">
            <div class="pull-left">
                &copy; {{ date('Y') }} Analyzer
            </div>
            <div class="pull-right">
                <a href="#">About</a> |
                <a href="#">Privacy</a> |
                <a href="#">Contact Us</a>
            </div>
        </div>
    </div>

</div>

</body>
</html>






