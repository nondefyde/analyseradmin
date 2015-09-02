@extends('layouts.default')

@section('title', 'Menus')

@section('page_title')
    <li><a href="/menus">Menus</a></li>
    <li class="active">Manage</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-tasks"></span> Menus</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12 center-block">

            </div>
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <button type="button" class="btn btn-default add_menu"><i class="fa fa-plus"></i> Add</button>
                    </div>

                    <div class="panel-body panel-body-table">
                        {!! Form::open([
                                'method'=>'POST',
                                'class'=>'form',
                                'role'=>'form',
                                'id'=>'menu_form'
                            ])
                        !!}
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-actions" id="menu_table">
                                    <thead>
                                        <tr>
                                            <th style="width: 5%;">#</th>
                                            <th style="width: 20%;">Menu</th>
                                            <th style="width: 20%;">Menu Url</th>
                                            <th style="width: 25%;">Menu Icon</th>
                                            <th style="width: 10%;">Menu Status</th>
                                            <th style="width: 10%;">Order By</th>
                                            <th style="width: 10%;">Actions</th>
                                        </tr>
                                    </thead>
                                    @if(count($menus) > 0)
                                        <tbody>
                                        <?php $i = 1; ?>
                                        @foreach($menus as $menu)
                                            <tr>
                                                <td class="text-center">{{$i++}} </td>
                                                <td>
                                                    {!! Form::text('menu[]', $menu->menu, ['placeholder'=>'Menu', 'class'=>'form-control', 'required'=>'required']) !!}
                                                    {!! Form::hidden('menu_id[]', $menu->menu_id, ['class'=>'form-control']) !!}
                                                </td>
                                                <td>{!! Form::text('menu_url[]', $menu->menu_url, ['placeholder'=>'Menu Url', 'class'=>'form-control', 'required'=>'required']) !!}</td>
                                                <td>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="{{$menu->icon}}"></i></span>
                                                        {!! Form::text('icon[]', $menu->icon, ['placeholder'=>'Menu Icon', 'class'=>'form-control', 'required'=>'required']) !!}
                                                    </div>
                                                </td>
                                                <td> {!! Form::select('active[]', [''=>'Status', 1=>'Enable', 0=>'Disable'], $menu->active, ['class'=>'form-control', 'required'=>'required']) !!}</td>
                                                <td>{!! Form::text('sequence[]', $menu->sequence, ['placeholder'=>'Order By', 'class'=>'form-control', 'required'=>'required']) !!}</td>
                                                <td>
                                                    <button class="btn btn-danger btn-rounded btn-condensed btn-sm delete_menu">
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
                                                {!! Form::text('menu[]', '', ['placeholder'=>'Menu', 'class'=>'form-control', 'required'=>'required']) !!}
                                                {!! Form::hidden('menu_id[]', '-1', ['class'=>'form-control']) !!}
                                            </td>
                                            <td>{!! Form::text('menu_url[]', '', ['placeholder'=>'Menu Url', 'class'=>'form-control', 'required'=>'required']) !!}</td>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class=""></i></span>
                                                    {!! Form::text('icon[]', '', ['placeholder'=>'Menu Icon', 'class'=>'form-control', 'required'=>'required']) !!}
                                                </div>
                                            </td>
                                            <td>{!! Form::select('active[]', [''=>'Status', 1=>'Enable', 0=>'Disable'],'', ['class'=>'form-control', 'required'=>'required']) !!}</td>
                                            <td>{!! Form::text('sequence[]', '', ['placeholder'=>'Order By', 'class'=>'form-control', 'required'=>'required']) !!}</td>
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
                                            <th style="width: 20%;">Menu</th>
                                            <th style="width: 20%;">Menu Url</th>
                                            <th style="width: 25%;">Menu Icon</th>
                                            <th style="width: 10%;">Menu Status</th>
                                            <th style="width: 10%;">Order By</th>
                                            <th style="width: 10%;">Actions</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="panel-footer">
                                <button class="btn btn-default pull-left add_menu"><i class="fa fa-plus"></i> Add</button>
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
                        <button class="btn btn-success btn-lg mb-control-yes" id="confirm_menu_delete">Yes</button>
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
    <script type="text/javascript" src="{{ asset('/js/custom/menu.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function() {
            setTabActive('[href="/menus"]');
        });
    </script>
@endsection