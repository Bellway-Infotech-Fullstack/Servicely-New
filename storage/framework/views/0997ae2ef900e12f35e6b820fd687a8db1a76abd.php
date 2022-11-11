<?php $__env->startSection('title','Vendor List'); ?>

<?php $__env->startPush('css_or_js'); ?>
    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-filter-list"></i> <?php echo e(__('messages.vendors')); ?> <span class="badge badge-soft-dark ml-2" id="itemCount"><?php echo e($vendors->total()); ?></span></h1>
                </div>
                <?php if($toggle_veg_non_veg): ?>
                    <!-- Veg/NonVeg filter -->
                    <div class="col-sm-auto mb-1 mb-sm-0">
                        <select name="category_id" onchange="set_filter('<?php echo e(url()->full()); ?>',this.value, 'type')" data-placeholder="<?php echo e(__('messages.all')); ?>" class="form-control">
                            <option value="all" <?php echo e($type=='all'?'selected':''); ?>><?php echo e(__('messages.all')); ?></option>
                            <option value="veg" <?php echo e($type=='veg'?'selected':''); ?>><?php echo e(__('messages.veg')); ?></option>
                            <option value="non_veg" <?php echo e($type=='non_veg'?'selected':''); ?>><?php echo e(__('messages.non_veg')); ?></option>
                        </select>
                    </div>
                    <!-- End Veg/NonVeg filter -->
                <?php endif; ?>
                <?php if(!isset(auth('admin')->user()->zone_id)): ?>
                <div class="col-sm-auto" style="min-width: 306px;">
                    <select name="zone_id" class="form-control js-select2-custom"
                            onchange="set_zone_filter('<?php echo e(route('admin.vendor.list')); ?>',this.value)">
                        <option value="all">All Zones</option>
                        <?php $__currentLoopData = \App\Models\Zone::orderBy('name')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $z): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option
                                value="<?php echo e($z['id']); ?>" <?php echo e(isset($zone) && $zone->id == $z['id']?'selected':''); ?>>
                                <?php echo e($z['name']); ?>

                            </option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                </div>
                <?php endif; ?>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <!-- Card -->
                <div class="card">
                    <!-- Header -->
                    <div class="card-header pb-1 pt-1" >
                        <h5><?php echo e(__('messages.vendors')); ?> <?php echo e(__('messages.list')); ?></h5>
                        <form action="javascript:" id="search-form" >
                                        <!-- Search -->
                            <?php echo csrf_field(); ?>
                            <div class="input-group input-group-merge input-group-flush">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="tio-search"></i>
                                    </div>
                                </div>
                                <input id="datatableSearch_" type="search" name="search" class="form-control"
                                        placeholder="<?php echo e(__('messages.search')); ?>" aria-label="<?php echo e(__('messages.search')); ?>" required>
                                <button type="submit" class="btn btn-light"><?php echo e(__('messages.search')); ?></button>

                            </div>
                            <!-- End Search -->
                        </form>
                    </div>
                    <!-- End Header -->

                    <!-- Table -->
                    <div class="table-responsive datatable-custom">
                        <table id="columnSearchDatatable"
                               class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                               data-hs-datatables-options='{
                                 "order": [],
                                 "orderCellsTop": true,
                                 "paging":false

                               }'>
                            <thead class="thead-light">
                            <tr>
                                <th style="width: 10%;"><?php echo e(__('messages.#')); ?></th>
                                <th style="width: 10%;"><?php echo e(__('messages.logo')); ?></th>
                                
                                <th style="width: 15%;"><?php echo e(__('messages.owner')); ?></th>
                                <th style="width: 15%;"><?php echo e(__('messages.zone')); ?></th>
                                <th style="width: 10%;"><?php echo e(__('messages.phone')); ?></th>
                                <th class="text-uppercase" style="width: 10%;"><?php echo e(__('messages.active')); ?>/<?php echo e(__('messages.inactive')); ?></th>
                                <th style="width: 10%;"><?php echo e(__('messages.action')); ?></th>
                            </tr>
                            </thead>

                            <tbody id="set-rows">
                            <?php $__currentLoopData = $vendors; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$dm): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td><?php echo e($key+$vendors->firstItem()); ?></td>
                                    <td>
                                        <div style="height: 60px; width: 60px; overflow-x: hidden;overflow-y: hidden">
                                            <a href="<?php echo e(route('admin.vendor.view', $dm->id)); ?>" alt="view restaurant">
                                            <img width="60" style="border-radius: 50%; height:100%;"
                                                 onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/img1.jpg')); ?>'"
                                                 src="<?php echo e(asset('storage/app/public/restaurant')); ?>/<?php echo e($dm['image']); ?>"></a>
                                        </div>
                                    </td>
                                 
                                    <td>
                                        <span class="d-block font-size-sm text-body">
                                            <?php echo e($dm->f_name.' '.$dm->l_name); ?>

                                        </span>
                                    </td>
                                    <td>
                                        <?php echo e($dm->zone? $dm->zone->name:__('messages.zone').' '.__('messages.deleted')); ?>

                                        
                                    </td>
                                    <td>
                                        <?php echo e($dm['phone']); ?>

                                    </td>
                                    <td>
                                        <?php if(isset($dm->status)): ?>
                                            <?php if($dm->status): ?>
                                            <label class="toggle-switch toggle-switch-sm" for="stocksCheckbox<?php echo e($dm->id); ?>">
                                                <input type="checkbox" onclick="status_change_alert('<?php echo e(route('admin.vendor.status',[$dm->id,$dm->status?0:1])); ?>', '<?php echo e(__('messages.you_want_to_change_this_restaurant_status')); ?>', event)" class="toggle-switch-input" id="stocksCheckbox<?php echo e($dm->id); ?>" <?php echo e($dm->status?'checked':''); ?>>
                                                <span class="toggle-switch-label">
                                                    <span class="toggle-switch-indicator"></span>
                                                </span>
                                            </label>
                                            <?php else: ?>
                                            <span class="badge badge-soft-danger"><?php echo e(__('messages.denied')); ?></span>
                                            <?php endif; ?>
                                        <?php else: ?>
                                            <span class="badge badge-soft-danger"><?php echo e(__('messages.pending')); ?></span>
                                        <?php endif; ?>
                                    </td>
                                    <td>
                                        <a class="btn btn-sm btn-white"
                                            href="<?php echo e(route('admin.vendor.view',[$dm['id']])); ?>" title="<?php echo e(__('messages.view')); ?> <?php echo e(__('messages.restaurant')); ?>"><i class="tio-visible text-success"></i>
                                        </a>
                                        <a class="btn btn-sm btn-white"
                                            href="<?php echo e(route('admin.vendor.edit',[$dm['id']])); ?>" title="<?php echo e(__('messages.edit')); ?> <?php echo e(__('messages.restaurant')); ?>"><i class="tio-edit text-primary"></i>
                                        </a>
                                        
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
        function status_change_alert(url, message, e) {
            e.preventDefault();
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
                    location.href=url;
                }
            })
        }
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
                    $('#itemCount').html(data.total);
                    $('.page-area').hide();
                },
                complete: function () {
                    $('#loading').hide();
                },
            });
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\servicely-new\resources\views/admin-views/vendor/list.blade.php ENDPATH**/ ?>