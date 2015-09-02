@extends('layouts.default')

@section('title', 'Manage Hansard')

@section('page_title')
    <li><a href="/hansards">Hansards</a></li>
    <li class="active">Manage</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-plus-square"></span> All Hansard</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">
        <div class="row">
            <div class="col-md-12">
                <!-- START DEFAULT DATATABLE -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Available Hansards</h3>
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
                                        <th style="width: 5%;">Volume</th>
                                        <th style="width: 5%;">Number</th>
                                        <th style="width: 25%;">House</th>
                                        <th style="width: 25%;">Session</th>
                                        <th style="width: 25%;">Date</th>
                                        <th style="width: 5%;">Download</th>
                                        <th style="width: 5%;">View</th>
                                    </tr>
                                </thead>
                                <tbody>
                                @if(count($hansards) > 0)
                                    <?php $i = 1; ?>
                                    @foreach($hansards as $hansard)
                                        <tr>
                                            <td>{{ $i++ }}</td>
                                            <td>Vol. {{ $hansard->volume }}</td>
                                            <td>No. {{ $hansard->number }}</td>
                                            <td>{{ $hansard->house()->first()->house }}</td>
                                            <td>{{ $hansard->session }}</td>
                                            <td>{{ $hansard->date->format('D, jS M, Y') }}</td>
                                            <td>
                                                <a href="{{ url('/hansards/download/'.$hashIds->encode($hansard->hansard_id)) }}"
                                                   class="btn btn-primary btn-rounded btn-condensed btn-xs">
                                                    <span class="fa fa-download"></span>
                                                </a>
                                            </td>
                                            <td>
                                                <a target="_blank" href="https://s3-us-west-2.amazonaws.com/analyser/{{$hansard->file_path . $hansard->upload_url}}"
                                                   class="btn btn-info btn-rounded btn-condensed btn-xs view-pdf"
                                                   rel="Vol.{{ $hansard->volume }} No.{{ $hansard->number }} of {{ $hansard->house()->first()->house }} : {{ $hansard->session }}">
                                                    <span class="fa fa-eye-slash"></span>
                                                </a>
                                            </td>
                                        </tr>
                                    @endforeach
                                @endif
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th style="width: 5%;">#</th>
                                        <th style="width: 5%;">Volume</th>
                                        <th style="width: 5%;">Number</th>
                                        <th style="width: 25%;">House</th>
                                        <th style="width: 25%;">Session</th>
                                        <th style="width: 25%;">Date</th>
                                        <th style="width: 5%;">Download</th>
                                        <th style="width: 5%;">View</th>
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
    @endsection

    @section('custom_script')
            <!-- THIS PAGE PLUGINS -->
    <script type="text/javascript" src="{{ asset('/js/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <!-- END PAGE PLUGINS -->

    <!-- START TEMPLATE -->
    <script type="text/javascript" src="{{ asset('/js/custom/hansards.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function () {
            setTabActive('[href="/hansards/view"]');
        });
    </script>
@endsection