@extends('layouts.default')

@section('title', 'Edit Hansard')

@section('page_title')
    <li><a href="/hansards">Hansards</a></li>
    <li class="active">Edit Hansard</li>
    @endsection

    @section('content')
    {{--<!-- END PAGE CONTENT WRAPPER -->--}}

            <!-- START CONTENT FRAME -->
    <div class="content-frame">
        <!-- START CONTENT FRAME TOP -->
        <div class="content-frame-top">
            <div class="page-title">
                <h2><span class="fa fa-pencil"></span> Edit Uploaded Hansards</h2>
            </div>
            {{--<div class="pull-right">--}}
            {{--<button class="btn btn-default"><span class="fa fa-cogs"></span> Settings</button>--}}
            {{--</div>--}}
        </div>
        <!-- END CONTENT FRAME TOP -->

        <!-- START CONTENT FRAME LEFT -->
        <div class="content-frame-left">
            <div class="block">
                <div class="list-group border-bottom">
                    <a href="{{ url('/hansards/roll-call/' . $hashIds->encode($hansard->hansard_id)) }}"
                       class="list-group-item active"><span class="fa fa-inbox"></span> Edit Roll Call</a>
                </div>
                <h4>Statistics</h4>
                <ul class="list-group border-bottom">
                    <li class="list-group-item">Senators<span class="badge badge-info">{{ $senators }}</span></li>
                    <li class="list-group-item">Federal Representative Members<span
                                class="badge badge-info">{{ $federal_rep }}</span></li>
                    <li class="list-group-item">State Representative Members<span
                                class="badge badge-info">{{ $state_rep }}</span></li>
                </ul>
            </div>
            <div class="block">
                <h4>Information</h4>

                <div class="list-group list-group-simple">
                    <a href="#" class="list-group-item"><span class="fa fa-file-pdf-o text-danger"></span> must be in
                        .pdf format</a>
                    <a href="#" class="list-group-item"><span class="fa fa-info-circle text-danger"></span> Roll call
                        should be taken after upload</a>
                </div>
            </div>
        </div>
        <!-- END CONTENT FRAME LEFT -->

        <!-- START CONTENT FRAME BODY -->
        <div class="content-frame-body">
            <div class="block">
                <div>@include('errors.errors')</div>
                <form role="form" action="{{ url('/hansards/edit/' . $hashIds->encode($hansard->hansard_id)) }}"
                      method="post" enctype="multipart/form-data" class="form-horizontal">
                    <input name="_method" type="hidden" value="PATCH">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <label class="col-md-2 control-label">Volume: </label>

                        <div class="col-md-3">
                            <input type="number" min="1" class="form-control" value="{{ $hansard->volume }}"
                                   name="volume" placeholder="Vol."/>
                        </div>
                        <label class="col-md-2 control-label">Number: </label>

                        <div class="col-md-3">
                            <input type="number" min="1" class="form-control" value="{{ $hansard->number }}"
                                   placeholder="No." name="number"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">House: </label>

                        <div class="col-md-8">
                            <select class="form-control select" name="house_id">
                                <option value="">Nothing Selected</option>
                                @foreach($houses as $house)
                                    @if($house->house_id === $hansard->house_id)
                                        <option selected value="{{ $house->house_id }}">{{ $house->house }}</option>
                                    @else
                                        <option value="{{ $house->house_id }}">{{ $house->house }}</option>
                                    @endif
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">Session: </label>

                        <div class="col-md-8">
                            <input type="text" class="form-control" value="{{ $hansard->session }}"
                                   placeholder="Session" name="session"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">Date: </label>

                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                                <input type="text" name="date" class="form-control datepicker" placeholder="Date"
                                       value="{{ $hansard->date->format('Y-m-d') }}">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">Attachments: </label>

                        <div class="col-md-6">
                            <input type="file" class="fileinput btn-primary" name="upload_url"
                                   placeholder="Attachments (.pdf)" title="Browse file"
                                   data-filename-placement="inside"/>
                            <a href="https://s3-us-west-2.amazonaws.com/analyser/{{$hansard->file_path . $hansard->upload_url}}"
                               class="btn btn-default view-pdf" rel="Hansard"
                               rel="Vol.{{ $hansard->volume }} No.{{ $hansard->number }} of {{ $hansard->house()->first()->house }} : {{ $hansard->session }}">
                                <span class="fa fa-file"></span> View Upload
                            </a>
                        </div>
                        <div class="col-md-4">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-10">
                            <div class="pull-right">
                                <button class="btn btn-primary"><span class="fa fa-save"></span> Update Hansard
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- END CONTENT FRAME BODY -->
    </div>
    <!-- END CONTENT FRAME -->
@endsection

@section('custom_script')
    <script type="text/javascript" src="{{ asset('/js/plugins/bootstrap/bootstrap-datepicker.js') }}"></script>
    <script type="text/javascript" src="{{ asset('/js/plugins/bootstrap/bootstrap-file-input.js') }}"></script>
    <script type="text/javascript" src="{{ asset('/js/plugins/bootstrap/bootstrap-select.js') }}"></script>
    <!-- START TEMPLATE -->
    <script type="text/javascript" src="{{ asset('/js/custom/hansards.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function () {
            setTabActive('[href="/hansards/create"]');
        });
    </script>
@endsection