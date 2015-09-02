@extends('layouts.default')

@section('title', 'Add Supervisor')

@section('page_title')
    <li><a href="/supervisors">Supervisors</a></li>
    <li class="active">Create</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-plus-square"></span> Add Supervisor</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12">
                @include('errors.errors')
                <form method="post" action="{{ url('/supervisors/create') }}" class="form-horizontal" role="form">
                    {!! csrf_field() !!}
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><strong>New Supervisor</strong> Form</h3>
                            <ul class="panel-controls">
                                <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                            </ul>
                        </div>
                        <div class="panel-body">
                            <p></p>
                        </div>
                        <div class="panel-body">

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Supervisor's First Name</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        <input type="text" value="{{ Input::old('first_name') }}" name="first_name" placeholder="Supervisor's First Name" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Supervisor's Last Name</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        <input type="text" value="{{ Input::old('last_name') }}" name="last_name" placeholder="Supervisor's Last Name" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Supervisor's E-mail</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-envelope"></span></span>
                                        <input type="text" value="{{ Input::old('email') }}" name="email" placeholder="Supervisor's E-mail" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Supervisor's Phone Number</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-phone"></span></span>
                                        <input type="text" value="{{ Input::old('phone_no') }}" name="phone_no" placeholder="Supervisor's Phone Number" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <button class="btn btn-default" type="reset">Clear Form</button>
                            <button class="btn btn-primary pull-right" type="submit">Submit</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>

    </div>
    <!-- END PAGE CONTENT WRAPPER -->
    @endsection

    @section('custom_script')
    <!-- START TEMPLATE -->
    <script type="text/javascript" src="{{ asset('/js/custom/supervisor.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function () {
            setTabActive('[href="/supervisors/create"]');
        });
    </script>
@endsection