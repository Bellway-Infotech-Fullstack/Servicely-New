<?php $__env->startSection('title','Order Details'); ?>

<?php $__env->startPush('css_or_js'); ?>
<style>
    .item-box{
        height:250px;
        width:150px;
        padding:3px;
    }

    .header-item{
        width:10rem;
    }
</style>
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
    
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header d-print-none">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb breadcrumb-no-gutter">
                            <li class="breadcrumb-item">
                                <a class="breadcrumb-link"
                                   href="<?php echo e(route('vendor.order.list',['status'=>'all'])); ?>">
                                    Bookings <?php echo e($order['otp']); ?>

                                </a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page"><?php echo e(__('messages.order')); ?> <?php echo e(__('messages.details')); ?></li>
                        </ol>
                    </nav>

                    <div class="d-sm-flex align-items-sm-center">
                        <h1 class="page-header-title"><?php echo e(__('messages.order')); ?> #<?php echo e($order['id']); ?></h1>

                        <?php if($order['payment_status']=='paid'): ?>
                            <span class="badge badge-soft-success ml-sm-3">
                                <span class="legend-indicator bg-success"></span><?php echo e(__('messages.paid')); ?>

                            </span>
                        <?php else: ?>
                            <span class="badge badge-soft-danger ml-sm-3">
                                <span class="legend-indicator bg-danger"></span><?php echo e(__('messages.unpaid')); ?>

                            </span>
                        <?php endif; ?>

                        <?php if($order['order_status']=='pending'): ?>
                            <span class="badge badge-soft-info ml-2 ml-sm-3 text-capitalize">
                              <span class="legend-indicator bg-info text"></span><?php echo e(__('messages.pending')); ?>

                            </span>
                        <?php elseif($order['order_status']=='accepted'): ?>
                            <span class="badge badge-soft-info ml-2 ml-sm-3 text-capitalize">
                              <span class="legend-indicator bg-info"></span><?php echo e(__('messages.accepted')); ?>

                            </span>
                        <?php elseif($order['order_status']=='confirmed'): ?>
                            <span class="badge badge-soft-info ml-2 ml-sm-3 text-capitalize">
                              <span class="legend-indicator bg-info"></span><?php echo e(__('messages.confirmed')); ?>

                            </span>
                        <?php elseif($order['order_status']=='processing'): ?>
                            <span class="badge badge-soft-warning ml-2 ml-sm-3 text-capitalize">
                              <span class="legend-indicator bg-warning"></span><?php echo e(__('messages.cooking')); ?>

                            </span>
                        <?php elseif($order['order_status']=='picked_up'): ?>
                            <span class="badge badge-soft-warning ml-2 ml-sm-3 text-capitalize">
                              <span class="legend-indicator bg-warning"></span><?php echo e(__('messages.out_for_delivery')); ?>

                            </span>
                        <?php elseif($order['order_status']=='delivered'): ?>
                            <span class="badge badge-soft-success ml-2 ml-sm-3 text-capitalize">
                              <span class="legend-indicator bg-success"></span><?php echo e(__('messages.delivered')); ?>

                            </span>
                        <?php else: ?>
                            <span class="badge badge-soft-danger ml-2 ml-sm-3 text-capitalize">
                              <span class="legend-indicator bg-danger"></span><?php echo e(str_replace('_',' ',$order['order_status'])); ?>

                            </span>
                        <?php endif; ?>
                       
                        <?php if($order->edited): ?>
                            <span class="badge badge-soft-dark ml-sm-3">
                                <span class="legend-indicator bg-dark"></span><?php echo e(__('messages.edited')); ?>

                            </span>
                        <?php endif; ?>
                        <span class="ml-2 ml-sm-3">
                                <i class="tio-date-range"></i> <?php echo e(date('d M Y '.config('timeformat'),strtotime($order['created_at']))); ?>

                        </span>
                    </div>

                    <div class="mt-2">
                        <a class="text-body mr-3"
                           href="<?php echo e(route('vendor.order.generate-invoice',[$order['id']])); ?>">
                            <i class="tio-print mr-1"></i> <?php echo e(__('messages.print')); ?> <?php echo e(__('messages.invoice')); ?>

                        </a>

                        <!-- Unfold -->
                        <div class="hs-unfold ml-1">
                            <h5>
                                <i class="tio-shop"></i>
                                <?php echo e(__('messages.vendor')); ?> : <label
                                    class="badge badge-secondary"><?php echo e($order->vendor?$order->vendor->names():'Vendor deleted!'); ?></label>
                            </h5>
                        </div>
                       


                        <section class="float-right row">

                            <?php if($order['order_status']=='processing'): ?>
                                <div>
                                    <input type="text" id='otp' class="form-control form-control-sm" placeholder="Customer OTP" />
                                </div>
                            <?php endif; ?>

                         <div class="hs-unfold float-right">
                            <div class="dropdown">
                                <button class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button"
                                        id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                    <?php echo e(__('messages.status')); ?>

                                </button>
                                <?php ($order_delivery_verification = (boolean)\App\Models\BusinessSetting::where(['key' => 'order_delivery_verification'])->first()->value); ?>
                                <div class="dropdown-menu text-capitalize" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item <?php echo e($order['order_status']=='pending'?'active':''); ?>"
                                       onclick="route_alert('<?php echo e(route('vendor.order.status',['id'=>$order['id'],'order_status'=>'pending'])); ?>','Change status to pending ?')"
                                       href="javascript:"><?php echo e(__('messages.pending')); ?></a>
                                    <a class="dropdown-item <?php echo e($order['order_status']=='accepted'?'active':''); ?>"
                                       onclick="route_alert('<?php echo e(route('vendor.order.status',['id'=>$order['id'],'order_status'=>'accepted'])); ?>','Change status to accepted ?')"
                                       href="javascript:"><?php echo e(__('messages.accepted')); ?></a>
                                    <a class="dropdown-item <?php echo e($order['order_status']=='processing'?'active':''); ?>"
                                       onclick="route_alert('<?php echo e(route('vendor.order.status',['id'=>$order['id'],'order_status'=>'processing'])); ?>','Change status to processing ?')"
                                       href="javascript:"><?php echo e(__('messages.processing')); ?></a>
                                   
                                    <a class="dropdown-item <?php echo e($order['order_status']=='services_ongoing'?'active':''); ?>"
                                       onclick="route_alert('<?php echo e(route('vendor.order.status',['id'=>$order['id'],'order_status'=>'services_ongoing'])); ?>&otp=' + document.getElementById('otp').value,'Change status to Service ongoing?')"
                                       href="javascript:"><?php echo e(__('messages.serviceOngoing')); ?></a>
                                    <a class="dropdown-item <?php echo e($order['order_status']=='delivered'?'active':''); ?>"
                                       onclick="route_alert('<?php echo e(route('vendor.order.status',['id'=>$order['id'],'order_status'=>'delivered'])); ?>','Change status to completed (payment status will be paid if not)?')"
                                       href="javascript:"><?php echo e(__('messages.delivered')); ?></a>
                                    <a class="dropdown-item <?php echo e($order['order_status']=='canceled'?'active':''); ?>"
                                       onclick="route_alert('<?php echo e(route('vendor.order.status',['id'=>$order['id'],'order_status'=>'canceled'])); ?>','Change status to canceled ?')"
                                       href="javascript:"><?php echo e(__('messages.canceled')); ?></a>
                                </div>
                            </div>
                        </div>

                            
                                
                            
                        
                        <!-- End Unfold -->
                    </section>
                    </div>
                </div>

                <div class="col-sm-auto">
                    <a class="btn btn-icon btn-sm btn-ghost-secondary rounded-circle mr-1"
                       href="<?php echo e(route('vendor.order.details',[$order['id']-1])); ?>"
                       data-toggle="tooltip" data-placement="top" title="Previous order">
                        <i class="tio-arrow-backward"></i>
                    </a>
                    <a class="btn btn-icon btn-sm btn-ghost-secondary rounded-circle"
                       href="<?php echo e(route('vendor.order.details',[$order['id']+1])); ?>" data-toggle="tooltip"
                       data-placement="top" title="Next order">
                        <i class="tio-arrow-forward"></i>
                    </a>
                </div>
            </div>
        </div>
        <!-- End Page Header -->

        <div class="row" id="printableArea">
            <div class="col-lg-8 mb-3 mb-lg-0">
                <!-- Card -->
                <div class="card mb-3 mb-lg-5">
                    <!-- Header -->
                    <div class="card-header" style="display: block!important;">
                        <div class="row">
                            <div class="col-12 pb-2 border-bottom d-flex justify-content-between">
                                <h4 class="card-header-title">
                                    <?php echo e(__('messages.order')); ?> <?php echo e(__('messages.details')); ?>

                                    <span
                                        class="badge badge-soft-dark rounded-circle ml-1"><?php echo e($order->details->count()); ?></span>
                                </h4>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6 pt-2">
                                <h6 style="color: #8a8a8a;">
                                    <?php echo e(__('messages.order')); ?> <?php echo e(__('messages.note')); ?> : <?php echo e($order['order_note']); ?>

                                </h6>
                            </div>
                            <div class="col-6 pt-2">
                                <div class="text-right">
                                    <h6 class="text-capitalize" style="color: #8a8a8a;">
                                        <?php echo e(__('messages.payment')); ?> <?php echo e(__('messages.method')); ?> : <?php echo e(str_replace('_',' ',$order['payment_method'])); ?>

                                    </h6>
                                    <h6 class="text-capitalize" style="color: #8a8a8a;"><?php echo e(__('messages.order')); ?> <?php echo e(__('messages.type')); ?>

                                        : <label style="font-size: 10px"
                                                 class="badge badge-soft-primary"><?php echo e(str_replace('_',' ',$order['order_type'])); ?></label>
                                    </h6>
                                    <?php if($order->schedule_at && $order->scheduled): ?>
                                    <h6 class="text-capitalize" style="color: #8a8a8a;"><?php echo e(__('messages.scheduled_at')); ?>

                                        : <label style="font-size: 10px"
                                                 class="badge badge-soft-primary"><?php echo e(date('d M Y '.config('timeformat'),strtotime($order['schedule_at']))); ?></label>
                                    </h6>
                                    <?php endif; ?>

                                    <?php if($order->due_amount): ?>
                                    <h6 class="text-capitalize" style="color: #8a8a8a;">Due Amount
                                        : <label style="font-size: 10px"
                                                 class="badge badge-soft-primary"><?php echo e($order->payment_type); ?> - <?php echo e(\App\CentralLogics\Helpers::format_currency($order->due_amount)); ?></label>
                                    </h6>
                                    <?php endif; ?>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                    <?php
                        $total_addon_price = 0;
                        $product_price = 0;
                        $restaurant_discount_amount = 0;
                        $product_price=0;
                        $total_addon_price=0;
                    ?>
                    <?php $__currentLoopData = $order->details; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$detail): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <?php if($detail->service ): ?>
                            <!-- Media -->
                            <div class="media">
                                <a class="avatar avatar-xl mr-3 cursor-pointer" href="<?php echo e(route('vendor.service.view',$detail->service['id'])); ?>">
                                    <img class="img-fluid"
                                            src="<?php echo e(asset('storage/app/public/product')); ?>/<?php echo e($detail->service['image']); ?>"
                                            onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/img2.jpg')); ?>'"
                                            alt="Image Description">
                                </a>

                                <div class="media-body">
                                    <div class="row">
                                        <div class="col-md-6 mb-3 mb-md-0">
                                            <strong> <?php echo e($detail->service['name']); ?></strong><br>

                                            <?php if(count(json_decode($detail['variation'],true))>0): ?>
                                                <strong><u><?php echo e(__('messages.variation')); ?> : </u></strong>
                                                <?php $__currentLoopData = json_decode($detail['variation'],true)[0]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key1 =>$variation): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <div class="font-size-sm text-body">
                                                        <span><?php echo e($key1); ?> :  </span>
                                                        <span class="font-weight-bold"><?php echo e($variation); ?></span>
                                                    </div>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <?php endif; ?>

                                            <?php $__currentLoopData = json_decode($detail['add_ons'],true); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key2 =>$addon): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <?php if($key2==0): ?><strong><u><?php echo e(__('messages.addons')); ?> : </u></strong><?php endif; ?>
                                                <div class="font-size-sm text-body">
                                                    <span><?php echo e($addon['name']); ?> :  </span>
                                                    <span class="font-weight-bold">
                                                        <?php echo e($addon['quantity']); ?> x <?php echo e(\App\CentralLogics\Helpers::format_currency($addon['price'])); ?>

                                                    </span>
                                                </div>
                                                <?php ($total_addon_price+=$addon['price']*$addon['quantity']); ?>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </div>

                                        <div class="col col-md-2 align-self-center">
                                            <h6><?php echo e(\App\CentralLogics\Helpers::format_currency($detail->service->price)); ?></h6>
                                        </div>
                                        <div class="col col-md-1 align-self-center">
                                            <h5><?php echo e($detail['quantity']); ?></h5>
                                        </div>

                                        <div class="col col-md-3 align-self-center text-right">
                                            <?php ($amount=($detail->service->price)*$detail['quantity']); ?>
                                            <h5><?php echo e(\App\CentralLogics\Helpers::format_currency($amount)); ?></h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php ($product_price+=$amount); ?>
                            <?php ($restaurant_discount_amount += ($detail['discount_on_food']*$detail['quantity'])); ?>
                            <!-- End Media -->
                            <hr>
                        <?php elseif($detail->campaign): ?>
                            <!-- Media -->
                                <div class="media">
                                    <div class="avatar avatar-xl mr-3">
                                        <img class="img-fluid"
                                             src="<?php echo e(asset('storage/app/public/campaign')); ?>/<?php echo e($detail->campaign['image']); ?>"
                                             onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/img2.jpg')); ?>'"
                                             alt="Image Description">
                                    </div>

                                    <div class="media-body">
                                        <div class="row">
                                            <div class="col-md-6 mb-3 mb-md-0">
                                                <strong> <?php echo e($detail->campaign['title']); ?></strong><br>

                                                <?php if(count(json_decode($detail['variation'],true))>0): ?>
                                                    <strong><u><?php echo e(__('messages.variation')); ?> : </u></strong>
                                                    <?php $__currentLoopData = json_decode($detail['variation'],true)[0]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key1 =>$variation): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <div class="font-size-sm text-body">
                                                            <span><?php echo e($key1); ?> :  </span>
                                                            <span class="font-weight-bold"><?php echo e($variation); ?></span>
                                                        </div>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                <?php endif; ?>

                                                <?php $__currentLoopData = json_decode($detail['add_ons'],true); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key2 =>$addon): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <?php if($key2==0): ?><strong><u><?php echo e(__('messages.addons')); ?> : </u></strong><?php endif; ?>
                                                    <div class="font-size-sm text-body">
                                                        <span><?php echo e($addon['name']); ?> :  </span>
                                                        <span class="font-weight-bold">
                                                            <?php echo e($addon['quantity']); ?> x <?php echo e(\App\CentralLogics\Helpers::format_currency($addon['price'])); ?>

                                                        </span>
                                                    </div>
                                                    <?php ($total_addon_price+=$addon['price']*$addon['quantity']); ?>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            </div>

                                            <div class="col col-md-2 align-self-center">
                                                <h6><?php echo e(\App\CentralLogics\Helpers::format_currency($detail['price'])); ?></h6>
                                            </div>
                                            <div class="col col-md-1 align-self-center">
                                                <h5><?php echo e($detail['quantity']); ?></h5>
                                            </div>

                                            <div class="col col-md-3 align-self-center text-right">
                                                <?php ($amount=($detail['price'])*$detail['quantity']); ?>
                                                <h5><?php echo e(\App\CentralLogics\Helpers::format_currency($amount)); ?></h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <?php ($product_price+=$amount); ?>
                            <?php ($restaurant_discount_amount += ($detail['discount_on_food']*$detail['quantity'])); ?>
                            <!-- End Media -->
                                <hr>
                        <?php endif; ?>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <?php 

                            $coupon_discount_amount = $order['coupon_discount_amount'];

                            $total_price = $product_price + $total_addon_price - $restaurant_discount_amount - $coupon_discount_amount;
                        
                            $total_tax_amount= $order['total_tax_amount'];

                            $restaurant_discount_amount = $order['restaurant_discount_amount'];

                        ?>
                        <div class="row justify-content-md-end mb-3">
                            <div class="col-md-9 col-lg-8">
                                <dl class="row text-sm-right">
                                    <dt class="col-sm-6"><?php echo e(__('messages.service')); ?> <?php echo e(__('messages.price')); ?>:</dt>
                                    <dd class="col-sm-6"><?php echo e(\App\CentralLogics\Helpers::format_currency($product_price)); ?></dd>
                                    

                                    <dt class="col-sm-6"><?php echo e(__('messages.subtotal')); ?>:</dt>
                                    <dd class="col-sm-6">
                                        <?php echo e(\App\CentralLogics\Helpers::format_currency($product_price+$total_addon_price)); ?></dd>
                                    <dt class="col-sm-6"><?php echo e(__('messages.discount')); ?>:</dt>
                                    <dd class="col-sm-6">
                                        - <?php echo e(\App\CentralLogics\Helpers::format_currency($restaurant_discount_amount)); ?></dd>
                                    <dt class="col-sm-6"><?php echo e(__('messages.coupon')); ?> <?php echo e(__('messages.discount')); ?>:</dt>
                                    <dd class="col-sm-6">
                                        - <?php echo e(\App\CentralLogics\Helpers::format_currency($coupon_discount_amount)); ?></dd>
                                    <dt class="col-sm-6"><?php echo e(__('messages.tax')); ?>:</dt>
                                    <dd class="col-sm-6">
                                        + <?php echo e(\App\CentralLogics\Helpers::format_currency($total_tax_amount)); ?></dd>
                                    

                                    <dt class="col-sm-6"><?php echo e(__('messages.total')); ?>:</dt>
                                    <dd class="col-sm-6"><?php echo e(\App\CentralLogics\Helpers::format_currency($product_price+$total_tax_amount+$total_addon_price-$coupon_discount_amount - $restaurant_discount_amount)); ?></dd>
                                </dl>
                                <!-- End Row -->
                            </div>
                        </div>
                        <!-- End Row -->
                    </div>
                    <!-- End Body -->
                </div>
                <!-- End Card -->
            </div>

            <div class="col-lg-4">
            
                <!-- Card -->
                <div class="card mb-2">
                    <!-- Header -->
                   
                    <!-- End Header -->

                    <!-- Body -->
                    
                       
                                
                           

                       
                                
                           


                    
                        
                   
                    
                <!-- End Body -->
                
                <!-- End Card -->
                
                <!-- Card -->
                <div class="card">
                    <!-- Header -->
                    <div class="card-header">
                        <h4 class="card-header-title"><?php echo e(__('messages.customer')); ?></h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <?php if($order->customer): ?>
                        <div class="card-body">
                            <div class="media align-items-center" href="javascript:">
                                <div class="avatar avatar-circle mr-3">
                                    <img
                                        class="avatar-img" style="width: 75px"
                                        onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/img1.jpg')); ?>'"
                                        src="<?php echo e(asset('storage/app/public/profile/'.$order->customer->image)); ?>"
                                        alt="Image Description">
                                </div>
                                <div class="media-body">
                                <span
                                    class="text-body text-hover-primary"><?php echo e($order->customer['f_name'].' '.$order->customer['l_name']); ?></span>
                                </div>
                                <div class="media-body text-right">
                                    
                                </div>
                            </div>

                            <hr>

                            <div class="media align-items-center" href="javascript:">
                                <div class="icon icon-soft-info icon-circle mr-3">
                                    <i class="tio-shopping-basket-outlined"></i>
                                </div>
                                <div class="media-body">
                                    <span class="text-body text-hover-primary"><?php echo e(\App\Models\Order::where('user_id',$order['user_id'])->count()); ?> bookings</span>
                                </div>
                                <div class="media-body text-right">
                                    
                                </div>
                            </div>

                            <hr>

                            <div class="d-flex justify-content-between align-items-center">
                                <h5><?php echo e(__('messages.contact')); ?> <?php echo e(__('messages.info')); ?></h5>
                            </div>

                            <ul class="list-unstyled list-unstyled-py-2">
                                <li>
                                    <i class="tio-online mr-2"></i>
                                    <?php echo e($order->customer['email']); ?>

                                </li>
                                <li>
                                    <a class="deco-none" href="tel:<?php echo e($order->customer['phone']); ?>">
                                        <i class="tio-android-phone-vs mr-2"></i>
                                        <?php echo e($order->customer['phone']); ?>

                                    </a>
                                </li>
                            </ul>

                           
                                        
                                   
                             
                            
                        </div>
                <?php endif; ?>
                <!-- End Body -->
                </div>
                <!-- End Card -->
            </div>
        </div>
        <!-- End Row -->
    </div>

    <!-- Modal -->
    <div id="shipping-address-modal" class="modal fade" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalTopCoverTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <!-- Header -->
                <div class="modal-top-cover bg-dark text-center">
                    <figure class="position-absolute right-0 bottom-0 left-0" style="margin-bottom: -1px;">
                        <svg preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                             viewBox="0 0 1920 100.1">
                            <path fill="#fff" d="M0,0c0,0,934.4,93.4,1920,0v100.1H0L0,0z"/>
                        </svg>
                    </figure>

                    <div class="modal-close">
                        <button type="button" class="btn btn-icon btn-sm btn-ghost-light" data-dismiss="modal"
                                aria-label="Close">
                            <svg width="16" height="16" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
                                <path fill="currentColor"
                                      d="M11.5,9.5l5-5c0.2-0.2,0.2-0.6-0.1-0.9l-1-1c-0.3-0.3-0.7-0.3-0.9-0.1l-5,5l-5-5C4.3,2.3,3.9,2.4,3.6,2.6l-1,1 C2.4,3.9,2.3,4.3,2.5,4.5l5,5l-5,5c-0.2,0.2-0.2,0.6,0.1,0.9l1,1c0.3,0.3,0.7,0.3,0.9,0.1l5-5l5,5c0.2,0.2,0.6,0.2,0.9-0.1l1-1 c0.3-0.3,0.3-0.7,0.1-0.9L11.5,9.5z"/>
                            </svg>
                        </button>
                    </div>
                </div>
                <!-- End Header -->

                <div class="modal-top-cover-icon">
                    <span class="icon icon-lg icon-light icon-circle icon-centered shadow-soft">
                      <i class="tio-location-search"></i>
                    </span>
                </div>

                <?php ($address=\App\Models\CustomerAddress::find($order['delivery_address_id'])); ?>
                <?php if(isset($address)): ?>
                    <form action="<?php echo e(route('vendor.order.update-shipping',[$order['delivery_address_id']])); ?>"
                          method="post">
                        <?php echo csrf_field(); ?>
                        <div class="modal-body">
                            <div class="row mb-3">
                                <label for="requiredLabel" class="col-md-2 col-form-label input-label text-md-right">
                                    <?php echo e(__('messages.type')); ?>

                                </label>
                                <div class="col-md-10 js-form-message">
                                    <input type="text" class="form-control" name="address_type"
                                           value="<?php echo e($address['address_type']); ?>" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="requiredLabel" class="col-md-2 col-form-label input-label text-md-right">
                                    <?php echo e(__('messages.contact')); ?>

                                </label>
                                <div class="col-md-10 js-form-message">
                                    <input type="text" class="form-control" name="contact_person_number"
                                           value="<?php echo e($address['contact_person_number']); ?>" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="requiredLabel" class="col-md-2 col-form-label input-label text-md-right">
                                    <?php echo e(__('messages.name')); ?>

                                </label>
                                <div class="col-md-10 js-form-message">
                                    <input type="text" class="form-control" name="contact_person_name"
                                           value="<?php echo e($address['contact_person_name']); ?>" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="requiredLabel" class="col-md-2 col-form-label input-label text-md-right">
                                    <?php echo e(__('messages.address')); ?>

                                </label>
                                <div class="col-md-10 js-form-message">
                                    <input type="text" class="form-control" name="address"
                                           value="<?php echo e($address['address']); ?>"
                                           required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="requiredLabel" class="col-md-2 col-form-label input-label text-md-right">
                                    <?php echo e(__('messages.latitude')); ?>

                                </label>
                                <div class="col-md-4 js-form-message">
                                    <input type="text" class="form-control" name="latitude"
                                           value="<?php echo e($address['latitude']); ?>"
                                           required>
                                </div>
                                <label for="requiredLabel" class="col-md-2 col-form-label input-label text-md-right">
                                    <?php echo e(__('messages.longitude')); ?>

                                </label>
                                <div class="col-md-4 js-form-message">
                                    <input type="text" class="form-control" name="longitude"
                                           value="<?php echo e($address['longitude']); ?>" required>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-white" data-dismiss="modal"><?php echo e(__('messages.close')); ?></button>
                            <button type="submit" class="btn btn-primary"><?php echo e(__('messages.save')); ?> <?php echo e(__('messages.changes')); ?></button>
                        </div>
                    </form>
                <?php endif; ?>
            </div>
        </div>
    </div>
    <!-- End Modal -->

    <!-- End Content -->


