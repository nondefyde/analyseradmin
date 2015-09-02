@extends('layouts.default')

@section('title', 'Domain Lists')

@section('page_title')
    <li><a href="/projects">Projects</a></li>
    <li class="active">Domain</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-home"></span> List of Domains</h2>
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
                        <button type="button" class="btn btn-default add_domain"><i class="fa fa-plus"></i> Add</button>
                    </div>
                    <div class="panel-body panel-body-table">
                        {!! Form::open([
                                'method'=>'POST',
                                'class'=>'form',
                                'role'=>'form',
                            ])
                        !!}
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped table-actions" id="domain_table">
                                <thead>
                                <tr>
                                    <th style="width: 3%;">#</th>
                                    <th style="width: 17%;">State</th>
                                    <th style="width: 17%;">L.G.A</th>
                                    <th style="width: 15%;">Town</th>
                                    <th style="width: 45%;">Location Address</th>
                                    <th style="width: 8%;">Delete</th>
                                </tr>
                                </thead>
                                @if(count($domains) > 0)
                                    <tbody>
                                    <?php $i = 1; ?>
                                    @foreach($domains as $domain)
                                        <tr>
                                            <td class="text-center">{{$i++}} </td>
                                            <td>
                                                <select class="form-control state_select" name="state_id[]" required>
                                                    <option value="">Nothing Selected</option>
                                                    @foreach($states as $state)
                                                        @if($state->state_id === $domain->lga()->first()->state_id)
                                                            <option selected value="{{ $state->state_id }}">{{ $state->state }}</option>
                                                        @else
                                                            <option value="{{ $state->state_id }}">{{ $state->state }}</option>
                                                        @endif
                                                    @endforeach
                                                </select>
                                                {!! Form::hidden('domain_id[]', $domain->domain_id, ['class'=>'form-control']) !!}
                                            </td>
                                            <td>
                                                <select class="form-control lga_select" name="lga_id[]" required>
                                                    <option value="">Nothing Selected</option>
                                                    @foreach($domain->lga()->first()->state()->first()->lgas()->get() as $lga)
                                                        @if($lga->lga_id === $domain->lga_id)
                                                            <option selected value="{{ $lga->lga_id }}">{{ $lga->lga }}</option>
                                                        @else
                                                            <option value="{{ $lga->lga_id }}">{{ $lga->lga }}</option>
                                                        @endif
                                                    @endforeach
                                            </td>
                                            <td>{!! Form::text('town[]', $domain->town, ['placeholder'=>'Town', 'class'=>'form-control', 'required'=>'required']) !!}</td>
                                            <td>{!! Form::text('location_address[]', $domain->location_address, ['placeholder'=>'Location Address', 'class'=>'form-control', 'required'=>'required']) !!}</td>
                                            <td>
                                                <button class="btn btn-danger btn-rounded btn-condensed btn-sm delete_domain">
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
                                            <select class="form-control state_select" name="state_id[]" required>
                                                <option value="">Nothing Selected</option>
                                                @foreach($states as $state)
                                                    <option value="{{ $state->state_id }}">{{ $state->state }}</option>
                                                @endforeach
                                            </select>
                                            {!! Form::hidden('domain_id[]', '-1', ['class'=>'form-control']) !!}
                                        </td>
                                        <td>
                                            <select class="form-control lga_select" name="lga_id[]" required>
                                                <option value="">Nothing Selected</option>

                                            </select>
                                        </td>
                                        <td>{!! Form::text('town[]', '', ['placeholder'=>'Town', 'class'=>'form-control', 'required'=>'required']) !!}</td>
                                        <td>{!! Form::text('location_address[]', '', ['placeholder'=>'Location Address', 'class'=>'form-control', 'required'=>'required']) !!}</td>
                                        <td>
                                            <button class="btn btn-danger btn-rounded btn-condensed btn-sm">
                                                <span class="fa fa-times"></span> Remove
                                            </button>
                                        </td>
                                    </tr>
                                @endif
                                <tfoot>
                                    <tr>
                                        <th style="width: 3%;">#</th>
                                        <th style="width: 17%;">State</th>
                                        <th style="width: 17%;">L.G.A</th>
                                        <th style="width: 15%;">Town</th>
                                        <th style="width: 45%;">Location Address</th>
                                        <th style="width: 8%;">Delete</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="panel-footer">
                            <input type="hidden" id="project_id" name="project_id" value="{{ $project->project_id }}"/>
                            <button class="btn btn-default pull-left add_domain"><i class="fa fa-plus"></i> Add</button>
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
                <div class="mb-title"><span class="fa fa-times"></span> Remove <strong><span id="domain_name"></span> Domain</strong> ?
                </div>
                <div class="mb-content">
                    <p>Are you sure you want to remove this Domain?</p>

                    <p>Press Yes if you are sure.</p>
                </div>
                <div class="mb-footer">
                    <div class="pull-right">
                        <button class="btn btn-success btn-lg mb-control-yes" id="confirm_domain_delete">Yes</button>
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
    <script type="text/javascript" src="{{ asset('/js/custom/domain.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function () {
            setTabActive('[href="/projects"]');
        });
    </script>
@endsection