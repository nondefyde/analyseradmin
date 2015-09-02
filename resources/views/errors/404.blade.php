@extends('layouts.default')

@section('title', '404 Page Not Found')

@section('page_title')
    <li><a href="#">Error</a></li>
    <li class="active">Error: 404</li>
@endsection

@section('content')
    <div class="page-title">
        <h2><span class="fa fa-unlink"></span> 404 Page Not Found</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">
        <div class="row">
            <div class="col-md-12">

                <div class="error-container">
                    <div class="error-code"><span class="fa fa-unlink"></span> 404</div>
                    <div class="error-text">page not found</div>
                    <div class="error-subtext">
                        Unfortunately we're having trouble loading the page you are looking for.
                        Please wait a moment and try again or use navigation side bar.
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- END PAGE CONTENT WRAPPER -->

@endsection

@section('custom_script')
    <script>
        jQuery(document).ready(function() {
            setTabActive('[href="/dashboard"]');
        });
    </script>
@endsection