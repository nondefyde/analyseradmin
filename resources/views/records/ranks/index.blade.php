@extends('layouts.default')

@section('title', 'Ranks')

@section('page_title')
    <li><a href="/ranks">Ranks</a></li>
    <li class="active">Manage</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-sitemap"></span> Ranks</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-heading">
                        <button type="button" class="btn btn-default add_rank"><i class="fa fa-plus"></i> Add</button>
                    </div>
                    <div class="panel-body panel-body-table">
                        {!! Form::open([
                                'method'=>'POST',
                                'class'=>'form',
                                'role'=>'form',
                                'id'=>'rank_form'
                            ])
                        !!}
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped table-actions" id="rank_table">
                                <thead>
                                <tr>
                                    <th style="width: 10%;">#</th>
                                    <th style="width: 30%;">Rank</th>
                                    <th style="width: 30%;">User Type</th>
                                    <th style="width: 30%;">actions</th>
                                </tr>
                                </thead>
                                @if(count($ranks) > 0)
                                    <tbody id="rank_tbody">
                                    <?php $i = 1; ?>
                                    @foreach($ranks as $rank)
                                        <tr>
                                            <td class="text-center">{{$i++}}</td>
                                            <td>
                                                {!! Form::text('rank[]', $rank->rank, ['placeholder'=>'Rank', 'class'=>'form-control', 'required'=>'required']) !!}
                                                {!! Form::hidden('rank_id[]', $rank->rank_id, ['class'=>'form-control']) !!}
                                            </td>
                                            <td>{!! Form::select('user_type_id[]', $user_type_list, $rank->user_type_id, ['class'=>'form-control']) !!} </td>
                                            <td>
                                                <button class="btn btn-danger btn-rounded btn-condensed btn-sm delete_rank">
                                                    <span class="fa fa-trash-o"></span> Delete
                                                </button>
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                @else
                                    <tr>
                                        <td class="text-center">1</td>
                                        <td>
                                            {!! Form::text('rank[]', '', ['placeholder'=>'Rank', 'class'=>'form-control', 'required'=>'required']) !!}
                                            {!! Form::hidden('rank_id[]', '-1', ['class'=>'form-control']) !!}
                                        </td>
                                        <td>{!! Form::select('user_type_id[]', $user_type_list, '', ['class'=>'form-control', 'required'=>'required']) !!} </td>
                                        <td>
                                            <button class="btn btn-danger btn-rounded btn-condensed btn-sm">
                                                <span class="fa fa-times"></span> Remove
                                            </button>
                                        </td>
                                    </tr>
                                @endif
                                <tfoot>
                                <tr>
                                    <th style="width: 10%;">#</th>
                                    <th style="width: 30%;">Rank</th>
                                    <th style="width: 30%;">User Type</th>
                                    <th style="width: 30%;">actions</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="panel-footer">
                            <button type="button" class="btn btn-default pull-left add_rank"><i class="fa fa-plus"></i> Add</button>
                            <button class="btn btn-primary pull-right" type="submit">Save record</button>
                        </div>
                        {!! Form::close() !!}
                    </div>
                </div>

            </div>
        </div>

    </div>
    <!-- END PAGE CONTENT WRAPPER -->

    <!-- MESSAGE BOX-->
    <div class="message-box animated fadeIn" data-sound="alert" id="confirm-remove-row">
        <div class="mb-container">
            <div class="mb-middle">
                <div class="mb-title"><span class="fa fa-times"></span> Remove <strong id="rank_value"></strong> ?
                </div>
                <div class="mb-content">
                    <p>Are you sure you want to remove this menu?</p>

                    <p>Press Yes if you sure.</p>
                </div>
                <div class="mb-footer">
                    <div class="pull-right">
                        <button class="btn btn-success btn-lg mb-control-yes" id="confirm_rank_delete">Yes</button>
                        <button class="btn btn-default btn-lg mb-control-close">No</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END MESSAGE BOX-->

    @endsection


    @section('custom_script')
            <!-- START THIS PAGE PLUGINS-->
    <script type="text/javascript" src="{{ asset('/js/plugins/bootstrap/bootstrap-select.js') }}"></script>
    <!-- END THIS PAGE PLUGINS-->

    <!-- START TEMPLATE -->
    <script type="text/javascript" src="{{ asset('/js/custom/ranks.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function () {
            setTabActive('[href="/ranks"]');
        });
    </script>
@endsection