@extends('layouts.admin.app')

@section('title',$vendor->names()."'s Settings")

@push('css_or_js')
    <!-- Custom styles for this page -->
    <link href="{{asset('public/assets/admin/css/croppie.css')}}" rel="stylesheet">

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
                <a href="{{route('admin.vendor.edit',[$vendor->id])}}" class="btn btn-primary float-right">
                    <i class="tio-edit"></i> {{__('messages.edit')}} {{__('messages.restaurant')}}
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
                    <a class="nav-link" href="{{route('admin.vendor.view', $vendor->id)}}">{{__('messages.restaurant')}}</a>
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
                    <a class="nav-link active" href="{{route('admin.vendor.view', ['vendor'=>$vendor->id, 'tab'=> 'settings'])}}"  aria-disabled="true">{{__('messages.settings')}}</a>
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
    </div>
        <!-- End Page Header -->
    <!-- Page Heading -->
    <div class="tab-content">
        <div class="tab-pane fade show active" id="vendor">
            <div class="row pt-2" >
                <div class="col-md-12">
                    <div class="card h-100">
                        <div class="card-header">
                            {{__('messages.restaurant')}} {{__('messages.settings')}}
                        </div>
                        <div class="card-body">
                            <div class="row justify-content-md-center">
                                <div class="col-xl-4 col-md-4 col-sm-6 col-6">
                                    <div class="form-group">
                                        <label class="toggle-switch toggle-switch-sm d-flex justify-content-between border border-secondary rounded px-4 form-control" for="food_section">
                                        <span class="pr-2">{{__('messages.Service_section')}}<span class="input-label-secondary" title="{{__('messages.show_hide_food_menu')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.show_hide_food_menu')}}"></span> :</span> 
                                            <input type="checkbox" class="toggle-switch-input" onclick="location.href='{{route('admin.vendor.toggle-settings',[$vendor->id,$vendor->service_section?0:1, 'service_section'])}}'" name="service_section" id="food_section" {{$vendor->service_section?'checked':''}}>
                                            <span class="toggle-switch-label text">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>
                                    </div>
                                </div>
                               {{--  <div class="col-xl-4 col-md-4 col-sm-6 col-6">
                                    <div class="form-group">
                                        <label class="toggle-switch toggle-switch-sm d-flex justify-content-between border border-secondary rounded px-4 form-control" for="free_delivery">
                                        <span class="pr-2">{{__('messages.free_delivery')}}:</span> 
                                            <input type="checkbox" class="toggle-switch-input" onclick="location.href='{{route('admin.vendor.toggle-settings',[$vendor->id,$vendor->free_delivery?0:1, 'free_delivery'])}}'" id="free_delivery" {{$vendor->free_delivery?'checked':''}}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>
                                    </div>
                                </div>
 --}}
                                <div class="col-xl-4 col-md-4 col-sm-6 col-6">
                                    <div class="form-group">
                                        <label class="toggle-switch toggle-switch-sm d-flex justify-content-between border border-secondary rounded px-4 form-control" for="schedule_order">
                                        <span class="pr-2">{{__('messages.scheduled')}} {{__('messages.order')}}:</span> 
                                            <input type="checkbox" class="toggle-switch-input" onclick="location.href='{{route('admin.vendor.toggle-settings',[$vendor->id,$vendor->schedule_order?0:1, 'schedule_order'])}}'" id="schedule_order" {{$vendor->schedule_order?'checked':''}}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-xl-4 col-md-4 col-sm-6 col-6">
                                    <div class="form-group">
                                        <label class="toggle-switch toggle-switch-sm d-flex justify-content-between border border-secondary rounded px-4 form-control" for="reviews_section">
                                        <span class="pr-2">{{__('messages.reviews')}} {{__('messages.panel')}}<span class="input-label-secondary" title="{{__('messages.show_hide_reviews_menu')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.show_hide_food_menu')}}"></span> :</span> 
                                            <input type="checkbox" class="toggle-switch-input" onclick="location.href='{{route('admin.vendor.toggle-settings',[$vendor->id,$vendor->reviews_section?0:1, 'reviews_section'])}}'" name="reviews_section" id="reviews_section" {{$vendor->reviews_section?'checked':''}}>
                                            <span class="toggle-switch-label text">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>
                                    </div>
                                </div>

                               {{--  <div class="col-xl-4 col-md-4 col-sm-6 col-6">
                                    <div class="form-group">
                                        <label class="toggle-switch toggle-switch-sm d-flex justify-content-between border border-secondary rounded px-4 form-control" for="delivery">
                                            <span class="pr-2">{{__('messages.delivery')}} :</span> 
                                            <input type="checkbox" name="delivery" class="toggle-switch-input" onclick="location.href='{{route('admin.vendor.toggle-settings',[$vendor->id,$vendor->delivery?0:1, 'delivery'])}}'" id="delivery" {{$vendor->delivery?'checked':''}}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>
                                    </div>
                                </div> --}}
                                {{-- <div class="col-xl-4 col-md-4 col-sm-6 col-6">
                                    <div class="form-group">
                                        <label class="toggle-switch toggle-switch-sm d-flex justify-content-between border border-secondary rounded px-4 form-control" for="take_away">
                                        <span class="pr-2 text-capitalize">{{__('messages.take_away')}}:</span> 
                                            <input type="checkbox" class="toggle-switch-input" onclick="location.href='{{route('admin.vendor.toggle-settings',[$vendor->id,$vendor->take_away?0:1, 'take_away'])}}'" id="take_away" {{$vendor->take_away?'checked':''}}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>
                                    </div>
                                </div> --}}
                               {{--  <div class="col-xl-4 col-md-4 col-sm-6 col-6">
                                    <div class="form-group">
                                        <label class="toggle-switch toggle-switch-sm d-flex justify-content-between border border-secondary rounded px-4 form-control" for="self_delivery_system">
                                        <span class="pr-2 text-capitalize">{{__('messages.self_delivery_system')}}:</span> 
                                            <input type="checkbox" class="toggle-switch-input" onclick="location.href='{{route('admin.vendor.toggle-settings',[$vendor->id,$vendor->self_delivery_system?0:1, 'self_delivery_system'])}}'" id="self_delivery_system" {{$vendor->self_delivery_system?'checked':''}}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>
                                    </div>
                                </div> --}}
                               {{--  <div class="col-xl-4 col-md-4 col-sm-6 col-6">
                                    <div class="form-group">
                                        <label class="toggle-switch toggle-switch-sm d-flex justify-content-between border border-secondary rounded px-4 form-control" for="pos_system">
                                        <span class="pr-2 text-capitalize">{{__('messages.pos_system')}}:</span> 
                                            <input type="checkbox" class="toggle-switch-input" onclick="location.href='{{route('admin.vendor.toggle-settings',[$vendor->id,$vendor->pos_system?0:1, 'pos_system'])}}'" id="pos_system" {{$vendor->pos_system?'checked':''}}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>
                                    </div>
                                </div> --}}
                                @if ($toggle_veg_non_veg)
                                <div class="col-xl-4 col-md-4 col-sm-6 col-6">
                                    <div class="form-group">
                                        <label class="toggle-switch toggle-switch-sm d-flex justify-content-between border border-secondary rounded px-4 form-control" for="veg">
                                        <span class="pr-2 text-capitalize">{{__('messages.veg')}}:</span> 
                                            <input type="checkbox" class="toggle-switch-input" onclick="location.href='{{route('admin.vendor.toggle-settings',[$vendor->id,$vendor->veg?0:1, 'veg'])}}'" id="veg" {{$vendor->veg?'checked':''}}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-xl-4 col-md-4 col-sm-6 col-6">
                                    <div class="form-group">
                                        <label class="toggle-switch toggle-switch-sm d-flex justify-content-between border border-secondary rounded px-4 form-control" for="non_veg">
                                        <span class="pr-2 text-capitalize">{{__('messages.non_veg')}}:</span> 
                                            <input type="checkbox" class="toggle-switch-input" onclick="location.href='{{route('admin.vendor.toggle-settings',[$vendor->id,$vendor->non_veg?0:1, 'non_veg'])}}'" id="non_veg" {{$vendor->non_veg?'checked':''}}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>
                                    </div>
                                </div>
                                @endif
                            </div>
                            <form action="{{route('admin.vendor.update-settings',[$vendor['id']])}}" method="post"
                                enctype="multipart/form-data">
                                @csrf 
                                <div class="row">
                                    <div class="col-md-4 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label class="input-label  text-capitalize" for="title">{{__('messages.opening')}} {{__('messages.time')}}</label>
                                            <input type="time" id="closeing_time" class="form-control" name="opening_time" value="{{$vendor->opening_time?$vendor->opening_time:''}}">
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-12">
                                        <label class="input-label  text-capitalize" for="title">{{__('messages.closing')}} {{__('messages.time')}}</label>
                                        <input type="time" id="closeing_time" class="form-control"  name="closeing_time" value="{{$vendor->closeing_time?$vendor->closeing_time:''}}">
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label class="input-label text-capitalize" for="title">{{__('messages.minimum')}} {{__('messages.order')}} {{__('messages.amount')}}</label>
                                            <input type="number" name="minimum_order" step="0.01" min="0" max="100000" class="form-control" placeholder="100" value="{{$vendor->minimum_order??'0'}}"> 
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label class="input-label" for="minimum_delivery_time">{{__('messages.minimum_delivery_time')}}</label>
                                        <input type="text" name="minimum_delivery_time" class="form-control" placeholder="30" pattern="^[0-9]{2}$" required value="{{explode('-',$vendor->delivery_time)[0]}}">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="input-label" for="maximum_delivery_time">{{__('messages.maximum_delivery_time')}}</label>
                                        <input type="text" name="maximum_delivery_time" class="form-control" placeholder="40" pattern="[0-9]{2}" required value="{{explode('-',$vendor->delivery_time)[1]}}">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6"> 
                                        <div class="form-group p-2 border">
                                            <label class="d-flex justify-content-between switch toggle-switch-sm text-dark" for="comission_status">
                                                <span>{{__('messages.admin_commission')}}(%) <span class="input-label-secondary" title="{{__('messages.if_sales_commission_disabled_system_default_will_be_applicable')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.if_sales_commission_disabled_system_default_will_be_applicable')}}"></span></span>
                                                <input type="checkbox" class="toggle-switch-input" name="comission_status" id="comission_status" value="1" {{isset($vendor->comission)?'checked':''}}>
                                                <span class="toggle-switch-label">
                                                    <span class="toggle-switch-indicator"></span>
                                                </span>
                                            </label>
                                            <input type="number" id="comission" min="0" max="10000" step="0.01" name="comission" class="form-control" required value="{{$vendor->comission??'0'}}" {{isset($vendor->comission)?'':'readonly'}}>
                                        </div>
                                    </div>
                                    <div class="col-6"> 
                                        <div class="form-group p-2 border">
                                            <label class="d-flex justify-content-between switch toggle-switch-sm text-dark" for="tax">
                                                <span>{{__('messages.tax')}}(%)</span>
                                            </label>
                                            <input type="number" id="tax" min="0" max="10000" step="0.01" name="tax" class="form-control" required value="{{$vendor->tax??'0'}}" {{isset($vendor->tax)?'':'readonly'}}>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary">{{__('messages.update')}}</button>
                            </form>
                        </div>
                    </div>
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
            $("#comission_status").on('change', function(){
                if($("#comission_status").is(':checked')){
                    $('#comission').removeAttr('readonly');
                } else {
                    $('#comission').attr('readonly', true);
                    $('#comission').val('0');
                }
            });

        });
    </script>
@endpush
