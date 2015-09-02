<!DOCTYPE html>
<html lang="en" class="body-full-height">
<head>
    <!-- META SECTION -->
    <title>:: {{ env('APP_NAME') }} | Password Reset ::</title>
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
            <div class="login-title"><strong>Forgot</strong>, Password?</div>

            @include('errors.errors')

            <!-- start: FLASH MESSAGE -->
            @if(Session::has('flash_message'))
                {!! Session::get('flash_message') !!}
            @endif
            <!-- end: FLASH MESSAGE -->

            <form class="form-horizontal" method="post" action="{{ url('/auth/reset-password') }}">
                <input type="hidden" name="_token" value="{{ csrf_token() }}">
                <div class="form-group">
                    <div class="col-md-12">
                        <input type="email" class="form-control" name="email" value="{{ Input::old('email') }}" placeholder="email@domain.com" required />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-6">
                        <a href="{{ url('/auth/login') }}" class="btn btn-link btn-block">Back To Login</a>
                    </div>
                    <div class="col-md-6">
                        <button class="btn btn-danger btn-block" type="submit">Reset Password</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="login-footer">
            <div class="pull-left">
                &copy; {{ date('Y') }} {{ env('APP_NAME') }}
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






