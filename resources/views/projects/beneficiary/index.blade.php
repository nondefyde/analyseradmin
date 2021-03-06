@extends('layouts.default')

@section('title', 'Beneficiary Lists')

@section('page_title')
    <li><a href="/projects">Projects</a></li>
    <li class="active">Beneficiary</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-bar-chart-o"></span> List of Beneficiaries</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12 center-block">

            </div>
            <div class="col-md-12">
                <div class="panel panel-danger">
                    <div class="panel-heading">
                        <h3 class="panel-title"><strong>Project Title: </strong> {{ $project->title }}</h3>
                        <ul class="panel-controls">
                            <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                        </ul>
                    </div>
                    <div class="panel-heading">
                        <button type="button" class="btn btn-default add_beneficiary"><i class="fa fa-plus"></i> Add</button>
                    </div>
                    <div class="panel-body panel-body-table">
                        {!! Form::open([
                                'method'=>'POST',
                                'class'=>'form',
                                'role'=>'form',
                            ])
                        !!}
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped table-actions" id="beneficiary_table">
                                <thead>
                                <tr>
                                    <th style="width: 5%;">#</th>
                                    <th style="width: 25%;">Beneficiary Full Name</th>
                                    <th style="width: 60%;">Beneficiary Address</th>
                                    <th style="width: 10%;">Delete</th>
                                </tr>
                                </thead>
                                @if(count($beneficiaries) > 0)
                                    <tbody id="menu_item_tbody">
                                    <?php $i = 1; ?>
                                    @foreach($beneficiaries as $beneficiary)
                                        <tr>
                                            <td class="text-center">{{$i++}} </td>
                                            <td>
                                                {!! Form::text('name[]', $beneficiary->name, ['placeholder'=>'Beneficiary Full Name', 'class'=>'form-control', 'required'=>'required']) !!}
                                                {!! Form::hidden('beneficiary_id[]', $beneficiary->beneficiary_id, ['class'=>'form-control']) !!}
                                            </td>
                                            <td>{!! Form::text('address[]', $beneficiary->address, ['placeholder'=>'Beneficiary Address', 'class'=>'form-control', 'required'=>'required']) !!}</td>
                                            <td>
                                                <button class="btn btn-danger btn-rounded btn-condensed btn-sm delete_beneficiary">
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
                                            {!! Form::text('name[]', '', ['placeholder'=>'Beneficiary Full Name', 'class'=>'form-control', 'required'=>'required']) !!}
                                            {!! Form::hidden('beneficiary_id[]', '-1', ['class'=>'form-control']) !!}
                                        </td>
                                        <td>{!! Form::text('address[]', '', ['placeholder'=>'Beneficiary Address', 'class'=>'form-control', 'required'=>'required']) !!}</td>
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
                                    <th style="width: 25%;">Beneficiary Full Name</th>
                                    <th style="width: 60%;">Beneficiary Address</th>
                                    <th style="width: 10%;">Delete</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="panel-footer">
                            <input type="hidden" id="project_id" name="project_id" value="{{ $project->project_id }}"/>
                            <button class="btn btn-default pull-left add_beneficiary"><i class="fa fa-plus"></i> Add</button>
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
                <div class="mb-title"><span class="fa fa-times"></span> Remove <strong><span id="beneficiary_name"></span> Beneficiary</strong> ?
                </div>
                <div class="mb-content">
                    <p>Are you sure you want to remove this Beneficiary?</p>

                    <p>Press Yes if you are sure.</p>
                </div>
                <div class="mb-footer">
                    <div class="pull-right">
                        <button class="btn btn-success btn-lg mb-control-yes" id="confirm_beneficiary_delete">Yes</button>
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
    <script type="text/javascript" src="{{ asset('/js/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('/js/custom/beneficiary.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function () {
            setTabActive('[href="/projects"]');
        });
    </script>
@endsection