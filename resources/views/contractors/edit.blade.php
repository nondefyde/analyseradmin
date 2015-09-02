@extends('layouts.default')

@section('title', 'Edit Contractor')

@section('page_title')
    <li><a href="/contractors">Contractors</a></li>
    <li class="active">Adjust</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-edit"></span> Edit Contractor</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12">
                @include('errors.errors')
                {!! Form::model(
                        $contractor, [
                        'method'=>'PATCH',
                        'route'=>['contractors.update', $hashIds->encode($contractor->contractor_id)],
                        'class'=>'form-horizontal',
                        'role'=>'form'
                    ])
                !!}
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><strong>New Contractor</strong> Form</h3>
                            <ul class="panel-controls">
                                <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                            </ul>
                        </div>
                        <div class="panel-body">
                            <p></p>
                        </div>
                        <div class="panel-body">

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Registration Code</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        {!! Form::text('contractor_code', Input::old('contractor_code'), ['placeholder'=>'Registration Code', 'class'=>'form-control']) !!}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Contractor</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        {!! Form::text('contractor', Input::old('contractor'), ['placeholder'=>'Contractor', 'class'=>'form-control']) !!}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">E-mail</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-envelope"></span></span>
                                        {!! Form::text('email', Input::old('email'), ['placeholder'=>'Contractor E-mail', 'class'=>'form-control']) !!}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Phone Number</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-phone"></span></span>
                                        {!! Form::text('phone_no', Input::old('phone_no'), ['placeholder'=>'Contractor Phone Number', 'class'=>'form-control']) !!}
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">C.A.C Registration No</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        {!! Form::text('cac_registration_no', Input::old('cac_registration_no'), ['placeholder'=>'C.A.C Registration No.', 'class'=>'form-control']) !!}
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">T.I.N</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        {!! Form::text('tin', Input::old('tin'), ['placeholder'=>'Contractor T.I.N', 'class'=>'form-control']) !!}
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Area of Specialization</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        {!! Form::text('specialization_area', Input::old('specialization_area'), ['placeholder'=>'Area of Specialization', 'class'=>'form-control']) !!}
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Years of Experience</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        {!! Form::input('number', 'years_experience', Input::old('years_experience'), ['placeholder'=>'Years of Experience', 'class'=>'form-control']) !!}
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Head Office Address</label>
                                <div class="col-md-6 col-xs-12">
                                    {!! Form::textarea('address', Input::old('address'), ['class'=>'form-control', 'rows'=>'5', 'placeholder'=>'Head Office Address']) !!}
                                </div>
                            </div>

                        </div>
                        <div class="panel-footer">
                            <button class="btn btn-primary pull-right" type="submit">Update Record</button>
                        </div>
                    </div>
                {!! Form::close() !!}
            </div>
        </div>

    </div>
    <!-- END PAGE CONTENT WRAPPER -->
    @endsection

    @section('custom_script')
    <!-- START TEMPLATE -->
    <script type="text/javascript" src="{{ asset('/js/custom/contractor.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function () {
            setTabActive('[href="/contractors"]');
        });
    </script>
@endsection