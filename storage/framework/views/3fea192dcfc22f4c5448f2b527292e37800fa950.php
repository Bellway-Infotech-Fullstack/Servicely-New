<?php $__env->startSection('title',$vendor->names()); ?>

<?php $__env->startPush('css_or_js'); ?>
    <!-- Custom styles for this page -->
    <link href="<?php echo e(asset('public/assets/admin/css/croppie.css')); ?>" rel="stylesheet">
    <style>
        .flex-item{
            padding: 10px;
            flex: 20%;
        }

        /* Responsive layout - makes a one column-layout instead of a two-column layout */
        @media (max-width: 768px) {
            .flex-item{
                flex: 50%;
            }
        }

        @media (max-width: 480px) {
            .flex-item{
                flex: 100%;
            }
        }
    </style>
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
                <?php if($vendor->status): ?>
                <a href="<?php echo e(route('admin.vendor.edit',[$vendor->id])); ?>" class="btn btn-primary float-right">
                    <i class="tio-edit"></i> <?php echo e(__('messages.edit')); ?> <?php echo e(__('messages.restaurant')); ?>

                </a>
                <?php else: ?>
                    <?php if(!isset($vendor->status)): ?>
                    <a class="btn btn-danger text-capitalize font-weight-bold float-right" 
                    onclick="request_alert('<?php echo e(route('admin.vendor.application',[$vendor['id'],0])); ?>','<?php echo e(__('messages.you_want_to_deny_this_application')); ?>')"
                        href="javascript:"><?php echo e(__('messages.deny')); ?></a>
                    <?php endif; ?>
                    <a class="btn btn-primary text-capitalize font-weight-bold float-right mr-2"
                    onclick="request_alert('<?php echo e(route('admin.vendor.application',[$vendor['id'],1])); ?>','<?php echo e(__('messages.you_want_to_approve_this_application')); ?>')"
                        href="javascript:"><?php echo e(__('messages.approve')); ?></a>
                <?php endif; ?>
            </div>
        </div>
        <?php if($vendor->status): ?>
        <!-- Nav Scroller -->
        <div class="js-nav-scroller hs-nav-scroller-horizontal">
            <!-- Nav -->
            <ul class="nav nav-tabs page-header-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="<?php echo e(route('admin.vendor.view', $vendor->id)); ?>"><?php echo e(__('messages.restaurant')); ?></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<?php echo e(route('admin.vendor.view', ['vendor'=>$vendor->id, 'tab'=> 'order'])); ?>"  aria-disabled="true"><?php echo e(__('messages.order')); ?></a>
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
        <?php endif; ?>
    </div>
        <!-- End Page Header -->
    <!-- Page Heading -->
    <div class="row my-2">
        <!-- Earnings (Monthly) Card Example -->
        <div class="for-card col-md-4 mb-1">
            <div class="card for-card-body-2 shadow h-100 text-white"  style="background: #8d8d8d;">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="font-weight-bold  text-uppercase for-card-text mb-1">
                                <?php echo e(__('messages.collected_cash_by_restaurant')); ?>

                            </div>
                            <div
                                class="for-card-count"><?php echo e($wallet->collected_cash); ?>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer"  style="background: #8d8d8d; border:none;">
                        <a class="btn w-100" style="background: #f9fafc;" href="<?php echo e(route('admin.account-transaction.index')); ?>" title="<?php echo e(__('messages.goto')); ?> <?php echo e(__('messages.account_transaction')); ?>"><?php echo e(__('messages.collect_cash_from_restaurant')); ?></a>
                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="row">
                <!-- Panding Withdraw Card Example -->
                <div class="for-card col-lg-6 col-md-6 col-sm-6 col-12 mb-1">
                    <div class="card  shadow h-100 for-card-body-3  badge-secondary" >
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div
                                        class=" font-weight-bold for-card-text text-uppercase mb-1"><?php echo e(__('messages.pending')); ?> <?php echo e(__('messages.withdraw')); ?></div>
                                    <div
                                        class="for-card-count"><?php echo e($wallet->pending_withdraw); ?></div>
                                </div>
                                <div class="col-auto for-margin">
                                    <i class="fas fa-money-bill fa-2x for-fa-3 text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Earnings (Monthly) Card Example -->
                <div class="for-card col-lg-6 col-md-6 col-sm-6 col-12 mb-1">
                    <div class="card  shadow h-100 for-card-body-3 text-white"  style="background: #2C2E43;">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div
                                        class=" font-weight-bold for-card-text text-uppercase mb-1"><?php echo e(__('messages.withdrawn')); ?></div>
                                    <div
                                        class="for-card-count"><?php echo e($wallet->total_withdrawn); ?></div>
                                </div>
                                <div class="col-auto for-margin">
                                    <i class="fas fa-money-bill fa-2x for-fa-3 text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Collected Cash Card Example -->
                <div class="for-card col-lg-6 col-md-6 col-sm-6 col-12 mb-1">
                    <div class="card r shadow h-100 for-card-body-4  badge-dark">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div
                                        class=" for-card-text font-weight-bold  text-uppercase mb-1"><?php echo e(__('messages.withdraw_able_balance')); ?></div>
                                    <div
                                        class="for-card-count"><?php echo e($wallet->balance); ?></div>
                                </div>
                                <div class="col-auto for-margin">
                                    <i class="fas fa-money-bill for-fa-fa-4  fa-2x text-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Pending Requests Card Example -->
                <div class="for-card col-lg-6 col-md-6 col-sm-6 col-12 mb-1">
                    <div class="card r shadow h-100 for-card-body-4 text-white" style="background:#362222;">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div
                                        class=" for-card-text font-weight-bold  text-uppercase mb-1"><?php echo e(__('messages.total_earning')); ?></div>
                                    <div
                                        class="for-card-count"><?php echo e($wallet->total_earning); ?></div>
                                </div>
                                <div class="col-auto for-margin">
                                    <i class="fas fa-money-bill for-fa-fa-4  fa-2x text-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
 
        </div>
    </div>
    <div class="card my-2">
        <div class="card-body">
            <div class="row align-items-md-center gx-md-5" id="restaurant_details">
                <div class="col-md-auto mb-3 mb-md-0">
                    <div class="d-flex align-items-center">
                        <img class="avatar avatar-xxl avatar-4by3 mr-4"
                        onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/img1.jpg')); ?>'"
                        src="<?php echo e(asset('storage/app/public/restaurant')); ?>/<?php echo e($vendor->image); ?>"
                                alt="<?php echo e($vendor->names()); ?> Logo">
                        
                    </div>
                </div>

                <div class="col-md">
                    <ul class="list-unstyled list-unstyled-py-2 mb-0">
                    <?php ($ratings = $vendor->rating()); ?>
                    <?php ($five = $ratings[1]); ?>
                    <?php ($four = $ratings[2]); ?>
                    <?php ($three = $ratings[3]); ?>
                    <?php ($two = $ratings[4]); ?>
                    <?php ($one = $ratings[5]); ?>
                    <?php ($total_rating = $one+$two+$three+$four+$five); ?>
                    <?php ($total_rating = $total_rating==0?1:$total_rating); ?>
                    <!-- Review Ratings -->
                        <li class="d-flex align-items-center font-size-sm">
                            <span
                                class="mr-3">5 star</span>
                            <div class="progress flex-grow-1">
                                <div class="progress-bar" role="progressbar"
                                        style="width: <?php echo e(($five/$total_rating)*100); ?>%;"
                                        aria-valuenow="<?php echo e(($five/$total_rating)*100); ?>"
                                        aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <span class="ml-3"><?php echo e($five); ?></span>
                        </li>
                        <!-- End Review Ratings -->

                        <!-- Review Ratings -->
                        <li class="d-flex align-items-center font-size-sm">
                            <span class="mr-3">4 star</span>
                            <div class="progress flex-grow-1">
                                <div class="progress-bar" role="progressbar"
                                        style="width: <?php echo e(($four/$total_rating)*100); ?>%;"
                                        aria-valuenow="<?php echo e(($four/$total_rating)*100); ?>"
                                        aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <span class="ml-3"><?php echo e($four); ?></span>
                        </li>
                        <!-- End Review Ratings -->

                        <!-- Review Ratings -->
                        <li class="d-flex align-items-center font-size-sm">
                            <span class="mr-3">3 star</span>
                            <div class="progress flex-grow-1">
                                <div class="progress-bar" role="progressbar"
                                        style="width: <?php echo e(($five/$total_rating)*100); ?>%;"
                                        aria-valuenow="<?php echo e(($five/$total_rating)*100); ?>"
                                        aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <span class="ml-3"><?php echo e($three); ?></span>
                        </li>
                        <!-- End Review Ratings -->

                        <!-- Review Ratings -->
                        <li class="d-flex align-items-center font-size-sm">
                            <span class="mr-3">2 star</span>
                            <div class="progress flex-grow-1">
                                <div class="progress-bar" role="progressbar"
                                        style="width: <?php echo e(($two/$total_rating)*100); ?>%;"
                                        aria-valuenow="<?php echo e(($two/$total_rating)*100); ?>"
                                        aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <span class="ml-3"><?php echo e($two); ?></span>
                        </li>
                        <!-- End Review Ratings -->

                        <!-- Review Ratings -->
                        <li class="d-flex align-items-center font-size-sm">
                        
                            <span class="mr-3">1 star</span>
                            <div class="progress flex-grow-1">
                                <div class="progress-bar" role="progressbar"
                                        style="width: <?php echo e(($one/$total_rating)*100); ?>%;"
                                        aria-valuenow="<?php echo e(($one/$total_rating)*100); ?>"
                                        aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <span class="ml-3"><?php echo e($one); ?></span>
                        </li>
                        <!-- End Review Ratings -->
                    </ul>
                </div>
                <div class="col-12">
                    <div class="row">
                        <div class="col-md-4 col-6">
                            <div class="card mt-2">
                                <div class="card-header">
                                <?php echo e(__('messages.restaurant')); ?> <?php echo e(__('messages.info')); ?>

                                </div>
                                <div class="card-body">
                                    <ul class="list-unstyled list-unstyled-py-3 text-dark mb-3">
                                        <li class="pt-2 pb-0">
                                            <small class="card-subtitle">Contact details</small>
                                        </li>
                                        <li>
                                            <i class="tio-city nav-icon"></i>
                                            <?php echo e(__('messages.address')); ?> : <?php echo e($vendor->address); ?>

                                        </li>

                                        <li>
                                            <i class="tio-online nav-icon"></i>
                                            <?php echo e(__('messages.email')); ?> : <?php echo e($vendor->email); ?>

                                        </li>
                                        <li>
                                            <i class="tio-android-phone-vs nav-icon"></i>
                                            <?php echo e(__('messages.phone')); ?> : <?php echo e($vendor->phone); ?>

                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8 col-6">
                            <div class="card mt-2">
                                <div class="card-header">
                                <?php echo e(__('messages.restaurant')); ?> <?php echo e(__('messages.location')); ?>

                                </div>
                                <div class="card-body pt-2 pb-2">
                                    <div id="map" style="height:180px; width:100%;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="row pt-4">
                <div class="col-md-4 col-sm-4 col-12">
                    <div class="card h-100">
                        <div class="card-header">
                            <?php echo e(__('messages.owner')); ?> <?php echo e(__('messages.info')); ?>

                        </div>
                        <div class="card-body ">
                            <div class="text-center">
                                <div class="avatar avatar-xxl avatar-circle avatar-border-lg">
                                    <img class="avatar-img" onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/img1.jpg')); ?>'"
                                src="<?php echo e(asset('storage/app/public/vendor')); ?>/<?php echo e($vendor->image); ?>" alt="Image Description">
                                </div>
                            
                            
                                <ul class="list-unstyled list-unstyled-py-3 text-dark mb-3">
                                    <li>
                                        <i class="tio-user-outlined nav-icon"></i>
                                        <?php echo e($vendor->f_name); ?> <?php echo e($vendor->l_name); ?>

                                    </li>
                                    <li>
                                        <i class="tio-online nav-icon"></i>
                                        <?php echo e($vendor->email); ?>

                                    </li>
                                    <li>
                                        <i class="tio-android-phone-vs nav-icon"></i>
                                    <?php echo e($vendor->phone); ?>

                                    </li>

                                    <li>
                                        KYC: 
                                        <?php echo e($vendor->kyc); ?>

                                    </li>

                                    <li>
                                        ACN : 
                                        <?php echo e($vendor->aadhaar_card_number); ?>

                                    </li>


                                    <li>
                                       PCN : 
                                        <?php echo e($vendor->pan_card_number); ?>

                                    </li>
                                </ul>
                            </div>  

                        </div>
                    </div>
                </div>
                <div class="col-md-8 col-sm-8 col-12">
                    <div class="row">
                        <div class="col-12">
                            <div class="card h-100">
                                <div class="card-body">
                                    <ul class="list-unstyled list-unstyled-py-3 text-dark mb-3">
                                        <li class="py-0 border-bottom">
                                            <small class="card-subtitle"><?php echo e(__('messages.bank_info')); ?></small>
                                        </li>
                                        <?php if($vendor->bank_name): ?>
                                        <li class="pb-1 pt-1">
                                            <?php echo e(__('messages.bank_name')); ?>: <?php echo e($vendor->bank_name ? $vendor->bank_name : 'No Data found'); ?>

                                        </li>
                                        <li class="pb-1 pt-1">
                                            <?php echo e(__('messages.branch')); ?>  : <?php echo e($vendor->branch ? $vendor->branch : 'No Data found'); ?>

                                        </li>
                                        <li class="pb-1 pt-1">
                                            <?php echo e(__('messages.holder_name')); ?> : <?php echo e($vendor->holder_name ? $vendor->holder_name : 'No Data found'); ?>

                                        </li>
                                        <li class="pb-1 pt-1">
                                            <?php echo e(__('messages.account_no')); ?>  : <?php echo e($vendor->account_no ? $vendor->account_no : 'No Data found'); ?>

                                        </li>
                                        <?php else: ?>
                                        <li class="my-auto">
                                            <center class="card-subtitle">No Data found</center>
                                        </li>
                                        <?php endif; ?>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>      
                </div>

                <div class="col-md-12">
                    
                   <section class="card">
                        <div class="card-header">
                            Aadharr Front Image
                        </div>
                        <div class="card-body ">
                         <div class="avatar avatar-xxl avatar-border-lg">
                                    <img class="avatar-img" onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/img1.jpg')); ?>'"
                                src="<?php echo e(asset('storage/app/public/restaurant/identity/')); ?>/<?php echo e($vendor->aadhaar_front_image); ?>" alt="Image Description">
                            </div>
                    </div>
                </section>

                <section class="card">
                        <div class="card-header">
                            Aadharr Back Image
                        </div>
                        <div class="card-body ">
                         <div class="avatar avatar-xxl avatar-border-lg">
                                    <img class="avatar-img" onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/img1.jpg')); ?>'"
                                src="<?php echo e(asset('storage/app/public/restaurant/identity/')); ?>/<?php echo e($vendor->aadhaar_back_image); ?>" alt="Image Description">
                            </div>
                    </div>
                </section>


                <section class="card">
                        <div class="card-header">
                            Pan Card Image
                        </div>
                        <div class="card-body ">
                         <div class="avatar avatar-xxl avatar-border-lg">
                                    <img class="avatar-img" onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/img1.jpg')); ?>'"
                                src="<?php echo e(asset('storage/app/public/restaurant/identity/')); ?>/<?php echo e($vendor->pan_card_image); ?>" alt="Image Description">
                            </div>
                    </div>
                </section>

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
    <script src="https://maps.googleapis.com/maps/api/js?key=<?php echo e(\App\Models\BusinessSetting::where('key', 'map_api_key')->first()->value); ?>&callback=initMap&v=3.45.8" ></script>
    <script>
        const myLatLng = { lat: <?php echo e($vendor->latitude); ?>, lng: <?php echo e($vendor->longitude); ?> };
        let map;
        initMap();
        function initMap() {
                 map = new google.maps.Map(document.getElementById("map"), {
                zoom: 15,
                center: myLatLng,
            });
            new google.maps.Marker({
                position: myLatLng,
                map,
                title: "<?php echo e($vendor->name); ?>",
            });
        }
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

    function request_alert(url, message) {
        Swal.fire({
            title: '<?php echo e(__('messages.are_you_sure')); ?>',
            text: message,
            type: 'warning',
            showCancelButton: true,
            cancelButtonColor: 'default',
            confirmButtonColor: '#FC6A57',
            cancelButtonText: '<?php echo e(__('messages.no')); ?>',
            confirmButtonText: '<?php echo e(__('messages.yes')); ?>',
            reverseButtons: true
        }).then((result) => {
            if (result.value) {
                location.href = url;
            }
        })
    }
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\servicely-new\resources\views/admin-views/vendor/view/index.blade.php ENDPATH**/ ?>