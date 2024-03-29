<style>
    .nav-sub{
        background: #019842 !important;
    }
</style>
<div id="sidebarMain" class="d-none">
    <aside
        class="js-navbar-vertical-aside navbar navbar-vertical-aside navbar-vertical navbar-vertical-fixed navbar-expand-xl navbar-bordered">
        <div class="navbar-vertical-container">
            <div class="navbar-brand-wrapper justify-content-center" onclick="location.href='{{route('vendor.dashboard')}}'" style="cursor: pointer;font-weight: bold;font-size: 15px">
                <!-- Logo -->

               @php($restaurant_data=\App\CentralLogics\Helpers::get_restaurant_data())
                <a class="navbar-brand" href="{{route('vendor.dashboard')}}" aria-label="Front" style="padding-top: 0!important;padding-bottom: 0!important;">
                    <img class="navbar-brand-logo"
                         style="height: 55px;"
                         onerror="this.src='{{asset('public/assets/admin/img/160x160/logo2.png')}}'"
                         src="{{asset('storage/app/public/restaurant/'.$restaurant_data->logo)}}"
                         alt="Logo">
                    <img class="navbar-brand-logo-mini"
                         style="height: 55px;"
                         onerror="this.src='{{asset('public/assets/admin/img/160x160/logo2.png')}}'"
                         src="{{asset('storage/app/public/restaurant/'.$restaurant_data->logo)}}" alt="Logo">
                </a> 
            {{\Illuminate\Support\Str::limit($restaurant_data->name,15)}}
            <!-- End Logo -->

                <!-- Navbar Vertical Toggle -->
                <button type="button"
                        class="js-navbar-vertical-aside-toggle-invoker navbar-vertical-aside-toggle btn btn-icon btn-xs btn-ghost-dark">
                    <i class="tio-clear tio-lg"></i>
                </button>
                <!-- End Navbar Vertical Toggle -->
            </div>

            <!-- Content -->
            <div class="navbar-vertical-content text-capitalize"  style="background-color: #019842;">
                <ul class="navbar-nav navbar-nav-lg nav-tabs">
                    <!-- Dashboards -->
                    <li class="navbar-vertical-aside-has-menu {{Request::is('vendor-panel')?'show':''}}">
                        <a class="js-navbar-vertical-aside-menu-link nav-link"
                            href="{{route('vendor.dashboard')}}" title="{{__('messages.dashboard')}}">
                            <i class="tio-home-vs-1-outlined nav-icon"></i>
                            <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                {{__('messages.dashboard')}}
                            </span>
                        </a>
                    </li>
                    <!-- End Dashboards -->

                    @if(\App\CentralLogics\Helpers::employee_module_permission_check('order'))
                    <li class="nav-item">   
                        <small class="nav-subtitle" title="{{__('messages.order')}} {{__('messages.section')}}">{{__('messages.order')}} {{__('messages.section')}}</small>
                        <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                    </li>

                    <!-- Order -->
                    <li class="navbar-vertical-aside-has-menu {{Request::is('vendor-panel/order*')?'active':''}}">
                        <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                            title="{{__('messages.orders')}}">
                            {{-- <i class="tio-shopping-cart nav-icon"></i> --}}

                            <img src="{{asset('public/assets/admin/img/booking.png')}}" style="width: 20px; height: auto;filter: invert(100%);" />&nbsp;
                            <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                {{__('messages.orders')}}
                            </span>
                        </a>
                        <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                            style="display: {{Request::is('vendor-panel/order*')?'block':'none'}}">
                           <li class="nav-item {{Request::is('vendor-panel/order/list/pending')?'active':''}}">
                                <a class="nav-link " href="{{route('vendor.order.list',['pending'])}}" title="{{__('messages.pending')}}{{-- ({{__('messages.take_away')}}) --}}">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">
                                        {{__('messages.pending')}} {{-- {{(config('order_confirmation_model') == 'restaurant' || \App\CentralLogics\Helpers::get_restaurant_data()->self_delivery_system)?'':__('messages.take_away')}} --}}
                                            <span class="badge badge-soft-success badge-pill ml-1">
                                            {{\App\Models\Order::Pending()->where(['vendor_id'=>\App\CentralLogics\Helpers::get_restaurant_id()])->count()}}
                                        </span>
                                    </span>
                                </a>
                            </li> 

                        <li class="nav-item {{Request::is('vendor-panel/order/list/accepted')?'active':''}}">
                                <a class="nav-link " href="{{route('vendor.order.list',['accepted'])}}" title="{{__('messages.accepted')}}">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">
                                        {{__('messages.accepted')}}
                                            <span class="badge badge-soft-success badge-pill ml-1">
                                            {{\App\Models\Order::Accepted()->where('vendor_id', \App\CentralLogics\Helpers::get_restaurant_id())->count()}}
                                        </span>
                                    </span>
                                </a>
                            </li>

                            <li class="nav-item {{Request::is('vendor-panel/order/list/processing')?'active':''}}">
                                <a class="nav-link" href="{{route('vendor.order.list',['processing'])}}" title="{{__('messages.cooking')}}">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">
                                        {{__('messages.cooking')}}
                                        <span class="badge badge-info badge-pill ml-1">
                                            {{\App\Models\Order::Preparing()->where(['vendor_id'=>\App\CentralLogics\Helpers::get_restaurant_id()])->count()}}
                                        </span>
                                    </span>
                                </a>
                            </li>
                           {{--  <li class="nav-item {{Request::is('vendor-panel/order/list/ready_for_delivery')?'active':''}}">
                                <a class="nav-link" href="{{route('vendor.order.list',['ready_for_delivery'])}}" title="{{__('messages.ready_for_delivery')}}">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">
                                        {{__('messages.ready_for_delivery')}}
                                        <span class="badge badge-info badge-pill ml-1">
                                            {{\App\Models\Order::Accepted()->where(['order_status'=>'handover', 'vendor_id'=>\App\CentralLogics\Helpers::get_restaurant_id()])->count()}}
                                        </span>
                                    </span>
                                </a>
                            </li> --}}
                            <li class="nav-item {{Request::is('vendor-panel/order/list/services_ongoing')?'active':''}}">
                                <a class="nav-link" href="{{route('vendor.order.list',['services_ongoing'])}}" title="{{__('messages.Service_on_the_way')}}">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">
                                        {{__('messages.Service_on_the_way')}}
                                        <span class="badge badge-info badge-pill ml-1">
                                            {{\App\Models\Order::ServiceOngoing()->where(['vendor_id'=>\App\CentralLogics\Helpers::get_restaurant_id()])->count()}}
                                        </span>
                                    </span>
                                </a>
                            </li>
                            <li class="nav-item {{Request::is('vendor-panel/order/list/delivered')?'active':''}}">
                                <a class="nav-link " href="{{route('vendor.order.list',['completed'])}}" title="">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">
                                        {{__('messages.delivered')}}
                                            <span class="badge badge-success badge-pill ml-1">
                                            {{\App\Models\Order::Delivered()->where(['vendor_id'=>\App\CentralLogics\Helpers::get_restaurant_id()])->Notpos()->count()}}
                                        </span>
                                    </span>
                                </a>
                            </li>
                           {{--  <li class="nav-item {{Request::is('vendor-panel/order/list/returned')?'active':''}}">
                                <a class="nav-link " href="{{route('vendor.order.list',['returned'])}}" title="">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">
                                        {{__('messages.returned')}}
                                            <span class="badge badge-soft-danger bg-light badge-pill ml-1">
                                            {{\App\Models\Order::Accepted()->where(['order_status'=>'returned','vendor_id'=>\App\CentralLogics\Helpers::get_restaurant_id()])->count()}}
                                        </span>
                                    </span>
                                </a>
                            </li> --}}
                            <li class="nav-item {{Request::is('vendor-panel/order/list/scheduled')?'active':''}}">
                                <a class="nav-link" href="{{route('vendor.order.list',['scheduled'])}}" title="{{__('messages.scheduled')}}">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">
                                        {{__('messages.scheduled')}}
                                        <span class="badge badge-info badge-pill ml-1">
                                            {{\App\Models\Order::Scheduled()->where('vendor_id',\App\CentralLogics\Helpers::get_restaurant_id())->count()}}
                                        </span>
                                    </span>
                                </a>
                            </li>
                            <li class="nav-item {{Request::is('vendor-panel/order/list/all')?'active':''}}">
                                <a class="nav-link" href="{{route('vendor.order.list',['all'])}}" title="{{__('messages.all')}} {{__('messages.order')}}">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">
                                        {{__('messages.all')}}
                                        <span class="badge badge-info badge-pill ml-1">
                                            {{\App\Models\Order::whereIn('order_status',['pending', 'canceled', 'services_ongoing', 'picked_up', 'service_ongoing', 'processing', 'accepted', 'delivered', 'completed', 'refunded'])->where('vendor_id', \App\CentralLogics\Helpers::get_restaurant_id())->count()}}
                                        </span>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </li> 
                    <!-- End Order -->
                    @endif
                    
                 @if(\App\CentralLogics\Helpers::employee_module_permission_check('pos'))
                    <li class="nav-item">
                        <small
                            class="nav-subtitle">{{__('messages.pos')}} {{__('messages.system')}}</small>
                        <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                    </li> 
                    
                    
                    <!-- POS -->
                   <li class="navbar-vertical-aside-has-menu {{Request::is('vendor-panel/pos/*')?'active':''}}">
                        <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                        >
                            <i class="tio-shopping nav-icon"></i>
                            <span
                                class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">{{__('messages.pos')}}</span>
                        </a>
                        <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                            style="display: {{Request::is('vendor-panel/pos/*')?'block':'none'}}">
                            <li class="nav-item {{Request::is('vendor-panel/pos/')?'active':''}}">
                                <a class="nav-link " href="{{route('vendor.pos.index')}}"
                                    title="{{__('messages.pos')}}">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span
                                        class="text-truncate">{{__('messages.pos')}}</span>
                                </a>
                            </li>
                            <li class="nav-item {{Request::is('vendor-panel/pos/orders')?'active':''}}">
                                <a class="nav-link " href="{{route('vendor.pos.orders')}}" title="{{__('messages.orders')}}">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">{{__('messages.orders')}}
                                        <span class="badge badge-info badge-pill ml-1">
                                            {{\App\Models\Order::where('vendor_id',\App\CentralLogics\Helpers::get_restaurant_id())->Pos()->count()}}
                                        </span>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </li> 
                    <!-- End POS -->
                    @endif      
                    <li class="nav-item">
                        <small
                            class="nav-subtitle">{{__('messages.service')}} {{__('messages.management')}}</small>
                        <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                    </li>

                    <!-- AddOn -->
                {{-- @if(\App\CentralLogics\Helpers::employee_module_permission_check('addon'))
                    <li class="navbar-vertical-aside-has-menu {{Request::is('vendor-panel/addon*')?'active':''}}">
                        <a class="js-navbar-vertical-aside-menu-link nav-link"
                            href="{{route('vendor.addon.add-new')}}" title="{{__('messages.addons')}}"
                        >
                            <i class="tio-add-circle-outlined nav-icon"></i>
                            <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                {{__('messages.addons')}}
                            </span>
                        </a>
                    </li>
                    @endif --}}
                    <!-- End AddOn -->
                    @if(\App\CentralLogics\Helpers::employee_module_permission_check('service'))
                    <!-- Food -->
                    <li class="navbar-vertical-aside-has-menu {{Request::is('vendor-panel/service*')?'active':''}}">
                        <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                        >
                            <i class="tio-premium-outlined nav-icon"></i>
                            <span
                                class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">{{__('messages.services')}}</span>
                        </a>
                        <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                            style="display: {{Request::is('vendor-panel/service*')?'block':'none'}}">
                            <li class="nav-item {{Request::is('vendor-panel/service/add-new')?'active':''}}">
                                <a class="nav-link " href="{{route('vendor.service.add-new')}}"
                                    title="add new service">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span
                                        class="text-truncate">{{__('messages.add')}} {{__('messages.new')}}</span>
                                </a>
                            </li>
                            <li class="nav-item {{Request::is('vendor-panel/service/list')?'active':''}}">
                                <a class="nav-link " href="{{route('vendor.service.list')}}" title="Service list">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">{{__('messages.list')}}</span>
                                </a>
                            </li>
                            @if(\App\CentralLogics\Helpers::get_restaurant_data()->food_section)
                            <li class="nav-item {{Request::is('vendor-panel/service/bulk-import')?'active':''}}">
                                <a class="nav-link " href="{{route('vendor.service.bulk-import')}}"
                                    title="{{__('messages.bulk_import')}}">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate text-capitalize">{{__('messages.bulk_import')}}</span>
                                </a>
                            </li>
                            <li class="nav-item {{Request::is('vendor-panel/service/bulk-export')?'active':''}}">
                                <a class="nav-link " href="{{route('vendor.service.bulk-export-index')}}"
                                    title="{{__('messages.bulk_export')}}">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate text-capitalize">{{__('messages.bulk_export')}}</span>
                                </a>
                            </li>
                            @endif
                        </ul>
                    </li>
                    <!-- End Food -->
                    <li class="navbar-vertical-aside-has-menu {{Request::is('vendor-panel/category*')?'active':''}}">
                        <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle"
                            href="javascript:" title="{{__('messages.category')}}"
                        >
                            <i class="tio-category nav-icon"></i>
                            <span
                                class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">{{__('messages.categories')}}</span>
                        </a>
                        <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                            style="display: {{Request::is('vendor-panel/category*')?'block':'none'}}">
                            <li class="nav-item {{Request::is('vendor-panel/category/add')?'active':''}}">
                                <a class="nav-link " href="{{route('vendor.category.add')}}"
                                    title="{{__('messages.category')}}">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">{{__('messages.category')}}</span>
                                </a>
                            </li>

                            <li class="nav-item {{Request::is('vendor-panel/category/add-sub-category')?'active':''}}">
                                <a class="nav-link " href="{{route('vendor.category.add-sub-category')}}"
                                    title="{{__('messages.sub_category')}}">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">{{__('messages.sub_category')}}</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    @endif 

                    <!-- DeliveryMan -->
                    {{-- @if(\App\CentralLogics\Helpers::employee_module_permission_check('deliveryman'))
                        <li class="nav-item">
                            <small class="nav-subtitle"
                                   title="{{__('messages.deliveryman')}} {{__('messages.section')}}">{{__('messages.deliveryman')}} {{__('messages.section')}}</small>
                            <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                        </li>
                        <li class="navbar-vertical-aside-has-menu {{Request::is('vendor-panel/delivery-man/add')?'active':''}}">
                            <a class="js-navbar-vertical-aside-menu-link nav-link"
                               href="{{route('vendor.delivery-man.add')}}"
                               title="{{__('messages.add_delivery_man')}}"
                            >
                                <i class="tio-running nav-icon"></i>
                                <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                    {{__('messages.add_delivery_man')}}
                                </span>
                            </a>
                        </li>

                        <li class="navbar-vertical-aside-has-menu {{Request::is('vendor-panel/delivery-man/list')?'active':''}}">
                            <a class="js-navbar-vertical-aside-menu-link nav-link"
                               href="{{route('vendor.delivery-man.list')}}"
                               title="{{__('messages.deliveryman')}} {{__('messages.list')}}"
                            >
                                <i class="tio-filter-list nav-icon"></i>
                                <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                    {{__('messages.deliverymen')}}
                                </span>
                            </a>
                        </li> --}}

                        {{--<li class="navbar-vertical-aside-has-menu {{Request::is('vendor-panel/delivery-man/reviews/list')?'active':''}}">
                            <a class="js-navbar-vertical-aside-menu-link nav-link"
                               href="{{route('vendor.delivery-man.reviews.list')}}" title="{{__('messages.reviews')}}"
                            >
                                <i class="tio-star-outlined nav-icon"></i>
                                <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                    {{__('messages.reviews')}}
                                </span>
                            </a>
                        </li>--}}
                    {{-- @endif --}}
                <!-- End DeliveryMan -->

                 <li class="nav-item">
                        <small
                            class="nav-subtitle">{{__('messages.marketing')}} {{__('messages.section')}}</small>
                        <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                    </li>
                    <!-- Campaign -->
                    @if(\App\CentralLogics\Helpers::employee_module_permission_check('campaign'))
                    <li class="navbar-vertical-aside-has-menu {{Request::is('vendor-panel/campaign*')?'active':''}}">
                        <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:">
                            <i class="tio-image nav-icon"></i>
                            <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">{{__('messages.campaign')}}</span>
                        </a>
                        <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                            style="display: {{Request::is('vendor-panel/campaign*')?'block':'none'}}">
                            <li class="nav-item {{Request::is('vendor-panel/campaign/list')?'active':''}}">
                                <a class="nav-link " href="{{route('vendor.campaign.list')}}">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">{{__('messages.list')}}</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    @endif 
                    <!-- End Campaign -->

                    <!-- Business Section-->
                  <li class="nav-item">
                        <small class="nav-subtitle"
                                title="{{__('messages.business')}} {{__('messages.section')}}">{{__('messages.business')}} {{__('messages.section')}}</small>
                        <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                    </li>


                    @if(\App\CentralLogics\Helpers::employee_module_permission_check('restaurant_setup'))
                    <li class="nav-item {{Request::is('vendor-panel/business-settings/restaurant-setup')?'active':''}}">
                        <a class="nav-link " href="{{route('vendor.business-settings.restaurant-setup')}}" title="{{__('messages.vendor')}} {{__('messages.config')}}"
                        >
                            <span class="tio-settings nav-icon"></span>
                            <span
                                class="text-truncate">{{__('messages.vendor')}} {{__('messages.config')}}</span>
                        </a>
                    </li>
                    @endif


                  {{--   @if(\App\CentralLogics\Helpers::employee_module_permission_check('my_shop'))
                    <li class="navbar-vertical-aside-has-menu {{Request::is('vendor/shop*')?'active':''}}">
                        <a class="js-navbar-vertical-aside-menu-link nav-link"
                            href="{{route('vendor.shop.view')}}"
                            title="{{__('messages.my_shop')}}">
                            <i class="tio-home nav-icon"></i>
                            <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                {{__('messages.my_shop')}}
                            </span>
                        </a>
                    </li>
                    @endif --}}


                    @if(\App\CentralLogics\Helpers::employee_module_permission_check('bank_info'))
                    <!-- Business Settings -->
                    <li class="navbar-vertical-aside-has-menu {{Request::is('vendor/profile*')?'active':''}}">
                        <a class="js-navbar-vertical-aside-menu-link nav-link"
                            href="{{route('vendor.profile.bankView')}}"
                            title="{{__('messages.kyc_details')}} {{__('messages.details')}}">
                            <i class="tio-shop nav-icon"></i>
                            <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                {{__('messages.kyc_details')}} {{__('messages.details')}}
                            </span>
                        </a>
                    </li>
                    @endif



                    @if(\App\CentralLogics\Helpers::employee_module_permission_check('wallet'))
                    <!-- RestaurantWallet -->
                    <li class="navbar-vertical-aside-has-menu {{Request::is('vendor/wallet*')?'active':''}}">
                        <a class="js-navbar-vertical-aside-menu-link nav-link" href="{{route('vendor.wallet.index')}}" title="{{__('messages.my')}} {{__('messages.wallet')}}"
                        >
                            <i class="tio-table nav-icon"></i>
                            <span
                                class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">{{__('messages.my')}} {{__('messages.wallet')}}</span>
                        </a>
                    </li>
                    @endif


                    <!-- End RestaurantWallet -->
                    @if(\App\CentralLogics\Helpers::employee_module_permission_check('reviews'))
                    <li class="navbar-vertical-aside-has-menu {{Request::is('vendor-panel/reviews')?'active':''}}">
                        <a class="js-navbar-vertical-aside-menu-link nav-link"
                            href="{{route('vendor.reviews')}}" title="{{__('messages.reviews')}}"
                        >
                            <i class="tio-star-outlined nav-icon"></i>
                            <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                {{__('messages.reviews')}}
                            </span>
                        </a>
                    </li>
                    @endif
                    <!-- End Business Settings -->


                    <!-- Employee-->
                    <li class="nav-item">
                        <small class="nav-subtitle" title="{{__('messages.employee')}} {{__('messages.section')}}">{{__('messages.employee')}} {{__('messages.section')}}</small>
                        <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                    </li>

                    @if(\App\CentralLogics\Helpers::employee_module_permission_check('custom_role'))
                    <li class="navbar-vertical-aside-has-menu {{Request::is('vendor-panel/custom-role*')?'active':''}}">
                        <a class="js-navbar-vertical-aside-menu-link nav-link" href="{{route('vendor.custom-role.create')}}"
                        title="{{__('messages.employee')}} {{__('messages.Role')}}">
                            <i class="tio-incognito nav-icon"></i>
                            <span
                                class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">{{__('messages.employee')}} {{__('messages.Role')}}</span>
                        </a>
                    </li>
                    @endif

                    @if(\App\CentralLogics\Helpers::employee_module_permission_check('employee'))
                    <li class="navbar-vertical-aside-has-menu {{Request::is('vendor-panel/employee*')?'active':''}}">
                        <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                        title="{{__('messages.employees')}}">
                            <i class="tio-user nav-icon"></i>
                            <span
                                class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">{{__('messages.employees')}}</span>
                        </a>
                        <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                            style="display: {{Request::is('vendor-panel/employee*')?'block':'none'}}">
                            <li class="nav-item {{Request::is('vendor-panel/employee/add-new')?'active':''}}">
                                <a class="nav-link " href="{{route('vendor.employee.add-new')}}" title="{{__('messages.add')}} {{__('messages.new')}} {{__('messages.Employee')}}">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">{{__('messages.add')}} {{__('messages.new')}}</span>
                                </a>
                            </li>
                            <li class="nav-item {{Request::is('vendor-panel/employee/list')?'active':''}}">
                                <a class="nav-link " href="{{route('vendor.employee.list')}}" title="{{__('messages.Employee')}} {{__('messages.list')}}">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">{{__('messages.list')}}</span>
                                </a>
                            </li>

                        </ul>
                    </li>
                    @endif 
                    <!-- End Employee -->

                    <li class="nav-item" style="padding-top: 100px">

                    </li>
                </ul>
            </div>
            <!-- End Content -->
        </div>
    </aside>
</div>

<div id="sidebarCompact" class="d-none">

</div>


{{--<script>
    $(document).ready(function () {
        $('.navbar-vertical-content').animate({
            scrollTop: $('#scroll-here').offset().top
        }, 'slow');
    });
</script>--}}
