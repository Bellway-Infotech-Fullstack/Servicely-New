@extends('layouts.vendor.app')
@section('title','Edit Role')
@push('css_or_js')

@endpush

@section('content')
<div class="content container-fluid"> 
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('vendor.dashboard')}}">Dashboard</a></li>
            <li class="breadcrumb-item" aria-current="page">Employee Role Update</li>
        </ol>
    </nav>

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-2">
        <h1 class="h3 mb-0 text-black-50">{{__('messages.employee')}} {{__('messages.Role')}}</h1>
    </div>

    <!-- Content Row -->
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <form action="{{route('vendor.custom-role.update',[$role['id']])}}" method="post">
                        @csrf
                        <div class="form-group">
                            <label for="name">{{trans('messages.role_name')}}</label>
                            <input type="text" name="name" value="{{$role['name']}}" class="form-control" id="name" aria-describedby="emailHelp"
                                   placeholder="Ex : Store">
                        </div>

                        <label for="module">{{trans('messages.module_permission')}} : </label>
                        <hr>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group form-check">
                                    <input type="checkbox" name="modules[]" value="service" class="form-check-input"
                                           id="service" {{in_array('service',(array)json_decode($role['modules']))?'checked':''}}>
                                    <label class="form-check-label" for="service">{{__('messages.service')}}</label>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group form-check">
                                    <input type="checkbox" name="modules[]" value="booking" class="form-check-input"
                                           id="booking" {{in_array('booking',(array)json_decode($role['modules']))?'checked':''}}>
                                    <label class="form-check-label" for="booking">{{__('messages.booking')}}</label>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group form-check">
                                    <input type="checkbox" name="modules[]" value="vendor_setup" class="form-check-input"
                                           id="vendor_setup" {{in_array('vendor_setup',(array)json_decode($role['modules']))?'checked':''}}>
                                    <label class="form-check-label" for="vendor_setup">{{__('messages.business')}} {{__('messages.setup')}}</label>
                                </div>
                            </div>
                            {{-- <div class="col-md-3">
                                <div class="form-group form-check">
                                    <input type="checkbox" name="modules[]" value="addon" class="form-check-input"
                                           id="addon" {{in_array('addon',(array)json_decode($role['modules']))?'checked':''}}>
                                    <label class="form-check-label" for="addon">{{__('messages.addon')}}</label>
                                </div>
                            </div> --}}
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group form-check">
                                    <input type="checkbox" name="modules[]" value="wallet" class="form-check-input"
                                           id="wallet" {{in_array('wallet',(array)json_decode($role['modules']))?'checked':''}}>
                                    <label class="form-check-label" for="wallet">{{__('messages.wallet')}}</label>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group form-check">
                                    <input type="checkbox" name="modules[]" value="bank_info" class="form-check-input"
                                           id="bank_info" {{in_array('bank_info',(array)json_decode($role['modules']))?'checked':''}}>
                                    <label class="form-check-label" for="bank_info">{{__('messages.bank_info')}}</label>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group form-check">
                                    <input type="checkbox" name="modules[]" value="employee" class="form-check-input"
                                           id="employee" {{in_array('employee',(array)json_decode($role['modules']))?'checked':''}}>
                                    <label class="form-check-label" for="employee">{{__('messages.Employee')}}</label>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group form-check">
                                    <input type="checkbox" name="modules[]" value="my_shop" class="form-check-input"
                                           id="my_shop" {{in_array('my_shop',(array)json_decode($role['modules']))?'checked':''}}>
                                    <label class="form-check-label" for="my_shop">{{__('messages.my_shop')}}</label>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group form-check">
                                    <input type="checkbox" name="modules[]" value="custom_role" class="form-check-input"
                                           id="custom_role" {{in_array('custom_role',(array)json_decode($role['modules']))?'checked':''}}>
                                    <label class="form-check-label" for="custom_role">{{__('messages.custom_role')}}</label>
                                </div>
                            </div>
                            
                            <div class="col-md-3">
                                <div class="form-group form-check">
                                    <input type="checkbox" name="modules[]" value="banner" class="form-check-input"
                                           id="banner" {{in_array('banner',(array)json_decode($role['modules']))?'checked':''}}>
                                    <label class="form-check-label" for="banner">{{__('messages.banner')}}</label>
                                </div>
                            </div>
                            
                            <div class="col-md-3">
                                <div class="form-group form-check">
                                    <input type="checkbox" name="modules[]" value="campaign" class="form-check-input"
                                           id="campaign" {{in_array('campaign',(array)json_decode($role['modules']))?'checked':''}}>
                                    <label class="form-check-label" for="campaign">{{__('messages.campaign')}}</label>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group form-check">
                                    <input type="checkbox" name="modules[]" value="reviews" class="form-check-input"
                                           id="reviews" {{in_array('reviews',(array)json_decode($role['modules']))?'checked':''}}>
                                    <label class="form-check-label" for="reviews">{{__('messages.reviews')}}</label>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">{{trans('messages.update')}}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script')

@endpush
