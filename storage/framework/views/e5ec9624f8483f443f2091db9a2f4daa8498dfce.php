<style>
    .nav-sub{
        background: #019842 !important;
    }
</style>
<div id="sidebarMain" class="d-none">
    <aside
        class="js-navbar-vertical-aside navbar navbar-vertical-aside navbar-vertical navbar-vertical-fixed navbar-expand-xl navbar-bordered">
        <div class="navbar-vertical-container">
            <div class="navbar-brand-wrapper justify-content-center" onclick="location.href='<?php echo e(route('vendor.dashboard')); ?>'" style="cursor: pointer;font-weight: bold;font-size: 15px">
                <!-- Logo -->

               <?php ($restaurant_data=\App\CentralLogics\Helpers::get_restaurant_data()); ?>
                <a class="navbar-brand" href="<?php echo e(route('vendor.dashboard')); ?>" aria-label="Front" style="padding-top: 0!important;padding-bottom: 0!important;">
                    <img class="navbar-brand-logo"
                         style="height: 55px;"
                         onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/logo2.png')); ?>'"
                         src="<?php echo e(asset('storage/app/public/restaurant/'.$restaurant_data->logo)); ?>"
                         alt="Logo">
                    <img class="navbar-brand-logo-mini"
                         style="height: 55px;"
                         onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/logo2.png')); ?>'"
                         src="<?php echo e(asset('storage/app/public/restaurant/'.$restaurant_data->logo)); ?>" alt="Logo">
                </a> 
            <?php echo e(\Illuminate\Support\Str::limit($restaurant_data->name,15)); ?>

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
                    <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('vendor-panel')?'show':''); ?>">
                        <a class="js-navbar-vertical-aside-menu-link nav-link"
                            href="<?php echo e(route('vendor.dashboard')); ?>" title="<?php echo e(__('messages.dashboard')); ?>">
                            <i class="tio-home-vs-1-outlined nav-icon"></i>
                            <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                <?php echo e(__('messages.dashboard')); ?>

                            </span>
                        </a>
                    </li>
                    <!-- End Dashboards -->

                    <?php if(\App\CentralLogics\Helpers::employee_module_permission_check('order')): ?>
                    <li class="nav-item">   
                        <small class="nav-subtitle" title="<?php echo e(__('messages.order')); ?> <?php echo e(__('messages.section')); ?>"><?php echo e(__('messages.order')); ?> <?php echo e(__('messages.section')); ?></small>
                        <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                    </li>

                    <!-- Order -->
                    <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('vendor-panel/order*')?'active':''); ?>">
                        <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                            title="<?php echo e(__('messages.orders')); ?>">
                            

                            <img src="<?php echo e(asset('public/assets/admin/img/booking.png')); ?>" style="width: 20px; height: auto;filter: invert(100%);" />&nbsp;
                            <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                <?php echo e(__('messages.orders')); ?>

                            </span>
                        </a>
                        <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                            style="display: <?php echo e(Request::is('vendor-panel/order*')?'block':'none'); ?>">
                           <li class="nav-item <?php echo e(Request::is('vendor-panel/order/list/pending')?'active':''); ?>">
                                <a class="nav-link " href="<?php echo e(route('vendor.order.list',['pending'])); ?>" title="<?php echo e(__('messages.pending')); ?>">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">
                                        <?php echo e(__('messages.pending')); ?> 
                                            <span class="badge badge-soft-success badge-pill ml-1">
                                            <?php echo e(\App\Models\Order::Pending()->where(['vendor_id'=>\App\CentralLogics\Helpers::get_restaurant_id()])->count()); ?>

                                        </span>
                                    </span>
                                </a>
                            </li> 

                        <li class="nav-item <?php echo e(Request::is('vendor-panel/order/list/accepted')?'active':''); ?>">
                                <a class="nav-link " href="<?php echo e(route('vendor.order.list',['accepted'])); ?>" title="<?php echo e(__('messages.accepted')); ?>">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">
                                        <?php echo e(__('messages.accepted')); ?>

                                            <span class="badge badge-soft-success badge-pill ml-1">
                                            <?php echo e(\App\Models\Order::Accepted()->where('vendor_id', \App\CentralLogics\Helpers::get_restaurant_id())->count()); ?>

                                        </span>
                                    </span>
                                </a>
                            </li>

                            <li class="nav-item <?php echo e(Request::is('vendor-panel/order/list/processing')?'active':''); ?>">
                                <a class="nav-link" href="<?php echo e(route('vendor.order.list',['processing'])); ?>" title="<?php echo e(__('messages.cooking')); ?>">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">
                                        <?php echo e(__('messages.cooking')); ?>

                                        <span class="badge badge-info badge-pill ml-1">
                                            <?php echo e(\App\Models\Order::Preparing()->where(['vendor_id'=>\App\CentralLogics\Helpers::get_restaurant_id()])->count()); ?>

                                        </span>
                                    </span>
                                </a>
                            </li>
                           
                            <li class="nav-item <?php echo e(Request::is('vendor-panel/order/list/services_ongoing')?'active':''); ?>">
                                <a class="nav-link" href="<?php echo e(route('vendor.order.list',['services_ongoing'])); ?>" title="<?php echo e(__('messages.Service_on_the_way')); ?>">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">
                                        <?php echo e(__('messages.Service_on_the_way')); ?>

                                        <span class="badge badge-info badge-pill ml-1">
                                            <?php echo e(\App\Models\Order::ServiceOngoing()->where(['vendor_id'=>\App\CentralLogics\Helpers::get_restaurant_id()])->count()); ?>

                                        </span>
                                    </span>
                                </a>
                            </li>
                            <li class="nav-item <?php echo e(Request::is('vendor-panel/order/list/delivered')?'active':''); ?>">
                                <a class="nav-link " href="<?php echo e(route('vendor.order.list',['completed'])); ?>" title="">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">
                                        <?php echo e(__('messages.delivered')); ?>

                                            <span class="badge badge-success badge-pill ml-1">
                                            <?php echo e(\App\Models\Order::Delivered()->where(['vendor_id'=>\App\CentralLogics\Helpers::get_restaurant_id()])->Notpos()->count()); ?>

                                        </span>
                                    </span>
                                </a>
                            </li>
                           
                            <li class="nav-item <?php echo e(Request::is('vendor-panel/order/list/scheduled')?'active':''); ?>">
                                <a class="nav-link" href="<?php echo e(route('vendor.order.list',['scheduled'])); ?>" title="<?php echo e(__('messages.scheduled')); ?>">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">
                                        <?php echo e(__('messages.scheduled')); ?>

                                        <span class="badge badge-info badge-pill ml-1">
                                            <?php echo e(\App\Models\Order::Scheduled()->where('vendor_id',\App\CentralLogics\Helpers::get_restaurant_id())->count()); ?>

                                        </span>
                                    </span>
                                </a>
                            </li>
                            <li class="nav-item <?php echo e(Request::is('vendor-panel/order/list/all')?'active':''); ?>">
                                <a class="nav-link" href="<?php echo e(route('vendor.order.list',['all'])); ?>" title="<?php echo e(__('messages.all')); ?> <?php echo e(__('messages.order')); ?>">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate">
                                        <?php echo e(__('messages.all')); ?>

                                        <span class="badge badge-info badge-pill ml-1">
                                            <?php echo e(\App\Models\Order::whereIn('order_status',['pending', 'canceled', 'services_ongoing', 'picked_up', 'service_ongoing', 'processing', 'accepted', 'delivered', 'completed', 'refunded'])->where('vendor_id', \App\CentralLogics\Helpers::get_restaurant_id())->count()); ?>

                                        </span>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </li> 
                    <!-- End Order -->
                    <?php endif; ?>
                    
                 <?php if(\App\CentralLogics\Helpers::employee_module_permission_check('pos')): ?>
                    <li class="nav-item">
                        <small
                            class="nav-subtitle"><?php echo e(__('messages.pos')); ?> <?php echo e(__('messages.system')); ?></small>
                        <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                    </li> 
                    
                    
                    <!-- POS -->
                   <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('vendor-panel/pos/*')?'active':''); ?>">
                        <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                        >
                            <i class="tio-shopping nav-icon"></i>
                            <span
                                class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(__('messages.pos')); ?></span>
                        </a>
                        <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                            style="display: <?php echo e(Request::is('vendor-panel/pos/*')?'block':'none'); ?>">
                            <li class="nav-item <?php echo e(Request::is('vendor-panel/pos/')?'active':''); ?>">
                                <a class="nav-link " href="<?php echo e(route('vendor.pos.index')); ?>"
                                    title="<?php echo e(__('messages.pos')); ?>">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span
                                        class="text-truncate"><?php echo e(__('messages.pos')); ?></span>
                                </a>
                            </li>
                            <li class="nav-item <?php echo e(Request::is('vendor-panel/pos/orders')?'active':''); ?>">
                                <a class="nav-link " href="<?php echo e(route('vendor.pos.orders')); ?>" title="<?php echo e(__('messages.orders')); ?>">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate"><?php echo e(__('messages.orders')); ?>

                                        <span class="badge badge-info badge-pill ml-1">
                                            <?php echo e(\App\Models\Order::where('vendor_id',\App\CentralLogics\Helpers::get_restaurant_id())->Pos()->count()); ?>

                                        </span>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </li> 
                    <!-- End POS -->
                    <?php endif; ?>      
                    <li class="nav-item">
                        <small
                            class="nav-subtitle"><?php echo e(__('messages.service')); ?> <?php echo e(__('messages.management')); ?></small>
                        <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                    </li>

                    <!-- AddOn -->
                
                    <!-- End AddOn -->
                    <?php if(\App\CentralLogics\Helpers::employee_module_permission_check('service')): ?>
                    <!-- Food -->
                    <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('vendor-panel/service*')?'active':''); ?>">
                        <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                        >
                            <i class="tio-premium-outlined nav-icon"></i>
                            <span
                                class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(__('messages.services')); ?></span>
                        </a>
                        <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                            style="display: <?php echo e(Request::is('vendor-panel/service*')?'block':'none'); ?>">
                            <li class="nav-item <?php echo e(Request::is('vendor-panel/service/add-new')?'active':''); ?>">
                                <a class="nav-link " href="<?php echo e(route('vendor.service.add-new')); ?>"
                                    title="add new service">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span
                                        class="text-truncate"><?php echo e(__('messages.add')); ?> <?php echo e(__('messages.new')); ?></span>
                                </a>
                            </li>
                            <li class="nav-item <?php echo e(Request::is('vendor-panel/service/list')?'active':''); ?>">
                                <a class="nav-link " href="<?php echo e(route('vendor.service.list')); ?>" title="Service list">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate"><?php echo e(__('messages.list')); ?></span>
                                </a>
                            </li>
                            <?php if(\App\CentralLogics\Helpers::get_restaurant_data()->food_section): ?>
                            <li class="nav-item <?php echo e(Request::is('vendor-panel/service/bulk-import')?'active':''); ?>">
                                <a class="nav-link " href="<?php echo e(route('vendor.service.bulk-import')); ?>"
                                    title="<?php echo e(__('messages.bulk_import')); ?>">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate text-capitalize"><?php echo e(__('messages.bulk_import')); ?></span>
                                </a>
                            </li>
                            <li class="nav-item <?php echo e(Request::is('vendor-panel/service/bulk-export')?'active':''); ?>">
                                <a class="nav-link " href="<?php echo e(route('vendor.service.bulk-export-index')); ?>"
                                    title="<?php echo e(__('messages.bulk_export')); ?>">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate text-capitalize"><?php echo e(__('messages.bulk_export')); ?></span>
                                </a>
                            </li>
                            <?php endif; ?>
                        </ul>
                    </li>
                    <!-- End Food -->
                    <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('vendor-panel/category*')?'active':''); ?>">
                        <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle"
                            href="javascript:" title="<?php echo e(__('messages.category')); ?>"
                        >
                            <i class="tio-category nav-icon"></i>
                            <span
                                class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(__('messages.categories')); ?></span>
                        </a>
                        <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                            style="display: <?php echo e(Request::is('vendor-panel/category*')?'block':'none'); ?>">
                            <li class="nav-item <?php echo e(Request::is('vendor-panel/category/add')?'active':''); ?>">
                                <a class="nav-link " href="<?php echo e(route('vendor.category.add')); ?>"
                                    title="<?php echo e(__('messages.category')); ?>">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate"><?php echo e(__('messages.category')); ?></span>
                                </a>
                            </li>

                            <li class="nav-item <?php echo e(Request::is('vendor-panel/category/add-sub-category')?'active':''); ?>">
                                <a class="nav-link " href="<?php echo e(route('vendor.category.add-sub-category')); ?>"
                                    title="<?php echo e(__('messages.sub_category')); ?>">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate"><?php echo e(__('messages.sub_category')); ?></span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <?php endif; ?> 

                    <!-- DeliveryMan -->
                    

                        
                    
                <!-- End DeliveryMan -->

                 <li class="nav-item">
                        <small
                            class="nav-subtitle"><?php echo e(__('messages.marketing')); ?> <?php echo e(__('messages.section')); ?></small>
                        <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                    </li>
                    <!-- Campaign -->
                    <?php if(\App\CentralLogics\Helpers::employee_module_permission_check('campaign')): ?>
                    <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('vendor-panel/campaign*')?'active':''); ?>">
                        <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:">
                            <i class="tio-image nav-icon"></i>
                            <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(__('messages.campaign')); ?></span>
                        </a>
                        <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                            style="display: <?php echo e(Request::is('vendor-panel/campaign*')?'block':'none'); ?>">
                            <li class="nav-item <?php echo e(Request::is('vendor-panel/campaign/list')?'active':''); ?>">
                                <a class="nav-link " href="<?php echo e(route('vendor.campaign.list')); ?>">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate"><?php echo e(__('messages.list')); ?></span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <?php endif; ?> 
                    <!-- End Campaign -->

                    <!-- Business Section-->
                  <li class="nav-item">
                        <small class="nav-subtitle"
                                title="<?php echo e(__('messages.business')); ?> <?php echo e(__('messages.section')); ?>"><?php echo e(__('messages.business')); ?> <?php echo e(__('messages.section')); ?></small>
                        <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                    </li>


                    <?php if(\App\CentralLogics\Helpers::employee_module_permission_check('restaurant_setup')): ?>
                    <li class="nav-item <?php echo e(Request::is('vendor-panel/business-settings/restaurant-setup')?'active':''); ?>">
                        <a class="nav-link " href="<?php echo e(route('vendor.business-settings.restaurant-setup')); ?>" title="<?php echo e(__('messages.vendor')); ?> <?php echo e(__('messages.config')); ?>"
                        >
                            <span class="tio-settings nav-icon"></span>
                            <span
                                class="text-truncate"><?php echo e(__('messages.vendor')); ?> <?php echo e(__('messages.config')); ?></span>
                        </a>
                    </li>
                    <?php endif; ?>


                  


                    <?php if(\App\CentralLogics\Helpers::employee_module_permission_check('bank_info')): ?>
                    <!-- Business Settings -->
                    <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('vendor/profile*')?'active':''); ?>">
                        <a class="js-navbar-vertical-aside-menu-link nav-link"
                            href="<?php echo e(route('vendor.profile.bankView')); ?>"
                            title="<?php echo e(__('messages.kyc_details')); ?> <?php echo e(__('messages.details')); ?>">
                            <i class="tio-shop nav-icon"></i>
                            <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                <?php echo e(__('messages.kyc_details')); ?> <?php echo e(__('messages.details')); ?>

                            </span>
                        </a>
                    </li>
                    <?php endif; ?>



                    <?php if(\App\CentralLogics\Helpers::employee_module_permission_check('wallet')): ?>
                    <!-- RestaurantWallet -->
                    <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('vendor/wallet*')?'active':''); ?>">
                        <a class="js-navbar-vertical-aside-menu-link nav-link" href="<?php echo e(route('vendor.wallet.index')); ?>" title="<?php echo e(__('messages.my')); ?> <?php echo e(__('messages.wallet')); ?>"
                        >
                            <i class="tio-table nav-icon"></i>
                            <span
                                class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(__('messages.my')); ?> <?php echo e(__('messages.wallet')); ?></span>
                        </a>
                    </li>
                    <?php endif; ?>


                    <!-- End RestaurantWallet -->
                    <?php if(\App\CentralLogics\Helpers::employee_module_permission_check('reviews')): ?>
                    <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('vendor-panel/reviews')?'active':''); ?>">
                        <a class="js-navbar-vertical-aside-menu-link nav-link"
                            href="<?php echo e(route('vendor.reviews')); ?>" title="<?php echo e(__('messages.reviews')); ?>"
                        >
                            <i class="tio-star-outlined nav-icon"></i>
                            <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                <?php echo e(__('messages.reviews')); ?>

                            </span>
                        </a>
                    </li>
                    <?php endif; ?>
                    <!-- End Business Settings -->


                    <!-- Employee-->
                    <li class="nav-item">
                        <small class="nav-subtitle" title="<?php echo e(__('messages.employee')); ?> <?php echo e(__('messages.section')); ?>"><?php echo e(__('messages.employee')); ?> <?php echo e(__('messages.section')); ?></small>
                        <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                    </li>

                    <?php if(\App\CentralLogics\Helpers::employee_module_permission_check('custom_role')): ?>
                    <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('vendor-panel/custom-role*')?'active':''); ?>">
                        <a class="js-navbar-vertical-aside-menu-link nav-link" href="<?php echo e(route('vendor.custom-role.create')); ?>"
                        title="<?php echo e(__('messages.employee')); ?> <?php echo e(__('messages.Role')); ?>">
                            <i class="tio-incognito nav-icon"></i>
                            <span
                                class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(__('messages.employee')); ?> <?php echo e(__('messages.Role')); ?></span>
                        </a>
                    </li>
                    <?php endif; ?>

                    <?php if(\App\CentralLogics\Helpers::employee_module_permission_check('employee')): ?>
                    <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('vendor-panel/employee*')?'active':''); ?>">
                        <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                        title="<?php echo e(__('messages.employees')); ?>">
                            <i class="tio-user nav-icon"></i>
                            <span
                                class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(__('messages.employees')); ?></span>
                        </a>
                        <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                            style="display: <?php echo e(Request::is('vendor-panel/employee*')?'block':'none'); ?>">
                            <li class="nav-item <?php echo e(Request::is('vendor-panel/employee/add-new')?'active':''); ?>">
                                <a class="nav-link " href="<?php echo e(route('vendor.employee.add-new')); ?>" title="<?php echo e(__('messages.add')); ?> <?php echo e(__('messages.new')); ?> <?php echo e(__('messages.Employee')); ?>">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate"><?php echo e(__('messages.add')); ?> <?php echo e(__('messages.new')); ?></span>
                                </a>
                            </li>
                            <li class="nav-item <?php echo e(Request::is('vendor-panel/employee/list')?'active':''); ?>">
                                <a class="nav-link " href="<?php echo e(route('vendor.employee.list')); ?>" title="<?php echo e(__('messages.Employee')); ?> <?php echo e(__('messages.list')); ?>">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="text-truncate"><?php echo e(__('messages.list')); ?></span>
                                </a>
                            </li>

                        </ul>
                    </li>
                    <?php endif; ?> 
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



<?php /**PATH C:\xampp\htdocs\servicely-new\resources\views/layouts/vendor/partials/_sidebar.blade.php ENDPATH**/ ?>