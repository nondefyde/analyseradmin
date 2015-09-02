@extends('layouts.default')

@section('title', 'Error')

@section('page_title')
    <li><a href="#">Error</a></li>
    <li class="active">Error: {{ $header }}</li>
@endsection

@section('content')
    <div class="page-title">
        <h2><span class="fa fa-unlink"></span> {{ $header }}</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">
        <div class="row">
            <div class="col-md-12">

                <div class="error-container">
                    <div class="error-code">{{ $code }}</div>
                    <div class="error-text">{{ $header }}</div>
                    <div class="error-subtext">{{ $message }}</div>

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