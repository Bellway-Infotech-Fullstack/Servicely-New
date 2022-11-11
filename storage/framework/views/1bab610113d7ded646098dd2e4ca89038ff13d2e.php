<?php $__env->startSection('title','Update Banner'); ?>

<?php $__env->startPush('css_or_js'); ?>
<style>
    .select2 .select2-container .select2-container--default .select2-container--above .select2-container--focus{
        width:100% !important;
    }
</style>
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-edit"></i><?php echo e(__('messages.update')); ?> <?php echo e(__('messages.banner')); ?></h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <div class="card">
                    <div class="card-body">
                        <form action="<?php echo e(route('admin.banner.update', [$banner->id])); ?>" method="post" id="banner_form">
                            <?php echo csrf_field(); ?>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlInput1"><?php echo e(__('messages.title')); ?></label>
                                        <input type="text" name="title" class="form-control" placeholder="<?php echo e(__('messages.new_banner')); ?>" value="<?php echo e($banner->title); ?>" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="input-label" for="title"><?php echo e(__('messages.zone')); ?></label>
                                        <select name="zone_id" id="zone" class="form-control js-select2-custom" onchange="getRequest('<?php echo e(url('/')); ?>/admin/food/get-foods?zone_id='+this.value,'choice_item')">
                                            <option  disabled selected>---<?php echo e(__('messages.select')); ?>---</option>
                                            <?php ($zones=\App\Models\Zone::all()); ?>
                                            <?php $__currentLoopData = $zones; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $zone): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <?php if(isset(auth('admin')->user()->zone_id)): ?>
                                                    <?php if(auth('admin')->user()->zone_id == $zone->id): ?>
                                                        <option value="<?php echo e($zone['id']); ?>" <?php echo e($zone->id == $banner->zone_id?'selected':''); ?>><?php echo e($zone['name']); ?></option>
                                                    <?php endif; ?>
                                                <?php else: ?>
                                                <option value="<?php echo e($zone['id']); ?>" <?php echo e($zone->id == $banner->zone_id?'selected':''); ?>><?php echo e($zone['name']); ?></option>
                                                <?php endif; ?>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlInput1"><?php echo e(__('messages.banner')); ?> <?php echo e(__('messages.type')); ?></label>
                                        <select name="banner_type" class="form-control" onchange="banner_type_change(this.value)">

                                            <option value="vendor_wise" <?php echo e($banner->type == 'vendor_wise'? 'selected':''); ?>><?php echo e(__('messages.vendor')); ?> <?php echo e(__('messages.wise')); ?></option>
                                            <option value="service_wise" <?php echo e($banner->type == 'service_wise'? 'selected':''); ?>><?php echo e(__('messages.service')); ?> <?php echo e(__('messages.wise')); ?></option>
                                        </select>
                                    </div>
                                    <div class="form-group" id="restaurant_wise">
                                        <label class="input-label" for="exampleFormControlSelect1"><?php echo e(__('messages.restaurant')); ?><span
                                                class="input-label-secondary"></span></label>

                                         <select name="vendor_id" class="form-control"  title="Select Vendor">
                                              <option value="">Vendor</option>
                                              <?php if($banner->type=='vendor_wise'): ?>
                                                <?php $__currentLoopData = $vendors; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $vendor): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <?php if($vendor->id == $banner->data): ?>
                                                            <option value="<?php echo e($vendor->id); ?>" selected><?php echo e($vendor->names()); ?></option>
                                                        <?php else: ?>
                                                            <option value="<?php echo e($vendor->id); ?>"><?php echo e($vendor->names()); ?></option>
                                                        <?php endif; ?>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                              <?php endif; ?>
                                        </select>

                                    </div>


                                   

                                    <div class="form-group" id="item_wise">
                                        <label class="input-label" for="exampleFormControlInput1"><?php echo e(__('messages.select')); ?> <?php echo e(__('messages.service')); ?></label>
                                        <select name="service_id" id="choice_item" class="form-control js-select2-custom" placeholder="<?php echo e(__('messages.select').__('messages.service')); ?>">
                                            
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label><?php echo e(__('messages.campaign')); ?> <?php echo e(__('messages.image')); ?></label>
                                        <small style="color: red">* ( <?php echo e(__('messages.ratio')); ?> 3:1 )</small>
                                        <div class="custom-file">
                                            <input type="file" name="image" id="customFileEg1" class="custom-file-input"
                                                accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                            <label class="custom-file-label" for="customFileEg1"><?php echo e(__('messages.choose')); ?> <?php echo e(__('messages.file')); ?></label>
                                        </div>
                                    </div>
                                    <div class="form-group" style="margin-bottom:0%;">
                                        <center>
                                            <img style="width: 80%;border: 1px solid; border-radius: 10px;" id="viewer" onerror="this.src='<?php echo e(asset('public/assets/admin/img/900x400/img1.jpg')); ?>'" src="<?php echo e(asset('storage/app/public/banner')); ?>/<?php echo e($banner['image']); ?>" alt="campaign image"/>
                                        </center>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary"><?php echo e(__('messages.submit')); ?></button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- End Table -->
        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startPush('script_2'); ?>
