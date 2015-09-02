@extends('layouts.default')

@section('title', 'Register New User')

@section('page_title')
    <li><a href="{{ url('/users/create') }}">User</a></li>
    <li class="active">Register</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-plus"></span> Register User</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12">
                <!-- START JQUERY VALIDATION PLUGIN -->
                <div class="registration-container">
                    <div class="registration-box animated fadeInDown">
                        @include('errors.errors')
                        <div class="registration-body">
                            <div class="registration-title"><strong>New User</strong> Info</div>
                            <form method="post" action="/users/create" class="form-horizontal" role="form">
                                {!! csrf_field() !!}
                                <h4>First Name:</h4>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input type="text" name="first_name"  value="{{ old('first_name') }}" class="form-control" placeholder="First Name"/>
                                    </div>
                                </div>
                                <h4>Last Name:</h4>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input type="text" name="last_name"  value="{{ old('last_name') }}" class="form-control" placeholder="Last Name"/>
                                    </div>
                                </div>
                                <h4>E-mail:</h4>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input type="email" name="email"  value="{{ old('email') }}" class="form-control" placeholder="E-mail"/>
                                    </div>
                                </div>
                                <h4>Gender:</h4>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <select name="gender" class="form-control">
                                            <option value="">Noting Selected</option>
                                            <option value="Female">Female</option>
                                            <option value="Male">Male</option>
                                        </select>
                                    </div>
                                </div>
                                <h4>User Type:</h4>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <select name="user_type_id" class="form-control">
                                            <option value="">Noting Selected</option>
                                            @foreach($user_types as $user_type)
                                                <option value="{{$user_type->user_type_id}}">{{$user_type->user_type}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group push-up-30">
                                    <div class="col-md-6">
                                        {{--<a href="#" class="btn btn-link btn-block">Already have account?</a>--}}
                                    </div>
                                    <div class="col-md-6">
                                        <button type="submit" class="btn btn-danger btn-block">Sign Up User</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- END JQUERY VALIDATION PLUGIN -->
            </div>

        </div>

    </div>
    <!-- END PAGE CONTENT WRAPPER -->

    @endsection


    @section('custom_script')
            <!-- START THIS PAGE PLUGINS-->
    <script type="text/javascript" src="{{ asset('/js/plugins/bootstrap/bootstrap-select.js') }}"></script>
    <!-- END THIS PAGE PLUGINS-->

    <!-- START TEMPLATE -->
    <script type="text/javascript" src="{{ asset('/js/custom/menu_item.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function() {
            setTabActive('[href="/users/create"]');
        });
    </script>
@endsection