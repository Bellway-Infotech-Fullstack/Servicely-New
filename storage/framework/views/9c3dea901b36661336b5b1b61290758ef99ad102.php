<?php $__env->startSection('title','Service Preview'); ?>

<?php $__env->startPush('css_or_js'); ?>

<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row">
                <div class="col-6">
                    <h1 class="page-header-title"><?php echo e($product['name']); ?></h1>
                </div>
                <div class="col-6">
                    <a href="<?php echo e(route('admin.service.edit',[$product['id']])); ?>" class="btn btn-primary float-right">
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
                                 src="<?php echo e(asset('storage/app/public/product')); ?>/<?php echo e($product['image']); ?>"
                                 onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/img2.jpg')); ?>'"
                                 alt="Image Description">
                            <div class="d-block">
                                <h4 class="display-2 text-dark mb-0"><?php echo e(count($product->rating)>0?number_format($product->rating[0]->average, 2, '.', ' '):0); ?></h4>
                                <p> <?php echo e(__('messages.of')); ?> <?php echo e($product->reviews->count()); ?> <?php echo e(__('messages.reviews')); ?>

                                    <span class="badge badge-soft-dark badge-pill ml-1"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-5">
                        <ul class="list-unstyled list-unstyled-py-2 mb-0">

                        <?php ($total=$product->reviews->count()); ?>
                        <!-- Review Ratings -->
                            <li class="d-flex align-items-center font-size-sm">
                                <?php ($five=\App\CentralLogics\Helpers::rating_count($product['id'],5)); ?>
                                <span
                                    class="mr-3">5 star</span>
                                <div class="progress flex-grow-1">
                                    <div class="progress-bar" role="progressbar"
                                         style="width: <?php echo e($total==0?0:($five/$total)*100); ?>%;"
                                         aria-valuenow="<?php echo e($total==0?0:($five/$total)*100); ?>"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="ml-3"><?php echo e($five); ?></span>
                            </li>
                            <!-- End Review Ratings -->

                            <!-- Review Ratings -->
                            <li class="d-flex align-items-center font-size-sm">
                                <?php ($four=\App\CentralLogics\Helpers::rating_count($product['id'],4)); ?>
                                <span class="mr-3">4 star</span>
                                <div class="progress flex-grow-1">
                                    <div class="progress-bar" role="progressbar"
                                         style="width: <?php echo e($total==0?0:($four/$total)*100); ?>%;"
                                         aria-valuenow="<?php echo e($total==0?0:($four/$total)*100); ?>"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="ml-3"><?php echo e($four); ?></span>
                            </li>
                            <!-- End Review Ratings -->

                            <!-- Review Ratings -->
                            <li class="d-flex align-items-center font-size-sm">
                                <?php ($three=\App\CentralLogics\Helpers::rating_count($product['id'],3)); ?>
                                <span class="mr-3">3 star</span>
                                <div class="progress flex-grow-1">
                                    <div class="progress-bar" role="progressbar"
                                         style="width: <?php echo e($total==0?0:($three/$total)*100); ?>%;"
                                         aria-valuenow="<?php echo e($total==0?0:($three/$total)*100); ?>"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="ml-3"><?php echo e($three); ?></span>
                            </li>
                            <!-- End Review Ratings -->

                            <!-- Review Ratings -->
                            <li class="d-flex align-items-center font-size-sm">
                                <?php ($two=\App\CentralLogics\Helpers::rating_count($product['id'],2)); ?>
                                <span class="mr-3">2 star</span>
                                <div class="progress flex-grow-1">
                                    <div class="progress-bar" role="progressbar"
                                         style="width: <?php echo e($total==0?0:($two/$total)*100); ?>%;"
                                         aria-valuenow="<?php echo e($total==0?0:($two/$total)*100); ?>"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="ml-3"><?php echo e($two); ?></span>
                            </li>
                            <!-- End Review Ratings -->

                            <!-- Review Ratings -->
                            <li class="d-flex align-items-center font-size-sm">
                                <?php ($one=\App\CentralLogics\Helpers::rating_count($product['id'],1)); ?>
                                <span class="mr-3">1 star</span>
                                <div class="progress flex-grow-1">
                                    <div class="progress-bar" role="progressbar"
                                         style="width: <?php echo e($total==0?0:($one/$total)*100); ?>%;"
                                         aria-valuenow="<?php echo e($total==0?0:($one/$total)*100); ?>"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="ml-3"><?php echo e($one); ?></span>
                            </li>
                            <!-- End Review Ratings -->
                        </ul>
                    </div>
                    <div class="col-sm-3 border-left text-center">
                        <span class="mb-1">Vendor info</span>
                        <?php if($product->vendor): ?>
                        <a href="<?php echo e(route('admin.vendor.view', $product->vendor_id)); ?>" title="<?php echo e($product->vendor['name']); ?>">
                            <img
                                class="avatar-img avatar-circle" style="width: 75px;margin:auto;"
                                onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/img1.jpg')); ?>'"
                                src="<?php echo e(asset('storage/app/public/restaurant/'.$product->vendor->image)); ?>"
                                alt="Image Description">
                            <label class="input-label"><?php echo e($product->vendor['name']); ?></label>
                        </a>
                        <?php else: ?>
                        <span class="badge-info"><?php echo e(__('messages.restaurant')); ?> <?php echo e(__('messages.deleted')); ?></span>
                        <?php endif; ?>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <hr>
                    </div>
                    <div class="col-sm-4 col-12 pt-2">
                        <h4 class="border-bottom"><?php echo e($product['name']); ?></h4>
                        <span><?php echo e(__('messages.price')); ?> :
                            <span><?php echo e(\App\CentralLogics\Helpers::format_currency($product['price'])); ?></span>
                        </span><br>
                        <span><?php echo e(__('messages.tax')); ?> :
                            <span><?php echo e(\App\CentralLogics\Helpers::format_currency(\App\CentralLogics\Helpers::tax_calculate($product,$product['price']))); ?></span>
                        </span><br>
                        <span><?php echo e(__('messages.discount')); ?> :
                            <span><?php echo e(\App\CentralLogics\Helpers::format_currency(\App\CentralLogics\Helpers::discount_calculate($product,$product['price']))); ?></span>
                        </span><br>
                        <span>
                            <?php echo e(__('messages.available')); ?> <?php echo e(__('messages.time')); ?> <?php echo e(__('messages.starts')); ?> : <?php echo e(date(config('timeformat'),strtotime($product['available_time_starts']))); ?>

                        </span><br>
                        <span>
                            <?php echo e(__('messages.available')); ?> <?php echo e(__('messages.time')); ?> <?php echo e(__('messages.ends')); ?> : <?php echo e(date(config('timeformat'), strtotime($product['available_time_ends']))); ?>

                        </span>
                        
                    </div>

                    <div class="col-sm-8 col-12 pt-2 border-left">
                        <h4><?php echo e(__('messages.short')); ?> <?php echo e(__('messages.description')); ?> : </h4>
                        <?php echo $product['description']; ?>

                    </div>
                </div>
            </div>
            <!-- End Body -->
        </div>
        <!-- End Card -->

        <!-- Card -->
        <div class="card">
            <div class="card-header">
            <?php echo e(__('messages.product')); ?> <?php echo e(__('messages.reviews')); ?>

            </div>
            <!-- Table -->
            <div class="table-responsive datatable-custom">
                <table id="datatable" class="table table-borderless table-thead-bordered table-nowrap card-table"
                       data-hs-datatables-options='{
                     "columnDefs": [{
                        "targets": [0, 3, 6],
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
                        <th><?php echo e(__('messages.reviewer')); ?></th>
                        <th><?php echo e(__('messages.review')); ?></th>
                        <th><?php echo e(__('messages.date')); ?></th>
                        <th><?php echo e(__('messages.status')); ?></th>
                    </tr>
                    </thead>

                    <tbody>

                    <?php $__currentLoopData = $reviews; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $review): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <tr>
                            <td>
                                <a class="d-flex align-items-center"
                                   href="<?php echo e(route('admin.customer.view',[$review['user_id']])); ?>">
                                    <div class="avatar avatar-circle">
                                        <img class="avatar-img" width="75" height="75"
                                             onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/img1.jpg')); ?>'"
                                             src="<?php echo e(asset('storage/app/public/profile/'.$review->customer->image)); ?>"
                                             alt="Image Description">
                                    </div>
                                    <div class="ml-3">
                                    <span class="d-block h5 text-hover-primary mb-0"><?php echo e($review->customer['f_name']." ".$review->customer['l_name']); ?> <i
                                            class="tio-verified text-primary" data-toggle="tooltip" data-placement="top"
                                            title="Verified Customer"></i></span>
                                        <span class="d-block font-size-sm text-body"><?php echo e($review->customer->email); ?></span>
                                    </div>
                                </a>
                            </td>
                            <td>
                                <div class="text-wrap" style="width: 18rem;">
                                    <div class="d-flex mb-2">
                                        <label class="badge badge-soft-info">
                                            <?php echo e($review->rating); ?> <i class="tio-star"></i>
                                        </label>
                                    </div>

                                    <p>
                                        <?php echo e($review['comment']); ?>

                                    </p>
                                </div>
                            </td>
                            <td>
                                <?php echo e(date('d M Y '.config('timeformat'),strtotime($review['created_at']))); ?>

                            </td>
                            <td>
                                <label class="toggle-switch toggle-switch-sm" for="reviewCheckbox<?php echo e($review->id); ?>">
                                    <input type="checkbox" onclick="status_form_alert('status-<?php echo e($review['id']); ?>','<?php echo e($review->status?__('messages.you_want_to_hide_this_review_for_customer'):__('messages.you_want_to_show_this_review_for_customer')); ?>', event)" class="toggle-switch-input" id="reviewCheckbox<?php echo e($review->id); ?>" <?php echo e($review->status?'checked':''); ?>>
                                    <span class="toggle-switch-label">
                                        <span class="toggle-switch-indicator"></span>
                                    </span>
                                </label>
                                <form action="<?php echo e(route('admin.service.reviews.status',[$review['id'],$review->status?0:1])); ?>" method="get" id="status-<?php echo e($review['id']); ?>">
                                </form>
                            </td>
                        </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </tbody>
                </table>
            </div>
            <!-- End Table -->

            <!-- Footer -->
            <div class="card-footer">
                <!-- Pagination -->
                <div class="row justify-content-center justify-content-sm-between align-items-sm-center">
                    <div class="col-12">
                        <?php echo $reviews->links(); ?>

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
<script>
    function status_form_alert(id, message, e) {
        e.preventDefault();
        Swal.fire({
            title: '<?php echo e(__('messages.are_you_sure')); ?>',   
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
                $('#'+id).submit()
            }
        })
    }
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\servicely-new\resources\views/admin-views/product/view.blade.php ENDPATH**/ ?>