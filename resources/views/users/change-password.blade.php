@extends('layouts.default')

@section('title', 'Password Change')

@section('page_title')
    <li><a href="/auth/change">Password</a></li>
    <li class="active">Change</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-lock"></span> Password Change</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12">
                <div class="registration-container">
                    <div class="registration-box animated fadeInDown">
                        @include('errors.errors')
                        <div class="registration-body">
                            <div class="registration-title"><strong>Change</strong> Password?</div>
                            <form action="/users/change" class="form-horizontal" method="post">
                                {!! csrf_field() !!}
                                <h4>Old Password</h4>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input name="password" type="password" min="6" class="form-control" placeholder="Old Password" required/>
                                    </div>
                                </div>
                                <h4>New Password</h4>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input name="new_password" type="password" min="6" class="form-control" placeholder="New Password" required/>
                                    </div>
                                </div>
                                <h4>Confirm Password</h4>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input name="password_confirmation" min="6" type="password" class="form-control" placeholder="Confirm Password" required/>
                                    </div>
                                </div>
                                <div class="form-group push-up-20">
                                    <div class="col-md-6">
                                        <button type="submit" class="btn btn-danger btn-block">Change</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="registration-footer">
                            <p></p>
                        </div>
                    </div>

                </div>
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
            setTabActive('[href="/users/password-change"]');
        });
    </script>
@endsection