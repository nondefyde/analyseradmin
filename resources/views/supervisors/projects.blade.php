@extends('layouts.default')

@section('title', 'Project Manage')

@section('page_title')
    <li><a href="/">Dashboard</a></li>
    <li class="active">Manage Projects</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-list-alt"></span> Projects</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">

        </div>
        <div class="col-md-12">
            <!-- START DEFAULT DATATABLE -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">List of Projects</h3>
                    <ul class="panel-controls">
                        <li><a href="#" class="panel-collapse"><span class="fa fa-angle-down"></span></a></li>
                        <li><a href="#" class="panel-refresh"><span class="fa fa-refresh"></span></a></li>
                        <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                    </ul>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-actions datatable">
                            <thead>
                                <tr>
                                    <th style="width: 1%;">#</th>
                                    <th style="width: 30%;">Title</th>
                                    <th style="width: 20%;">Contractor</th>
                                    <th style="width: 8%;">TimeLine</th>
                                    <th style="width: 10%;">Started On</th>
                                    <th style="width: 10%;">Expected On</th>
                                    <th style="width: 7%;">Domain</th>
                                    <th style="width: 7%;">Beneficiary</th>
                                    <th style="width: 7%;">Details</th>
                                </tr>
                            </thead>
                            <tbody>
                            @if(count($projectSupervisors) > 0)
                                <?php $i = 1; ?>
                                @foreach($projectSupervisors as $projectSupervisor)
                                    <tr>
                                        <td class="text-center">{{$i++}} </td>
                                        <td>{{ $projectSupervisor->project()->first()->title }}</td>
                                        <td>
                                            <a target="_blank" href="{{ url('/projects/contractor/'.$hashIds->encode($projectSupervisor->project()->first()->contractor_id)) }}" class="btn btn-link text-danger">
                                                {{ $projectSupervisor->project()->first()->contractor()->first()->contractor }}
                                            </a>
                                        </td>
                                        <td>
                                            <a target="_blank" href="{{ url('/projects/timeline/'.$hashIds->encode($projectSupervisor->project()->first()->project_id)) }}" class="btn btn-primary btn-rounded btn-condensed btn-xs">
                                                <span class="glyphicon glyphicon-time"></span> Update
                                            </a>
                                        </td>
                                        <td>{{ $projectSupervisor->project()->first()->started_on->format('jS M, Y') }}</td>
                                        <td>{{ $projectSupervisor->project()->first()->expected_on->format('jS M, Y') }}</td>
                                        <td>
                                            <a target="_blank" href="{{ url('/projects/domain/'.$hashIds->encode($projectSupervisor->project()->first()->project_id)) }}" class="btn btn-default btn-rounded btn-condensed btn-xs">
                                                <span class="fa fa-home"></span>
                                            </a>
                                        </td>
                                        <td>
                                            <a target="_blank" href="{{ url('/projects/beneficiary/'.$hashIds->encode($projectSupervisor->project()->first()->project_id)) }}" class="btn btn-primary btn-rounded btn-condensed btn-xs   ">
                                                <span class="fa fa-bar-chart-o"></span>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="{{ url('/projects/'.$hashIds->encode($projectSupervisor->project()->first()->project_id)) }}" class="btn btn-info btn-rounded btn-condensed btn-xs">
                                                <span class="fa fa-eye-slash"></span> View
                                            </a>
                                        </td>
                                    </tr>
                                @endforeach
                            @endif
                            </tbody>
                            <tfoot>
                            <tr>
                                <th style="width: 1%;">#</th>
                                <th style="width: 30%;">Title</th>
                                <th style="width: 20%;">Contractor</th>
                                <th style="width: 8%;">TimeLine</th>
                                <th style="width: 10%;">Started On</th>
                                <th style="width: 10%;">Expected On</th>
                                <th style="width: 7%;">Domain</th>
                                <th style="width: 7%;">Beneficiary</th>
                                <th style="width: 7%;">Details</th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
            <!-- END DEFAULT DATATABLE -->
        </div>

    </div>
    <!-- END PAGE CONTENT WRAPPER -->
@endsection

@section('custom_script')
    <!-- START TEMPLATE -->
    <script type="text/javascript" src="{{ asset('/js/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function() {
            setTabActive('[href="/supervisors/projects"]');
        });
    </script>
@endsection