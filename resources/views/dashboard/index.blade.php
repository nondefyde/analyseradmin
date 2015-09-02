@extends('layouts.default')

@section('title', 'Dashboard')

@section('page_title')
    <li class="active"><a href="/">Dashboard</a></li>
@endsection

@section('content')
<!-- PAGE CONTENT WRAPPER -->
<div class="page-content-wrap">

    <!-- START WIDGETS -->
    <div class="row">
        <div class="col-md-3">

            <!-- START WIDGET SLIDER -->
            <div class="widget widget-default widget-carousel">
                <div class="owl-carousel" id="owl-example">
                    <div>
                        <div class="widget-title">Total Visitors</div>
                        <div class="widget-subtitle">27/08/2015 15:23</div>
                        <div class="widget-int">3,548</div>
                    </div>
                    <div>
                        <div class="widget-title">Returned</div>
                        <div class="widget-subtitle">Visitors</div>
                        <div class="widget-int">1,695</div>
                    </div>
                    <div>
                        <div class="widget-title">New</div>
                        <div class="widget-subtitle">Visitors</div>
                        <div class="widget-int">1,977</div>
                    </div>
                </div>
                <div class="widget-controls">
                    <a href="#" class="widget-control-right widget-remove" data-toggle="tooltip" data-placement="top" title="Remove Widget"><span class="fa fa-times"></span></a>
                </div>
            </div>
            <!-- END WIDGET SLIDER -->

        </div>
        <div class="col-md-3">

            <!-- START WIDGET MESSAGES -->
            <div class="widget widget-default widget-item-icon" onclick="location.href='pages-messages.html';">
                <div class="widget-item-left">
                    <span class="fa fa-envelope"></span>
                </div>
                <div class="widget-data">
                    <div class="widget-int num-count">48</div>
                    <div class="widget-title">New messages</div>
                    <div class="widget-subtitle">In your mailbox</div>
                </div>
                <div class="widget-controls">
                    <a href="#" class="widget-control-right widget-remove" data-toggle="tooltip" data-placement="top" title="Remove Widget"><span class="fa fa-times"></span></a>
                </div>
            </div>
            <!-- END WIDGET MESSAGES -->

        </div>
        <div class="col-md-3">

            <!-- START WIDGET REGISTRED -->
            <div class="widget widget-default widget-item-icon" onclick="location.href='pages-address-book.html';">
                <div class="widget-item-left">
                    <span class="fa fa-user"></span>
                </div>
                <div class="widget-data">
                    <div class="widget-int num-count">375</div>
                    <div class="widget-title">Registred users</div>
                    <div class="widget-subtitle">On your website</div>
                </div>
                <div class="widget-controls">
                    <a href="#" class="widget-control-right widget-remove" data-toggle="tooltip" data-placement="top" title="Remove Widget"><span class="fa fa-times"></span></a>
                </div>
            </div>
            <!-- END WIDGET REGISTRED -->

        </div>
        <div class="col-md-3">

            <!-- START WIDGET CLOCK -->
            <div class="widget widget-danger widget-padding-sm">
                <div class="widget-big-int plugin-clock">00:00</div>
                <div class="widget-subtitle plugin-date">Loading...</div>
                <div class="widget-controls">
                    <a href="#" class="widget-control-right widget-remove" data-toggle="tooltip" data-placement="left" title="Remove Widget"><span class="fa fa-times"></span></a>
                </div>
                <div class="widget-buttons widget-c3">
                    <div class="col">
                        <a href="#"><span class="fa fa-clock-o"></span></a>
                    </div>
                    <div class="col">
                        <a href="#"><span class="fa fa-bell"></span></a>
                    </div>
                    <div class="col">
                        <a href="#"><span class="fa fa-calendar"></span></a>
                    </div>
                </div>
            </div>
            <!-- END WIDGET CLOCK -->

        </div>
    </div>
    <!-- END WIDGETS -->

    <div class="row">
        <div class="col-md-6">

            <!-- START LINE AND BAR CHART -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Twitter Streams</h3>

                </div>
                <div class="panel-body">
                    <div id="twitter_chart" style="height: 300px;"><svg></svg></div>
                </div>
            </div>
            <!-- END LINE AND BAR CHART -->

        </div>
        <div class="col-md-6">

            <!-- START STACKED AREA CHART -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Stacked Area Chart</h3>
                </div>
                <div class="panel-body">
                    <div id="chart-3" style="height: 300px;"><svg></svg></div>
                </div>
            </div>
            <!-- END STACKED AREA CHART -->

        </div>
    </div>

</div>
@endsection

@section('custom_script')
<!-- START THIS PAGE PLUGINS-->
    <script type="text/javascript" src="{{ asset('js/plugins/nvd3/lib/d3.v3.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/plugins/nvd3/nv.d3.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/plugins/owl/owl.carousel.min.js') }}"></script>
<!-- END THIS PAGE PLUGINS-->

<!-- START TEMPLATE -->
    <script type="text/javascript" src="{{ asset('js/custom/feeds_chat.js') }}"></script>
<!-- START THIS PAGE TEMPLATE-->
    <script>
        jQuery(document).ready(function() {
            setTabActive('[href="/"]');
        });
    </script>
@endsection