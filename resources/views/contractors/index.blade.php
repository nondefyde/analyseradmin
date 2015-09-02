@extends('layouts.default')

@section('title', 'Manage Contractors')

@section('page_title')
    <li><a href="/contractors">Contractors</a></li>
    <li class="active">Lists</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-table"></span> Manage Contractors</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12 center-block">

            </div>
            <div class="col-md-12">
                <!-- START DEFAULT DATATABLE -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">List of Contractors</h3>
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
                                        <th style="width: 20%;">Code</th>
                                        <th style="width: 20%;">Name</th>
                                        <th style="width: 20%;">Projects</th>
                                        <th style="width: 20%;">Phone No.</th>
                                        <th style="width: 20%;">Email</th>
                                        <th style="width: 25%;">CAC Reg. No.</th>
                                        <th style="width: 10%;">Experience</th>
                                        <th style="width: 10%;">View</th>
                                        <th style="width: 10%;">Edit</th>
                                        <th style="width: 10%;">Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                @if(count($contractors) > 0)
                                    <?php $i = 1; ?>
                                    @foreach($contractors as $contractor)
                                        <tr>
                                            <td class="text-center">{{$i++}} </td>
                                            <td>{{ $contractor->contractor_code }}</td>
                                            <td>{{ $contractor->contractor }}</td>
                                            <td>
                                                <a href="{{ url('/contractors/projects/'.$hashIds->encode($contractor->contractor_id)) }}" class="btn btn-primary btn-rounded btn-condensed btn-xs">
                                                    <span class="fa fa-table"></span> Projects
                                                </a>
                                            </td>
                                            <td>{{ $contractor->phone_no }}</td>
                                            <td>{{ $contractor->email }}</td>
                                            <td>{{ $contractor->cac_registration_no }}</td>
                                            <td>{{ $contractor->years_experience }} Year(s)</td>
                                            <td>
                                                <a target="_blank" href="{{ url('/contractors/'.$hashIds->encode($contractor->contractor_id)) }}" class="btn btn-primary btn-rounded btn-condensed btn-xs">
                                                    <span class="fa fa-eye-slash"></span>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="{{ url('/contractors/'.$hashIds->encode($contractor->contractor_id).'/edit') }}" class="btn btn-warning btn-rounded btn-condensed btn-xs">
                                                    <span class="fa fa-edit"></span>
                                                </a>
                                            </td>
                                            <td>
                                                <button value="{{ $contractor->contractor_id }}" class="btn btn-danger btn-rounded btn-condensed btn-xs delete_contractor">
                                                    <span class="fa fa-trash-o"></span>
                                                </button>
                                            </td>
                                        </tr>
                                    @endforeach
                                @endif
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th style="width: 5%;">#</th>
                                        <th style="width: 20%;">Code</th>
                                        <th style="width: 20%;">Name</th>
                                        <th style="width: 20%;">Projects</th>
                                        <th style="width: 20%;">Phone No.</th>
                                        <th style="width: 20%;">Email</th>
                                        <th style="width: 25%;">CAC Reg. No.</th>
                                        <th style="width: 10%;">Experience</th>
                                        <th style="width: 10%;">View</th>
                                        <th style="width: 10%;">Edit</th>
                                        <th style="width: 10%;">Delete</th>
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