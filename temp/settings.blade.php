@extends('resources.views.layouts.default')

@section('title', 'Composer Hansard')

@section('page_title')
    <li><a href="/hansards">Hansards</a></li>
    <li class="active">Settings</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-plus-square"></span> Hansard Settings</h2>
    </div>
    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">
        <div class="row">
            <div class="col-md-10 col-lg-offset-1">
                <!-- START PANEL WITH CONTROL CLASSES -->
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <h3 class="panel-title">Hansards Default Settings</h3>
                    </div>
                    <div class="panel-body">
                        <form action="#" role="form" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-md-4 control-label">What Assembly ?.</label>

                                <div class="col-md-4">
                                    {{--{{$assemblies}}--}}
                                    <select class="form-control select" name="assembly" id="assembly">
                                        <option value="0">Nothing Selected</option>
                                        @foreach($assemblies as $assembly)
                                            <option value="{{ $assembly->assembly_id }}">{{ $assembly->assembly }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div id="assembly_content" class="text-center">

                            </div>
                            <hr>
                        </form>
                    </div>
                    <div class="panel-footer">
                        <button class="btn btn-primary pull-right">Button</button>
                    </div>
                </div>
                <!-- END PANEL WITH CONTROL CLASSES -->
            </div>
        </div>
    </div>
    <!-- END PAGE CONTENT WRAPPER -->
@endsection

@section('custom_script')
    <script type="text/javascript" src="{{ asset('/js/plugins/jquery/jquery-migrate.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('/js/plugins/bootstrap/bootstrap-select.js') }}"></script>
    <!-- START TEMPLATE -->
    <script type="text/javascript" src="{{ asset('/js/custom/hansard_setting.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function () {
            setTabActive('[href="/hansards"]');
        });
    </script>
@endsection