@extends('layouts.default')

@section('title', 'Contractor Projects')

@section('page_title')
    <li><a href="/contractors">Contractors</a></li>
    <li><a href="/projects">Projects</a></li>
    <li class="active">Details</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-briefcase"></span> Contractor {{ $projects->first()->contractor()->first()->contractor }}  Projects</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12 center-block">

            </div>
            <div class="col-md-10 col-md-offset-1">
                <!-- START DEFAULT DATATABLE -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">List of Contractor Projects</h3>
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
                                        <th style="width: 5%;">#</th>
                                        <th style="width: 30%;">Title</th>
                                        <th style="width: 16%;">Contractor</th>
                                        <th style="width: 14%;">Started On</th>
                                        <th style="width: 14%;">Expected On</th>
                                        <th style="width: 6%;">Details</th>
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
                                                <a target="_blank" href="{{ url('/contractors/projects/'.$hashIds->encode($project->contractor_id)) }}" class="btn btn-link">
                                                    {{ $project->contractor()->first()->contractor }}
                                                </a>
                                            </td>
                                            <td>{{ $project->started_on->format('D, jS M, Y') }}</td>
                                            <td>{{ $project->expected_on->format('D, jS M, Y') }}</td>
                                            <td>
                                                <a target="_blank" href="{{ url('/projects/'.$hashIds->encode($project->project_id)) }}" class="btn btn-primary btn-rounded btn-condensed btn-xs">
                                                    <span class="fa fa-eye-slash"></span> View
                                                </a>
                                            </td>
                                        </tr>
                                    @endforeach
                                @endif
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th style="width: 5%;">#</th>
                                    <th style="width: 30%;">Title</th>
                                    <th style="width: 16%;">Contractor</th>
                                    <th style="width: 14%;">Started On</th>
                                    <th style="width: 14%;">Expected On</th>
                                    <th style="width: 6%;">Details</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- END DEFAULT DATATABLE -->
            </div>
        </div>

    </div>
    <!-- END PAGE CONTENT WRAPPER -->


    <!-- MESSAGE BOX-->
    <div class="message-box animated fadeIn" data-sound="alert" id="confirm-remove-row">
        <div class="mb-container">
            <div class="mb-middle">
                <div class="mb-title"><span class="fa fa-times"></span> Remove <strong><span id="contractor_name"></span> Contractor</strong> ?
                </div>
                <div class="mb-content">
                    <p>Are you sure you want to remove this Contractor?</p>

                    <p>Press Yes if you are sure.</p>
                </div>
                <div class="mb-footer">
                    <div class="pull-right">
                        <button class="btn btn-success btn-lg mb-control-yes" id="confirm_contractor_delete">Yes</button>
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
    <script type="text/javascript" src="{{ asset('/js/custom/contractor.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function() {
            setTabActive('[href="/contractors"]');
        });
    </script>
@endsection