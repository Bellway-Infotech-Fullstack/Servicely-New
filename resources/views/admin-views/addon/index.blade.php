@extends('layouts.admin.app')

@section('title','Add new addon')

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title">{{__('messages.addon')}}</h1>
                </div>
                @if(isset($addon))
                <a href="{{route('admin.addon.add-new')}}" class="btn btn-primary pull-right"><i class="tio-add-circle"></i> {{__('messages.add')}} {{__('messages.new')}} {{__('messages.addon')}}</a>
                @endif
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header"> <h5>{{__('messages.add').' '.__('messages.new')}} {{__('messages.addon')}}</h5></div>
                    <div class="card-body">
                        <form action="{{isset($addon)?route('admin.addon.update',[$addon['id']]):route('admin.addon.store')}}" method="post">
                            @csrf
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlSelect1">{{__('messages.vendor')}}<span
                                        class="input-label-secondary"></span></label>
                                <select name="restaurant_id" class="js-data-example-ajax form-control"  data-placeholder="{{__('messages.select')}} {{__('messages.vendor')}}" oninvalid="this.setCustomValidity('{{__('messages.please_select_restaurant')}}')">
 
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.name')}}</label>
                                <input type="text" name="name" class="form-control" placeholder="{{__('messages.new_addon')}}" value="{{old('name')}}" required>
                            </div>
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.price')}}</label>
                                <input type="number" min="0" max="10000" name="price" step="0.01" value="{{old('price')}}" class="form-control" placeholder="100" required>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary"><i class="tio-add-circle-outlined"></i> {{isset($addon)?__('messages.update'):__('messages.save')}}</button>
                            </div>
                            
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-header-title"> {{__('messages.addon')}} {{__('messages.list')}}<span class="badge badge-soft-dark ml-2" id="itemCount">{{$addons->total()}}</span></h5>
                        <div class="col-sm-auto" style="width: 306px;">
                            <select name="restaurant_id" onchange="set_restaurant_filter('{{route('admin.addon.add-new')}}',this.value)" data-placeholder="{{__('messages.select')}} {{__('messages.vendor')}}" class="js-data-example-ajax form-control"   title="Select Vendor">
                            @if(isset($restaurant))    
                            <option value="{{$restaurant->id}}" selected>{{$restaurant->name}}</option>
                            @else
                            <option value="all" selected>{{__('messages.all_restaurants')}}</option>
                            @endif
                            </select>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row justify-content-between align-items-center flex-grow-1 mb-1">
                            <div class="col-md-4 mb-3 mb-md-0">
                                <form id="search-form">
                                    @csrf
                                    <!-- Search -->
                                    <div class="input-group input-group-merge input-group-flush">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <i class="tio-search"></i>
                                            </div>
                                        </div>
                                        <input id="datatableSearch" type="search" name="search" class="form-control" placeholder="{{__('messages.search_addons')}}" aria-label="Search addons">
                                    </div>
                                    <!-- End Search -->
                                </form>
                            </div>

                            <div class="col-auto">
                                <div class="hs-unfold">
                                <a class="js-hs-unfold-invoker btn btn-white" href="javascript:;"
                                    data-hs-unfold-options='{
                                    "target": "#showHideDropdown",
                                    "type": "css-animation"
                                    }'>
                                    <i class="tio-table mr-1"></i> Columns <span class="badge badge-soft-dark rounded-circle ml-1">5</span>
                                </a>

                                <div id="showHideDropdown" class="hs-unfold-content dropdown-unfold dropdown-menu dropdown-menu-right dropdown-card" style="width: 15rem;">
                                    <div class="card card-sm">
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <span class="mr-2">#</span>
                                                <!-- Checkbox Switch -->
                                                <label class="toggle-switch toggle-switch-sm" for="toggleColumn_index">
                                                    <input type="checkbox" class="toggle-switch-input" id="toggleColumn_index" checked>
                                                    <span class="toggle-switch-label">
                                                    <span class="toggle-switch-indicator"></span>
                                                    </span>
                                                </label>
                                            <!-- End Checkbox Switch -->
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <span class="mr-2">Name</span>
                                                <!-- Checkbox Switch -->
                                                <label class="toggle-switch toggle-switch-sm" for="toggleColumn_name">
                                                    <input type="checkbox" class="toggle-switch-input" id="toggleColumn_name" checked>
                                                    <span class="toggle-switch-label">
                                                    <span class="toggle-switch-indicator"></span>
                                                    </span>
                                                </label>
                                            <!-- End Checkbox Switch -->
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <span class="mr-2">Price</span>
                                                <!-- Checkbox Switch -->
                                                <label class="toggle-switch toggle-switch-sm" for="toggleColumn_price">
                                                    <input type="checkbox" class="toggle-switch-input" id="toggleColumn_price" checked>
                                                    <span class="toggle-switch-label">
                                                    <span class="toggle-switch-indicator"></span>
                                                    </span>
                                                </label>
                                                <!-- End Checkbox Switch -->
                                            </div>


                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <span class="mr-2">Restaurant</span>

                                                <!-- Checkbox Switch -->
                                                <label class="toggle-switch toggle-switch-sm" for="toggleColumn_vendor">
                                                    <input type="checkbox" class="toggle-switch-input" id="toggleColumn_vendor" checked>
                                                    <span class="toggle-switch-label">
                                                    <span class="toggle-switch-indicator"></span>
                                                    </span>
                                                </label>
                                                <!-- End Checkbox Switch -->
                                            </div>

                                        
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <span class="mr-2">Status</span>

                                                <!-- Checkbox Switch -->
                                                <label class="toggle-switch toggle-switch-sm" for="toggleColumn_status">
                                                    <input type="checkbox" class="toggle-switch-input" id="toggleColumn_status" checked>
                                                    <span class="toggle-switch-label">
                                                    <span class="toggle-switch-indicator"></span>
                                                    </span>
                                                </label>
                                                <!-- End Checkbox Switch -->
                                            </div>
                                            
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <span class="mr-2">Action</span>

                                                <!-- Checkbox Switch -->
                                                <label class="toggle-switch toggle-switch-sm" for="toggleColumn_action">
                                                    <input type="checkbox" class="toggle-switch-input" id="toggleColumn_action" checked>
                                                    <span class="toggle-switch-label">
                                                    <span class="toggle-switch-indicator"></span>
                                                    </span>
                                                </label>
                                                <!-- End Checkbox Switch -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>
                                <!-- End Unfold -->
                            </div>
                        </div>
                        <div class="table-responsive datatable-custom">
                            <table id="datatable" class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"  data-hs-datatables-options='{
                                "search": "#datatableSearch",
                                "entries": "#datatableEntries",
                                "isResponsive": false,
                                "isShowPaging": false,
                                "paging":false
                                    }'>
                                <thead class="thead-light">
                                <tr>
                                    <th>{{__('messages.#')}}</th>
                                    <th style="width: 20%">{{__('messages.name')}}</th>
                                    <th style="width: 20%">{{__('messages.price')}}</th>
                                    <th style="width: 30%">{{__('messages.restaurant')}}</th>
                                    <th style="width: 10%">{{__('messages.status')}}</th>
                                    <th style="width: 10%">{{__('messages.action')}}</th>
                                </tr>
                                </thead>

                                <tbody id="set-rows">
                                @foreach($addons as $key=>$addon)
                                    <tr>
                                        <td>{{$key+ $addons->firstItem()}}</td>
                                        <td>
                                        <span class="d-block font-size-sm text-body">
                                            {{$addon['name']}}
                                        </span>
                                        </td>
                                        <td>{{\App\CentralLogics\Helpers::format_currency($addon['price'])}}</td>
                                        <td>{{$addon->restaurant?$addon->restaurant->name:__('messages.restaurant').' '.__('messages.deleted')}}</td>
                                        <td>    
                                            <label class="toggle-switch toggle-switch-sm" for="stausCheckbox{{$addon->id}}">
                                            <input type="checkbox" onclick="location.href='{{route('admin.addon.status',[$addon['id'],$addon->status?0:1])}}'"class="toggle-switch-input" id="stausCheckbox{{$addon->id}}" {{$addon->status?'checked':''}}>
                                                <span class="toggle-switch-label">
                                                    <span class="toggle-switch-indicator"></span>
                                                </span>
                                            </label>
                                        </td>
                                        <td>
                                            <a class="btn btn-sm btn-white"
                                                href="{{route('admin.addon.edit',[$addon['id']])}}" title="{{__('messages.edit')}} {{__('messages.addon')}}"><i class="tio-edit"></i></a>
                                            <a class="btn btn-sm btn-white"     href="javascript:"
                                                onclick="form_alert('addon-{{$addon['id']}}','Want to delete this addon ?')" title="{{__('messages.delete')}} {{__('messages.addon')}}"><i class="tio-delete-outlined"></i></a>
                                            <form action="{{route('admin.addon.delete',[$addon['id']])}}"
                                                        method="post" id="addon-{{$addon['id']}}">
                                                @csrf @method('delete')
                                            </form>
                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer">
                        <!-- Pagination -->
                        <div class="row justify-content-center justify-content-sm-between align-items-sm-center page-area"> 
                            <div class="col-sm-auto">
                                <div class="d-flex justify-content-center justify-content-sm-end">
                                    <!-- Pagination -->
                                    {!! $addons->links() !!}
                                </div>
                            </div>
                        </div>
                        <!-- End Pagination -->
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@push('script_2')
    <script>
        $(document).on('ready', function () {
            // INITIALIZATION OF DATATABLES
            // =======================================================
            var datatable = $.HSCore.components.HSDatatables.init($('#datatable'), {
            select: {
                style: 'multi',
                classMap: {
                checkAll: '#datatableCheckAll',
                counter: '#datatableCounter',
                counterInfo: '#datatableCounterInfo'
                }
          },
          language: {
            zeroRecords: '<div class="text-center p-4">' +
                '<img class="mb-3" src="{{asset('public/assets/admin/svg/illustrations/sorry.svg')}}" alt="Image Description" style="width: 7rem;">' +
                '<p class="mb-0">No data to show</p>' +
                '</div>'
          }
        });

        $('#datatableSearch').on('mouseup', function (e) {
          var $input = $(this),
            oldValue = $input.val();

          if (oldValue == "") return;

          setTimeout(function(){
            var newValue = $input.val();

            if (newValue == ""){
              // Gotcha
              datatable.search('').draw();
            }
          }, 1);
        });

        $('#toggleColumn_index').change(function (e) {
          datatable.columns(0).visible(e.target.checked)
        })
        $('#toggleColumn_name').change(function (e) {
          datatable.columns(1).visible(e.target.checked)
        })

        $('#toggleColumn_vendor').change(function (e) {
          datatable.columns(3).visible(e.target.checked)
        })

        $('#toggleColumn_status').change(function (e) {
          datatable.columns(4).visible(e.target.checked)
        })
        $('#toggleColumn_price').change(function (e) {
          datatable.columns(2).visible(e.target.checked)
        })
        $('#toggleColumn_action').change(function (e) {
          datatable.columns(5).visible(e.target.checked)
        })


            // INITIALIZATION OF SELECT2
            // =======================================================
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
                        all:true,
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
        $('#search-form').on('submit', function (e) {
            e.preventDefault();
            var formData = new FormData(this);
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '{{route('admin.addon.search')}}',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    $('#set-rows').html(data.view);
                    $('.page-area').hide();
                },
                complete: function () {
                    $('#loading').hide();
                },
            });
        });
    </script>
@endpush
