@extends('layouts.default')

@section('title', 'Manage Supervisors')

@section('page_title')
    <li><a href="/supervisors">Supervisors</a></li>
    <li class="active">Manage</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-users"></span> Supervisors</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">

        </div>
        <div class="col-md-10 col-lg-offset-1">
            <!-- START DEFAULT DATATABLE -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">List of Supervisors</h3>
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
                                <th style="width: 2%;">#</th>
                                <th style="width: 29%;">Full Name</th>
                                <th style="width: 10%;">Gender</th>
                                <th style="width: 25%;">Email</th>
                                <th style="width: 14%;">Phone No.</th>
                                <th style="width: 8%;">Status</th>
                                <th style="width: 6%;">View</th>
                                <th style="width: 6%;">Delete</th>
                            </tr>
                            </thead>
                            <tbody>
                            @if(count($subUsers) > 0)
                                <?php $i = 1; ?>
                                @foreach($subUsers as $subUser)
                                    <tr>
                                        <td class="text-center">{{$i++}} </td>
                                        <td>{{ $subUser->subUser()->first()->fullNames() }}</td>
                                        <td>{{ $subUser->subUser()->first()->gender }}</td>
                                        <td>{{ $subUser->subUser()->first()->email }}</td>
                                        <td>{{ $subUser->subUser()->first()->phone_no }}</td>
                                        <td>
                                            @if($subUser->subUser()->first()->status === 1)
                                                <button value="{{ $subUser->subUser()->first()->user_id }}" rel="0" class="btn btn-success btn-rounded btn-condensed btn-xs supervisor_status">
                                                    Disable
                                                </button>
                                            @else
                                                <button value="{{ $subUser->subUser()->first()->user_id }}" rel="1" class="btn btn-danger btn-rounded btn-condensed btn-xs supervisor_status">
                                                    Enable
                                                </button>
                                            @endif
                                        </td>
                                        <td>
                                            <a target="_blank" href="{{ url('/supervisors/show/'.$hashIds->encode($subUser->subUser()->first()->user_id)) }}" class="btn btn-info btn-rounded btn-condensed btn-xs">
                                                <span class="fa fa-eye-slash"></span>
                                            </a>
                                        </td>
                                        <td>
                                            <button value="{{ $subUser->sub_user_id }}" class="btn btn-danger btn-rounded btn-condensed btn-xs delete_supervisor">
                                                <span class="fa fa-trash-o"></span>
                                            </button>
                                        </td>
                                    </tr>
                                @endforeach
                            @endif
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th style="width: 2%;">#</th>
                                    <th style="width: 29%;">Full Name</th>
                                    <th style="width: 10%;">Gender</th>
                                    <th style="width: 25%;">Email</th>
                                    <th style="width: 14%;">Phone No.</th>
                                    <th style="width: 8%;">Status</th>
                                    <th style="width: 6%;">View</th>
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
                <div class="mb-title"><span class="fa fa-times"></span> Remove <strong><span id="supervisor_name"></span> </strong> as a Supervisor?
                </div>
                <div class="mb-content">
                    <p>Are you sure you want to remove this Supervisor?</p>

                    <p>Press Yes if you are sure.</p>
                </div>
                <div class="mb-footer">
                    <div class="pull-right">
                        <button class="btn btn-success btn-lg mb-control-yes" id="confirm_supervisor_delete">Yes</button>
                        <button class="btn btn-default btn-lg mb-control-close">No</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END MESSAGE BOX-->
    <!-- MESSAGE BOX-->
    <div class="message-box animated fadeIn" data-sound="alert" id="confirm-status-row">
        <div class="mb-container">
            <div class="mb-middle">
                <div class="mb-title"><span class="fa fa-times"></span>You are about to <strong><span id="supervisor_status"></span> </strong> as a Supervisor?
                </div>
                <div class="mb-content">
                    <p>Press Yes to continue.</p>
                    <p>Press No to cancel.</p>
                </div>
                <div class="mb-footer">
                    <div class="pull-right">
                        <button class="btn btn-success btn-lg mb-control-yes" id="confirm_supervisor_status">Yes</button>
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
    <script type="text/javascript" src="{{ asset('/js/custom/supervisor.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function() {
            setTabActive('[href="/supervisors"]');
        });
    </script>
@endsection