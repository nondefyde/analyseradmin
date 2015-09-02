@extends('layouts.default')

@section('title', 'Contractor Details')

@section('page_title')
    <li><a href="/projects">Projects</a></li>
    <li><a href="/contractors">Contractors</a></li>
    <li class="active">Detail</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-eye"></span> Contractor Details</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12">
                <div class="col-md-12">

                    <div class="panel panel-default">
                        <div class="panel-body">
                            <!-- INVOICE -->
                            <div class="invoice">
                                <div class="row">
                                    <div class="col-lg-8 col-md-12 col-lg-offset-2">
                                        <div class="push-down-10 pull-right">
                                            <button class="btn btn-default"><span class="fa fa-print"></span> Print</button>
                                        </div>
                                        <h2>CODE <strong>{{ $contractor->contractor_code }}</strong></h2>
                                        <table class="table table-striped">
                                            <tr>
                                                <td><strong>Contractor Name:</strong></td>
                                                <td class="text-right">{{ $contractor->contractor }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>E-mail:</strong></td>
                                                <td class="text-right">{{ $contractor->email }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Phone Number:</strong></td>
                                                <td class="text-right">{{ $contractor->phone_no }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>C.A.C Registration No:</strong></td>
                                                <td class="text-right">{{ $contractor->cac_registration_no }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>T.I.N:</strong></td>
                                                <td class="text-right">{{ $contractor->tin }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Area Of Specialization:</strong></td>
                                                <td class="text-right">{{ $contractor->specialization_area }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Year Of Experience:</strong></td>
                                                <td class="text-right">{{ $contractor->years_experience }} Year(s)</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Address:</strong></td>
                                                <td class="text-right">{{ $contractor->address }}</td>
                                            </tr>
                                        </table>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="pull-right push-down-20">
                                                    <a href="{{ url('/contractors/projects/'.$hashIds->encode($contractor->contractor_id)) }}" class="btn btn-success">
                                                        <span class="fa fa-credit-card"></span> View Contractors Projects
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- END INVOICE -->
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    </div>
    <!-- END PAGE CONTENT WRAPPER -->
    @endsection

    @section('custom_script')

            <!-- START TEMPLATE -->
    <script type="text/javascript" src="{{ asset('/js/custom/contractor.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function () {
            setTabActive('[href="/contractors"]');
        });
    </script>
@endsection