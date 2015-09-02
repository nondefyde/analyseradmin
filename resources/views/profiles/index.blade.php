@extends('layouts.default')

@section('before_custom_css')
    <link rel="stylesheet" type="text/css" href="{{ asset('/css/cropper/cropper.min.css') }}"/>
@endsection

@section('title', 'Edit Profile')

@section('page_title')
    <li><a href="{{ url('/profiles') }}">Profile</a></li>
    <li class="active">Manage</li>
@endsection

@section('content')
    <div class="page-title">
        <h2><span class="fa fa-edit"></span> Edit Profile</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">
        <div class="row">
            <div class="col-md-3 col-sm-4 col-xs-5">
                <form action="#" class="form-horizontal">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h3><span class="fa fa-user"></span> {{Auth::user()->fullNames()}}</h3>

                            <p>Type / <strong>{{ Auth::user()->userType()->first()->user_type }}</strong></p>
                            <div class="text-center" id="user_image">
                                @if(!Auth::user()->avatar)
                                    <img src="{{ asset('/images/avatar.svg') }}" class="img-thumbnail"/>
                                @else
                                    <img src="https://s3-us-west-2.amazonaws.com/analyser/{{ Auth::user()->avatar }}" class="img-thumbnail"/>
                                @endif
                            </div>
                        </div>
                        <div class="panel-body form-group-separated">

                            <div class="form-group">
                                <div class="col-md-12 col-xs-12">
                                    <a href="#" class="btn btn-primary btn-block btn-rounded" data-toggle="modal"
                                       data-target="#modal_change_photo">Change Photo</a>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 col-xs-5 control-label">E-mail</label>

                                <div class="col-md-9 col-xs-7">
                                    <input type="text" name="email" disabled value="{{Auth::user()->email}}" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-12 col-xs-12">
                                    <a href="#" class="btn btn-danger btn-block btn-rounded" data-toggle="modal"
                                       data-target="#modal_change_password">Change password</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </form>

            </div>
            <div class="col-md-6 col-sm-8 col-xs-7">
                <div>@include('errors.errors')</div>
                {!! Form::model(
                        Auth::user(), [
                        'method'=>'POST',
                        'class'=>'form-horizontal',
                        'role'=>'form'
                    ])
                !!}
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h3><span class="fa fa-pencil"></span> Profile</h3>

                            <p>This information lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer
                                faucibus, est quis molestie tincidunt, elit arcu faucibus erat.</p>
                        </div>
                        <div class="panel-body form-group-separated">
                            <div class="form-group">
                                <label class="col-md-3 col-xs-5 control-label">First Name</label>

                                <div class="col-md-8 col-xs-7">
                                    {!! Form::text('first_name', Input::old('first_name'), ['id'=>'first_name', 'placeholder'=>'First Name', 'class'=>'form-control']) !!}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-5 control-label">Last Name</label>

                                <div class="col-md-9 col-xs-7">
                                    {!! Form::text('last_name', Input::old('last_name'), ['id'=>'last_name', 'placeholder'=>'Last Name', 'class'=>'form-control']) !!}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-5 control-label">Middle Name</label>

                                <div class="col-md-8 col-xs-7">
                                    {!! Form::text('middle_name', Input::old('middle_name'), ['id'=>'middle_name', 'placeholder'=>'Middle Name', 'class'=>'form-control']) !!}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-5 control-label">Gender</label>
                                <?php
                                    $male = $female = '';
                                    if(Auth::user()->gender === 'Female')
                                        $female = 'checked';
                                    elseif(Auth::user()->gender === 'Male')
                                        $male = 'checked';
                                ?>
                                <div class="col-md-4">
                                    <label class="check"><input {{ $female }} type="radio" value="Female" class="icheckbox" name="gender"/> Female</label>
                                </div>
                                <div class="col-md-4">
                                    <label class="check"><input {{ $male }} type="radio" value="Male" class="iradio" name="gender"/> Male</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-5 control-label">Date of Birth</label>

                                <div class="col-md-8 col-xs-7">
                                    {!! Form::text('dob', (Auth::user()->dob !== null) ? Auth::user()->dob->format('Y-m-d') : '', ['id'=>'dob', 'placeholder'=>'Date of Birth', 'class'=>'form-control datepicker']) !!}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-5 control-label">Phone number</label>

                                <div class="col-md-8 col-xs-7">
                                    {!! Form::text('phone_no', Input::old('phone_no'), ['id'=>'phone_no', 'placeholder'=>'Phone number', 'class'=>'form-control']) !!}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-5 control-label">State</label>

                                <div class="col-md-8 col-xs-7">
                                    @if($lga === null)
                                        {!! Form::select('state_id', $states, Input::old('state_id'), ['class'=>'form-control', 'id'=>'state_id']) !!}
                                    @else
                                        {!! Form::select('state_id', $states, $lga->state_id, ['class'=>'form-control', 'id'=>'state_id']) !!}
                                    @endif
                                </div>
                                <span></span>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-5 control-label">L.G.A</label>
                                <div class="col-md-8 col-xs-7">
                                    @if($lga == null)
                                        {!! Form::select('lga_id', [''=>'Nothing Selected'], '', ['class'=>'form-control', 'id'=>'lga_id']) !!}
                                    @else
                                        {!! Form::select('lga_id', $lgas, $lga->lga_id, ['class'=>'form-control', 'id'=>'lga_id']) !!}
                                    @endif
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12 col-xs-5">
                                    {!! Form::submit('Save', ['class'=>'btn btn-primary btn-rounded pull-right']) !!}
                                </div>
                            </div>
                        </div>
                    </div>
                {!! Form::close() !!}

            </div>

            <div class="col-md-3">
                <div class="panel panel-default form-horizontal">
                    <div class="panel-body">
                        <h3><span class="fa fa-info-circle"></span> Quick Info</h3>

                        <p>Some quick info about this user</p>
                    </div>
                    <div class="panel-body form-group-separated">
                        <div class="form-group">
                            <label class="col-md-4 col-xs-5 control-label">Last visit</label>

                            <div class="col-md-8 col-xs-7 line-height-30">12:46 27.11.2015</div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 col-xs-5 control-label">Registration</label>

                            <div class="col-md-8 col-xs-7 line-height-30">
                                @if(Auth::user()->created_at){{ Auth::user()->created_at->format('D, jS M, Y') }}@else {!! '<span class="label label-danger">nil</span>' !!}@endif
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 col-xs-5 control-label">Groups</label>

                            <div class="col-md-8 col-xs-7">administrators, managers, team-leaders, developers</div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 col-xs-5 control-label">Birthday</label>

                            <div class="col-md-8 col-xs-7 line-height-30">
                                @if(Auth::user()->dob){{ Auth::user()->dob->format('D, jS M, Y') }}@else {!! '<span class="label label-danger">nil</span>' !!}@endif
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 col-xs-5 control-label">Age</label>

                            <div class="col-md-8 col-xs-7 line-height-30">
                                @if(Auth::user()->dob){{ Auth::user()->dob->age }} Years Old @else {!! '<span class="label label-danger">nil</span>' !!}@endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END PAGE CONTENT WRAPPER -->



    <div class="modal animated fadeIn" id="modal_change_photo" tabindex="-1" role="dialog"
         aria-labelledby="smallModalHead" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                                aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="smallModalHead">Change photo</h4>
                </div>
                <form id="cp_crop" method="post" action="{{ url('profiles/crop-picture')  }}">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                    <div class="modal-body">
                        <div class="text-center" id="cp_target">Use form below to upload file. Only .jpg files.</div>
                        <input type="hidden" name="cp_img_path" id="cp_img_path"/>
                        <input type="hidden" name="ic_x" id="ic_x"/>
                        <input type="hidden" name="ic_y" id="ic_y"/>
                        <input type="hidden" name="ic_w" id="ic_w"/>
                        <input type="hidden" name="ic_h" id="ic_h"/>
                    </div>
                </form>
                <form id="cp_upload" method="post" enctype="multipart/form-data"
                      action="{{ url('profiles/upload-picture')  }}">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                    <input type="hidden" name="user" value="{{Auth::user()->user_id}}">
                    <div class="modal-body form-horizontal form-group-separated">
                        <div class="form-group">
                            <label class="col-md-4 control-label">New Photo</label>

                            <div class="col-md-4">
                                <input type="file" class="fileinput btn-info" name="file" id="cp_photo"
                                       data-filename-placement="inside" title="Select file"/>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success disabled" id="cp_accept">Accept</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal animated fadeIn" id="modal_change_password" tabindex="-1" role="dialog" aria-labelledby="smallModalHead" aria-hidden="true">
       <form id="password_change_form" method="post">
           {!! csrf_field() !!}
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="smallModalHead">Change password</h4>
                    </div>
                    <div class="modal-body">
                        <div class="alert alert-danger hide" id="error_msg"></div>
                    </div>
                    <div class="modal-body form-horizontal form-group-separated">
                        <div class="form-group">
                            <label class="col-md-3 control-label">Old Password</label>
                            <div class="col-md-9">
                                <input type="password" class="form-control" name="password" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">New Password</label>
                            <div class="col-md-9">
                                <input type="password" class="form-control" name="new_password" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Repeat Password</label>
                            <div class="col-md-9">
                                <input type="password" class="form-control" name="password_confirmation" required/>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-danger">Process</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
       </form>
    </div>
    @endsection

    @section('custom_script')
            <!-- START THIS PAGE PLUGINS-->
    <script type="text/javascript" src="{{ asset('/js/plugins/jquery/jquery-migrate.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('/js/plugins/bootstrap/bootstrap-select.js') }}"></script>

    <script type="text/javascript" src="{{ asset('/js/plugins/bootstrap/bootstrap-file-input.js') }}"></script>
    <script type="text/javascript" src="{{ asset('/js/plugins/form/jquery.form.js') }}"></script>

    <script type="text/javascript" src="{{ asset('/js/plugins/cropper/cropper.min.js') }}"></script>
    <script type='text/javascript' src='{{ asset('/js/plugins/bootstrap/bootstrap-datepicker.js') }}'></script>
    <!-- END THIS PAGE PLUGINS-->

    <!-- START TEMPLATE -->
    <script type="text/javascript" src="{{ asset('/js/custom/edit_profile.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function() {
            setTabActive('[href="/profiles"]');
        });
    </script>
@endsection