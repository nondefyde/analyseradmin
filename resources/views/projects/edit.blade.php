@extends('layouts.default')

@section('title', 'Edit Project')

@section('page_title')
    <li><a href="/projects">Projects</a></li>
    <li class="active">Update</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-edit"></span> Edit Project</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12">
                <div id="image_error"></div>
                @include('errors.errors')
                {!! Form::model(
                        $project, [
                        'method'=>'PATCH',
                        'route'=>['projects.update', $hashIds->encode($project->project_id)],
                        'class'=>'form-horizontal',
                        'files'=>true,
                        'role'=>'form'
                    ])
                !!}
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><strong>Edit Project</strong> Form</h3>
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
                                            {!! Form::text('title', Input::old('title'), ['placeholder'=>'Project Title', 'class'=>'form-control']) !!}
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-5 control-label">Contractor</label>

                                    <div class="col-md-7">
                                        <select class="form-control select" name="contractor_id">
                                            <option value="">Nothing Selected</option>
                                            @foreach($contractors as $contractor)
                                                @if($contractor->contractor_id === $project->contractor_id)
                                                    <option selected
                                                            value="{{ $contractor->contractor_id }}">{{ $contractor->contractor }}</option>
                                                @else
                                                    <option value="{{ $contractor->contractor_id }}">{{ $contractor->contractor }}</option>
                                                @endif
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-5 control-label">Sector(s)</label>

                                    <div class="col-md-7">
                                        <select multiple class="form-control select" name="sector_id[]">
                                            @foreach($sectors as $sector)
                                                @if(in_array($sector->sector_id, $project_sectors))
                                                    <option selected
                                                            value="{{ $sector->sector_id }}">{{ $sector->sector }}</option>
                                                @else
                                                    <option value="{{ $sector->sector_id }}">{{ $sector->sector }}</option>
                                                @endif
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
                                                    @if(in_array($supervisor->subUser()->first()->user_id, $project_supervisors))
                                                        <option selected
                                                                value="{{ $supervisor->subUser()->first()->user_id }}">{{ $supervisor->subUser()->first()->fullNames() }}</option>
                                                    @else
                                                        <option value="{{ $supervisor->subUser()->first()->user_id }}">{{ $supervisor->subUser()->first()->fullNames() }}</option>
                                                    @endif
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
                                            {!! Form::text('started_on', $project->started_on->format('Y-m-d'), ['placeholder'=>'Date Commenced', 'class'=>'form-control datepicker']) !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-5 col-xs-12 control-label">Expected Date of Completion</label>

                                    <div class="col-md-7 col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                                            {!! Form::text('expected_on', $project->expected_on->format('Y-m-d'), ['placeholder'=>'Expected Date of Completion', 'class'=>'form-control datepicker']) !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-5 col-xs-12 control-label">Completion Date</label>

                                    <div class="col-md-7 col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                                            {!! Form::text('completed_on', ($project->completed_on) ? $project->completed_on->format('Y-m-d') : '', ['placeholder'=>'Completion Date', 'class'=>'form-control datepicker']) !!}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-5 control-label">Project Description</label>

                                    <div class="col-md-7 col-xs-12">
                                        {!! Form::textarea('description', Input::old('description'), ['class'=>'form-control', 'rows'=>'4', 'placeholder'=>'Project Description']) !!}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-5 control-label">Purpose of Project</label>

                                    <div class="col-md-7 col-xs-12">
                                        {!! Form::textarea('purpose', Input::old('purpose'), ['class'=>'form-control', 'rows'=>'3', 'placeholder'=>'Purpose of Project']) !!}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-5 control-label">Award Letter (.pdf)</label>

                                    <div class="col-md-7">
                                        <input type="file" class="fileinput btn-primary" name="award_letter" id="award_letter" title="Browse file"/>
                                        <a href="{{ url($project->file_path . $project->award_letter) }}" class="view-pdf" rel="Award Letter">
                                            <span class="fa fa-file"></span> View Award Letter
                                        </a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-5 control-label">Memorandum of Understanding (.pdf)</label>

                                    <div class="col-md-7">
                                        <input type="file" class="fileinput btn-primary" name="mou" id="mou" title="Browse file"/>
                                        <a href="{{ url($project->file_path . $project->mou) }}" class="view-pdf" rel="Memorandum of Understanding">
                                            <span class="fa fa-file"></span> View MoU
                                        </a>
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
                {!! Form::close() !!}

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
            setTabActive('[href="/projects"]');
        });
    </script>
@endsection