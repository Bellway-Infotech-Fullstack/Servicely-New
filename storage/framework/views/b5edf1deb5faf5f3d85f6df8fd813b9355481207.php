<?php $__env->startSection('title',__('messages.add_new_restaurant')); ?>

<?php $__env->startPush('css_or_js'); ?>
<style>
    #map{
        height: 100%;
    }
    @media  only screen and (max-width: 768px) {
        /* For mobile phones: */
        #map{
            height: 200px;
        }
    }
</style>
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header" style="border-bottom:0;padding-bottom:0;">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-add-circle-outlined"></i> <?php echo e(__('messages.add')); ?> <?php echo e(__('messages.new')); ?> <?php echo e(__('messages.vendor')); ?></h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <form action="<?php echo e(route('admin.vendor.store')); ?>" method="post" enctype="multipart/form-data" class="js-validate">
                    <?php echo csrf_field(); ?>

                    <small class="nav-subtitle text-secondary border-bottom"><?php echo e(__('messages.vendor')); ?> <?php echo e(__('messages.info')); ?></small>
                    <br>
                    <div class="row">
                        <div class="col-md-6 col-12">
                             <div class="col-12">
                                <div class="form-group">
                                    <label class="input-label" for="f_name"><?php echo e(__('messages.first')); ?> <?php echo e(__('messages.name')); ?></label>
                                    <input type="text" name="f_name" class="form-control" placeholder="<?php echo e(__('messages.first')); ?> <?php echo e(__('messages.name')); ?>"
                                         value="<?php echo e(old('f_name')); ?>"  required>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="input-label" for="l_name"><?php echo e(__('messages.last')); ?> <?php echo e(__('messages.name')); ?></label>
                                    <input type="text" name="l_name" class="form-control" placeholder="<?php echo e(__('messages.last')); ?> <?php echo e(__('messages.name')); ?>"
                                    value="<?php echo e(old('l_name')); ?>"  required>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="input-label" for="phone"><?php echo e(__('messages.phone')); ?></label>
                                    <input type="text" name="phone" class="form-control" placeholder="Ex : 017********"
                                    value="<?php echo e(old('phone')); ?>" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="input-label" for="address"><?php echo e(__('messages.vendor')); ?> <?php echo e(__('messages.address')); ?></label>
                                <textarea type="text" name="address" class="form-control" placeholder="<?php echo e(__('messages.vendor')); ?> <?php echo e(__('messages.address')); ?>" required ><?php echo e(old('address')); ?></textarea>
                            </div>

                           

                            <small class="nav-subtitle text-secondary border-bottom"><?php echo e(__('messages.kyc_details')); ?> <?php echo e(__('messages.details')); ?></small>
                            <br>

                            <div class="form-group">
                                <label class="input-label" for="address">Aadhaar Card Number (12 digits)</label>
                                <input type="text" name="aadhaar_card_number" class="form-control" placeholder="Aadhaar Card Number" required value="<?php echo e(old('aadhaar_card_number')); ?>" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1').substring(0, 12);" />
                            </div>

                            <div class="form-group">
                                <label class="input-label" for="address">Pan Card Number (10 char max)</label>
                                <input type="text" name="pan_card_number" class="form-control" placeholder="Pan Card Number" required value="<?php echo e(old('pan_card_number')); ?>"  oninput="this.value = this.value.replace(/[^0-9a-zA-Z]/g, '').replace(/(\..*)\./g, '$1').substring(0, 10);" />
                            </div>


                            <div class="form-group">
                                    <label>Upload Aadhaar card Front Image</label>
                                    <div class="custom-file">
                                        <input type="file" name="aadhaar_front_image" id="aadhaar_front_image" class="custom-file-input"
                                            accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                        <label class="custom-file-label" for="aadhaar_front_image"><?php echo e(__('messages.choose')); ?> <?php echo e(__('messages.file')); ?></label>
                                    </div>

                                    <center>
                                        <img style="max-width: 100%;border: 1px solid; border-radius: 10px; max-height:100px;" id="AadhaarFrontImageCoverImageViewer"
                                        src="<?php echo e(asset('public/assets/admin/img/900x400/img1.jpg')); ?>" alt="Product thumbnail"/>
                                    </center>  
                            </div>

                            <div class="form-group">
                                    <label>Upload Aadhaar card Back Image</label>
                                    <div class="custom-file">
                                        <input type="file" name="aadhaar_back_image" id="aadhaar_back_image" class="custom-file-input"
                                            accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                        <label class="custom-file-label" for="aadhaar_back_image"><?php echo e(__('messages.choose')); ?> <?php echo e(__('messages.file')); ?></label>
                                    </div>

                                    <center>
                                        <img style="max-width: 100%;border: 1px solid; border-radius: 10px; max-height:100px;" id="AadhaarBackImageCoverImageViewer"
                                        src="<?php echo e(asset('public/assets/admin/img/900x400/img1.jpg')); ?>" alt="Product thumbnail"/>
                                    </center>  
                            </div>

                            <div class="form-group">
                                    <label>Upload Pan card Image</label>
                                    <div class="custom-file">
                                        <input type="file" name="pan_card_image" id="pan_card_image" class="custom-file-input"
                                            accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                        <label class="custom-file-label" for="pan_card_image"><?php echo e(__('messages.choose')); ?> <?php echo e(__('messages.file')); ?></label>
                                    </div>

                                    <center>
                                        <img style="max-width: 100%;border: 1px solid; border-radius: 10px; max-height:100px;" id="panCardCoverImageViewer"
                                        src="<?php echo e(asset('public/assets/admin/img/900x400/img1.jpg')); ?>" alt="Product thumbnail"/>
                                    </center>  
                            </div>

                            <small class="nav-subtitle text-secondary border-bottom"><?php echo e(__('messages.bank_info')); ?></small>
                            <br>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="name"><?php echo e(__('messages.bank_name')); ?> <span class="text-danger">*</span></label>
                                        <input type="text" name="bank_name" 
                                               class="form-control" id="name"
                                               value="<?php echo e(old('bank_name')); ?>"
                                               required>
                                    </div>
                                    <div class="col-md-12">
                                        <label for="name"><?php echo e(__('messages.branch')); ?> <?php echo e(__('messages.name')); ?><span class="text-danger">*</span></label>
                                        <input type="text" name="branch"  class="form-control"
                                               id="name"
                                               value="<?php echo e(old('branch')); ?>"
                                               required>
                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="account_no"><?php echo e(__('messages.holder_name')); ?> <span class="text-danger">*</span></label>
                                        <input type="text" name="holder_name" 
                                               class="form-control" id="account_no"
                                               value="<?php echo e(old('holder_name')); ?>"
                                               required>
                                    </div>
                                    <div class="col-md-12">
                                        <label for="account_no"><?php echo e(__('messages.account_no')); ?> <span class="text-danger">*</span></label>
                                        <input type="number" name="account_no" 
                                               class="form-control" id="account_no"
                                               value="<?php echo e(old('account_no')); ?>"
                                               required>
                                    </div>

                                </div>

                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="ifsc_code">IFSC Code<span class="text-danger">*</span></label>
                                        <input type="text" name="ifsc_code" 
                                               class="form-control" id="ifsc_code"
                                               value="<?php echo e(old('ifsc_code')); ?>"
                                               required>
                                    </div>
                                </div>
                            </div>

                            
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="input-label" for="minimum_delivery_time"><?php echo e(__('messages.minimum_delivery_time')); ?></label>
                                    <input type="text" name="minimum_delivery_time" class="form-control" placeholder="30" pattern="^[0-9]{2}$" required value="<?php echo e(old('minimum_delivery_time')); ?>">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="input-label" for="maximum_delivery_time"><?php echo e(__('messages.maximum_delivery_time')); ?></label>
                                    <input type="text" name="maximum_delivery_time" class="form-control" placeholder="40" pattern="[0-9]{2}" required value="<?php echo e(old('maximum_delivery_time')); ?>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="input-label"><?php echo e(__('messages.vendor')); ?> <?php echo e(__('messages.logo')); ?><small style="color: red"> ( <?php echo e(__('messages.ratio')); ?> 1:1 )</small></label>
                                <div class="custom-file">
                                    <input type="file" name="logo" id="customFileEg1" class="custom-file-input"
                                        accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" required>
                                    <label class="custom-file-label" for="logo"><?php echo e(__('messages.choose')); ?> <?php echo e(__('messages.file')); ?></label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-12" style="margin-top: auto;margin-bottom: auto;">
                            <div class="form-group" style="margin-bottom:0%;">                       
                                <center>
                                    <img style="height: 200px;border: 1px solid; border-radius: 10px;" id="viewer"
                                        src="<?php echo e(asset('public/assets/admin/img/400x400/img2.jpg')); ?>" />
                                </center>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-12">
                            <div class="form-group">
                                <label class="input-label" for="choice_zones"><?php echo e(__('messages.zone')); ?><span
                                        class="input-label-secondary" title="<?php echo e(__('messages.select_zone_for_map')); ?>"><img src="<?php echo e(asset('/public/assets/admin/img/info-circle.svg')); ?>" alt="<?php echo e(__('messages.select_zone_for_map')); ?>"></span></label>
                                <select name="zone_id" id="choice_zones" required
                                        class="form-control js-select2-custom"  data-placeholder="<?php echo e(__('messages.select')); ?> <?php echo e(__('messages.zone')); ?>">
                                        <option value="" selected disabled><?php echo e(__('messages.select')); ?> <?php echo e(__('messages.zone')); ?></option>
                                    <?php $__currentLoopData = \App\Models\Zone::all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $zone): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <?php if(isset(auth('admin')->user()->zone_id)): ?>
                                            <?php if(auth('admin')->user()->zone_id == $zone->id): ?>
                                                <option value="<?php echo e($zone->id); ?>" selected><?php echo e($zone->name); ?></option>
                                            <?php endif; ?>
                                        <?php else: ?>
                                        <option value="<?php echo e($zone->id); ?>"><?php echo e($zone->name); ?></option>
                                        <?php endif; ?>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="input-label" for="latitude"><?php echo e(__('messages.latitude')); ?><span
                                        class="input-label-secondary" title="<?php echo e(__('messages.restaurant_lat_lng_warning')); ?>"><img src="<?php echo e(asset('/public/assets/admin/img/info-circle.svg')); ?>" alt="<?php echo e(__('messages.restaurant_lat_lng_warning')); ?>"></span></label>
                                <input type="text" id="latitude"
                                       name="latitude" class="form-control"
                                       placeholder="Ex : -94.22213" value="<?php echo e(old('latitude')); ?>" required readonly>
                            </div>
                            <div class="form-group">
                                <label class="input-label" for="longitude"><?php echo e(__('messages.longitude')); ?><span
                                        class="input-label-secondary" title="<?php echo e(__('messages.restaurant_lat_lng_warning')); ?>"><img src="<?php echo e(asset('/public/assets/admin/img/info-circle.svg')); ?>" alt="<?php echo e(__('messages.restaurant_lat_lng_warning')); ?>"></span></label>
                                <input type="text" 
                                       name="longitude" class="form-control"
                                       placeholder="Ex : 103.344322" id="longitude" value="<?php echo e(old('longitude')); ?>" required readonly>
                            </div>
                        </div>

                        <div class="col-md-8 col-12">
                            <div id="map"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name"><?php echo e(__('messages.upload')); ?> <?php echo e(__('messages.cover')); ?> <?php echo e(__('messages.photo')); ?> <span class="text-danger">(<?php echo e(__('messages.ratio')); ?> 2:1)</span></label>
                        <div class="custom-file">
                            <input type="file" name="cover_photo" id="coverImageUpload" class="custom-file-input"
                                accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                            <label class="custom-file-label" for="customFileUpload"><?php echo e(__('messages.choose')); ?> <?php echo e(__('messages.file')); ?></label>
                        </div>
                    </div> 
                    <center>
                        <img style="max-width: 100%;border: 1px solid; border-radius: 10px; max-height:200px;" id="coverImageViewer"
                        src="<?php echo e(asset('public/assets/admin/img/900x400/img1.jpg')); ?>" alt="Product thumbnail"/>
                    </center>  
                    
                    
                    <br>
                    
                    <small class="nav-subtitle text-secondary border-bottom"><?php echo e(__('messages.login')); ?> <?php echo e(__('messages.info')); ?></small>
                    <br>
                    <div class="row">
                        <div class="col-md-4 col-12">
                            <div class="form-group">
                                <label class="input-label" for="email"><?php echo e(__('messages.email')); ?></label>
                                <input type="email" name="email" class="form-control" placeholder="Ex : ex@example.com"
                                value="<?php echo e(old('email')); ?>"  required>
                            </div>
                        </div>
                        <div class="col-md-4 col-12">
                            <div class="js-form-message form-group" x-data="{ show : false}">
                                <label class="input-label" for="signupSrPassword"><?php echo e(__('messages.password')); ?></label>

                                <div class="input-group input-group-merge">
                                    <input :type="show ? 'text' : 'password'"  class="js-toggle-password form-control" name="password" id="signupSrPassword" placeholder="<?php echo e(__('messages.password_length_placeholder',['length'=>'5+'])); ?>" aria-label="<?php echo e(__('messages.password_length_placeholder',['length'=>'5+'])); ?>" required
                                    data-msg="Your password is invalid. Please try again.">
                                    <div class="js-toggle-password-target-1 input-group-append">
                                        <a class="input-group-text" href="javascript:;" x-on:click="show = !show">
                                            <i class="" :class="show ? 's-toggle-passowrd-show-icon-2 tio-visible-outlined' : 's-toggle-passowrd-show-icon-2 tio-hidden-outlined'"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-12">
                            <div class="js-form-message form-group" x-data="{ show : false}">
                                <label class="input-label" for="signupSrConfirmPassword"><?php echo e(__('messages.confirm_password')); ?></label>
                                <div class="input-group input-group-merge">
                                <input  :type="show ? 'text' : 'password'"  class="js-toggle-password form-control" name="confirmPassword" id="signupSrConfirmPassword" placeholder="<?php echo e(__('messages.password_length_placeholder',['length'=>'5+'])); ?>" aria-label="<?php echo e(__('messages.password_length_placeholder',['length'=>'5+'])); ?>" required
                                        data-msg="Password does not match the confirm password.">
                                <div class="js-toggle-password-target-2 input-group-append">
                                    <a class="input-group-text" href="javascript:;" x-on:click="show = !show">
                                        <i class="" :class="show ? 's-toggle-passowrd-show-icon-2 tio-visible-outlined' : 's-toggle-passowrd-show-icon-2 tio-hidden-outlined'"></i>
                                    </a>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary"><?php echo e(__('messages.submit')); ?></button>
                </form>
            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startPush('script_2'); ?>
    <script>
      $(document).on('ready', function () {
        // INITIALIZATION OF SHOW PASSWORD
        // =======================================================
        $('.js-toggle-password').each(function () {
          new HSTogglePassword(this).init()
        });


        // INITIALIZATION OF FORM VALIDATION
        // =======================================================
        $('.js-validate').each(function() {
          $.HSCore.components.HSValidation.init($(this), {
            rules: {
              confirmPassword: {
                equalTo: '#signupSrPassword'
              }
            }
          });
        });
      });
    </script>
    <script>
        function readURL(input, viewer) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#'+viewer).attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#customFileEg1").change(function () {
            readURL(this, 'viewer');
        });

        $("#coverImageUpload").change(function () {
            readURL(this, 'coverImageViewer');
        });

        $("#aadhaar_front_image").change(function () {
            readURL(this, 'AadhaarFrontImageCoverImageViewer');
        });

        $("#aadhaar_back_image").change(function () {
            readURL(this, 'AadhaarBackImageCoverImageViewer');
        });

        $("#pan_card_image").change(function () {
            readURL(this, 'panCardCoverImageViewer');
        });

    </script>

    <script src="<?php echo e(asset('public/assets/admin/js/spartan-multi-image-picker.js')); ?>"></script>
    <script type="text/javascript">
        $(function () {
            $("#coba").spartanMultiImagePicker({
                fieldName: 'identity_image[]',
                maxCount: 5,
                rowHeight: '120px',
                groupClassName: 'col-lg-2 col-md-4 col-sm-4 col-6',
                maxFileSize: '',
                placeholderImage: {
                    image: '<?php echo e(asset('public/assets/admin/img/400x400/img2.jpg')); ?>',
                    width: '100%'
                },
                dropFileLabel: "Drop Here",
                onAddRow: function (index, file) {

                },
                onRenderedPreview: function (index) {

                },
                onRemoveRow: function (index) {

                },
                onExtensionErr: function (index, file) {
                    toastr.error('<?php echo e(__('messages.please_only_input_png_or_jpg_type_file')); ?>', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                },
                onSizeErr: function (index, file) {
                    toastr.error('<?php echo e(__('messages.file_size_too_big')); ?>', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            });
        });
    </script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=<?php echo e(\App\Models\BusinessSetting::where('key', 'map_api_key')->first()->value); ?>&callback=initMap&v=3.45.8"></script>
    <script> 
        <?php ($default_location=\App\Models\BusinessSetting::where('key','default_location')->first()); ?>
        <?php ($default_location=$default_location->value?json_decode($default_location->value, true):0); ?>
        let myLatlng = { lat: <?php echo e($default_location?$default_location['lat']:'23.757989'); ?>, lng: <?php echo e($default_location?$default_location['lng']:'90.360587'); ?> };
        let map = new google.maps.Map(document.getElementById("map"), {
                zoom: 13,
                center: myLatlng,
            });
        var zonePolygon = null;
        let infoWindow = new google.maps.InfoWindow({
                content: "Click the map to get Lat/Lng!",
                position: myLatlng,
            });
        var bounds = new google.maps.LatLngBounds();
        function initMap() {           
            // Create the initial InfoWindow.
            infoWindow.open(map);
             //get current location block
             infoWindow = new google.maps.InfoWindow();
            // Try HTML5 geolocation.
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(
                    (position) => {
                    myLatlng = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude,
                    };
                    infoWindow.setPosition(myLatlng);
                    infoWindow.setContent("Location found.");
                    infoWindow.open(map);
                    map.setCenter(myLatlng);
                },
                () => {
                    handleLocationError(true, infoWindow, map.getCenter());
                    }
                );
            } else {
            // Browser doesn't support Geolocation
                handleLocationError(false, infoWindow, map.getCenter());
            }
            //-----end block------
        }
        initMap();
        function handleLocationError(browserHasGeolocation, infoWindow, pos) {
            infoWindow.setPosition(pos);
            infoWindow.setContent(
                browserHasGeolocation
                ? "Error: The Geolocation service failed."
                : "Error: Your browser doesn't support geolocation."
            );
            infoWindow.open(map);
        }
        $('#choice_zones').on('change', function(){
            var id = $(this).val();
            $.get({
                url: '<?php echo e(url('/')); ?>/admin/zone/get-coordinates/'+id,
                dataType: 'json',
                success: function (data) {
                    if(zonePolygon)
                    {
                        zonePolygon.setMap(null);
                    }
                    zonePolygon = new google.maps.Polygon({
                        paths: data.coordinates,
                        strokeColor: "#FF0000",
                        strokeOpacity: 0.8,
                        strokeWeight: 2,
                        fillColor: 'white',
                        fillOpacity: 0,
                    });
                    zonePolygon.setMap(map);
                    zonePolygon.getPaths().forEach(function(path) {
                        path.forEach(function(latlng) {
                            bounds.extend(latlng);
                            map.fitBounds(bounds);
                        });
                    });
                    map.setCenter(data.center);
                    google.maps.event.addListener(zonePolygon, 'click', function (mapsMouseEvent) {
                        infoWindow.close();
                        // Create a new InfoWindow.
                        infoWindow = new google.maps.InfoWindow({
                        position: mapsMouseEvent.latLng,
                        content: JSON.stringify(mapsMouseEvent.latLng.toJSON(), null, 2),
                        });
                        var coordinates = JSON.stringify(mapsMouseEvent.latLng.toJSON(), null, 2);
                        var coordinates = JSON.parse(coordinates);

                        document.getElementById('latitude').value = coordinates['lat'];
                        document.getElementById('longitude').value = coordinates['lng'];
                        infoWindow.open(map);
                    });    
                },
            });
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\servicely-new\resources\views/admin-views/vendor/index.blade.php ENDPATH**/ ?>