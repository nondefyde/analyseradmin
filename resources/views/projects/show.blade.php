@extends('layouts.default')

@section('title', 'Project Details')

@section('page_title')
    <li><a href="/projects">Projects</a></li>
    <li class="active">Detail</li>
@endsection

@section('content')

    <div class="page-title">
        <h3><span class="fa fa-briefcase"></span> {{ $project->title }} Project</h3>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-4">
                            <!-- START WIDGET REGISTRED -->
                            <div class="widget widget-default widget-item-icon" onclick="location.href='pages-address-book.html';">
                                <div class="widget-item-left text-primary">
                                    <span class="fa fa-user"></span>
                                </div>
                                <div class="widget-data">
                                    <div class="widget-int num-count">345</div>
                                    <div class="widget-title">FOLLOWERS</div>
                                </div>
                            </div>
                            <!-- END WIDGET REGISTRED -->
                        </div>
                        <div class="col-md-4">
                            <!-- START WIDGET REGISTRED -->
                            <div class="widget widget-default widget-item-icon" onclick="location.href='pages-address-book.html';">
                                <div class="widget-item-left text-info">
                                    <span class="fa fa-thumbs-up"></span>
                                </div>
                                <div class="widget-data">
                                    <div class="widget-int num-count">{{ $project->likes }}</div>
                                    <div class="widget-title">Likes</div>
                                    <div class="widget-subtitle">like this project</div>
                                </div>
                            </div>
                            <!-- END WIDGET REGISTRED -->
                        </div>
                        <div class="col-md-4">
                            <!-- START WIDGET REGISTRED -->
                            <div class="widget widget-default widget-item-icon" onclick="location.href='pages-address-book.html';">
                                <div class="widget-item-left text-danger">
                                    <span class="fa fa-thumbs-down"></span>
                                </div>
                                <div class="widget-data">
                                    <div class="widget-int num-count">{{ $project->dislikes }}</div>
                                    <div class="widget-title">Dislikes</div>
                                    <div class="widget-subtitle">Dislike this project</div>
                                </div>
                            </div>
                            <!-- END WIDGET REGISTRED -->
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <!-- INVOICE -->
                            <div class="invoice">
                                <div class="row">
                                    <div class="col-lg-8 col-md-12">
                                        <div class="panel panel-default form-horizontal">
                                            <div class="panel-body">
                                                <h3 class="pull-left"><span class="fa fa-briefcase"></span> Project
                                                    Information</h3>
                                                <span class="push-down-10 pull-right">
                                                    <button class="btn btn-default"><span class="fa fa-print"></span> Print</button>
                                                </span>
                                            </div>
                                            <div class="panel-body form-group-separated">

                                                <div class="form-group">
                                                    <label class="col-md-4 col-xs-5 control-label text-left">Title: </label>

                                                    <div class="col-md-8 col-xs-7 line-height-30 text-right">{{ $project->title }}</div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 col-xs-5 control-label text-left">Sector(s): </label>

                                                    <div class="col-md-8 col-xs-7 text-right">
                                                        @foreach($project->sectors as $sector)
                                                            <span class="label label-default">{{ $sector->sector }}</span>
                                                        @endforeach
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 col-xs-5 control-label text-left">Description: </label>

                                                    <div class="col-md-8 col-xs-7 text-right">{{ $project->description }}</div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 col-xs-5 control-label text-left">Purpose: </label>

                                                    <div class="col-md-8 col-xs-7 line-height-30 text-right">{{ $project->purpose }}</div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 col-xs-5 control-label text-left">Date Commenced: </label>

                                                    <div class="col-md-8 col-xs-7 line-height-30 text-right">{{ $project->started_on->format('D, jS, M Y') }}</div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 col-xs-5 control-label text-left">Expected Date of Completion: </label>

                                                    <div class="col-md-8 col-xs-7 line-height-30 text-right">{{ $project->expected_on->format('D, jS, M Y') }}</div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 col-xs-5 control-label text-left">Date Completed: </label>

                                                    <div class="col-md-8 col-xs-7 line-height-30 text-right">
                                                        @if($project->completed_on)
                                                            {{  $project->completed_on->format('D, jS, M Y') }}
                                                        @else
                                                            <span class="label label-danger">nil</span>
                                                        @endif
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 col-xs-5 control-label text-left">Award Letter: </label>

                                                    <div class="col-md-8 col-xs-7 line-height-30 text-right">
                                                        <a href="{{ url($project->file_path . $project->award_letter) }}" class="btn btn-default view-pdf" rel="Award Letter">
                                                            <span class="fa fa-file"></span> View Award Letter
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 col-xs-5 control-label text-left">Memorandum of Understanding: </label>

                                                    <div class="col-md-8 col-xs-7 line-height-30 text-right">
                                                        <a href="{{ url($project->file_path . $project->mou) }}"
                                                           class="btn btn-default view-pdf" rel="Memorandum of Understanding">
                                                            <span class="fa fa-file"></span> View MoU
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-12">
                                        <div class="panel panel-default form-horizontal">
                                            <div class="panel-body">
                                                <h3><span class="fa fa-user"></span> Supervisor(s)</h3>
                                            </div>
                                            <div class="panel-body form-group-separated">
                                                @if(count($project->supervisors) > 0)
                                                    <?php $i = 1;?>
                                                    @foreach($project->supervisors as $supervisors)
                                                        <div class="form-group">
                                                            <label class="col-md-3 col-xs-4 control-label">{{ $i++ }} </label>
                                                            <label class="col-md-8 col-xs-7">
                                                                <a target="_blank" href="{{ url('/supervisors/show/'.$hashIds->encode($supervisors->user_id)) }}" class="btn btn-link text-danger">
                                                                    {{ $supervisors->fullNames() }}
                                                                </a>
                                                            </label>
                                                        </div>
                                                    @endforeach
                                                @else
                                                    <div class="form-group">
                                                        <label class="col-md-6 col-xs-4 control-label">No Supervisor Assigned</label>
                                                    </div>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-12">
                                        <div class="panel panel-default form-horizontal">
                                            <div class="panel-body">
                                                <h3><span class="fa fa-gears"></span> Contractor</h3>
                                            </div>
                                            <div class="panel-body form-group-separated">

                                                <div class="form-group">
                                                    <label class="col-md-4 col-xs-5 control-label">Name: </label>

                                                    <div class="col-md-8 col-xs-7 line-height-30">{{ $project->contractor()->first()->contractor }}</div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 col-xs-5 control-label">Code: </label>

                                                    <div class="col-md-8 col-xs-7">{{ $project->contractor()->first()->contractor_code }}</div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 col-xs-5 control-label">Phone No:</label>

                                                    <div class="col-md-8 col-xs-7 line-height-30">{{ $project->contractor()->first()->phone_no }}</div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 col-xs-5 control-label">Experience:</label>

                                                    <div class="col-md-8 col-xs-7 line-height-30">{{ $project->contractor()->first()->years_experience }} Year(s)</div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 col-xs-5 control-label">Details:</label>

                                                    <div class="col-md-8 col-xs-7 line-height-30">
                                                        <a href="{{ url('/contractors/'.$hashIds->encode($project->contractor()->first()->contractor_id)) }}" class="btn btn-success">
                                                            <span class="fa fa-credit-card"></span> View Contractor
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-body"><h3 class="push-down-0">Beneficiaries</h3></div>
                                @if($project->beneficiaries()->count() > 0)
                                    @foreach($project->beneficiaries()->get() as $beneficiary)
                                        <div class="panel-body faq">
                                            <div class="faq-item">
                                                <div class="faq-title"><span
                                                            class="fa fa-angle-up"></span>{{ $beneficiary->name }}</div>
                                                <div class="faq-text">
                                                    <table class="table table-striped">
                                                        <tr>
                                                            <td width="200"><strong>Address:</strong></td>
                                                            <td class="text-right">{{ $beneficiary->address }}</td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                @else
                                    <div class="panel-body faq">
                                        <div class="faq-item">
                                            <div class="faq-title">No Beneficiary Assigned Yet</div>
                                        </div>
                                    </div>
                                @endif
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-body"><h3 class="push-down-0">Domains</h3></div>
                                @if($project->domains()->count() > 0)
                                    @foreach($project->domains()->get() as $domain)
                                        <div class="panel-body faq">
                                            <div class="faq-item">
                                                <div class="faq-title"><span
                                                            class="fa fa-angle-up"></span>{{ $domain->town }}</div>
                                                <div class="faq-text">
                                                    <table class="table table-striped">
                                                        <tr>
                                                            <th width="40"><strong>Town: </strong></th>
                                                            <td>{{ $domain->town }}</td>
                                                            <th width="40"><strong>State: </strong></th>
                                                            <td>{{ $domain->lga()->first()->state()->first()->state }}</td>
                                                            <th width="40"><strong>L.G.A: </strong></th>
                                                            <td>{{ $domain->lga()->first()->lga }}</td>
                                                        </tr>
                                                        <tr>
                                                            <th width="140"><strong>Location Address: </strong></th>
                                                            <td colspan="5">{{ $domain->location_address }}</td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                @else
                                    <div class="panel-body faq">
                                        <div class="faq-item">
                                            <div class="faq-title">No Domain Assigned Yet</div>
                                        </div>
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-right push-down-20">
                                <button class="btn btn-success"><span class="fa fa-print"></span> Print
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

    </div>
    <!-- END PAGE CONTENT WRAPPER -->

    <!-- MESSAGE BOX-->
    <div class="message-box animated fadeIn" data-sound="alert" id="confirm-publish-row">
        <div class="mb-container">
            <div class="mb-middle">
                <div class="mb-title"><span class="fa fa-times"></span>You are about to <strong><span
                                id="publish_name"></span> Project</strong> ?
                </div>
                <div class="mb-content">
                    <p>Press Yes to continue.</p>

                    <p>Press No to cancel.</p>
                </div>
                <div class="mb-footer">
                    <div class="pull-right">
                        <button class="btn btn-success btn-lg mb-control-yes" id="confirm_project_publish">Yes</button>
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
    <script type="text/javascript" src="{{ asset('/js/faq.js') }}"></script>
    <script type="text/javascript" src="{{ asset('/js/custom/projects.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function () {
            setTabActive('[href="/projects"]');
        });
    </script>
@endsection