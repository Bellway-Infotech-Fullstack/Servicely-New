<!-- Header -->
<div class="card-header">
    <h5 class="card-header-title">
        <i class="tio-align-to-top"></i> {{trans('messages.top_selling_Services')}}
    </h5>
    @php($params=session('dash_params'))
    @if($params['zone_id']!='all')
        @php($zone_name=\App\Models\Zone::where('id',$params['zone_id'])->first()->name)
    @else
        @php($zone_name='All')
    @endif
    <label class="badge badge-soft-info">( Zone : {{$zone_name}} )</label>
</div>
<!-- End Header -->

<!-- Body -->
<div class="card-body">
    <div class="row">
        @foreach($top_sell as $key=>$item)
            <div class="col-md-4 col-sm-6 mt-2"
                 onclick="location.href='{{route('admin.service.view',[$item['service_id']])}}'"
                 style="cursor: pointer;padding-right: 6px;padding-left: 6px">
                <div class="grid-card">
                    <label class="label_1">Booked : {{$item['count']}}</label>
                    <img style="width: 100%;height: 120px"
                         src="{{asset('storage/app/public/product')}}/{{$item->service['image']}}"
                         onerror="this.src='{{asset('public/assets/admin/img/160x160/img2.jpg')}}'"
                         alt="{{$item->service->name}} image">
                    <div class="text-center mt-2">
                        <span class="" style="font-size: 10px">{{$item->service['name']}}</span>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
</div>
<!-- End Body -->
