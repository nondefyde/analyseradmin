@extends('layouts.default')

@section('title', 'Error 304')

@section('page_title')
    <li><a href="#">Error</a></li>
    <li class="active">Error: 304</li>
@endsection

@section('content')
    <div class="page-title">
        <h2><span class="fa fa-unlink"></span> Error 304 Invalid Record Request</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">
        <div class="row">
            <div class="col-md-12">

                <div class="error-container">
                    <div class="error-code">304</div>
                    <div class="error-text">page not found</div>
                    <div class="error-subtext">Unfortunately the page you were looking for could not be found.<br>
                        It may be temporarily unavailable, moved or no longer exist.<br>
                        Check the URL you entered for any mistakes and try again.</div>

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