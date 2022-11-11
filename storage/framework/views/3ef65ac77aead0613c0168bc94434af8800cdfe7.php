<?php $__env->startSection('title','Update Service'); ?>

<?php $__env->startPush('css_or_js'); ?>
    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
    <link href="<?php echo e(asset('public/assets/admin/css/tags-input.min.css')); ?>" rel="stylesheet">
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>

    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-edit"></i> <?php echo e(__('messages.service')); ?> <?php echo e(__('messages.update')); ?></h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <form action="javascript:" method="post" id="product_form"
                      enctype="multipart/form-data">
                    <?php echo csrf_field(); ?>
                    <div class="form-group">
                        <label class="input-label" for="exampleFormControlInput1"><?php echo e(__('messages.name')); ?></label>
                        <input type="text" name="name" value="<?php echo e($product['name']); ?>" class="form-control"
                               placeholder="<?php echo e(__('messages.new_food')); ?>" required>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1"><?php echo e(__('messages.price')); ?></label>
                                <input type="number" value="<?php echo e($product['price']); ?>" min="0" max="100000" name="price"
                                       class="form-control" step="0.01"
                                       placeholder="Ex : 100" required>
                            </div>
                        </div>
                        <div class="col-md-3 col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1"><?php echo e(__('messages.discount')); ?></label>
                                <input type="number" min="0" value="<?php echo e($product['discount']); ?>" max="100000"
                                       name="discount" class="form-control"
                                       placeholder="Ex : 100">
                            </div>
                        </div>
                        <div class="col-md-3 col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1"><?php echo e(__('messages.discount')); ?> <?php echo e(__('messages.type')); ?></label>
                                <select name="discount_type" class="form-control js-select2-custom">
                                    <option value="percent" <?php echo e($product['discount_type']=='percent'?'selected':''); ?>>
                                        <?php echo e(__('messages.percent')); ?>

                                    </option>
                                    <option value="amount" <?php echo e($product['discount_type']=='amount'?'selected':''); ?>>
                                        <?php echo e(__('messages.amount')); ?>

                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1"><?php echo e(__('messages.item_type')); ?></label>
                                <select name="veg" class="form-control js-select2-custom">
                                    <option value="1" <?php echo e($product['veg']==1?'selected':''); ?>><?php echo e(__('messages.veg')); ?></option>
                                    <option value="0" <?php echo e($product['veg']==0?'selected':''); ?>><?php echo e(__('messages.non_veg')); ?></option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlSelect1"><?php echo e(__('messages.category')); ?><span
                                        class="input-label-secondary">*</span></label>
                                <select name="category_id" id="category-id" class="form-control js-select2-custom"
                                        onchange="getRequest('<?php echo e(url('/')); ?>/vendor-panel/food/get-categories?parent_id='+this.value,'sub-categories')">
                                    <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option
                                            value="<?php echo e($category['id']); ?>" <?php echo e($category->id==$product_category[0]->id ? 'selected' : ''); ?> ><?php echo e($category['name']); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlSelect1"><?php echo e(__('messages.sub_category')); ?><span
                                        class="input-label-secondary"></span></label>
                                <select name="sub_category_id" id="sub-categories"
                                        data-id="<?php echo e(count($product_category)>=2?$product_category[1]->id:''); ?>"
                                        class="form-control js-select2-custom"
                                        onchange="getRequest('<?php echo e(url('/')); ?>/vendor-panel/food/get-categories?parent_id='+this.value,'sub-sub-categories')">

                                </select>
                            </div>
                        </div>
                        
                    </div>

                   

                   

                    <?php

                        $opening_time=\App\CentralLogics\Helpers::get_restaurant_data()->opening_time;
                        $opening_time=$opening_time? \Carbon\Carbon::parse($opening_time)->format('H:i'):$opening_time;
                        
                        $closing_time=\App\CentralLogics\Helpers::get_restaurant_data()->closeing_time;
                        $closing_time=$closing_time? \Carbon\Carbon::parse($closing_time)->format('H:i'):$closing_time;
                        
                    ?>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1"><?php echo e(__('messages.available')); ?> <?php echo e(__('messages.time')); ?> <?php echo e(__('messages.starts')); ?></label>
                                <input type="time" value="<?php echo e($product['available_time_starts']); ?>" min="<?php echo e($opening_time); ?>"
                                       name="available_time_starts" class="form-control"
                                       placeholder="Ex : 10:30 am" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1"><?php echo e(__('messages.available')); ?> <?php echo e(__('messages.time')); ?> <?php echo e(__('messages.ends')); ?></label>
                                <input type="time" value="<?php echo e($product['available_time_ends']); ?>"
                                       name="available_time_ends" class="form-control" max="<?php echo e($closing_time); ?>" placeholder="5:45 pm"
                                       required>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="input-label" for="exampleFormControlInput1"><?php echo e(__('messages.short')); ?> <?php echo e(__('messages.description')); ?></label>
                        <textarea type="text" name="description" class="form-control"><?php echo e($product['description']); ?></textarea>
                    </div>

                    <div class="form-group">
                        <label><?php echo e(__('messages.service')); ?> <?php echo e(__('messages.image')); ?></label><small style="color: red">* ( <?php echo e(__('messages.ratio')); ?> 1:1 )</small>
                        <div class="custom-file">
                            <input type="file" name="image" id="customFileEg1" class="custom-file-input"
                                   accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                            <label class="custom-file-label" for="customFileEg1"><?php echo e(__('messages.choose')); ?> <?php echo e(__('messages.file')); ?></label>
                        </div>

                        <center style="display: block" id="image-viewer-section" class="pt-2">
                            <img style="height: 200px;border: 1px solid; border-radius: 10px;" id="viewer"
                                 src="<?php echo e(asset('storage/app/public/product')); ?>/<?php echo e($product['image']); ?>"
                                 alt="product image"/>
                        </center>
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-primary"><?php echo e(__('messages.update')); ?></button>
                </form>
            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startPush('script'); ?>

