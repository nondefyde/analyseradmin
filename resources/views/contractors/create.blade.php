@extends('layouts.default')

@section('title', 'Add Contractor')

@section('page_title')
    <li><a href="/contractors">Contractors</a></li>
    <li class="active">Create</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-plus-square"></span> Add Contractor</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12">
                @include('errors.errors')
                <form method="post" action="{{ url('contractors') }}" class="form-horizontal" role="form">
                    {!! csrf_field() !!}
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
                                        <input type="text" value="{{ Input::old('contractor_code') }}" name="contractor_code" placeholder="Registration Code" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Contractor</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        <input type="text" value="{{ Input::old('contractor') }}" name="contractor" placeholder="Contractor" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">E-mail</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-envelope"></span></span>
                                        <input type="text" value="{{ Input::old('email') }}" name="email" placeholder="Contractor E-mail" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Phone Number</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-phone"></span></span>
                                        <input type="text" value="{{ Input::old('phone_no') }}" name="phone_no" placeholder="Contractor Phone Number" class="form-control"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">C.A.C Registration No</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        <input type="text" value="{{ Input::old('cac_registration_no') }}" name="cac_registration_no" placeholder="CAC Registration No" class="form-control"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">T.I.N</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        <input type="text" value="{{ Input::old('tin') }}" name="tin" placeholder="Contractor TIN" class="form-control"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Area of Specialization</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        <input type="text" value="{{ Input::old('specialization_area') }}" name="specialization_area" placeholder="Area of Specialization" class="form-control"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Years of Experience</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        <input type="number" value="{{ Input::old('years_experience') }}" name="years_experience" placeholder="Years of Experience" class="form-control"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Head Office Address</label>
                                <div class="col-md-6 col-xs-12">
                                    <textarea class="form-control" rows="5" name="address" placeholder="Head Office Address">{{ Input::old('address') }}</textarea>
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
            <!-- THIS PAGE PLUGINS -->
    <script type="text/javascript" src="{{ asset('/js/plugins/smartwizard/jquery.smartWizard-2.0.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('/js/plugins/jquery-validation/jquery.validate.js') }}"></script>
    <!-- END PAGE PLUGINS -->

    <!-- START TEMPLATE -->
    <script type="text/javascript" src="{{ asset('/js/custom/contractor.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function () {
            setTabActive('[href="/contractors/create"]');
        });
    </script>
@endsection