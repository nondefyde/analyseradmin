@extends('layouts.default')

@section('title', 'Menu Items')

@section('page_title')
    <li><a href="{{ url('/feeds') }}">Social Feeds</a></li>
    <li class="active">Active</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-arrow-circle-o-left"></span> Social Feeds</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Current Feeds</h3>
                    <ul class="panel-controls">
                        <li><a href="#" class="panel-collapse"><span class="fa fa-angle-down"></span></a></li>
                        <li><a href="#" class="panel-refresh"><span class="fa fa-refresh"></span></a></li>
                        <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                    </ul>
                </div>
                <div class="panel-body">

                    <div class="table-responsive">
                        <table class="table datatable">
                            <thead>
                            <tr>
                                <th>S/No</th>
                                <th>Media</th>
                                <th>Title</th>
                                <th>Link</th>
                                <th>Date</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr data-toggle="collapse" data-target="#demo1" class="accordion-toggle">
                                <td>1</td>
                                <td>Facebook</td>
                                <td>Kingsley is a joker</td>
                                <td>http://www.facebook.com/kingsley is a joker</td>
                                <td>12/3/2015 08:33</td>
                                <td>
                                    <button class="btn btn-primary btn-rounded">
                                        <span class="fa fa-thumbs-down"></span>
                                    </button>
                                    <button class="btn btn-primary btn-rounded">
                                        <span class="fa fa-thumbs-up"></span>
                                    </button>
                                </td>
                            </tr>
                            <tr data-toggle="collapse" data-target="#demo1" class="accordion-toggle">
                                <td>1</td>
                                <td>Facebook</td>
                                <td>Emmanuel is a joker</td>
                                <td>http://www.facebook.com/kingsley is a joker</td>
                                <td>12/3/2015 08:33</td>
                                <td>
                                    <button class="btn btn-primary btn-rounded">
                                        <span class="fa fa-thumbs-down"></span>
                                    </button>
                                    <button class="btn btn-primary btn-rounded">
                                        <span class="fa fa-thumbs-up"></span>
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <br>

                    <div class="panel panel-default accordian-body collapse" id="demo1">
                        <div class="panel-heading">
                            <h3 class="panel-title">Kingsley is a joker</h3>
                        </div>
                        <div class="panel-body">
                            <div>
                                <div class="messages messages-img">
                                    <div class="item item-visible">
                                        <div class="image">
                                            <img src="{{ Auth::user()->avatar }}" alt="{{Auth::user()->fullNames()}}"/>
                                        </div>
                                        <div class="text">
                                            <div class="heading">
                                                <a href="#">John Doe</a>
                                                <span class="date">08:33</span>
                                            </div>
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed facilisis
                                                suscipit eros vitae iaculis.
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed facilisis
                                                suscipit eros vitae iaculis.
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed facilisis
                                                suscipit eros vitae iaculis.
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed facilisis
                                                <a href="#"> Read more</a>
                                            </p>

                                            <div style="text-align: right">
                                                <button class="btn btn-primary btn-rounded">
                                                    <span class="fa fa-thumbs-down"></span>
                                                </button>
                                                <button class="btn btn-primary btn-rounded">
                                                    <span class="fa fa-thumbs-up"></span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    {{--<div class="accordian-body collapse" id="demo1"> Demo1</div>--}}
                </div>
            </div>
        </div>
    </div>
    <!-- END PAGE CONTENT WRAPPER -->

    <!-- MESSAGE BOX-->
    <div class="message-box animated fadeIn" data-sound="alert" id="confirm-remove-row">
        <div class="mb-container">
            <div class="mb-middle">
                <div class="mb-title"><span class="fa fa-times"></span> Remove <strong id="menu_value"></strong> ?
                </div>
                <div class="mb-content">
                    <p>Are you sure you want to remove this menu?</p>

                    <p>Press Yes if you sure.</p>
                </div>
                <div class="mb-footer">
                    <div class="pull-right">
                        <button class="btn btn-success btn-lg mb-control-yes" id="confirm_menu_item_delete">Yes</button>
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

    <!-- THIS PAGE PLUGINS -->
    <script type='text/javascript' src='{{ asset('/js/plugins/icheck/icheck.min.js') }}'></script>
    <script type="text/javascript"
            src="{{ asset('/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js') }}"></script>

    <script type="text/javascript" src="{{ asset('/js/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <!-- END PAGE PLUGINS -->
    <script>
        jQuery(document).ready(function () {
            setTabActive('[href="/feeds"]');
        });
    </script>
@endsection