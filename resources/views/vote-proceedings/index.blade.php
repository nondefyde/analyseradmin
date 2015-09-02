@extends('layouts.default')

@section('title', 'Manage Votes And Proceedings')

@section('page_title')
    <li><a href="/vote-proceedings">Votes And Proceedings</a></li>
    <li class="active">Manage</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-plus-square"></span> Manage Votes And Proceedings</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">
        <div class="row">
            <div class="col-md-12">
                <!-- START DEFAULT DATATABLE -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Uploaded Votes And Proceedings</h3>
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
                                        <th style="width: 5%;">Volume</th>
                                        <th style="width: 5%;">Number</th>
                                        <th style="width: 20%;">House</th>
                                        <th style="width: 25%;">Session</th>
                                        <th style="width: 8%;">Roll call</th>
                                        <th style="width: 17%;">Date</th>
                                        <th style="width: 5%;">Download</th>
                                        <th style="width: 5%;">View</th>
                                        <th style="width: 5%;">Edit</th>
                                        <th style="width: 5%;">Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                @if(count($votes_proceedings) > 0)
                                    <?php $i = 1; ?>
                                    @foreach($votes_proceedings as $votes_proceeding)
                                        <tr>
                                            <td>{{ $i++ }}</td>
                                            <td>Vol. {{ $votes_proceeding->volume }}</td>
                                            <td>No. {{ $votes_proceeding->number }}</td>
                                            <td>{{ $votes_proceeding->house()->first()->house }}</td>
                                            <td>{{ $votes_proceeding->session }}</td>
                                            <td>
                                                <a target="_blank" href="{{ url('/vote-proceedings/roll-call/' . $hashIds->encode($votes_proceeding->votes_proceeding_id )) }}"
                                                   class="btn btn-primary btn-rounded btn-condensed btn-xs">
                                                    <span class="fa fa-check"></span> Roll Call
                                                </a>
                                            </td>
                                            <td>{{ $votes_proceeding->date->format('D, jS M, Y') }}</td>
                                            <td>
                                                <a href="{{ url('/vote-proceedings/download/'.$hashIds->encode($votes_proceeding->votes_proceeding_id)) }}"
                                                   class="btn btn-primary btn-rounded btn-condensed btn-xs">
                                                    <span class="fa fa-download"></span>
                                                </a>
                                            </td>
                                            <td>
                                                <a target="_blank" href="https://s3-us-west-2.amazonaws.com/analyser/{{$votes_proceeding->file_path . $votes_proceeding->upload_url}}"
                                                   class="btn btn-info btn-rounded btn-condensed btn-xs view-pdf"
                                                   rel="Vol.{{ $votes_proceeding->volume }} No.{{ $votes_proceeding->number }} of {{ $votes_proceeding->house()->first()->house }} : {{ $votes_proceeding->session }}">
                                                    <span class="fa fa-eye-slash"></span>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="{{ url('/vote-proceedings/edit/' . $hashIds->encode($votes_proceeding->votes_proceeding_id)) }}" class="btn btn-warning btn-rounded btn-condensed btn-xs">
                                                    <span class="fa fa-edit"></span>
                                                </a>
                                            </td>
                                            <td>
                                                <button value="{{ $votes_proceeding->votes_proceeding_id }}" class="btn btn-danger btn-rounded btn-condensed btn-xs delete_vote_proceeding">
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
                                        <th style="width: 5%;">Volume</th>
                                        <th style="width: 5%;">Number</th>
                                        <th style="width: 20%;">House</th>
                                        <th style="width: 25%;">Session</th>
                                        <th style="width: 8%;">Roll call</th>
                                        <th style="width: 17%;">Date</th>
                                        <th style="width: 5%;">Download</th>
                                        <th style="width: 5%;">View</th>
                                        <th style="width: 5%;">Edit</th>
                                        <th style="width: 5%;">Delete</th>
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
    <!-- MESSAGE BOX-->
    <div class="message-box animated fadeIn" data-sound="alert" id="confirm-remove-row">
        <div class="mb-container">
            <div class="mb-middle">
                <div class="mb-title"><span class="fa fa-times"></span> Remove Votes And Proceedings <strong><span id="vote_proceeding_name"></span></strong> ?
                </div>
                <div class="mb-content">
                    <p>Are you sure you want to remove this Votes And Proceedings?</p>

                    <p>Press Yes if you are sure.</p>
                </div>
                <div class="mb-footer">
                    <div class="pull-right">
                        <button class="btn btn-success btn-lg mb-control-yes" id="confirm_vote_proceeding_delete">Yes</button>
                        <button class="btn btn-default btn-lg mb-control-close">No</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END MESSAGE BOX-->
    <!-- END PAGE CONTENT WRAPPER -->
    @endsection

    @section('custom_script')
            <!-- THIS PAGE PLUGINS -->
    <script type="text/javascript" src="{{ asset('/js/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <!-- END PAGE PLUGINS -->

    <!-- START TEMPLATE -->
    <script type="text/javascript" src="{{ asset('/js/custom/vote_proceeding.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function () {
            setTabActive('[href="/vote-proceedings"]');
        });
    </script>
@endsection