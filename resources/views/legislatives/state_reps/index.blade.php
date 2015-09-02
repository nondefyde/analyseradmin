@extends('layouts.default')

@section('title', 'State Representatives')

@section('page_title')
    <li><a href="/state-reps"> State Representatives</a></li>
    <li class="active">Manage</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="fa fa-sitemap"></span> State Representatives</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <h3>Filter By State</h3>

                        <form method="post" action="/state-reps/state" role="form" class="form-horizontal">
                            {!! csrf_field() !!}
                            <div class="form-group">
                                <label class="col-md-3 control-label">States</label>

                                <div class="col-md-6">
                                    <div class="col-md-9">
                                        <select class="form-control select" name="state_id" id="state_id">
                                            <option value="">Display All State Reps.</option>
                                            @foreach($states as $key => $value)
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
                        <button type="button" class="btn btn-default add_state_reps"><i class="fa fa-plus"></i> Add</button>
                    </div>
                    <div class="panel-body panel-body-table">
                        <form method="post" action="/state-reps" id="state_reps_form" role="form" class="form-horizontal">
                            {!! csrf_field() !!}
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped table-actions" id="state_reps_table">
                                <thead>
                                    <tr>
                                        <th style="width: 2%;">#</th>
                                        <th style="width: 20%;">State Representative</th>
                                        <th style="width: 20%;">State</th>
                                        <th style="width: 20%;">State Constituency</th>
                                        <th style="width: 15%;">Rank</th>
                                        <th style="width: 15%;">House</th>
                                        <th style="width: 8%;">Action</th>
                                    </tr>
                                </thead>
                                @if(count($state_reps) > 0)
                                    <tbody>
                                    <?php $i = 1; ?>
                                    @foreach($state_reps as $state_rep)
                                        <tr>
                                            <td class="text-center">{{$i++}}</td>
                                            <td>
                                                <select name="user_id[]" class="form-control" required="required">
                                                    <option value="">Nothing Selected</option>
                                                    @foreach($users as $user)
                                                        @if($user->user_id === $state_rep->user_id)
                                                            <option selected value="{{ $user->user_id }}">{{ $user->fullNames() }}</option>
                                                        @else
                                                            <option value="{{ $user->user_id }}">{{ $user->fullNames() }}</option>
                                                        @endif
                                                    @endforeach
                                                </select>
                                                {!! Form::hidden('state_rep_id[]', $state_rep->state_rep_id, ['class'=>'form-control']) !!}
                                            </td>

                                            <td>{!! Form::select('state_id[]', $states, $state_rep->stateConstituency()->first()->state()->first()->state_id, ['class'=>'form-control state_options', 'required'=>'required']) !!} </td>
                                            <td>
                                                <select name="state_constituency_id[]" class="form-control" required="required">
                                                    <option value="">Nothing Selected</option>
                                                    @foreach($state_rep->stateConstituency()->first()->state()->first()->stateConstituencies()->orderBy('state_constituency')->get() as $state_cons)
                                                        @if($state_cons->state_constituency_id === $state_rep->state_constituency_id)
                                                            <option selected value="{{ $state_cons->state_constituency_id }}">{{ $state_cons->state_constituency }}</option>
                                                        @else
                                                            <option value="{{ $state_cons->state_constituency_id }}">{{ $state_cons->state_constituency }}</option>
                                                        @endif
                                                    @endforeach
                                                </select>
                                            </td>
                                            <td>{!! Form::select('rank_id[]', $ranks, $state_rep->rank_id, ['class'=>'form-control', 'required'=>'required']) !!} </td>
                                            <td>{!! Form::select('house_id[]', $houses, $state_rep->house_id, ['class'=>'form-control', 'required'=>'required']) !!} </td>
                                            <td>
                                                <button class="btn btn-danger btn-rounded btn-condensed btn-sm delete_state_reps">
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
                                            <select name="user_id[]" class="form-control" required="required">
                                                <option value="">Nothing Selected</option>
                                                @foreach($users as $user)
                                                    <option value="{{ $user->user_id }}">{{ $user->fullNames() }}</option>
                                                @endforeach
                                            </select>
                                            {!! Form::hidden('state_rep_id[]', '-1', ['class'=>'form-control']) !!}
                                        </td>
                                        <td>{!! Form::select('state_id[]', $states, '', ['class'=>'form-control state_options', 'required'=>'required']) !!} </td>
                                        <td>
                                            <select name="state_constituency_id[]" class="form-control" required="required">
                                                <option value="">Nothing Selected</option>
                                            </select>
                                        </td>
                                        <td>{!! Form::select('rank_id[]', $ranks, '', ['class'=>'form-control', 'required'=>'required']) !!} </td>
                                        <td>{!! Form::select('house_id[]', $houses, '', ['class'=>'form-control', 'required'=>'required']) !!} </td>
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
                                        <th style="width: 20%;">State Representative</th>
                                        <th style="width: 20%;">State</th>
                                        <th style="width: 20%;">State Constituency</th>
                                        <th style="width: 15%;">Rank</th>
                                        <th style="width: 15%;">House</th>
                                        <th style="width: 8%;">Action</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="panel-footer">
                            <button class="btn btn-default pull-left add_state_reps"><i class="fa fa-plus"></i> Add</button>
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
                <div class="mb-title"><span class="fa fa-times"></span> Remove <strong id="state_reps_value"></strong> ?
                </div>
                <div class="mb-content">
                    <p>Are you sure you want to remove this menu?</p>

                    <p>Press Yes if you sure.</p>
                </div>
                <div class="mb-footer">
                    <div class="pull-right">
                        <button class="btn btn-success btn-lg mb-control-yes" id="confirm_state_reps_delete">Yes</button>
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
    <script type="text/javascript" src="{{ asset('/js/custom/state_reps.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function () {
            setTabActive('[href="/state-reps"]');
        });
    </script>
@endsection