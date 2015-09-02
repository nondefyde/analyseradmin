@extends('layouts.default')

@section('title', 'Project TimeLine')

@section('page_title')
    <li><a href="/projects">Projects</a></li>
    <li class="active">TimeLine</li>
@endsection

@section('content')

    <div class="page-title">
        <h2><span class="glyphicon glyphicon-time"></span> Project: {{ $project->title }} TimeLine</h2>
    </div>

    <!-- PAGE CONTENT WRAPPER -->
    <div class="page-content-wrap">
        <div class="row">
            <div class="col-md-6">
                <!-- START NEW RECORD -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        @include('errors.errors')
                        <form class="form-horizontal" action="/projects/timeline" enctype="multipart/form-data"
                              method="post" role="form">
                            {!! csrf_field() !!}
                            <div class="form-group">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        <input class="form-control" name="update_title"
                                               value="{{ Input::old('update_title') }}" placeholder="Project Update"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <textarea class="form-control" name="update_description" rows="3"
                                              placeholder="Project Update Description">{{ Input::old('update_description') }}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-video-camera"></span></span>
                                        <input class="form-control" name="video_url"
                                               value="{{ Input::old('video_url') }}" placeholder="Youtube url http://"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <div class="btn-group pull-left">
                                        <input type="file" class="fileinput btn-primary" name="update_picture"
                                               id="update_picture"
                                               title="{{ '<span class="fa fa-image"></span> Add Image' }}"/>
                                    </div>
                                    <div class="pull-right">
                                        <input type="hidden" class="form-control" name="project_id"
                                               value="{{ $project->project_id }}"/>
                                        <button class="btn btn-success"><span class="fa fa-send"></span> Update</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="panel-body">
                        {{--@include('errors.errors')--}}
                        {{--<form class="form-horizontal" action="/projects/timeline/comment" enctype="multipart/form-data"--}}
                              {{--method="post" role="form">--}}
                            {{--{!! csrf_field() !!}--}}
                            {{--<div class="form-group">--}}
                                {{--<div class="col-md-12">--}}
                                    {{--<div class="input-group">--}}
                                        {{--<span class="input-group-addon"><span class="fa fa-pencil"></span></span>--}}
                                        {{--<select class="form-control" name="project_update_id">--}}
                                            {{--<option value="">Nothing Select</option>--}}
                                            {{--@foreach($updates as $update)--}}
                                                {{--<option value="{{ $update->project_update_id }}">{{ $update->update_title }}</option>--}}
                                            {{--@endforeach--}}
                                        {{--</select>--}}
                                    {{--</div>--}}
                                {{--</div>--}}
                            {{--</div>--}}
                            {{--<div class="form-group">--}}
                                {{--<div class="col-md-12">--}}
                                    {{--<textarea class="form-control" name="project_comment" rows="1"--}}
                                              {{--placeholder="Comment"></textarea>--}}
                                {{--</div>--}}
                            {{--</div>--}}
                            {{--<div class="form-group">--}}
                                {{--<div class="col-md-12">--}}
                                    {{--<div class="pull-right">--}}
                                        {{--<input type="hidden" class="form-control" name="project_id"--}}
                                               {{--value="{{ $project->project_id }}"/>--}}
                                        {{--<button class="btn btn-primary"><span class="fa fa-comment-o"></span> Comment--}}
                                        {{--</button>--}}
                                    {{--</div>--}}
                                {{--</div>--}}
                            {{--</div>--}}
                        {{--</form>--}}
                    </div>
                </div>
                <!-- END NEW RECORD -->
            </div>
            <div class="col-md-3">
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
            <div class="col-md-3">
                <!-- START WIDGET SLIDER -->
                <div class="widget widget-default widget-carousel">
                    <div class="owl-carousel" id="owl-example">
                        <div>
                            <div class="widget-title">Total Views</div>
                            <div class="widget-subtitle">34,555</div>
                            <div class="widget-int">3,548</div>
                        </div>
                        <div>
                            <div class="widget-title">Total Likes</div>
                            <div class="widget-subtitle">23,5556</div>
                            <div class="widget-int">1,695</div>
                        </div>
                        <div>
                            <div class="widget-title">Total Comments</div>
                            <div class="widget-subtitle">23,445</div>
                            <div class="widget-int">1,977</div>
                        </div>
                    </div>
                </div>
                <!-- END WIDGET SLIDER -->

            </div>
            <div class="col-md-3">
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
            <div class="col-md-3">
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

        <div class="row">
            <div class="col-md-12">

                <!-- START TIMELINE -->
                <div class="timeline timeline-right">

                    <!-- START TIMELINE ITEM -->
                    <div class="timeline-item timeline-main">
                        <div class="timeline-date">2015</div>
                    </div>
                    <!-- END TIMELINE ITEM -->

                    @if($updates->count() > 0)
                    <!-- START TIMELINE ITEM -->
                    @foreach($updates as $update)
                        <div class="timeline-item timeline-item-right">
                            <div class="timeline-item-info">{{ $update->created_at->diffForHumans() }}</div>
                            <div class="timeline-item-icon"><span class="fa fa-briefcase"></span></div>
                            <div class="timeline-item-content">
                                <div class="timeline-heading">
                                    <img src="{{ $update->user()->first()->avatar }}"/>
                                    <a href="#">{{ $update->user()->first()->fullNames() }}</a>
                                    <small class="text-muted"> added update</small>
                                    <a href="#">{{ $update->update_title }}</a>
                                    <small class="text-muted">about {{ $update->created_at->diffForHumans() }}</small>
                                </div>
                                <div class="timeline-body">
                                    @if($update->update_picture)
                                        <img src="https://s3-us-west-2.amazonaws.com/analyser/{{ $update->image_path . $update->update_picture }}" class="img-text"
                                             width="150" align="left"/>
                                    @endif

                                    <p>{{ $update->update_description }}</p>
                                </div>
                                <div class="timeline-footer">
                                    <div>
                                        <a href="#"><span class="fa fa-comment"></span> 35</a>
                                        <a href="#"><span class="fa fa-thumbs-up"></span> 50</a>
                                        <a href="#"><span class="fa fa-thumbs-down"></span> 50</a>
                                    </div>
                                </div>
                                @foreach($update->comments()->orderBy('created_at', 'desc')->get() as $comment)
                                    <div class="timeline-body comments">
                                        <div class="comment-item">
                                            <img src="{{ $comment->appUser()->first()->avatar }}"/>

                                            <p class="comment-head">
                                                <a href="#">{{ $comment->appUser()->first()->fullNames() }}</a> <span
                                                        class="text-muted">@bradpitt</span>
                                            </p>

                                            <p>{{ $comment->project_comment }}</p>

                                            <span class="fa fa-clock-o"> {{ $comment->created_at->diffForHumans() }}</span>
                                            <span class="fa fa-reply reply" rel="{{ $comment->project_comment_id }}"> Reply </span>

                                            <div class="col-lg-12 hidden" rel="{{ $comment->project_comment_id }}">
                                                <div class="comment-write col-lg-10 inline">
                                                    <textarea class="form-control inner-comment"
                                                              placeholder="Write a comment" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                        @endforeach
                        <!-- END TIMELINE ITEM -->
                        @endif

                        <!-- START TIMELINE ITEM -->
                        <div class="timeline-item timeline-main">
                            <div class="timeline-date"><a href="#"><span class="fa fa-ellipsis-h"></span></a></div>
                        </div>
                        <!-- END TIMELINE ITEM -->
                </div>
                <!-- END TIMELINE -->

            </div>
        </div>
    </div>
    <!-- END PAGE CONTENT WRAPPER -->
    @endsection

    @section('custom_script')
            <!-- START TEMPLATE -->
    <script type="text/javascript" src="{{ asset('/js/plugins/bootstrap/bootstrap-file-input.js') }}"></script>
    <script type="text/javascript" src="{{ asset('/js/plugins/owl/owl.carousel.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('/js/custom/timeline.js') }}"></script>
    <!-- END TEMPLATE -->
    <script>
        jQuery(document).ready(function () {
            setTabActive('[href="/"]');
        });
    </script>
@endsection