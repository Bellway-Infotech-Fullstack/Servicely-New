@extends('layouts.admin.app')

@section('title','Update service')

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link href="{{asset('public/assets/admin/css/tags-input.min.css')}}" rel="stylesheet">
@endpush

@section('content')
    @php($opening_time='')
    @php($closing_time='')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-edit"></i> {{__('messages.service')}} {{__('messages.update')}}</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <form action="javascript:" method="post" id="product_form"
                      enctype="multipart/form-data">
                    @csrf
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlSelect1">{{__('messages.restaurant')}}<span
                                        class="input-label-secondary"></span></label>
                                {{-- <select name="vendor_id" data-placeholder="{{__('messages.select')}} {{__('messages.restaurant')}}" class="js-data-example-ajax form-control" onchange="getRestaurantData('{{url('/')}}/admin/vendor/get-addons?data[]=0&vendor_id='+this.value,'add_on')"  title="Select Restaurant" required oninvalid="this.setCustomValidity('{{__('messages.please_select_restaurant')}}')">
                                @if(isset($product->restaurant))
                                <option value="{{$product->vendor_id}}" selected="selected">{{$product->restaurant->name}}</option>
                                @endif
                                </select> --}}

                                 <select name="vendor_id" data-placeholder="{{__('messages.select')}} {{__('messages.vendor')}}" 
                                 class="form-control">
                                            <option value="">Vendor</option>
                                            @foreach ($vendors as $vendor)

                                                @if($product->vendor_id == $vendor->id)
                                                      <option value="{{$vendor->id}}" selected="selected">{{$vendor->names()}}</option>
                                                @else
                                                    <option value="{{$vendor->id}}">{{ $vendor->names() }}</option>
                                                @endif
                                                
                                            @endforeach
                                </select>

                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.name')}}</label>
                                <input type="text" name="name" value="{{$product['name']}}" class="form-control" placeholder="New food" required>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3 col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.price')}}</label>
                                <input type="number" value="{{$product['price']}}" min="0" max="100000" name="price"
                                       class="form-control" step="0.01"
                                       placeholder="Ex : 100" required>
                            </div>
                        </div>

                        <div class="col-md-3 col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.discount')}} {{__('messages.type')}}</label>
                                <select name="discount_type" class="form-control js-select2-custom">
                                    <option value="percent" {{$product['discount_type']=='percent'?'selected':''}}>
                                        {{__('messages.percent')}}
                                    </option>
                                    <option value="amount" {{$product['discount_type']=='amount'?'selected':''}}>
                                        {{__('messages.amount')}}
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.discount')}}</label>
                                <input type="number" min="0" value="{{$product['discount']}}" max="100000"
                                       name="discount" class="form-control"
                                       placeholder="Ex : 100">
                            </div>
                        </div>

                       {{--  <div class="col-md-3 col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.item_type')}}</label>
                                <select name="veg" class="form-control js-select2-custom">
                                    <option value="1" {{$product['veg']==1?'selected':''}}>{{__('messages.veg')}}</option>
                                    <option value="0" {{$product['veg']==0?'selected':''}}>{{__('messages.non_veg')}}</option>
                                </select>
                            </div>
                        </div> --}}
                    </div>

                    <div class="row">
                        <div class="col-md-6 col-12">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlSelect1">{{__('messages.category')}}<span
                                        class="input-label-secondary">*</span></label>
                                <select name="category_id" id="category-id" class="form-control js-select2-custom"
                                        onchange="getRequest('{{url('/')}}/admin/food/get-categories?parent_id='+this.value,'sub-categories')">
                                    @foreach($categories as $category)
                                        <option
                                            value="{{$category['id']}}" {{ $category->id==$product_category[0]->id ? 'selected' : ''}} >{{$category['name']}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 col-12">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlSelect1">{{__('messages.sub_category')}}<span
                                        class="input-label-secondary" title="{{__('messages.category_required_warning')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.category_required_warning')}}"></span></label>
                                <select name="sub_category_id" id="sub-categories"
                                        data-id="{{count($product_category)>=2?$product_category[1]->id:''}}"
                                        class="form-control js-select2-custom">

                                </select>
                            </div>
                        </div>
                        {{--<div class="col-md-4 col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlSelect1">Sub Sub Category<span
                                        class="input-label-secondary"></span></label>
                                <select name="sub_sub_category_id" id="sub-sub-categories"
                                        data-id="{{count($product_category)>=3?$product_category[2]->id:''}}"
                                        class="form-control js-select2-custom">

                                </select>
                            </div>
                        </div>--}}
                    </div>

                   {{--  <div class="row" style="border: 1px solid #80808045; border-radius: 10px;padding-top: 10px;margin: 1px">
                        <div class="col-12">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlSelect1">{{__('messages.attribute')}}<span
                                        class="input-label-secondary"></span></label>
                                <select name="attribute_id[]" id="choice_attributes"
                                        class="form-control js-select2-custom"
                                        multiple="multiple">
                                    @foreach(\App\Models\Attribute::orderBy('name')->get() as $attribute)
                                        <option value="{{$attribute['id']}}" {{in_array($attribute->id,json_decode($product['attributes'],true))?'selected':''}}>{{$attribute['name']}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-12 mt-2 mb-2">
                            <div class="customer_choice_options" id="customer_choice_options">
                                @include('admin-views.product.partials._choices',['choice_no'=>json_decode($product['attributes']),'choice_options'=>json_decode($product['choice_options'],true)])
                            </div>
                        </div>
                        <div class="col-md-12 mt-2 mb-2">
                            <div class="variant_combination" id="variant_combination">
                                @include('admin-views.product.partials._edit-combinations',['combinations'=>json_decode($product['variations'],true)])
                            </div>
                        </div>
                    </div> --}}

                   {{--  <div class="row mt-2">
                        <div class="col-12">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlSelect1">{{__('messages.addon')}}<span
                                        class="input-label-secondary" title="{{__('messages.restaurant_required_warning')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.restaurant_required_warning')}}"></span></label>
                                <select name="addon_ids[]" class="form-control js-select2-custom" multiple="multiple" id="add_on">
                                </select>
                            </div>
                        </div>
                    </div> --}}

                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.available')}} {{__('messages.time')}} {{__('messages.starts')}}</label>
                                <input type="time" value="{{$product['available_time_starts']}}"
                                       name="available_time_starts" step="any" class="form-control" id="available_time_starts"
                                       placeholder="Ex : 10:30 am" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.available')}} {{__('messages.time')}} {{__('messages.ends')}}</label>
                                <input type="time" value="{{$product['available_time_ends']}}"
                                       name="available_time_ends" step="any" class="form-control"  id="available_time_ends" placeholder="5:45 pm"
                                       required>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="input-label" for="exampleFormControlInput1">{{__('messages.short')}} {{__('messages.description')}}</label>
                        <textarea type="text" name="description" class="form-control">{{$product['description']}}</textarea>
                    </div>

                    <div class="form-group">
                        <label>{{__('messages.service')}} {{__('messages.image')}}</label><small style="color: red">* ( {{__('messages.ratio')}} 1:1 )</small>
                        <div class="custom-file">
                            <input type="file" name="image" id="customFileEg1" class="custom-file-input"
                                   accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                            <label class="custom-file-label" for="customFileEg1">{{__('messages.choose')}} {{__('messages.file')}}</label>
                        </div>

                        <center style="display: block" id="image-viewer-section" class="pt-2">
                            <img style="height: 200px;border: 1px solid; border-radius: 10px;" id="viewer"
                                 src="{{asset('storage/app/public/product')}}/{{$product['image']}}"
                                 alt="product image"/>
                        </center>
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-primary">{{__('messages.update')}}</button>
                </form>
            </div>
        </div>
    </div>

@endsection

@push('script')

@endpush

@push('script_2')
    <script>
        function getRestaurantData(route, id) {
            $.get({
                url: route,
                dataType: 'json',
                success: function (data) {
                    $('#' + id).empty().append(data.options);
                },
            });
            $.get({
                url:'{{url('/')}}/api/v1/restaurants/details/'+vendor_id,
                dataType: 'json',
                success: function(data) {
                    if(data.available_time_starts != null && data.available_time_ends != null){
                        var opening_time = data.available_time_starts;
                        var closeing_time = data.available_time_ends;
                        $('#available_time_ends').attr('min', opening_time);
                        $('#available_time_starts').attr('min', opening_time);
                        $('#available_time_ends').attr('max', closeing_time);
                        $('#available_time_starts').attr('max', closeing_time);
                        $('#available_time_starts').val(opening_time);
                        $('#available_time_ends').val(closeing_time);
                    }                    
                },
            });
        }

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
                let sub_category = '{{count($product_category)>=2?$product_category[1]->id:''}}';
                let sub_sub_category ='{{count($product_category)>=3?$product_category[2]->id:''}}';
                getRequest('{{url('/')}}/admin/food/get-categories?parent_id=' + category + '&&sub_category=' + sub_category, 'sub-categories');
                getRequest('{{url('/')}}/admin/food/get-categories?parent_id=' + sub_category + '&&sub_category=' + sub_sub_category, 'sub-sub-categories');
            
            }, 1000)
            @if(count(json_decode($product['add_ons'], true))>0)
            getRestaurantData('{{url('/')}}/admin/vendor/get-addons?vendor_id={{$product['vendor_id']}}@foreach(json_decode($product['add_ons'], true) as $addon)&data[]={{$addon}}@endforeach','add_on');
            @else
            getRestaurantData('{{url('/')}}/admin/vendor/get-addons?data[]=0&vendor_id={{$product['vendor_id']}}','add_on');
            @endif
        });
    </script>

    <script>
        $(document).on('ready', function () {
            $('.js-select2-custom').each(function () {
                var select2 = $.HSCore.components.HSSelect2.init($(this));
            });
        });
        
        $('.js-data-example-ajax').select2({
            ajax: {
                url: '{{url('/')}}/admin/vendor/get-restaurants',
                data: function (params) {
                    return {
                        q: params.term, // search term
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
        
    </script>

    <script src="{{asset('public/assets/admin')}}/js/tags-input.min.js"></script>

    <script>
        $('#choice_attributes').on('change', function () {
            $('#customer_choice_options').html(null);
            combination_update();
            $.each($("#choice_attributes option:selected"), function () {
                add_more_customer_choice_option($(this).val(), $(this).text());
            });
        });

        function add_more_customer_choice_option(i, name) {
            let n = name;
            $('#customer_choice_options').append('<div class="row"><div class="col-md-3"><input type="hidden" name="choice_no[]" value="' + i + '"><input type="text" class="form-control" name="choice[]" value="' + n + '" placeholder="Choice Title" readonly></div><div class="col-lg-9"><input type="text" class="form-control" name="choice_options_' + i + '[]" placeholder="Enter choice values" data-role="tagsinput" onchange="combination_update()"></div></div>');
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
                url: '{{route('admin.service.variant-combination')}}',
                data: $('#product_form').serialize(),
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    $('#loading').hide();
                    console.log(data.view);
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

    <!-- submit form -->
    <script>
        $('#product_form').on('submit', function () {
            var formData = new FormData(this);
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '{{route('admin.service.update',[$product['id']])}}',
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
                        toastr.success('Service updated successfully!', {
                            CloseButton: true,
                            ProgressBar: true
                        });
                        setTimeout(function () {
                            location.href = '{{\Request::server('HTTP_REFERER')??route('admin.service.list')}}';
                        }, 2000);
                    }
                }
            });
        });
    </script>
@endpush


