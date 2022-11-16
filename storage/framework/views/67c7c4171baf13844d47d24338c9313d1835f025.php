<?php $__env->startSection('title','Campaign view'); ?>

<?php $__env->startPush('css_or_js'); ?>
    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row">
                <div class="col-6">
                    <h1 class="page-header-title"><?php echo e($campaign->title); ?></h1>
                </div>
                <div class="col-6">
                    
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <!-- Card -->
        <div class="card mb-3 mb-lg-5">
            <!-- Body -->
            <div class="card-body">
                <div class="row align-items-md-center gx-md-5">
                    <div class="col-md-auto mb-3 mb-md-0">
                        <div class="d-flex align-items-center">
                            <img class="avatar avatar-xxl avatar-4by3 mr-4"
                                 src="<?php echo e(asset('storage/app/public/campaign')); ?>/<?php echo e($campaign->image); ?>"
                                 onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/img2.jpg')); ?>'"
                                 alt="Image Description">
                            <div class="d-block">
                                
                                
                            </div>
                        </div>
                    </div>

                    <div class="col-md">
                        <h4><?php echo e(__('messages.short')); ?> <?php echo e(__('messages.description')); ?> : </h4>
                        <p><?php echo e($campaign->description); ?></p>
                    </div>

                </div>
            </div>
            <!-- End Body -->
        </div>
        <!-- End Card -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <!-- Card -->
                <div class="card">
                    <!-- Table -->
                    <div class="table-responsive datatable-custom">
                        <table id="columnSearchDatatable"
                               class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                               data-hs-datatables-options='{
                                 "order": [],
                                 "orderCellsTop": true
                               }'>
                            <thead class="thead-light">
                            <tr>
                                <th><?php echo e(__('messages.#')); ?></th>
                                <th style="width: 15%"><?php echo e(__('messages.logo')); ?></th>
                                <th style="width: 20%"><?php echo e(__('messages.restaurant')); ?></th>
                                <th style="width: 25%"><?php echo e(__('messages.owner')); ?></th>
                                <th><?php echo e(__('messages.email')); ?></th>
                                <th><?php echo e(__('messages.phone')); ?></th>
                                <th><?php echo e(__('messages.action')); ?></th>
                            </tr>
                            <tr>
                                <th colspan="3">
                                    <form action="<?php echo e(route('admin.campaign.addrestaurant',$campaign->id)); ?>" id="restaurant-add-form" method="POST">
                                        <?php echo csrf_field(); ?>
                                        <!-- Search -->
                                        <div class="row">
                                            <div class="input-group-prepend col-md-7">   
                                            <?php ($allrestaurants=App\Models\Restaurant::all()); ?>
                                                <select name="restaurant_id" id="restaurant_id" class="form-control">
                                                    <?php $__empty_1 = true; $__currentLoopData = $allrestaurants; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $restaurant): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                                    <?php if(!in_array($restaurant->id, $restaurant_ids)): ?>
                                                    <option value="<?php echo e($restaurant->id); ?>" ><?php echo e($restaurant->name); ?></option>
                                                    <?php endif; ?>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                                    <option value="">No data found</option>
                                                    <?php endif; ?>
                                                </select>
                                            </div>
                                            <button type="submit" class="btn btn-primary col-md-5"><?php echo e(__('messages.add')); ?> <?php echo e(__('messages.restaurant')); ?></button>

                                        </div>
                                        <!-- End Search -->
                                    </form>
                                </th>
                                <th></th>
                                <th colspan="3">
                                    <form action="javascript:" id="search-form">
                                        <!-- Search -->
                                        <div class="input-group input-group-merge input-group-flush">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <i class="tio-search"></i>
                                                </div>
                                            </div>
                                            <input id="datatableSearch_" type="search" name="search" class="form-control"
                                                   placeholder="<?php echo e(__('messages.search')); ?>" aria-label="Search" required>
                                            <button type="submit" class="btn btn-primary"><?php echo e(__('messages.search')); ?></button>

                                        </div>
                                        <!-- End Search -->
                                    </form>
                                </th>
                            </tr>
                            </thead>

                            <tbody id="set-rows">
                            <?php $__currentLoopData = $vendors; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$dm): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td><?php echo e($key+1); ?></td>
                                    <td>
                                        <div style="height: 60px; width: 60px; overflow-x: hidden;overflow-y: hidden">
                                            <img width="60" style="border-radius: 50%"
                                                 onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/img1.jpg')); ?>'"
                                                 src="<?php echo e(asset('storage/app/public/restaurant')); ?>/<?php echo e($dm['logo']); ?>">
                                        </div>
                                    </td>
                                    <td>
                                        <span class="d-block font-size-sm text-body">
                                            <?php echo e($dm->name); ?>

                                        </span>
                                    </td>
                                    <td>
                                        <span class="d-block font-size-sm text-body">
                                            <?php echo e($dm->vendor->f_name.' '.$dm->vendor->l_name); ?>

                                        </span>
                                    </td>
                                    <td>
                                        <?php echo e($dm->email); ?>

                                        
                                    </td>
                                    <td>
                                        <?php echo e($dm['phone']); ?>

                                    </td>
                                    <td>
                                        <a class="btn btn-sm btn-white text-danger" href="javascript:"
                                            onclick="form_alert('campaign-<?php echo e($campaign['id']); ?>','Want to remove this restaurant ?')" title="<?php echo e(__('messages.delete')); ?> <?php echo e(__('messages.campaign')); ?>"><i class="tio-delete-outlined"></i>
                                        </a>
                                        
                                        <form action="<?php echo e(route('admin.campaign.remove-restaurant',[$campaign->id, $dm['id']])); ?>"
                                                      method="GET" id="campaign-<?php echo e($campaign['id']); ?>">
                                            <?php echo csrf_field(); ?>
                                        </form>
                                    </td>
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </tbody>
                        </table>
                        <hr>

                        <div class="page-area">
                            <table>
                                <tfoot>
                                <?php echo $vendors->links(); ?>

                                </tfoot>
                            </table>
                        </div>

                    </div>
                    <!-- End Table -->
                </div>
                <!-- End Card -->
            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startPush('script_2'); ?>
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

            $('#column3_search').on('keyup', function () {
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

    <script>

        $('#search-form').on('submit', function () {
            var formData = new FormData(this);
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '<?php echo e(route('admin.vendor.search')); ?>',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    $('#set-rows').html(data.view);
                    $('.page-area').hide();
                },
                complete: function () {
                    $('#loading').hide();
                },
            });
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\servicely-new\resources\views/admin-views/campaign/basic/view.blade.php ENDPATH**/ ?>