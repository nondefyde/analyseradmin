@extends('layouts.default')

@section('title', 'Votes And Proceedings Roll Calls')

@section('page_title')
    <li><a href="/vote-proceedings">Votes And Proceedings</a></li>
    <li class="active">Roll Call</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-plus-square"></span> Votes And Proceedings Roll Calls</h2>
    </div>
    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="panel panel-default form-horizontal">
                    <div class="panel-body">
                        <h3><span class="fa fa-info-circle"></span> Votes And Proceedings Info</h3>
                    </div>
                    <div class="col-md-4">
                        <div class="panel-body form-group-separated">
                            <div class="form-group">
                                <label class="col-md-4 col-xs-5 control-label">Volume: </label>

                                <div class="col-md-8 col-xs-7 line-height-30">Vol. {{ $vote_proceeding->volume }}</div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 col-xs-5 control-label">Number: </label>

                                <div class="col-md-8 col-xs-7 line-height-30">No. {{ $vote_proceeding->number }}</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="panel-body form-group-separated">
                            <div class="form-group">
                                <label class="col-md-4 col-xs-5 control-label">Created By: </label>

                                <div class="col-md-8 col-xs-7 line-height-30">{{ $vote_proceeding->user()->first()->fullNames() }}</div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 col-xs-5 control-label">Date: </label>

                                <div class="col-md-8 col-xs-7 line-height-30">{{ $vote_proceeding->date->format('D, jS M, Y') }}</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="panel-body form-group-separated">
                            <div class="form-group">
                                <label class="col-md-4 col-xs-5 control-label">House: </label>

                                <div class="col-md-8 col-xs-7 line-height-30">{{ $vote_proceeding->house()->first()->house }}</div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 col-xs-5 control-label">Session: </label>

                                <div class="col-md-8 col-xs-7 line-height-30">{{ $vote_proceeding->session }}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">

                <!-- START DATATABLE EXPORT -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">List of {{ $vote_proceeding->house()->first()->userType()->first()->user_type }} for Roll Calls</h3>

                        <div class="btn-group pull-right">
                            <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><i
                                        class="fa fa-bars"></i> Export Data
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#"
                                       onClick="$('#customers2').tableExport({type:'json',escape:'false'});"><img
                                                src='{{ asset('/img/icons/json.png') }}' width="24"/> JSON</a></li>
                                <li><a href="#"
                                       onClick="$('#customers2').tableExport({type:'json',escape:'false',ignoreColumn:'[2,3]'});"><img
                                                src='{{ asset('/img/icons/json.png') }}' width="24"/> JSON
                                        (ignoreColumn)</a></li>
                                <li><a href="#"
                                       onClick="$('#customers2').tableExport({type:'json',escape:'true'});"><img
                                                src='{{ asset('/img/icons/json.png') }}' width="24"/> JSON (with Escape)</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="#"
                                       onClick="$('#customers2').tableExport({type:'xml',escape:'false'});"><img
                                                src='{{ asset('/img/icons/xml.png') }}' width="24"/> XML</a></li>
                                <li><a href="#" onClick="$('#customers2').tableExport({type:'sql'});"><img
                                                src='{{ asset('/img/icons/sql.png') }}' width="24"/> SQL</a></li>
                                <li class="divider"></li>
                                <li><a href="#"
                                       onClick="$('#customers2').tableExport({type:'csv',escape:'false'});"><img
                                                src='{{ asset('/img/icons/csv.png') }}' width="24"/> CSV</a></li>
                                <li><a href="#"
                                       onClick="$('#customers2').tableExport({type:'txt',escape:'false'});"><img
                                                src='{{ asset('/img/icons/txt.png') }}' width="24"/> TXT</a></li>
                                <li class="divider"></li>
                                <li><a href="#"
                                       onClick="$('#customers2').tableExport({type:'excel',escape:'false'});"><img
                                                src='{{ asset('/img/icons/xls.png') }}' width="24"/> XLS</a></li>
                                <li><a href="#"
                                       onClick="$('#customers2').tableExport({type:'doc',escape:'false'});"><img
                                                src='{{ asset('/img/icons/word.png') }}' width="24"/> Word</a></li>
                                <li><a href="#"
                                       onClick="$('#customers2').tableExport({type:'powerpoint',escape:'false'});"><img
                                                src='{{ asset('/img/icons/ppt.png') }}' width="24"/> PowerPoint</a></li>
                                <li class="divider"></li>
                                <li><a href="#"
                                       onClick="$('#customers2').tableExport({type:'png',escape:'false'});"><img
                                                src='{{ asset('/img/icons/png.png') }}' width="24"/> PNG</a></li>
                                <li><a href="#"
                                       onClick="$('#customers2').tableExport({type:'pdf',escape:'false'});"><img
                                                src='{{ asset('/img/icons/pdf.png') }}' width="24"/> PDF</a></li>
                            </ul>
                        </div>

                    </div>
                    <div class="panel-body">
                        {!! Form::open([
                                'method'=>'POST',
                                'class'=>'form',
                                'role'=>'form',
                                'id'=>'house_form'
                            ])
                        !!}
                        <input type="hidden" name="votes_proceeding_id" value="{{ $vote_proceeding->votes_proceeding_id }}"/>
                        <div class="table-responsive">
                            <table id="customers2" class="table table-bordered table-striped table-actions">
                                <thead>
                                    <tr>
                                        <th style="width: 5%;">#</th>
                                        <th style="width: 20%;">Name</th>
                                        <th style="width: 25%;">Position / Rank</th>
                                        <th style="width: 30%;">{{ $legislatives->column_header }}</th>
                                        <th style="width: 20%;">
                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <label style="font-size: small"><input type="checkbox" class="roll_call_all" value="0" name=""/>
                                                        <span> Check All</span></label>
                                                </div>
                                            </div>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @if(count($legislatives) > 0)
                                        <?php $i = 1; ?>
                                        @foreach($legislatives as $legislative)
                                            <tr>
                                                <td>{{ $i++ }}</td>
                                                <td>{{ $legislative->user()->first()->fullNames() }}</td>
                                                <td>{{ $legislative->rank()->first()->rank }}</td>
                                                <td>{{ $legislative->legislative_zone }}</td>
                                                <td>
                                                    <div class="form-group">
                                                        <div class="col-md-12">
                                                            <label style="font-size: medium">
                                                                @if( in_array($legislative->user_id, array_values($attend)))
                                                                    <input type="checkbox" checked name="user_id[]" value="{{ $legislative->user_id }}"  class="roll_call_check_box"/>
                                                                    <span class="label label-success"> Present</span>
                                                                @else
                                                                    <input type="checkbox" name="user_id[]" value="{{ $legislative->user_id }}"  class="roll_call_check_box"/>
                                                                    <span class="label label-danger"> Absent</span>
                                                                @endif
                                                            </label>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        @endforeach
                                    @endif
                                </tbody>
                                <tfoot>
                                    <th style="width: 5%;">#</th>
                                    <th style="width: 20%;">Name</th>
                                    <th style="width: 25%;">Position / Rank</th>
                                    <th style="width: 30%;">{{ $legislatives->column_header }}</th>
                                    <th style="width: 20%;">
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <label style="font-size: small"><input type="checkbox" class="roll_call_all" value="0" name=""/>
                                                    <span> Check All</span></label>
                                            </div>
                                        </div>
                                    </th>
                                </tfoot>
                            </table>
                        </div>
                        <div class="panel-footer">
                            <button class="btn btn-primary pull-right" type="submit">Save Attendance</button>
                        </div>
                        {!! Form::close() !!}
                    </div>
                </div>
                <!-- END DATATABLE EXPORT -->
            </div>
        </div>
    </div>
    <!-- END PAGE CONTENT WRAPPER -->
@endsection

@section('custom_script')
    <script type="text/javascript" src="{{ asset('/js/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('/js/plugins/tableexport/tableExport.js') }}"></script>
    <script type="text/javascript" src="{{ asset('/js/plugins/tableexport/jquery.base64.js') }}"></script>
    <script type="text/javascript" src="{{ asset('/js/plugins/tableexport/html2canvas.js') }}"></script>
    <script type="text/javascript" src="{{ asset('/js/plugins/tableexport/jspdf/libs/sprintf.js') }}"></script>
    <script type="text/javascript" src="{{ asset('/js/plugins/tableexport/jspdf/jspdf.js') }}"></script>
    <script type="text/javascript" src="{{ asset('/js/plugins/tableexport/jspdf/libs/base64.js') }}"></script>
    <!-- START TEMPLATE -->
    <script type="text/javascript" src="{{ asset('/js/custom/roll_call.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function () {
            setTabActive('[href="/vote-proceedings"]');
        });
    </script>
@endsection