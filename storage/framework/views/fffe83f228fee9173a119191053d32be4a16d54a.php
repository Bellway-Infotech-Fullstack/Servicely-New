<?php $__env->startSection('title',$vendor->names()."'s Orders"); ?>

<?php $__env->startPush('css_or_js'); ?>
    <!-- Custom styles for this page -->
    <link href="<?php echo e(asset('public/assets/admin/css/croppie.css')); ?>" rel="stylesheet">

<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
<div class="content container-fluid">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?php echo e(route('admin.dashboard')); ?>"><?php echo e(__('messages.dashboard')); ?></a></li>
            <li class="breadcrumb-item" aria-current="page"><?php echo e(__('messages.vendor_view')); ?></li>
        </ol>
    </nav>

    <!-- Page Header -->
    <div class="page-header">
        <div class="row">
            <div class="col-6">
                <h1 class="page-header-title"><?php echo e($vendor->name); ?></h1>
            </div>
            <div class="col-6">
                <a href="<?php echo e(route('admin.vendor.edit',[$vendor->id])); ?>" class="btn btn-primary float-right">
                    <i class="tio-edit"></i> <?php echo e(__('messages.edit')); ?> <?php echo e(__('messages.restaurant')); ?>

                </a>
            </div>
        </div>
        <!-- Nav Scroller -->
        <div class="js-nav-scroller hs-nav-scroller-horizontal">
            <span class="hs-nav-scroller-arrow-prev" style="display: none;">
                <a class="hs-nav-scroller-arrow-link" href="javascript:;">
                    <i class="tio-chevron-left"></i>
                </a>
            </span>

            <span class="hs-nav-scroller-arrow-next" style="display: none;">
                <a class="hs-nav-scroller-arrow-link" href="javascript:;">
                    <i class="tio-chevron-right"></i>
                </a>
            </span>

            <!-- Nav -->
            <ul class="nav nav-tabs page-header-tabs">
                <li class="nav-item">
                    <a class="nav-link" href="<?php echo e(route('admin.vendor.view', $vendor->id)); ?>"><?php echo e(__('messages.restaurant')); ?></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="<?php echo e(route('admin.vendor.view', ['vendor'=>$vendor->id, 'tab'=> 'order'])); ?>"  aria-disabled="true"><?php echo e(__('messages.order')); ?></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<?php echo e(route('admin.vendor.view', ['vendor'=>$vendor->id, 'tab'=> 'service'])); ?>"  aria-disabled="true"><?php echo e(__('messages.service')); ?></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<?php echo e(route('admin.vendor.view', ['vendor'=>$vendor->id, 'tab'=> 'discount'])); ?>"  aria-disabled="true"><?php echo e(__('messages.discount')); ?></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<?php echo e(route('admin.vendor.view', ['vendor'=>$vendor->id, 'tab'=> 'settings'])); ?>"  aria-disabled="true"><?php echo e(__('messages.settings')); ?></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<?php echo e(route('admin.vendor.view', ['vendor'=>$vendor->id, 'tab'=> 'transaction'])); ?>"  aria-disabled="true"><?php echo e(__('messages.transaction')); ?></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<?php echo e(route('admin.vendor.view', ['vendor'=>$vendor->id, 'tab'=> 'reviews'])); ?>"  aria-disabled="true"><?php echo e(__('messages.reviews')); ?></a>
                </li>
            </ul>
            <!-- End Nav -->
        </div>
        <!-- End Nav Scroller -->
    </div>
        <!-- End Page Header -->
    <!-- Page Heading -->
    <div class="tab-content">
        <div class="tab-pane fade show active" id="order">
            <div class="row pt-2">
                <div class="col-md-12">
                    <div class="card w-100">
                        <div class="card-header">
                            <?php echo e(__('messages.order')); ?> <?php echo e(__('messages.info')); ?>

                        </div>
                        <!-- Card -->
                        <div class="card-body mb-3 mb-lg-5">
                            <div class="row gx-lg-4">
                                <div class="col-sm-6 col-lg-3">
                                    <div class="media" style="cursor: pointer" onclick="location.href='<?php echo e(route('admin.order.list',['pending'])); ?>?vendor[]=<?php echo e($vendor->id); ?>'">
                                        <div class="media-body">
                                            <h6 class="card-subtitle"><?php echo e(__('messages.pending')); ?></h6>
                                            <span class="card-title h3">
                                            <?php echo e(\App\Models\Order::where(['order_status'=>'pending','vendor_id'=>$vendor->id])->count()); ?></span>
                                        </div>
                                        <span class="icon icon-sm icon-soft-secondary icon-circle ml-3">
                                        <i class="tio-airdrop"></i>
                                        </span>
                                    </div>
                                    <div class="d-lg-none">
                                        <hr>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-lg-3 column-divider-sm">
                                    <div class="media" style="cursor: pointer" onclick="location.href='<?php echo e(route('admin.order.list',['delivered'])); ?>?vendor[]=<?php echo e($vendor->id); ?>'">
                                        <div class="media-body">
                                            <h6 class="card-subtitle"><?php echo e(__('messages.delivered')); ?></h6>
                                            <span class="card-title h3"><?php echo e(\App\Models\Order::where(['order_status'=>'delivered', 'vendor_id'=>$vendor->id])->count()); ?></span>
                                        </div>
                                        <span class="icon icon-sm icon-soft-secondary icon-circle ml-3">
                                        <i class="tio-checkmark-circle"></i>
                                        </span>
                                    </div>
                                    <div class="d-lg-none">
                                        <hr>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-lg-3 column-divider-lg">
                                    <div class="media" style="cursor: pointer" onclick="location.href='<?php echo e(route('admin.order.list',['scheduled'])); ?>?vendor[]=<?php echo e($vendor->id); ?>'">
                                        <div class="media-body">
                                            <h6 class="card-subtitle"><?php echo e(__('messages.scheduled')); ?></h6>
                                            <span class="card-title h3"><?php echo e(\App\Models\Order::Scheduled()->where('vendor_id', $vendor->id)->count()); ?></span>
                                        </div>
                                        <span class="icon icon-sm icon-soft-secondary icon-circle ml-3">
                                        <i class="tio-clock"></i>
                                        </span>
                                    </div>
                                    <div class="d-lg-none">
                                        <hr>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-lg-3 column-divider-sm">
                                    <div class="media" style="cursor: pointer" onclick="location.href='<?php echo e(route('admin.order.list',['all'])); ?>?vendor[]=<?php echo e($vendor->id); ?>'">
                                        <div class="media-body">
                                            <h6 class="card-subtitle"><?php echo e(__('messages.all')); ?></h6>
                                            <span class="card-title h3"><?php echo e(\App\Models\Order::where('vendor_id', $vendor->id)->count()); ?></span>
                                        </div>
                                        <span class="icon icon-sm icon-soft-secondary icon-circle ml-3">
                                        <i class="tio-table"></i>
                                        </span>
                                    </div>
                                    <div class="d-lg-none">
                                        <hr>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- Table -->
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
                                    <th><?php echo e(__('messages.payment')); ?> <?php echo e(__('messages.status')); ?></th>
                                    <th><?php echo e(__('messages.total')); ?></th>
                                    <th><?php echo e(__('messages.order')); ?> <?php echo e(__('messages.status')); ?></th>
                                    <th><?php echo e(__('messages.actions')); ?></th>
                                </tr>
                                </thead>

                                <tbody id="set-rows">
                                <?php ($orders=\App\Models\Order::where('vendor_id', $vendor->id)->latest()->paginate(10)); ?>
                                <?php $__currentLoopData = $orders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$order): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                                    <tr class="status-<?php echo e($order['order_status']); ?> class-all">
                                        <td class="">
                                            <?php echo e($key+ $orders->firstItem()); ?>

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
                                            <a class="btn btn-sm btn-white"
                                           href="<?php echo e(route('admin.order.details',['id'=>$order['id']])); ?>"><i
                                                class="tio-visible"></i> <?php echo e(__('messages.view')); ?></a>
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
                                <div class="col-sm-auto">
                                    <div class="d-flex justify-content-center justify-content-sm-end">
                                        <!-- Pagination -->
                                        <?php echo $orders->links(); ?>

                                    </div>
                                </div>
                            </div>
                            <!-- End Pagination -->
                        </div>
                        <!-- End Footer -->
                        <!-- End Card -->
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('script_2'); ?>
    <!-- Page level plugins -->
    <script>
        // Call the dataTables jQuery plugin
        $(document).ready(function () {
            $('#dataTable').DataTable();
        });
    </script>
    <script>
        $(document).on('ready', function () {
            // INITIALIZATION OF DATATABLES
            // =======================================================
            var datatable = $.HSCore.components.HSDatatables.init($('#columnSearchDatatable'));

            $('#column1_search').on('keyup', function () {
                datatable
                    .columns(1)
                    .search(this.value)
                    .draw();
            });

            $('#column2_search').on('keyup', function () {
                datatable
                    .columns(2)
                    .search(this.value)
                    .draw();
            });

            $('#column3_search').on('change', function () {
                datatable
                    .columns(3)
                    .search(this.value)
                    .draw();
            });

            $('#column4_search').on('keyup', function () {
                datatable
                    .columns(4)
                    .search(this.value)
                    .draw();
            });


            // INITIALIZATION OF SELECT2
            // =======================================================
            $('.js-select2-custom').each(function () {
                var select2 = $.HSCore.components.HSSelect2.init($(this));
            });
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\servicely-new\resources\views/admin-views/vendor/view/order.blade.php ENDPATH**/ ?>