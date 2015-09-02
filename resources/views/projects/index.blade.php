@extends('layouts.default')

@section('title', 'Manage Projects')

@section('page_title')
    <li><a href="/projects">Projects</a></li>
    <li class="active">Manage</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-table"></span> Manage  Projects</h2>
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
                                    <th style="width: 28%;">Title</th>
                                    <th style="width: 18%;">Contractor</th>
                                    <th style="width: 5%;">TimeLine</th>
                                    <th style="width: 5%;">Domain</th>
                                    <th style="width: 5%;">Beneficiary</th>
                                    <th style="width: 12%;">Expected On</th>
                                    <th style="width: 10%;">Publish Status</th>
                                    <th style="width: 5%;">View</th>
                                    <th style="width: 5%;">Edit</th>
                                    <th style="width: 6%;">Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                            @if(count($projects) > 0)
                                <?php $i = 1; ?>
                                @foreach($projects as $project)
                                    <tr>
                                        <td class="text-center">{{$i++}} </td>
                                        <td>{{ $project->title }}</td>
                                        <td>
                                            <a target="_blank" href="{{ url('/projects/contractor/'.$hashIds->encode($project->contractor_id)) }}" class="btn btn-link text-danger">
                                                {{ $project->contractor()->first()->contractor }}
                                            </a>
                                        </td>
                                        <td>
                                            <a target="_blank" href="{{ url('/projects/timeline/'.$hashIds->encode($project->project_id)) }}" class="btn btn-primary btn-rounded btn-condensed btn-xs">
                                                <span class="glyphicon glyphicon-time"></span>
                                            </a>
                                        </td>
                                        <td>
                                            <a target="_blank" href="{{ url('/projects/domain/'.$hashIds->encode($project->project_id)) }}" class="btn btn-default btn-rounded btn-condensed btn-xs">
                                                <span class="fa fa-home"></span>
                                            </a>
                                        </td>
                                        <td>
                                            <a target="_blank" href="{{ url('/projects/beneficiary/'.$hashIds->encode($project->project_id)) }}" class="btn btn-primary btn-rounded btn-condensed btn-xs   ">
                                                <span class="fa fa-bar-chart-o"></span>
                                            </a>
                                        </td>
                                        <td>{{ $project->expected_on->format('jS M, Y') }}</td>
                                        <td>
                                            @if($project->publish_id === 1)
                                                <button value="{{ $project->project_id }}" rel="0" class="btn btn-success btn-rounded btn-condensed btn-xs publish_project">
                                                     Un-publish
                                                </button>
                                            @else
                                                <button value="{{ $project->project_id }}" rel="1" class="btn btn-danger btn-rounded btn-condensed btn-xs publish_project">
                                                    Publish
                                                </button>
                                            @endif
                                        </td>
                                        <td>
                                            <a target="_blank" href="{{ url('/projects/'.$hashIds->encode($project->project_id)) }}" class="btn btn-info btn-rounded btn-condensed btn-xs">
                                                <span class="fa fa-eye-slash"></span>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="{{ url('/projects/'.$hashIds->encode($project->project_id).'/edit') }}" class="btn btn-warning btn-rounded btn-condensed btn-xs">
                                                <span class="fa fa-edit"></span>
                                            </a>
                                        </td>
                                        <td>
                                            <button value="{{ $project->project_id }}" class="btn btn-danger btn-rounded btn-condensed btn-xs delete_project">
                                                <span class="fa fa-trash-o"></span>
                                            </button>
                                        </td>
                                    </tr>
                                @endforeach
                            @endif
                            </tbody>
                            <tfoot>
                            <tr>
                                <th style="width: 1%;">#</th>
                                <th style="width: 28%;">Title</th>
                                <th style="width: 18%;">Contractor</th>
                                <th style="width: 5%;">TimeLine</th>
                                <th style="width: 5%;">Domain</th>
                                <th style="width: 5%;">Beneficiary</th>
                                <th style="width: 12%;">Expected On</th>
                                <th style="width: 10%;">Publish Status</th>
                                <th style="width: 5%;">View</th>
                                <th style="width: 5%;">Edit</th>
                                <th style="width: 6%;">Delete</th>
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
    <!-- MESSAGE BOX-->
    <div class="message-box animated fadeIn" data-sound="alert" id="confirm-remove-row">
        <div class="mb-container">
            <div class="mb-middle">
                <div class="mb-title"><span class="fa fa-times"></span> Remove <strong><span id="project_name"></span> Project</strong> ?
                </div>
                <div class="mb-content">
                    <p>Are you sure you want to remove this Project?</p>

                    <p>Press Yes if you are sure.</p>
                </div>
                <div class="mb-footer">
                    <div class="pull-right">
                        <button class="btn btn-success btn-lg mb-control-yes" id="confirm_project_delete">Yes</button>
                        <button class="btn btn-default btn-lg mb-control-close">No</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END MESSAGE BOX-->
    <!-- MESSAGE BOX-->
    <div class="message-box animated fadeIn" data-sound="alert" id="confirm-publish-row">
        <div class="mb-container">
            <div class="mb-middle">
                <div class="mb-title"><span class="fa fa-times"></span>You are about to <strong><span id="publish_name"></span> Project</strong> ?
                </div>
                <div class="mb-content">
                    <p>Press Yes to continue.</p>
                    <p>Press No to cancel.</p>
                </div>
                <div class="mb-footer">
                    <div class="pull-right">
                        <button class="btn btn-success btn-lg mb-control-yes" id="confirm_project_publish">Yes</button>
                        <button class="btn btn-default btn-lg mb-control-close">No</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END MESSAGE BOX-->

@endsection

@section('custom_script')
    <!-- START TEMPLATE -->
    <script type="text/javascript" src="{{ asset('/js/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('/js/custom/projects.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function() {
            setTabActive('[href="/projects"]');
        });
    </script>
@endsection