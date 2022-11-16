<?php $__env->startSection('title','Item Campaign Preview'); ?>

<?php $__env->startPush('css_or_js'); ?>

<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row">
                <div class="col-6">
                    <h1 class="page-header-title"><?php echo e($campaign['title']); ?></h1>
                </div>
                <div class="col-6">
                    <a href="<?php echo e(route('admin.campaign.edit',['service_campaigns',$campaign['id']])); ?>" class="btn btn-primary float-right">
                        <i class="tio-edit"></i> <?php echo e(__('messages.edit')); ?>

                    </a>
                </div>
            </div>
        </div>
        <!-- End Page Header -->

        <!-- Card -->
        <div class="card mb-3 mb-lg-5">
            <!-- Body -->
            <div class="card-body">
                <div class="row align-items-md-center gx-md-5">
                    <div class="col-sm-4 mb-3 mb-md-0">
                        <div class="d-flex align-items-center">
                            <img class="avatar avatar-xxl avatar-4by3 mr-4"
                                 src="<?php echo e(asset('storage/app/public/campaign')); ?>/<?php echo e($campaign['image']); ?>"
                                 onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/img2.jpg')); ?>'"
                                 alt="Image Description">
                            
                        </div>
                    </div>

                    
                    <div class="col-sm-5">
                        <small class="card-subtitle border-bottom"><?php echo e(__('messages.campaign')); ?> <?php echo e(__('messages.info')); ?></small>
                        <small class="text-dark">
                            <?php echo e(__('messages.campaign')); ?> <?php echo e(__('messages.starts')); ?> <?php echo e(__('messages.from')); ?> : <?php echo e($campaign->start_date->format('Y-M-d')); ?>

                        </small><br>
                        <small class="text-dark">
                            <?php echo e(__('messages.campaign')); ?> <?php echo e(__('messages.ends')); ?> <?php echo e(__('messages.at')); ?> : <?php echo e($campaign->end_date->format('Y-M-d')); ?>

                        </small><br>
                        <small class="text-dark">
                            <?php echo e(__('messages.available')); ?> <?php echo e(__('messages.time')); ?> <?php echo e(__('messages.starts')); ?> : <?php echo e($campaign->start_time->format(config('timeformat'))); ?>

                        </small><br>
                        <small class="text-dark">
                            <?php echo e(__('messages.available')); ?> <?php echo e(__('messages.time')); ?> <?php echo e(__('messages.ends')); ?> : <?php echo e($campaign->end_time->format(config('timeformat'))); ?>

                        </small>
                    </div>
                    <div class="col-sm-3 border-left text-center">
                        <span class="mb-1">Restaurant info</span>
                        <?php if($campaign->restaurant): ?>
                        <a href="<?php echo e(route('admin.vendor.view', $campaign->restaurant_id)); ?>" title="<?php echo e($campaign->restaurant['name']); ?>">
                            <img
                                class="avatar-img avatar-circle" style="width: 75px;margin:auto;"
                                onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/img1.jpg')); ?>'"
                                src="<?php echo e(asset('storage/app/public/restaurant/'.$campaign->restaurant->logo)); ?>"
                                alt="Image Description">
                            <label class="input-label"><?php echo e($campaign->restaurant['name']); ?></label>
                        </a>
                        <?php else: ?>
                        <span class="badge-info"><?php echo e(__('messages.restaurant')); ?> <?php echo e(__('messages.deleted')); ?></span>
                        <?php endif; ?>
                    </div>
                    <div class="col-12 pt-2">
                        <div class="card">
                            <div class="card-body">
                                <small class="card-subtitle border-bottom"><?php echo e(__('messages.item')); ?> <?php echo e(__('messages.info')); ?></small>
                                <div class="row">
                                    <div class="col-4 pt-2">
                                        <small class="text-dark"><?php echo e(__('messages.price')); ?> : <?php echo e(\App\CentralLogics\Helpers::format_currency($campaign['price'])); ?>

                                        </small class="text-dark"><br>
                                        <small class="text-dark"><?php echo e(__('messages.tax')); ?> :
                                            <?php echo e(\App\CentralLogics\Helpers::format_currency(\App\CentralLogics\Helpers::tax_calculate($campaign,$campaign['price']))); ?>

                                        </small class="text-dark"><br>
                                        <small class="text-dark"><?php echo e(__('messages.discount')); ?> :
                                            <?php echo e(\App\CentralLogics\Helpers::format_currency(\App\CentralLogics\Helpers::discount_calculate($campaign,$campaign['price']))); ?>

                                        </small class="text-dark"><br>
                                        
                                        <small class="card-subtitle border-bottom mt-2"> <?php echo e(__('messages.variations')); ?> </small><br>
                                        <?php $__currentLoopData = json_decode($campaign['variations'],true); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $variation): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <small class="text-capitalize">
                                            <?php echo e($variation['type']); ?> : <?php echo e(\App\CentralLogics\Helpers::format_currency($variation['price'])); ?>

                                            </small><br>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        <small class="card-subtitle border-bottom mt-2"> Addons </small><br>
                                        <?php $__currentLoopData = \App\Models\AddOn::whereIn('id',json_decode($campaign['add_ons'],true))->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $addon): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <small class="text-capitalize">
                                            <?php echo e($addon['name']); ?> : <?php echo e(\App\CentralLogics\Helpers::format_currency($addon['price'])); ?>

                                            </small><br>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </div>
                                    <div class="col-8 pt-2 border-left">
                                        <h4><?php echo e(__('messages.short')); ?> <?php echo e(__('messages.description')); ?> : </h4>
                                        <p><?php echo e($campaign['description']); ?></p>
                                    </div> 
                                </div>
                                
                            </div>
                        </div> 
                    </div>
                    
                </div>
            </div>
            <!-- End Body -->
        </div>
        <!-- End Card -->
        <?php ($orders = $campaign->orderdetails()->paginate(2)); ?>
        <!-- Card -->
        <div class="card">
            <div class="table-responsive datatable-custom">
                <table id="datatable"
                       class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                       style="width: 100%"
                       data-hs-datatables-options='{
                     "columnDefs": [{
                        "targets": [0],
                        "orderable": false
                      }],
                     "order": [],
                     "info": {
                       "totalQty": "#datatableWithPaginationInfoTotalQty"
                     },
                     "search": "#datatableSearch",
                     "entries": "#datatableEntries",
                     "pageLength": 25,
                     "isResponsive": false,
                     "isShowPaging": false,
                     "pagination": "datatablePagination"
                   }'>
                    <thead class="thead-light">
                    <tr>
                        <th class="">
                            <?php echo e(__('messages.#')); ?>

                        </th>
                        <th class="table-column-pl-0"><?php echo e(__('messages.order')); ?></th>
                        <th><?php echo e(__('messages.date')); ?></th>
                        <th><?php echo e(__('messages.customer')); ?></th>
                        <th><?php echo e(__('messages.vendor')); ?></th>
                        <th><?php echo e(__('messages.payment')); ?> <?php echo e(__('messages.status')); ?></th>
                        <th><?php echo e(__('messages.total')); ?></th>
                        <th><?php echo e(__('messages.order')); ?> <?php echo e(__('messages.status')); ?></th>
                        <th><?php echo e(__('messages.actions')); ?></th>
                    </tr>
                    </thead>

                    <tbody id="set-rows">
                    <?php $__currentLoopData = $orders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$order): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                        <tr class="status-<?php echo e($order['order_status']); ?> class-all">
                            <td class="">
                                <?php echo e($key+1); ?>

                            </td>
                            <td class="table-column-pl-0">
                                <a href="<?php echo e(route('admin.order.details',['id'=>$order['id']])); ?>"><?php echo e($order['id']); ?></a>
                            </td>
                            <td><?php echo e(date('d M Y',strtotime($order['created_at']))); ?></td>
                            <td>
                                <?php if($order->customer): ?>
                                    <a class="text-body text-capitalize"
                                       href="<?php echo e(route('admin.customer.view',[$order['user_id']])); ?>"><?php echo e($order->customer['f_name'].' '.$order->customer['l_name']); ?></a>
                                <?php else: ?>
                                    <label class="badge badge-danger"><?php echo e(__('messages.invalid')); ?> <?php echo e(__('messages.customer')); ?> <?php echo e(__('messages.data')); ?></label>
                                <?php endif; ?>
                            </td>
                            <td>
                                <label class="badge badge-soft-primary"><?php echo e($order->restaurant?$order->restaurant->name:'Vendor deleted!'); ?></label>
                            </td>
                            <td>
                                <?php if($order->payment_status=='paid'): ?>
                                    <span class="badge badge-soft-success">
                                      <span class="legend-indicator bg-success"></span><?php echo e(__('messages.paid')); ?>

                                    </span>
                                <?php else: ?>
                                    <span class="badge badge-soft-danger">
                                      <span class="legend-indicator bg-danger"></span><?php echo e(__('messages.unpaid')); ?>

                                    </span>
                                <?php endif; ?>
                            </td>
                            <td><?php echo e(\App\CentralLogics\Helpers::format_currency($order['order_amount'])); ?></td>
                            <td class="text-capitalize">
                                <?php if($order['order_status']=='pending'): ?>
                                    <span class="badge badge-soft-info ml-2 ml-sm-3">
                                      <span class="legend-indicator bg-info"></span><?php echo e(__('messages.pending')); ?>

                                    </span>
                                <?php elseif($order['order_status']=='confirmed'): ?>
                                    <span class="badge badge-soft-info ml-2 ml-sm-3">
                                      <span class="legend-indicator bg-info"></span><?php echo e(__('messages.confirmed')); ?>

                                    </span>
                                <?php elseif($order['order_status']=='processing'): ?>
                                    <span class="badge badge-soft-warning ml-2 ml-sm-3">
                                      <span class="legend-indicator bg-warning"></span><?php echo e(__('messages.processing')); ?>

                                    </span>
                                <?php elseif($order['order_status']=='out_for_delivery'): ?>
                                    <span class="badge badge-soft-warning ml-2 ml-sm-3">
                                      <span class="legend-indicator bg-warning"></span><?php echo e(__('messages.out_for_delivery')); ?>

                                    </span>
                                <?php elseif($order['order_status']=='delivered'): ?>
                                    <span class="badge badge-soft-success ml-2 ml-sm-3">
                                      <span class="legend-indicator bg-success"></span><?php echo e(__('messages.delivered')); ?>

                                    </span>
                                <?php else: ?>
                                    <span class="badge badge-soft-danger ml-2 ml-sm-3">
                                      <span class="legend-indicator bg-danger"></span><?php echo e(str_replace('_',' ',$order['order_status'])); ?>

                                    </span>
                                <?php endif; ?>
                            </td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                            id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                        <i class="tio-settings"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item"
                                           href="<?php echo e(route('admin.order.details',['id'=>$order['id']])); ?>"><i
                                                class="tio-visible"></i> <?php echo e(__('messages.view')); ?></a>
                                        <a class="dropdown-item" target="_blank"
                                           href="<?php echo e(route('admin.order.generate-invoice',[$order['id']])); ?>"><i
                                                class="tio-download"></i> <?php echo e(__('messages.invoice')); ?></a>
                                    </div>
                                </div>
                            </td>
                        </tr>

                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </tbody>
                </table>
            </div>
            <!-- Footer -->
            <div class="card-footer">
                <!-- Pagination -->
                <div class="row justify-content-center justify-content-sm-between align-items-sm-center">
                    <div class="col-12">
                        <?php echo $orders->links(); ?>

                    </div>
                </div>
                <!-- End Pagination -->
            </div>
            <!-- End Footer -->
        </div>
        <!-- End Card -->
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('script_2'); ?>

<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\servicely-new\resources\views/admin-views/campaign/item/view.blade.php ENDPATH**/ ?>