<script>
    function getRequest(route, id) {
        $.get({
            url: route,
            dataType: 'json',
            success: function (data) {
                $('#' + id).empty().append(data.options);
            },
        });
    }
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#viewer').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#customFileEg1").change(function () {
        readURL(this);
    });
</script>
<script>
    $(document).on('ready', function () {
        var zone_id = <?php echo e($banner->zone_id); ?>;
        banner_type_change('<?php echo e($banner->type); ?>');

        $('#zone').on('change', function(){
            if($(this).val())
            {
                zone_id = $(this).val();
            }
            else
            {
                zone_id = true;
            }
        });

        $('.js-data-example-ajax').select2({
            ajax: {
                url: '<?php echo e(url('/')); ?>/admin/vendor/get-restaurants',
                data: function (params) {
                    return {
                        q: params.term, // search term
                        zone_ids: [zone_id],
                        page: params.page
                    };
                },
                processResults: function (data) {
                    return {
                    results: data
                    };
                },
                __port: function (params, success, failure) {
                    var $request = $.ajax(params);

                    $request.then(success);
                    $request.fail(failure);

                    return $request;
                }
            }
        });



        $('.js-select2-custom').each(function () {
            var select2 = $.HSCore.components.HSSelect2.init($(this));
        });   
    });

        function banner_type_change(order_type) {
           if(order_type=='service_wise')
            {
                $('#restaurant_wise').hide();
                $('#item_wise').show();
            }
            else if(order_type=='vendor_wise')
            {
                $('#restaurant_wise').show();
                $('#item_wise').hide();
            }
            else{
                $('#item_wise').hide();
                $('#restaurant_wise').hide();
            }
        }
        <?php if($banner->type == 'service_wise'): ?>
        getRequest('<?php echo e(url('/')); ?>/admin/service/get-foods?zone_id=<?php echo e($banner->zone_id); ?>&data[]=<?php echo e($banner->data); ?>','choice_item');
        <?php endif; ?> 
        $('#banner_form').on('submit', function (e) {
            e.preventDefault();
            var formData = new FormData(this);
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '<?php echo e(route('admin.banner.update', [$banner['id']])); ?>',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    if (data.errors) {
                        for (var i = 0; i < data.errors.length; i++) {
                            toastr.error(data.errors[i].message, {
                                CloseButton: true,
                                ProgressBar: true
                            });
                        }
                    } else {
                        toastr.success('Banner uploaded successfully!', {
                            CloseButton: true,
                            ProgressBar: true
                        });
                        setTimeout(function () {
                            location.href = '<?php echo e(route('admin.banner.add-new')); ?>';
                        }, 2000);
                    }
                }
            });
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\servicly\resources\views/admin-views/banner/edit.blade.php ENDPATH**/ ?>