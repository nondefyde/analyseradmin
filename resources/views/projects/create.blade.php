@extends('layouts.default')

@section('title', 'Create Project')

@section('page_title')
    <li><a href="/projects">Projects</a></li>
    <li class="active">Create</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-plus-square"></span> Create Project</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12">
                <div id="image_error"></div>
                @include('errors.errors')
                <form method="post" action="{{ url('projects') }}" enctype="multipart/form-data" class="form-horizontal" role="form">
                    {!! csrf_field() !!}
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><strong>New Project</strong> Form</h3>
                            <ul class="panel-controls">
                                <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                            </ul>
                        </div>
                        <div class="panel-body">
                        </div>
                        <div class="panel-body">

                            <div class="row">

                                <div class="col-md-6">

                                    <div class="form-group">
                                        <label class="col-md-5 col-xs-12 control-label">Project Title</label>
                                        <div class="col-md-7 col-xs-12">
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <input type="text" value="{{ Input::old('title') }}" placeholder="Project Title" name="title" class="form-control"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-5 control-label">Contractor</label>

                                        <div class="col-md-7">
                                            <select class="form-control select" name="contractor_id">
                                                <option value="">Nothing Selected</option>
                                                @foreach($contractors as $contractor)
                                                    <option value="{{ $contractor->contractor_id }}">{{ $contractor->contractor }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-5 control-label">Sector(s)</label>
                                        <div class="col-md-7">
                                            <select multiple class="form-control select" name="sector_id[]">
                                                @foreach($sectors as $sector)
                                                    <option value="{{ $sector->sector_id }}">{{ $sector->sector }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-5 control-label">Supervisor(s)</label>
                                        <div class="col-md-7">
                                            <select multiple class="form-control select" name="supervisor_id[]">
                                                @foreach($supervisors as $supervisor)
                                                    @if($supervisor->subUser()->first()->status === 1)
                                                        <option value="{{ $supervisor->subUser()->first()->user_id }}">{{ $supervisor->subUser()->first()->fullNames() }}</option>
                                                    @endif
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-5 col-xs-12 control-label">Date Commenced</label>
                                        <div class="col-md-7 col-xs-12">
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                                                <input type="text" name="started_on" class="form-control datepicker" placeholder="Date Commenced" value="{{ Input::old('started_on') }}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-5 col-xs-12 control-label">Expected Date of Completion</label>

                                        <div class="col-md-7 col-xs-12">
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                                                <input type="text" name="expected_on" class="form-control datepicker" placeholder="Expected Date of Completion" value="{{ Input::old('expected_on') }}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-5 col-xs-12 control-label">Completion Date</label>
                                        <div class="col-md-7 col-xs-12">
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                                                <input type="text" name="completed_on" class="form-control datepicker" placeholder="Completion Date" value="{{ Input::old('completed_on') }}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-5 control-label">Project Description</label>

                                        <div class="col-md-7 col-xs-12">
                                            <textarea class="form-control" name="description" rows="4" placeholder="Project Description">{{ Input::old('description') }}</textarea>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-5 control-label">Purpose of Project</label>

                                        <div class="col-md-7 col-xs-12">
                                            <textarea class="form-control" name="purpose" rows="3" placeholder="Purpose of Project">{{ Input::old('purpose') }}</textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-5 control-label">Award Letter (.pdf)</label>

                                        <div class="col-md-7">
                                            <input type="file" class="fileinput btn-primary" placeholder="Award Letter (.pdf)" name="award_letter" id="award_letter" title="Browse file"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-5 control-label">Memorandum of Understanding (.pdf)</label>
                                        <div class="col-md-7">
                                            <input type="file" class="fileinput btn-primary" placeholder="Memorandum of Understanding (.pdf)" name="mou" id="mou" title="Browse file"/>
                                        </div>
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

    </div>
    <!-- END PAGE CONTENT WRAPPER -->
    @endsection


    @section('custom_script')
            <!-- START TEMPLATE -->

    <script type="text/javascript" src="{{ asset('/js/plugins/bootstrap/bootstrap-datepicker.js') }}"></script>
    <script type="text/javascript" src="{{ asset('/js/plugins/bootstrap/bootstrap-file-input.js') }}"></script>
    <script type="text/javascript" src="{{ asset('/js/plugins/bootstrap/bootstrap-select.js') }}"></script>
    <script type="text/javascript" src="{{ asset('/js/plugins/tagsinput/jquery.tagsinput.min.js') }}"></script>


    <script type="text/javascript" src="{{ asset('/js/custom/projects.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function () {
            setTabActive('[href="/projects/create"]');
        });
    </script>
@endsection