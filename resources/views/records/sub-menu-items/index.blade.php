@extends('layouts.default')

@section('title', 'Sub Menu Items')

@section('page_title')
    <li><a href="/sub-menu-items"> Sub Menu Items</a></li>
    <li class="active">Manage</li>
@endsection

@section('content')
    <div class="page-title">
        <h2><span class="fa fa-sitemap"></span> Sub Menu Item</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <h3>Filter By Menu Items</h3>

                        <form method="post" action="/sub-menu-items/menu-item" role="form" class="form-horizontal">
                            {!! csrf_field() !!}
                            <div class="form-group">
                                <label class="col-md-3 control-label">Menu</label>

                                <div class="col-md-6">
                                    <div class="col-md-9">
                                        <select class="form-control select" name="menu_item_id" id="menu_item_id">
                                            <option value="">Display All Menu Items</option>
                                            @foreach($menu_item_lists as $key => $value)
                                                <option value="{{$key}}">{{$value}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <button class="btn btn-primary pull-right" type="submit">Filter</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-heading">
                        <button type="button" class="btn btn-default add_sub_menu_item"><i class="fa fa-plus"></i> Add</button>
                    </div>
                    <div class="panel-body panel-body-table">
                        <form method="post" action="/sub-menu-items" id="sub_menu_item_form" role="form" class="form-horizontal">
                            {!! csrf_field() !!}
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped table-actions" id="sub_sub_menu_item_table">
                                <thead>
                                <tr>
                                    <th style="width: 2%;">#</th>
                                    <th style="width: 20%;">Sub Menu item</th>
                                    <th style="width: 18%;">Sub Menu item url</th>
                                    <th style="width: 20%;">Sub Menu item icon</th>
                                    <th style="width: 20%;">Parent menu item</th>
                                    <th style="width: 10%;">Status</th>
                                    <th style="width: 15%;">Order By</th>
                                    <th style="width: 15%;">actions</th>
                                </tr>
                                </thead>
                                @if(count($sub_menu_items) > 0)
                                    <tbody id="sub_menu_item_tbody">
                                    <?php $i = 1; ?>
                                    @foreach($sub_menu_items as $sub_menu_item)
                                        <tr>
                                            <td class="text-center">{{$i++}}</td>
                                            <td>
                                                {!! Form::text('sub_menu_item[]', $sub_menu_item->sub_menu_item, ['placeholder'=>'Sub Menu Item', 'class'=>'form-control', 'required'=>'required']) !!}
                                                {!! Form::hidden('sub_menu_item_id[]', $sub_menu_item->sub_menu_item_id, ['class'=>'form-control']) !!}
                                            </td>
                                            <td>{!! Form::text('sub_menu_item_url[]', $sub_menu_item->sub_menu_item_url, ['placeholder'=>'Sub Menu Item Url', 'class'=>'form-control', 'required'=>'required']) !!}</td>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i
                                                                class="{{$sub_menu_item->sub_menu_item_icon}}"></i></span>
                                                    {!! Form::text('sub_menu_item_icon[]', $sub_menu_item->sub_menu_item_icon, ['placeholder'=>'Menu Icon', 'class'=>'form-control', 'required'=>'required']) !!}
                                                </div>
                                            </td>
                                            <td>{!! Form::select('menu_item_id[]', $menu_item_lists, $sub_menu_item->menu_item_id, ['class'=>'form-control']) !!} </td>
                                            <td> {!! Form::select('active[]', [''=>'Status', 1=>'Enable', 0=>'Disable'], $sub_menu_item->active, ['class'=>'form-control', 'required'=>'required']) !!}</td>
                                            <td>{!! Form::text('sequence[]', $sub_menu_item->sequence, ['placeholder'=>'Order By', 'class'=>'form-control', 'required'=>'required']) !!}</td>
                                            <td>
                                                <button class="btn btn-danger btn-rounded btn-condensed btn-sm delete_sub_menu_item">
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
                                            {!! Form::text('sub_menu_item[]', '', ['placeholder'=>'Sub Menu Item', 'class'=>'form-control', 'required'=>'required']) !!}
                                            {!! Form::hidden('sub_menu_item_id[]', '-1', ['class'=>'form-control']) !!}
                                        </td>
                                        <td>{!! Form::text('sub_menu_item_url[]', '', ['placeholder'=>'Menu Item Url', 'class'=>'form-control', 'required'=>'required']) !!}</td>
                                        <td>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class=""></i></span>
                                                {!! Form::text('sub_menu_item_icon[]', '', ['placeholder'=>'Sub Menu Item Icon', 'class'=>'form-control', 'required'=>'required']) !!}
                                            </div>
                                        </td>
                                        <td>{!! Form::select('menu_item_id[]', $menu_item_lists, '', ['class'=>'form-control', 'required'=>'required']) !!} </td>
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
                                    <th style="width: 2%;">#</th>
                                    <th style="width: 20%;">Menu item</th>
                                    <th style="width: 18%;">Menu item url</th>
                                    <th style="width: 20%;">Menu item icon</th>
                                    <th style="width: 20%;">Parent menu</th>
                                    <th style="width: 10%;">Menu Status</th>
                                    <th style="width: 15%;">Order By</th>
                                    <th style="width: 15%;">actions</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="panel-footer">
                            <button class="btn btn-default pull-left add_sub_menu_item"><i class="fa fa-plus"></i> Add</button>
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
                <div class="mb-title"><span class="fa fa-times"></span> Remove <strong id="sub_menu_item_value"></strong> ?
                </div>
                <div class="mb-content">
                    <p>Are you sure you want to remove this menu?</p>

                    <p>Press Yes if you sure.</p>
                </div>
                <div class="mb-footer">
                    <div class="pull-right">
                        <button class="btn btn-success btn-lg mb-control-yes" id="confirm_sub_menu_item_delete">Yes</button>
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
    <script type="text/javascript" src="{{ asset('/js/custom/sub_menu_item.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function () {
            setTabActive('[href="/sub-menu-items"]');
        });
    </script>
@endsection