<?php $__env->stopSection(); ?>
<?php $__env->startPush('script_2'); ?>
    <script>
        function order_status_change_alert(route, message, verification) {
            if(verification)
            {
                Swal.fire({
                    title: 'Enter order verification code',
                    input: 'text',
                    inputAttributes: {
                        autocapitalize: 'off'
                    },
                    showCancelButton: true,
                    cancelButtonColor: 'default',
                    confirmButtonColor: '#FC6A57',
                    confirmButtonText: 'Submit',
                    showLoaderOnConfirm: true,
                    preConfirm: (otp) => {
                        location.href = route+'&otp='+otp;
                        // .then(response => {
                        //     if (!response.ok) {
                        //     throw new Error(response.statusText)
                        //     }
                        //     return response.json()
                        // })
                        // .catch(error => {
                        //     Swal.showValidationMessage(
                        //     `Request failed: ${error}`
                        //     )
                        // })
                    },
                    allowOutsideClick: () => !Swal.isLoading()
                    })
                    // .then((result) => {
                    // if (result.isConfirmed) {
                    //     Swal.fire({
                    //     title: `${result.value.login}'s avatar`,
                    //     imageUrl: result.value.avatar_url
                    //     })
                    // }
                    // })
            }
            else
            {
                Swal.fire({
                    title: 'Are you sure?',
                    text: message,
                    type: 'warning',
                    showCancelButton: true,
                    cancelButtonColor: 'default',
                    confirmButtonColor: '#FC6A57',
                    cancelButtonText: 'No',
                    confirmButtonText: 'Yes',
                    reverseButtons: true
                }).then((result) => {
                    if (result.value) {
                        location.href = route;
                    }
                })
            }   
        }

        function last_location_view() {
            toastr.warning('Only available when order is out for delivery!', {
                CloseButton: true,
                ProgressBar: true
            });
        }
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.vendor.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\servicely-new\resources\views/vendor-views/order/order-view.blade.php ENDPATH**/ ?>