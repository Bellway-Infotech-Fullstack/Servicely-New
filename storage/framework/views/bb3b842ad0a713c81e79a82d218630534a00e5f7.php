<?php $__env->startSection('title',__('messages.dashboard')); ?>

<?php $__env->startPush('css_or_js'); ?>
    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
    <style>
        .grid-card {
            border: 2px solid #00000012;
            border-radius: 10px;
            padding: 10px;
        }

        .label_1 {
            position: absolute;
            font-size: 10px;
            background: #865439;
            color: #ffffff;
            width: 60px;
            padding: 2px;
            font-weight: bold;
            border-radius: 6px;
        }
    </style>
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
    <div class="content container-fluid">
        <?php if(auth('vendor')->check()): ?>
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title">
                        <?php echo e(__('messages.dashboard')); ?>


                        <span class="float-right" style="font-size: 14px;color: gray">
                            <?php echo e(__('messages.followup')); ?>

                             
                        </span>
                    </h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->

        <div class="card mb-3">
            <div class="card-body">
                <div class="row gx-2 gx-lg-3 mb-2">
                    <div class="col-9">
                        <h4><i style="font-size: 30px"
                               class="tio-chart-bar-4"></i><?php echo e(__('messages.dashboard_order_statistics')); ?></h4>
                    </div>
                    <div class="col-3">
                        <select class="custom-select" name="statistics_type" onchange="order_stats_update(this.value)">
                            <option
                                value="overall" <?php echo e($params['statistics_type'] == 'overall'?'selected':''); ?>>
                                Overall Statistics
                            </option>
                            <option
                                value="today" <?php echo e($params['statistics_type'] == 'today'?'selected':''); ?>>
                                Today's Statistics
                            </option>
                            <option
                                value="this_month" <?php echo e($params['statistics_type'] == 'this_month'?'selected':''); ?>>
                                This Month's Statistics
                            </option>
                        </select>
                    </div>
                </div>
                <div class="row gx-2 gx-lg-3" id="order_stats">

                    <?php echo $__env->make('vendor-views.partials._dashboard-order-stats',['data'=>$data], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                </div>
            </div>
        </div>

        <div class="row gx-2 gx-lg-3">
            <div class="col-lg-12 mb-3 mb-lg-12">
                <!-- Card -->
                <div class="card h-100">
                    <!-- Body -->
                    <div class="card-body">
                        <div class="row mb-4">
                            <div class="col-sm mb-2 mb-sm-0">
                                <div class="d-flex align-items-center">
                                    <?php ($amount=array_sum($earning)); ?>
                                    <span class="h3 mb-0">
                                        <span class="legend-indicator bg-primary"
                                              style="background-color: #511281!important;"></span>
                                        <?php echo e(__('messages.total_earning')); ?> : <?php echo e(\App\CentralLogics\Helpers::format_currency(array_sum($earning))); ?>

                                    </span>
                                </div>
                                <div class="d-flex align-items-center mt-2 mb-2">
                                    <span class="h5 mb-0">
                                        <span class="legend-indicator bg-primary"
                                              style="background-color: #4CA1A3!important;"></span>
                                        <?php echo e(__('messages.commission_given')); ?> : <?php echo e(\App\CentralLogics\Helpers::format_currency(array_sum($commission))); ?>

                                    </span>
                                </div>
                            </div>

                            <div class="col-sm-auto align-self-sm-end">
                                <!-- Legend Indicators -->
                                <div class="row font-size-sm">
                                    <div class="col-auto">
                                        <h4>
                                            <?php echo e(__('messages.yearly_statistics')); ?>

                                            <i class="tio-chart-bar-4" style="font-size: 60px"></i>
                                        </h4>
                                    </div>
                                </div>
                                <!-- End Legend Indicators -->
                            </div>
                        </div>
                        <!-- End Row -->

                        <!-- Bar Chart -->
                        <div class="chartjs-custom">
                            <canvas id="updatingData" style="height: 20rem;"
                                    data-hs-chartjs-options='{
                            "type": "bar",
                            "data": {
                              "labels": ["Jan","Feb","Mar","April","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],
                              "datasets": [{
                                "data": [<?php echo e($earning[1]); ?>,<?php echo e($earning[2]); ?>,<?php echo e($earning[3]); ?>,<?php echo e($earning[4]); ?>,<?php echo e($earning[5]); ?>,<?php echo e($earning[6]); ?>,<?php echo e($earning[7]); ?>,<?php echo e($earning[8]); ?>,<?php echo e($earning[9]); ?>,<?php echo e($earning[10]); ?>,<?php echo e($earning[11]); ?>,<?php echo e($earning[12]); ?>],
                                "backgroundColor": "#511281",
                                "hoverBackgroundColor": "#511281",
                                "borderColor": "#511281"
                              },
                              {
                                "data": [<?php echo e($commission[1]); ?>,<?php echo e($commission[2]); ?>,<?php echo e($commission[3]); ?>,<?php echo e($commission[4]); ?>,<?php echo e($commission[5]); ?>,<?php echo e($commission[6]); ?>,<?php echo e($commission[7]); ?>,<?php echo e($commission[8]); ?>,<?php echo e($commission[9]); ?>,<?php echo e($commission[10]); ?>,<?php echo e($commission[11]); ?>,<?php echo e($commission[12]); ?>],
                                "backgroundColor": "#4CA1A3",
                                "borderColor": "#4CA1A3"
                              }]
                            },
                            "options": {
                              "scales": {
                                "yAxes": [{
                                  "gridLines": {
                                    "color": "#e7eaf3",
                                    "drawBorder": false,
                                    "zeroLineColor": "#e7eaf3"
                                  },
                                  "ticks": {
                                    "beginAtZero": true,
                                    "stepSize": <?php echo e($amount>1?20000:1); ?>,
                                    "fontSize": 12,
                                    "fontColor": "#97a4af",
                                    "fontFamily": "Open Sans, sans-serif",
                                    "padding": 10,
                                    "postfix": "<?php echo e(\App\CentralLogics\Helpers::currency_symbol()); ?>"
                                  }
                                }],
                                "xAxes": [{
                                  "gridLines": {
                                    "display": false,
                                    "drawBorder": false
                                  },
                                  "ticks": {
                                    "fontSize": 12,
                                    "fontColor": "#97a4af",
                                    "fontFamily": "Open Sans, sans-serif",
                                    "padding": 5
                                  },
                                  "categoryPercentage": 0.5,
                                  "maxBarThickness": "10"
                                }]
                              },
                              "cornerRadius": 2,
                              "tooltips": {
                                "prefix": " ",
                                "hasIndicator": true,
                                "mode": "index",
                                "intersect": false
                              },
                              "hover": {
                                "mode": "nearest",
                                "intersect": true
                              }
                            }
                          }'></canvas>
                        </div>
                        <!-- End Bar Chart -->
                    </div>
                    <!-- End Body -->
                </div>
                <!-- End Card -->
            </div>

            <div class="col-lg-6 mt-3">
                <!-- Card -->
                <div class="card h-100" id="top-selling-foods-view">
                    <?php echo $__env->make('vendor-views.partials._top-selling-foods',['top_sell'=>$data['top_sell']], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                </div>
                <!-- End Card -->
            </div>

            <div class="col-lg-6 mt-3">
                <!-- Card -->
                <div class="card h-100" id="top-rated-foods-view">
                    <?php echo $__env->make('vendor-views.partials._most-rated-foods',['most_rated_foods'=>$data['most_rated_foods']], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                </div>
                <!-- End Card -->
            </div>


        </div>
        <!-- End Row -->
        <?php else: ?>
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><?php echo e(__('messages.welcome')); ?>, <?php echo e(auth('vendor_employee')->user()->f_name); ?>.</h1>
                    <p class="page-header-text"><?php echo e(__('messages.employee_welcome_message')); ?></p>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <?php endif; ?>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('script'); ?>
    <script src="<?php echo e(asset('public/assets/admin')); ?>/vendor/chart.js/dist/Chart.min.js"></script>
    <script src="<?php echo e(asset('public/assets/admin')); ?>/vendor/chart.js.extensions/chartjs-extensions.js"></script>
    <script
        src="<?php echo e(asset('public/assets/admin')); ?>/vendor/chartjs-plugin-datalabels/dist/chartjs-plugin-datalabels.min.js"></script>
<?php $__env->stopPush(); ?>


<?php $__env->startPush('script_2'); ?>
    <script>
        // INITIALIZATION OF CHARTJS
        // =======================================================
        Chart.plugins.unregister(ChartDataLabels);

        $('.js-chart').each(function () {
            $.HSCore.components.HSChartJS.init($(this));
        });

        var updatingChart = $.HSCore.components.HSChartJS.init($('#updatingData'));
    </script>

    <script>
        function order_stats_update(type) {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '<?php echo e(route('vendor.dashboard.order-stats')); ?>',
                data: {
                    statistics_type: type
                },
                beforeSend: function () {
                    $('#loading').show()
                },
                success: function (data) {
                    insert_param('statistics_type',type);
                    $('#order_stats').html(data.view)
                },
                complete: function () {
                    $('#loading').hide()
                }
            });
        }
    </script>

    <script>
        function insert_param(key, value) {
            key = encodeURIComponent(key);
            value = encodeURIComponent(value);
            // kvp looks like ['key1=value1', 'key2=value2', ...]
            var kvp = document.location.search.substr(1).split('&');
            let i = 0;

            for (; i < kvp.length; i++) {
                if (kvp[i].startsWith(key + '=')) {
                    let pair = kvp[i].split('=');
                    pair[1] = value;
                    kvp[i] = pair.join('=');
                    break;
                }
            }
            if (i >= kvp.length) {
                kvp[kvp.length] = [key, value].join('=');
            }
            // can return this or...
            let params = kvp.join('&');
            // change url page with new params
            window.history.pushState('page2', 'Title', '<?php echo e(url()->current()); ?>?' + params);
        }
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.vendor.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\servicely-new\resources\views/vendor-views/dashboard.blade.php ENDPATH**/ ?>