@extends('layouts.admin.app')

@section('title',$vendor->names())

@push('css_or_js')
    <!-- Custom styles for this page -->
    <link href="{{asset('public/assets/admin/css/croppie.css')}}" rel="stylesheet">
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
@endpush

@section('content')
<div class="content container-fluid">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{__('messages.dashboard')}}</a></li>
            <li class="breadcrumb-item" aria-current="page">{{__('messages.vendor_view')}}</li>
        </ol>
    </nav>

    <!-- Page Header -->
    <div class="page-header">
        <div class="row">
            <div class="col-6">
                <h1 class="page-header-title">{{$vendor->name}}</h1>
            </div>
            <div class="col-6">
                @if($vendor->status)
                <a href="{{route('admin.vendor.edit',[$vendor->id])}}" class="btn btn-primary float-right">
                    <i class="tio-edit"></i> {{__('messages.edit')}} {{__('messages.restaurant')}}
                </a>
                @else
                    @if(!isset($vendor->status))
                    <a class="btn btn-danger text-capitalize font-weight-bold float-right" 
                    onclick="request_alert('{{route('admin.vendor.application',[$vendor['id'],0])}}','{{__('messages.you_want_to_deny_this_application')}}')"
                        href="javascript:">{{__('messages.deny')}}</a>
                    @endif
                    <a class="btn btn-primary text-capitalize font-weight-bold float-right mr-2"
                    onclick="request_alert('{{route('admin.vendor.application',[$vendor['id'],1])}}','{{__('messages.you_want_to_approve_this_application')}}')"
                        href="javascript:">{{__('messages.approve')}}</a>
                @endif
            </div>
        </div>
        @if($vendor->status)
        <!-- Nav Scroller -->
        <div class="js-nav-scroller hs-nav-scroller-horizontal">
            <!-- Nav -->
            <ul class="nav nav-tabs page-header-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="{{route('admin.vendor.view', $vendor->id)}}">{{__('messages.restaurant')}}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{route('admin.vendor.view', ['vendor'=>$vendor->id, 'tab'=> 'order'])}}"  aria-disabled="true">{{__('messages.order')}}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{route('admin.vendor.view', ['vendor'=>$vendor->id, 'tab'=> 'service'])}}"  aria-disabled="true">{{__('messages.service')}}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{route('admin.vendor.view', ['vendor'=>$vendor->id, 'tab'=> 'discount'])}}"  aria-disabled="true">{{__('messages.discount')}}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{route('admin.vendor.view', ['vendor'=>$vendor->id, 'tab'=> 'settings'])}}"  aria-disabled="true">{{__('messages.settings')}}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{route('admin.vendor.view', ['vendor'=>$vendor->id, 'tab'=> 'transaction'])}}"  aria-disabled="true">{{__('messages.transaction')}}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{route('admin.vendor.view', ['vendor'=>$vendor->id, 'tab'=> 'reviews'])}}"  aria-disabled="true">{{__('messages.reviews')}}</a>
                </li>
            </ul>
            <!-- End Nav -->
        </div>
        <!-- End Nav Scroller -->
        @endif
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
                                {{__('messages.collected_cash_by_restaurant')}}
                            </div>
                            <div
                                class="for-card-count">{{$wallet->collected_cash}}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer"  style="background: #8d8d8d; border:none;">
                        <a class="btn w-100" style="background: #f9fafc;" href="{{route('admin.account-transaction.index')}}" title="{{__('messages.goto')}} {{__('messages.account_transaction')}}">{{__('messages.collect_cash_from_restaurant')}}</a>
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
                                        class=" font-weight-bold for-card-text text-uppercase mb-1">{{__('messages.pending')}} {{__('messages.withdraw')}}</div>
                                    <div
                                        class="for-card-count">{{$wallet->pending_withdraw}}</div>
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
                                        class=" font-weight-bold for-card-text text-uppercase mb-1">{{__('messages.withdrawn')}}</div>
                                    <div
                                        class="for-card-count">{{$wallet->total_withdrawn}}</div>
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
                                        class=" for-card-text font-weight-bold  text-uppercase mb-1">{{__('messages.withdraw_able_balance')}}</div>
                                    <div
                                        class="for-card-count">{{$wallet->balance}}</div>
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
                                        class=" for-card-text font-weight-bold  text-uppercase mb-1">{{__('messages.total_earning')}}</div>
                                    <div
                                        class="for-card-count">{{$wallet->total_earning}}</div>
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
                        onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'"
                        src="{{asset('storage/app/public/restaurant')}}/{{$vendor->image}}"
                                alt="{{$vendor->names()}} Logo">
                        
                    </div>
                </div>

                <div class="col-md">
                    <ul class="list-unstyled list-unstyled-py-2 mb-0">
                    @php($ratings = $vendor->rating())
                    @php($five = $ratings[1])
                    @php($four = $ratings[2])
                    @php($three = $ratings[3])
                    @php($two = $ratings[4])
                    @php($one = $ratings[5])
                    @php($total_rating = $one+$two+$three+$four+$five)
                    @php($total_rating = $total_rating==0?1:$total_rating)
                    <!-- Review Ratings -->
                        <li class="d-flex align-items-center font-size-sm">
                            <span
                                class="mr-3">5 star</span>
                            <div class="progress flex-grow-1">
                                <div class="progress-bar" role="progressbar"
                                        style="width: {{($five/$total_rating)*100}}%;"
                                        aria-valuenow="{{($five/$total_rating)*100}}"
                                        aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <span class="ml-3">{{$five}}</span>
                        </li>
                        <!-- End Review Ratings -->

                        <!-- Review Ratings -->
                        <li class="d-flex align-items-center font-size-sm">
                            <span class="mr-3">4 star</span>
                            <div class="progress flex-grow-1">
                                <div class="progress-bar" role="progressbar"
                                        style="width: {{($four/$total_rating)*100}}%;"
                                        aria-valuenow="{{($four/$total_rating)*100}}"
                                        aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <span class="ml-3">{{$four}}</span>
                        </li>
                        <!-- End Review Ratings -->

                        <!-- Review Ratings -->
                        <li class="d-flex align-items-center font-size-sm">
                            <span class="mr-3">3 star</span>
                            <div class="progress flex-grow-1">
                                <div class="progress-bar" role="progressbar"
                                        style="width: {{($five/$total_rating)*100}}%;"
                                        aria-valuenow="{{($five/$total_rating)*100}}"
                                        aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <span class="ml-3">{{$three}}</span>
                        </li>
                        <!-- End Review Ratings -->

                        <!-- Review Ratings -->
                        <li class="d-flex align-items-center font-size-sm">
                            <span class="mr-3">2 star</span>
                            <div class="progress flex-grow-1">
                                <div class="progress-bar" role="progressbar"
                                        style="width: {{($two/$total_rating)*100}}%;"
                                        aria-valuenow="{{($two/$total_rating)*100}}"
                                        aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <span class="ml-3">{{$two}}</span>
                        </li>
                        <!-- End Review Ratings -->

                        <!-- Review Ratings -->
                        <li class="d-flex align-items-center font-size-sm">
                        
                            <span class="mr-3">1 star</span>
                            <div class="progress flex-grow-1">
                                <div class="progress-bar" role="progressbar"
                                        style="width: {{($one/$total_rating)*100}}%;"
                                        aria-valuenow="{{($one/$total_rating)*100}}"
                                        aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <span class="ml-3">{{$one}}</span>
                        </li>
                        <!-- End Review Ratings -->
                    </ul>
                </div>
                <div class="col-12">
                    <div class="row">
                        <div class="col-md-4 col-6">
                            <div class="card mt-2">
                                <div class="card-header">
                                {{__('messages.restaurant')}} {{__('messages.info')}}
                                </div>
                                <div class="card-body">
                                    <ul class="list-unstyled list-unstyled-py-3 text-dark mb-3">
                                        <li class="pt-2 pb-0">
                                            <small class="card-subtitle">Contact details</small>
                                        </li>
                                        <li>
                                            <i class="tio-city nav-icon"></i>
                                            {{__('messages.address')}} : {{$vendor->address}}
                                        </li>

                                        <li>
                                            <i class="tio-online nav-icon"></i>
                                            {{__('messages.email')}} : {{$vendor->email}}
                                        </li>
                                        <li>
                                            <i class="tio-android-phone-vs nav-icon"></i>
                                            {{__('messages.phone')}} : {{$vendor->phone}}
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8 col-6">
                            <div class="card mt-2">
                                <div class="card-header">
                                {{__('messages.restaurant')}} {{__('messages.location')}}
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
                            {{__('messages.owner')}} {{__('messages.info')}}
                        </div>
                        <div class="card-body ">
                            <div class="text-center">
                                <div class="avatar avatar-xxl avatar-circle avatar-border-lg">
                                    <img class="avatar-img" onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'"
                                src="{{asset('storage/app/public/vendor')}}/{{$vendor->image}}" alt="Image Description">
                                </div>
                            
                            
                                <ul class="list-unstyled list-unstyled-py-3 text-dark mb-3">
                                    <li>
                                        <i class="tio-user-outlined nav-icon"></i>
                                        {{$vendor->f_name}} {{$vendor->l_name}}
                                    </li>
                                    <li>
                                        <i class="tio-online nav-icon"></i>
                                        {{$vendor->email}}
                                    </li>
                                    <li>
                                        <i class="tio-android-phone-vs nav-icon"></i>
                                    {{$vendor->phone}}
                                    </li>

                                    <li>
                                        KYC: 
                                        {{$vendor->kyc}}
                                    </li>

                                    <li>
                                        ACN : 
                                        {{$vendor->aadhaar_card_number}}
                                    </li>


                                    <li>
                                       PCN : 
                                        {{$vendor->pan_card_number}}
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
                                            <small class="card-subtitle">{{__('messages.bank_info')}}</small>
                                        </li>
                                        @if($vendor->bank_name)
                                        <li class="pb-1 pt-1">
                                            {{__('messages.bank_name')}}: {{$vendor->bank_name ? $vendor->bank_name : 'No Data found'}}
                                        </li>
                                        <li class="pb-1 pt-1">
                                            {{__('messages.branch')}}  : {{$vendor->branch ? $vendor->branch : 'No Data found'}}
                                        </li>
                                        <li class="pb-1 pt-1">
                                            {{__('messages.holder_name')}} : {{$vendor->holder_name ? $vendor->holder_name : 'No Data found'}}
                                        </li>
                                        <li class="pb-1 pt-1">
                                            {{__('messages.account_no')}}  : {{$vendor->account_no ? $vendor->account_no : 'No Data found'}}
                                        </li>
                                        @else
                                        <li class="my-auto">
                                            <center class="card-subtitle">No Data found</center>
                                        </li>
                                        @endif
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
                                    <img class="avatar-img" onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'"
                                src="{{asset('storage/app/public/restaurant/identity/')}}/{{$vendor->aadhaar_front_image}}" alt="Image Description">
                            </div>
                    </div>
                </section>

                <section class="card">
                        <div class="card-header">
                            Aadharr Back Image
                        </div>
                        <div class="card-body ">
                         <div class="avatar avatar-xxl avatar-border-lg">
                                    <img class="avatar-img" onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'"
                                src="{{asset('storage/app/public/restaurant/identity/')}}/{{$vendor->aadhaar_back_image}}" alt="Image Description">
                            </div>
                    </div>
                </section>


                <section class="card">
                        <div class="card-header">
                            Pan Card Image
                        </div>
                        <div class="card-body ">
                         <div class="avatar avatar-xxl avatar-border-lg">
                                    <img class="avatar-img" onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'"
                                src="{{asset('storage/app/public/restaurant/identity/')}}/{{$vendor->pan_card_image}}" alt="Image Description">
                            </div>
                    </div>
                </section>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script_2')
    <!-- Page level plugins -->
    <script>
        // Call the dataTables jQuery plugin
        $(document).ready(function () {
            $('#dataTable').DataTable();
        });
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key={{\App\Models\BusinessSetting::where('key', 'map_api_key')->first()->value}}&callback=initMap&v=3.45.8" ></script>
    <script>
        const myLatLng = { lat: {{$vendor->latitude}}, lng: {{$vendor->longitude}} };
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
                title: "{{$vendor->name}}",
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
            title: '{{__('messages.are_you_sure')}}',
            text: message,
            type: 'warning',
            showCancelButton: true,
            cancelButtonColor: 'default',
            confirmButtonColor: '#FC6A57',
            cancelButtonText: '{{__('messages.no')}}',
            confirmButtonText: '{{__('messages.yes')}}',
            reverseButtons: true
        }).then((result) => {
            if (result.value) {
                location.href = url;
            }
        })
    }
    </script>
@endpush
