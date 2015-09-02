@extends('layouts.default')

@section('title', 'Sectors')

@section('page_title')
    <li><a href="/sectors">Sectors</a></li>
    <li class="active">Manage</li>
@endsection

@section('content')

    {{--{{var_dump($sectors)}}--}}

    <div class="page-title">
        <h2><span class="fa fa-globe"></span> Sectors</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12 center-block">

            </div>
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <button type="button" class="btn btn-default add_sector"><i class="fa fa-plus"></i> Add</button>
                    </div>

                    <div class="panel-body panel-body-table">
                        {!! Form::open([
                                'method'=>'POST',
                                'class'=>'form',
                                'role'=>'form',
                                'id'=>'sector_form'
                            ])
                        !!}
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped table-actions" id="menu_table">
                                <thead>
                                <tr>
                                    <th style="width: 5%;">#</th>
                                    <th style="width: 55%;">Sector</th>
                                    <th style="width: 40%;">Actions</th>
                                </tr>
                                </thead>
                                @if(count($sectors) > 0)
                                    <tbody>
                                    <?php $i = 1; ?>
                                    @foreach($sectors as $sector)
                                        <tr>
                                            <td class="text-center">{{$i++}} </td>
                                            <td>
                                                {!! Form::text('sector[]', $sector->sector, ['placeholder'=>'Sector ', 'class'=>'form-control', 'required'=>'required']) !!}
                                                {!! Form::hidden('sector_id[]', $sector->sector_id, ['class'=>'form-control']) !!}
                                            </td>
                                            <td>
                                                <button class="btn btn-danger btn-rounded btn-condensed btn-sm delete_sector">
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
                                            {!! Form::text('sector[]', '', ['placeholder'=>'Sector', 'class'=>'form-control', 'required'=>'required']) !!}
                                            {!! Form::hidden('sector_id[]', '-1', ['class'=>'form-control']) !!}
                                        </td>
                                        <td>
                                            <button class="btn btn-danger btn-rounded btn-condensed btn-sm">
                                                <span class="fa fa-times"></span> Remove
                                            </button>
                                        </td>
                                    </tr>
                                @endif
                                <tfoot>
                                <tr>
                                    <th style="width: 5%;">#</th>
                                    <th style="width: 55%;">Sector</th>
                                    <th style="width: 40%;">Actions</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="panel-footer">
                            <button class="btn btn-default pull-left add_sector"><i class="fa fa-plus"></i> Add</button>
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
                <div class="mb-title"><span class="fa fa-times"></span> Remove <strong id="menu_value">Menu</strong> ?
                </div>
                <div class="mb-content">
                    <p>Are you sure you want to remove this menu?</p>

                    <p>Press Yes if you are sure.</p>
                </div>
                <div class="mb-footer">
                    <div class="pull-right">
                        <button class="btn btn-success btn-lg mb-control-yes" id="confirm_sector_delete">Yes</button>
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
    <script type="text/javascript" src="{{ asset('/js/custom/sector.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function() {
            setTabActive('[href="/sectors"]');
        });
    </script>
@endsection