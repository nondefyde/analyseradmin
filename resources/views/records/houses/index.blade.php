@extends('layouts.default')

@section('title', 'Menu Items')

@section('page_title')
    <li><a href="/houses">Houses</a></li>
    <li class="active">Manage</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-home"></span> Houses</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-heading">
                        <button type="button" class="btn btn-default add_house"><i class="fa fa-plus"></i> Add</button>
                    </div>
                    <div class="panel-body panel-body-table">
                        {!! Form::open([
                                'method'=>'POST',
                                'class'=>'form',
                                'role'=>'form',
                                'id'=>'house_form'
                            ])
                        !!}
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped table-actions" id="house_table">
                                <thead>
                                <tr>
                                    <th style="width: 10%;">#</th>
                                    <th style="width: 30%;">House</th>
                                    <th style="width: 30%;">User Type</th>
                                    <th style="width: 30%;">actions</th>
                                </tr>
                                </thead>
                                @if(count($houses) > 0)
                                    <tbody id="house_tbody">
                                    <?php $i = 1; ?>
                                    @foreach($houses as $house)
                                        <tr>
                                            <td class="text-center">{{$i++}}</td>
                                            <td>
                                                {!! Form::text('house[]', $house->house, ['placeholder'=>'House', 'class'=>'form-control', 'required'=>'required']) !!}
                                                {!! Form::hidden('house_id[]', $house->house_id, ['class'=>'form-control']) !!}
                                            </td>
                                            <td>{!! Form::select('user_type_id[]', $user_type_list, $house->user_type_id, ['class'=>'form-control']) !!} </td>
                                            <td>
                                                <button class="btn btn-danger btn-rounded btn-condensed btn-sm delete_house">
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
                                            {!! Form::text('house[]', '', ['placeholder'=>'House', 'class'=>'form-control', 'required'=>'required']) !!}
                                            {!! Form::hidden('house_id[]', '-1', ['class'=>'form-control']) !!}
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
                                    <th style="width: 30%;">House</th>
                                    <th style="width: 30%;">User Type</th>
                                    <th style="width: 30%;">actions</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="panel-footer">
                            <button class="btn btn-default pull-left add_house"><i class="fa fa-plus"></i> Add</button>
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
                <div class="mb-title"><span class="fa fa-times"></span> Remove <strong id="house_value"></strong> ?
                </div>
                <div class="mb-content">
                    <p>Are you sure you want to remove this menu?</p>

                    <p>Press Yes if you sure.</p>
                </div>
                <div class="mb-footer">
                    <div class="pull-right">
                        <button class="btn btn-success btn-lg mb-control-yes" id="confirm_house_delete">Yes</button>
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
    <script type="text/javascript" src="{{ asset('/js/custom/house.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function () {
            setTabActive('[href="/houses"]');
        });
    </script>
@endsection