<?php $__env->stopPush(); ?>

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
            $('#image-viewer-section').show(1000)
        });

        $(document).ready(function () {
            setTimeout(function () {
                let category = $("#category-id").val();
                let sub_category = '<?php echo e(count($product_category)>=2?$product_category[1]->id:''); ?>';
                let sub_sub_category ='<?php echo e(count($product_category)>=3?$product_category[2]->id:''); ?>';
                getRequest('<?php echo e(url('/')); ?>/vendor-panel/food/get-categories?parent_id=' + category + '&&sub_category=' + sub_category, 'sub-categories');
                getRequest('<?php echo e(url('/')); ?>/vendor-panel/food/get-categories?parent_id=' + sub_category + '&&sub_category=' + sub_sub_category, 'sub-sub-categories');
            }, 1000)
        });
    </script>

    <script>
        $(document).on('ready', function () {
            $('.js-select2-custom').each(function () {
                var select2 = $.HSCore.components.HSSelect2.init($(this));
            });
        });
    </script>


    <script src="<?php echo e(asset('public/assets/admin')); ?>/js/tags-input.min.js"></script>

    <script>
        $('#choice_attributes').on('change', function () {
            combination_update();
            $('#customer_choice_options').html(null);
            $.each($("#choice_attributes option:selected"), function () {
                add_more_customer_choice_option($(this).val(), $(this).text());
            });
        });

        function add_more_customer_choice_option(i, name) {
            let n = name;
            $('#customer_choice_options').append('<div class="row"><div class="col-md-3"><input type="hidden" name="choice_no[]" value="' + i + '"><input type="text" class="form-control" name="choice[]" value="' + n + '" placeholder="<?php echo e(__('messages.choice_title')); ?>" readonly></div><div class="col-lg-9"><input type="text" class="form-control" name="choice_options_' + i + '[]" placeholder="<?php echo e(__('messages.enter_choice_values')); ?>" data-role="tagsinput" onchange="combination_update()"></div></div>');
            $("input[data-role=tagsinput], select[multiple][data-role=tagsinput]").tagsinput();
        }

        setTimeout(function () {
            $('.call-update-sku').on('change', function () {
                combination_update();
            });
        }, 2000)

        $('#colors-selector').on('change', function () {
            combination_update();
        });

        $('input[name="unit_price"]').on('keyup', function () {
            combination_update();
        });

        function combination_update() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $.ajax({
                type: "POST",
                url: '<?php echo e(route('vendor.service.variant-combination')); ?>',
                data: $('#product_form').serialize(),
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    $('#loading').hide();
                    $('#variant_combination').html(data.view);
                    if (data.length > 1) {
                        $('#quantity').hide();
                    } else {
                        $('#quantity').show();
                    }
                }
            });
        }
    </script>

    <script>
        $('#product_form').on('submit', function () {
            var formData = new FormData(this);
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '<?php echo e(route('vendor.service.update',[$product['id']])); ?>',
                data: $('#product_form').serialize(),
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    $('#loading').hide();
                    if (data.errors) {
                        for (var i = 0; i < data.errors.length; i++) {
                            toastr.error(data.errors[i].message, {
                                CloseButton: true,
                                ProgressBar: true
                            });
                        }
                    } else {
                        toastr.success('<?php echo e(__('messages.product_updated_successfully')); ?>', {
                            CloseButton: true,
                            ProgressBar: true
                        });
                        setTimeout(function () {
                            location.href = '<?php echo e(route('vendor.service.list')); ?>';
                        }, 2000);
                    }
                }
            });
        });
    </script>
<?php $__env->stopPush(); ?>



<?php echo $__env->make('layouts.vendor.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\servicely-new\resources\views/vendor-views/product/edit.blade.php ENDPATH**/ ?>