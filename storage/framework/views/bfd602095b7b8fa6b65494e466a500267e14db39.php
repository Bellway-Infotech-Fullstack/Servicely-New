<!-- Header -->
<div class="card-header">
    <h5 class="card-header-title">
        <i class="tio-align-to-top"></i> <?php echo e(trans('messages.top_selling_Services')); ?>

    </h5>
</div>
<!-- End Header -->

<!-- Body -->
<div class="card-body">
    <div class="row">
        <?php $__currentLoopData = $top_sell; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <div class="col-md-4 col-sm-6 mt-2"
                 onclick="location.href='<?php echo e(route('vendor.service.view',[$item['service_id']])); ?>'"
                 style="cursor: pointer;padding-right: 6px;padding-left: 6px">
                <div class="grid-card">
                    <label class="label_1">Sold : <?php echo e($item['count']); ?></label>
                    <img style="width: 100%;height: 120px"
                         src="<?php echo e(asset('storage/app/public/product')); ?>/<?php echo e($item->service['image']); ?>"
                         onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/img2.jpg')); ?>'"
                         alt="<?php echo e($item->service->name); ?> image">
                    <div class="text-center mt-2">
                        <span class="" style="font-size: 10px"><?php echo e($item->service['name']); ?></span>
                    </div>
                </div>
            </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </div>
</div>
<!-- End Body -->
<?php /**PATH C:\xampp\htdocs\servicely-new\resources\views/vendor-views/partials/_top-selling-foods.blade.php ENDPATH**/ ?>