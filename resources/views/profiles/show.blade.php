@extends('layouts.default')

@section('title', 'Details')

@section('page_title')
    <li><a href="#">{{ $type }}</a></li>
    <li class="active">Details</li>
@endsection

@section('content')
    <div class="page-title">
        <h2><span class="fa fa-table"></span> {{ $type }} Details</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">
        <div class="row">
            <div class="col-md-3 col-sm-4 col-xs-5">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <h3><span class="fa fa-user"></span> {{$user->fullNames()}}</h3>

                        <p>Type / <strong>{{ $user->userType()->first()->user_type }}</strong></p>

                        <div class="text-center" id="user_image">
                            @if(!$user->avatar)
                                <img src="{{ asset('/images/avatar.svg') }}" class="img-thumbnail"/>
                            @else
                                <img src="https://s3-us-west-2.amazonaws.com/analyser/{{ Auth::user()->avatar }}" class="img-thumbnail"/>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-sm-8 col-xs-7">
                <form action="#" class="form-horizontal">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h3><span class="fa fa-pencil"></span> {{ $type }} Details</h3>
                        </div>
                        <div class="panel-body form-group-separated">
                            <div class="form-group">
                                <label class="col-md-3 col-xs-5 control-label">First Name: </label>

                                <div class="col-md-8 col-xs-7">{{ $user->first_name }}</div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-5 control-label">Last Name: </label>

                                <div class="col-md-8 col-xs-7">{{ $user->last_name }}</div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-5 control-label">Middle Name: </label>

                                <div class="col-md-8 col-xs-7">
                                    {!! ($user->middle_name) ? $user->middle_name : '<span class="label label-danger">nil</span>' !!}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-5 control-label">Gender: </label>

                                <div class="col-md-8 col-xs-7">
                                    {!! ($user->gender) ? $user->gender : '<span class="label label-danger">nil</span>' !!}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-5 control-label">Age: </label>

                                <div class="col-md-8 col-xs-7">
                                    {!! ($user->dob) ? $user->dob->age . ' Years' : '<span class="label label-danger">nil</span>' !!}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-5 control-label">Date of Birth: </label>

                                <div class="col-md-8 col-xs-7">
                                    {!! ($user->dob) ? $user->dob->format('D, jS, F Y') : '<span class="label label-danger">nil</span>' !!}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-5 control-label">Phone Number: </label>

                                <div class="col-md-8 col-xs-7">
                                    {!! ($user->phone_no) ? $user->phone_no : '<span class="label label-danger">nil</span>' !!}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-5 control-label">State: </label>

                                <div class="col-md-8 col-xs-7">
                                    {!! ($user->lga_id) ? $user->lga()->first()->state()->first()->state . ' State' : '<span class="label label-danger">nil</span>' !!}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-5 control-label">L.G.A: </label>

                                <div class="col-md-8 col-xs-7">
                                    {!! ($user->lga_id) ? $user->lga()->first()->lga : '<span class="label label-danger">nil</span>' !!}
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- END PAGE CONTENT WRAPPER -->
@endsection

@section('custom_script')
    <script>
        jQuery(document).ready(function () {
            setTabActive('[href="/profiles/show"]');
        });
    </script>
@endsection