<!-- START PAGE SIDEBAR -->
<div class="page-sidebar">
    <!-- START X-NAVIGATION -->
    <ul class="x-navigation">
        <li class="xn-logo">
            <a href="/">ANALYSER</a>
            <a href="#" class="x-navigation-control"></a>
        </li>
        <li class="xn-profile">
            <a href="#" class="profile-mini p_image">
                @if(!Auth::user()->avatar)
                    <img src="{{ asset('/images/avatar.svg') }}" alt="{{Auth::user()->fullNames()}}"/>
                @else
                    <img src="https://s3-us-west-2.amazonaws.com/analyser/{{ Auth::user()->avatar }}" alt="{{Auth::user()->fullNames()}}"/>
                @endif
            </a>
            <div class="profile">
                <div class="profile-image p_image">
                    @if(!Auth::user()->avatar)
                        <img src="{{ asset('/images/avatar.svg') }}" alt="{{Auth::user()->fullNames()}}"/>
                    @else
                        <img src="https://s3-us-west-2.amazonaws.com/analyser/{{ Auth::user()->avatar }}" alt="{{Auth::user()->fullNames()}}"/>
                    @endif
                </div>
                <div class="profile-data">
                    <div class="profile-data-name">{{Auth::user()->fullNames()}}</div>
                    <div class="profile-data-title">Type / <strong>{{ Auth::user()->userType()->first()->user_type }}</strong></div>
                </div>
                <div class="profile-controls">
                    <a href="pages-profile.html" class="profile-control-left"><span class="fa fa-info"></span></a>
                    <a href="pages-messages.html" class="profile-control-right"><span class="fa fa-envelope"></span></a>
                </div>
            </div>
        </li>
        <li class="xn-title">Navigation</li>
        <li><a href="/"><span class="fa fa-dashboard"></span> <span class="xn-text"> Dashboard</span></a></li>

        @foreach($active_menus as $menu)
            @if(count($menu->menuItems) > 0)
                <li class="xn-openable">
                    <a href="#"><span class="{{ $menu->icon }}"></span> <span class="xn-text">{{ $menu->menu }}</span></a>
                    <ul>
                        @foreach($menu->menuItems()->orderBy('sequence')->get() as $menu_item)
                            @if($menu_item->active === 1)
                                @if(count($menu_item->subMenuItems()->get()) > 0)
                                    <li class="xn-openable">
                                        <a href="#"><span class="{{ $menu_item->menu_item_icon }}"></span> <span class="xn-text">{{ $menu_item->menu_item }}</span></a>
                                        <ul>
                                            @foreach($menu_item->subMenuItems()->orderBy('sequence')->get() as $sub_menu_item)
                                                @if($sub_menu_item->active === 1)
                                                    <li><a href="{{ $sub_menu_item->sub_menu_item_url }}"><span class="{{ $sub_menu_item->sub_menu_item_icon }}"></span> {{ $sub_menu_item->sub_menu_item }}</a></li>
                                                @endif
                                            @endforeach
                                        </ul>
                                    </li>
                                @else
                                    <li><a href="{{ $menu_item->menu_item_url }}"><span class="{{ $menu_item->menu_item_icon }}"></span> {{ $menu_item->menu_item }}</a></li>
                                @endif
                            @endif
                        @endforeach
                    </ul>
                </li>
            @else
                <li>
                    <a href="{{ $menu->menu_url }}"><span class="{{ $menu->icon }}"></span> <span class="xn-text">{{ $menu->menu }}</span></a>
                </li>
            @endif
        @endforeach

        <li><a href="/users/change"><span class="fa fa-lock"></span> <span class="xn-text"> Change Password</span></a></li>
        <li><a href="/auth/logout"><span class="fa fa-power-off text-danger"></span> <span class="xn-text"> Logout</span></a></li>
    </ul>
    <!-- END X-NAVIGATION -->
</div>
<!-- END PAGE SIDEBAR -->