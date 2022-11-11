@extends('layouts.admin.app')

@section('title','Settings')

@push('css_or_js')
<style>
    .switch {
        position: relative;
        display: inline-block;
        width: 48px;
        height: 23px;
    }

    .switch input {
        opacity: 0;
        width: 0;
        height: 0;
    }


    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        -webkit-transition: .4s;
        transition: .4s;
    }

    .slider:before {
        position: absolute;
        content: "";
        height: 15px;
        width: 15px;
        left: 4px;
        bottom: 4px;
        background-color: white;
        -webkit-transition: .4s;
        transition: .4s;
    }

    input:checked + .slider {
        background-color: #377dff;
    }

    input:focus + .slider {
        box-shadow: 0 0 1px #377dff;
    }

    input:checked + .slider:before {
        -webkit-transform: translateX(26px);
        -ms-transform: translateX(26px);
        transform: translateX(26px);
    }

    /* Rounded sliders */
    .slider.round {
        border-radius: 34px;
    }

    .slider.round:before {
        border-radius: 50%;
    }
    #location_map_canvas{
        height: 100%;
    }
    @media only screen and (max-width: 768px) {
        /* For mobile phones: */
        #location_map_canvas{
            height: 200px;
        }
    }
</style>
@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title text-capitalize">{{__('messages.business')}} {{__('messages.setup')}}</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-md-12 mb-3 mt-3">
                <div class="card">
                    <div class="card-body" style="padding-bottom: 12px">
                        <div class="row">
                            @php($config=\App\CentralLogics\Helpers::get_business_settings('maintenance_mode'))
                            <div class="col-6">
                                <h5 class="text-capitalize">
                                    <i class="tio-settings-outlined"></i>
                                    {{__('messages.maintenance_mode')}}
                                </h5>
                            </div>
                            <div class="col-6">
                                <label class="switch ml-3 float-right">
                                    <input type="checkbox" class="status" onclick="maintenance_mode()"
                                        {{isset($config) && $config?'checked':''}}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <form action="{{route('admin.business-settings.update-setup')}}" method="post"
                      enctype="multipart/form-data">
                    @csrf
                    @php($name=\App\Models\BusinessSetting::where('key','business_name')->first())
                    <div class="form-group">
                        <label class="input-label" for="exampleFormControlInput1">{{__('messages.business')}} {{__('messages.name')}}</label>
                        <input type="text" name="restaurant_name" value="{{$name->value??''}}" class="form-control"
                               placeholder="{{__('messages.new_business')}}" required>
                    </div>

                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-12">
                        @php($currency_code=\App\Models\BusinessSetting::where('key','currency')->first())
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.currency')}}</label>
                                <select name="currency" class="form-control js-select2-custom">
                                    @foreach(\App\Models\Currency::orderBy('currency_code')->get() as $currency)
                                        <option
                                            value="{{$currency['currency_code']}}" {{$currency_code?($currency_code->value==$currency['currency_code']?'selected':''):''}}>
                                            {{$currency['currency_code']}} ( {{$currency['currency_symbol']}} )
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-6 col-12">
                        @php($currency_symbol_position=\App\Models\BusinessSetting::where('key','currency_symbol_position')->first())
                            <div class="form-group">
                                <label class="input-label text-capitalize" for="currency_symbol_position">{{__('messages.currency_symbol_positon')}}</label>
                                <select name="currency_symbol_position" class="form-control js-select2-custom" id="currency_symbol_position">
                                    <option
                                        value="left" {{$currency_symbol_position?($currency_symbol_position->value=='left'?'selected':''):''}}>
                                        {{__('messages.left')}} ({{\App\CentralLogics\Helpers::currency_symbol()}}123)
                                    </option>
                                    <option
                                        value="right" {{$currency_symbol_position?($currency_symbol_position->value=='right'?'selected':''):''}}>
                                        {{__('messages.right')}} (123{{\App\CentralLogics\Helpers::currency_symbol()}})
                                    </option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-6 col-12">
                            @php($country=\App\Models\BusinessSetting::where('key','country')->first()->value)
                            <div class="form-group">
                                <label class="input-label text-capitalize d-inline" for="country">{{__('messages.country')}}</label>
                                <select id="country" name="country" class="form-control  js-select2-custom">
                                    <option value="AF" {{$country == "AF" ? 'selected' : ''}}>Afghanistan</option>
                                    <option value="AX" {{$country == "AX" ? 'selected' : ''}}>Åland Islands</option>
                                    <option value="AL" {{$country == "AL" ? 'selected' : ''}}>Albania</option>
                                    <option value="DZ" {{$country == "DZ" ? 'selected' : ''}}>Algeria</option>
                                    <option value="AS" {{$country == "AS" ? 'selected' : ''}}>American Samoa</option>
                                    <option value="AD" {{$country == "AD" ? 'selected' : ''}}>Andorra</option>
                                    <option value="AO" {{$country == "AO" ? 'selected' : ''}}>Angola</option>
                                    <option value="AI" {{$country == "AI" ? 'selected' : ''}}>Anguilla</option>
                                    <option value="AQ" {{$country == "AQ" ? 'selected' : ''}}>Antarctica</option>
                                    <option value="AG" {{$country == "AG" ? 'selected' : ''}}>Antigua and Barbuda</option>
                                    <option value="AR" {{$country == "AR" ? 'selected' : ''}}>Argentina</option>
                                    <option value="AM" {{$country == "AM" ? 'selected' : ''}}>Armenia</option>
                                    <option value="AW" {{$country == "AW" ? 'selected' : ''}}>Aruba</option>
                                    <option value="AU" {{$country == "AU" ? 'selected' : ''}}>Australia</option>
                                    <option value="AT" {{$country == "AT" ? 'selected' : ''}}>Austria</option>
                                    <option value="AZ" {{$country == "AZ" ? 'selected' : ''}}>Azerbaijan</option>
                                    <option value="BS" {{$country == "BS" ? 'selected' : ''}}>Bahamas</option>
                                    <option value="BH" {{$country == "BH" ? 'selected' : ''}}>Bahrain</option>
                                    <option value="BD" {{$country == "BD" ? 'selected' : ''}}>Bangladesh</option>
                                    <option value="BB" {{$country == "BB" ? 'selected' : ''}}>Barbados</option>
                                    <option value="BY" {{$country == "BY" ? 'selected' : ''}}>Belarus</option>
                                    <option value="BE" {{$country == "BE" ? 'selected' : ''}}>Belgium</option>
                                    <option value="BZ" {{$country == "BZ" ? 'selected' : ''}}>Belize</option>
                                    <option value="BJ" {{$country == "BJ" ? 'selected' : ''}}>Benin</option>
                                    <option value="BM" {{$country == "BM" ? 'selected' : ''}}>Bermuda</option>
                                    <option value="BT" {{$country == "BT" ? 'selected' : ''}}>Bhutan</option>
                                    <option value="BO" {{$country == "BO" ? 'selected' : ''}}>Bolivia, Plurinational State of</option>
                                    <option value="BQ" {{$country == "BQ" ? 'selected' : ''}}>Bonaire, Sint Eustatius and Saba</option>
                                    <option value="BA" {{$country == "BA" ? 'selected' : ''}}>Bosnia and Herzegovina</option>
                                    <option value="BW" {{$country == "BW" ? 'selected' : ''}}>Botswana</option>
                                    <option value="BV" {{$country == "BV" ? 'selected' : ''}}>Bouvet Island</option>
                                    <option value="BR" {{$country == "BR" ? 'selected' : ''}}>Brazil</option>
                                    <option value="IO" {{$country == "IO" ? 'selected' : ''}}>British Indian Ocean Territory</option>
                                    <option value="BN" {{$country == "BN" ? 'selected' : ''}}>Brunei Darussalam</option>
                                    <option value="BG" {{$country == "BG" ? 'selected' : ''}}>Bulgaria</option>
                                    <option value="BF" {{$country == "BF" ? 'selected' : ''}}>Burkina Faso</option>
                                    <option value="BI" {{$country == "BI" ? 'selected' : ''}}>Burundi</option>
                                    <option value="KH" {{$country == "KH" ? 'selected' : ''}}>Cambodia</option>
                                    <option value="CM" {{$country == "CM" ? 'selected' : ''}}>Cameroon</option>
                                    <option value="CA" {{$country == "CA" ? 'selected' : ''}}>Canada</option>
                                    <option value="CV" {{$country == "CV" ? 'selected' : ''}}>Cape Verde</option>
                                    <option value="KY" {{$country == "KY" ? 'selected' : ''}}>Cayman Islands</option>
                                    <option value="CF" {{$country == "CF" ? 'selected' : ''}}>Central African Republic</option>
                                    <option value="TD" {{$country == "TD" ? 'selected' : ''}}>Chad</option>
                                    <option value="CL" {{$country == "CL" ? 'selected' : ''}}>Chile</option>
                                    <option value="CN" {{$country == "CN" ? 'selected' : ''}}>China</option>
                                    <option value="CX" {{$country == "CX" ? 'selected' : ''}}>Christmas Island</option>
                                    <option value="CC" {{$country == "CC" ? 'selected' : ''}}>Cocos (Keeling) Islands</option>
                                    <option value="CO" {{$country == "CO" ? 'selected' : ''}}>Colombia</option>
                                    <option value="KM" {{$country == "KM" ? 'selected' : ''}}>Comoros</option>
                                    <option value="CG" {{$country == "CG" ? 'selected' : ''}}>Congo</option>
                                    <option value="CD" {{$country == "CD" ? 'selected' : ''}}>Congo, the Democratic Republic of the</option>
                                    <option value="CK" {{$country == "CK" ? 'selected' : ''}}>Cook Islands</option>
                                    <option value="CR" {{$country == "CR" ? 'selected' : ''}}>Costa Rica</option>
                                    <option value="CI" {{$country == "CI" ? 'selected' : ''}}>Côte d'Ivoire</option>
                                    <option value="HR" {{$country == "HR" ? 'selected' : ''}}>Croatia</option>
                                    <option value="CU" {{$country == "CU" ? 'selected' : ''}}>Cuba</option>
                                    <option value="CW" {{$country == "CW" ? 'selected' : ''}}>Curaçao</option>
                                    <option value="CY" {{$country == "CY" ? 'selected' : ''}}>Cyprus</option>
                                    <option value="CZ" {{$country == "CZ" ? 'selected' : ''}}>Czech Republic</option>
                                    <option value="DK" {{$country == "DK" ? 'selected' : ''}}>Denmark</option>
                                    <option value="DJ" {{$country == "DJ" ? 'selected' : ''}}>Djibouti</option>
                                    <option value="DM" {{$country == "DM" ? 'selected' : ''}}>Dominica</option>
                                    <option value="DO" {{$country == "DO" ? 'selected' : ''}}>Dominican Republic</option>
                                    <option value="EC" {{$country == "EC" ? 'selected' : ''}}>Ecuador</option>
                                    <option value="EG" {{$country == "EG" ? 'selected' : ''}}>Egypt</option>
                                    <option value="SV" {{$country == "SV" ? 'selected' : ''}}>El Salvador</option>
                                    <option value="GQ" {{$country == "GQ" ? 'selected' : ''}}>Equatorial Guinea</option>
                                    <option value="ER" {{$country == "ER" ? 'selected' : ''}}>Eritrea</option>
                                    <option value="EE" {{$country == "EE" ? 'selected' : ''}}>Estonia</option>
                                    <option value="ET" {{$country == "ET" ? 'selected' : ''}}>Ethiopia</option>
                                    <option value="FK" {{$country == "FK" ? 'selected' : ''}}>Falkland Islands (Malvinas)</option>
                                    <option value="FO" {{$country == "FO" ? 'selected' : ''}}>Faroe Islands</option>
                                    <option value="FJ" {{$country == "FJ" ? 'selected' : ''}}>Fiji</option>
                                    <option value="FI" {{$country == "FI" ? 'selected' : ''}}>Finland</option>
                                    <option value="FR" {{$country == "FR" ? 'selected' : ''}}>France</option>
                                    <option value="GF" {{$country == "GF" ? 'selected' : ''}}>French Guiana</option>
                                    <option value="PF" {{$country == "PF" ? 'selected' : ''}}>French Polynesia</option>
                                    <option value="TF" {{$country == "TF" ? 'selected' : ''}}>French Southern Territories</option>
                                    <option value="GA" {{$country == "GA" ? 'selected' : ''}}>Gabon</option>
                                    <option value="GM" {{$country == "GM" ? 'selected' : ''}}>Gambia</option>
                                    <option value="GE" {{$country == "GE" ? 'selected' : ''}}>Georgia</option>
                                    <option value="DE" {{$country == "DE" ? 'selected' : ''}}>Germany</option>
                                    <option value="GH" {{$country == "GH" ? 'selected' : ''}}>Ghana</option>
                                    <option value="GI" {{$country == "GI" ? 'selected' : ''}}>Gibraltar</option>
                                    <option value="GR" {{$country == "GR" ? 'selected' : ''}}>Greece</option>
                                    <option value="GL" {{$country == "GL" ? 'selected' : ''}}>Greenland</option>
                                    <option value="GD" {{$country == "GD" ? 'selected' : ''}}>Grenada</option>
                                    <option value="GP" {{$country == "GP" ? 'selected' : ''}}>Guadeloupe</option>
                                    <option value="GU" {{$country == "GU" ? 'selected' : ''}}>Guam</option>
                                    <option value="GT" {{$country == "GT" ? 'selected' : ''}}>Guatemala</option>
                                    <option value="GG" {{$country == "GG" ? 'selected' : ''}}>Guernsey</option>
                                    <option value="GN" {{$country == "GN" ? 'selected' : ''}}>Guinea</option>
                                    <option value="GW" {{$country == "GW" ? 'selected' : ''}}>Guinea-Bissau</option>
                                    <option value="GY" {{$country == "GY" ? 'selected' : ''}}>Guyana</option>
                                    <option value="HT" {{$country == "HT" ? 'selected' : ''}}>Haiti</option>
                                    <option value="HM" {{$country == "HM" ? 'selected' : ''}}>Heard Island and McDonald Islands</option>
                                    <option value="VA" {{$country == "VA" ? 'selected' : ''}}>Holy See (Vatican City State)</option>
                                    <option value="HN" {{$country == "HN" ? 'selected' : ''}}>Honduras</option>
                                    <option value="HK" {{$country == "HK" ? 'selected' : ''}}>Hong Kong</option>
                                    <option value="HU" {{$country == "HU" ? 'selected' : ''}}>Hungary</option>
                                    <option value="IS" {{$country == "IS" ? 'selected' : ''}}>Iceland</option>
                                    <option value="IN" {{$country == "IN" ? 'selected' : ''}}>India</option>
                                    <option value="ID" {{$country == "ID" ? 'selected' : ''}}>Indonesia</option>
                                    <option value="IR" {{$country == "IR" ? 'selected' : ''}}>Iran, Islamic Republic of</option>
                                    <option value="IQ" {{$country == "IQ" ? 'selected' : ''}}>Iraq</option>
                                    <option value="IE" {{$country == "IE" ? 'selected' : ''}}>Ireland</option>
                                    <option value="IM" {{$country == "IM" ? 'selected' : ''}}>Isle of Man</option>
                                    <option value="IL" {{$country == "IL" ? 'selected' : ''}}>Israel</option>
                                    <option value="IT" {{$country == "IT" ? 'selected' : ''}}>Italy</option>
                                    <option value="JM" {{$country == "JM" ? 'selected' : ''}}>Jamaica</option>
                                    <option value="JP" {{$country == "JP" ? 'selected' : ''}}>Japan</option>
                                    <option value="JE" {{$country == "JE" ? 'selected' : ''}}>Jersey</option>
                                    <option value="JO" {{$country == "JO" ? 'selected' : ''}}>Jordan</option>
                                    <option value="KZ" {{$country == "KZ" ? 'selected' : ''}}>Kazakhstan</option>
                                    <option value="KE" {{$country == "KE" ? 'selected' : ''}}>Kenya</option>
                                    <option value="KI" {{$country == "KI" ? 'selected' : ''}}>Kiribati</option>
                                    <option value="KP" {{$country == "KP" ? 'selected' : ''}}>Korea, Democratic People's Republic of</option>
                                    <option value="KR" {{$country == "KR" ? 'selected' : ''}}>Korea, Republic of</option>
                                    <option value="KW" {{$country == "KW" ? 'selected' : ''}}>Kuwait</option>
                                    <option value="KG" {{$country == "KG" ? 'selected' : ''}}>Kyrgyzstan</option>
                                    <option value="LA" {{$country == "LA" ? 'selected' : ''}}>Lao People's Democratic Republic</option>
                                    <option value="LV" {{$country == "LV" ? 'selected' : ''}}>Latvia</option>
                                    <option value="LB" {{$country == "LB" ? 'selected' : ''}}>Lebanon</option>
                                    <option value="LS" {{$country == "LS" ? 'selected' : ''}}>Lesotho</option>
                                    <option value="LR" {{$country == "LR" ? 'selected' : ''}}>Liberia</option>
                                    <option value="LY" {{$country == "LY" ? 'selected' : ''}}>Libya</option>
                                    <option value="LI" {{$country == "LI" ? 'selected' : ''}}>Liechtenstein</option>
                                    <option value="LT" {{$country == "LT" ? 'selected' : ''}}>Lithuania</option>
                                    <option value="LU" {{$country == "LU" ? 'selected' : ''}}>Luxembourg</option>
                                    <option value="MO" {{$country == "MO" ? 'selected' : ''}}>Macao</option>
                                    <option value="MK" {{$country == "MK" ? 'selected' : ''}}>Macedonia, the former Yugoslav Republic of</option>
                                    <option value="MG" {{$country == "MG" ? 'selected' : ''}}>Madagascar</option>
                                    <option value="MW" {{$country == "MW" ? 'selected' : ''}}>Malawi</option>
                                    <option value="MY" {{$country == "MY" ? 'selected' : ''}}>Malaysia</option>
                                    <option value="MV" {{$country == "MV" ? 'selected' : ''}}>Maldives</option>
                                    <option value="ML" {{$country == "ML" ? 'selected' : ''}}>Mali</option>
                                    <option value="MT" {{$country == "MT" ? 'selected' : ''}}>Malta</option>
                                    <option value="MH" {{$country == "MH" ? 'selected' : ''}}>Marshall Islands</option>
                                    <option value="MQ" {{$country == "MQ" ? 'selected' : ''}}>Martinique</option>
                                    <option value="MR" {{$country == "MR" ? 'selected' : ''}}>Mauritania</option>
                                    <option value="MU" {{$country == "MU" ? 'selected' : ''}}>Mauritius</option>
                                    <option value="YT" {{$country == "YT" ? 'selected' : ''}}>Mayotte</option>
                                    <option value="MX" {{$country == "MX" ? 'selected' : ''}}>Mexico</option>
                                    <option value="FM" {{$country == "FM" ? 'selected' : ''}}>Micronesia, Federated States of</option>
                                    <option value="MD" {{$country == "MD" ? 'selected' : ''}}>Moldova, Republic of</option>
                                    <option value="MC" {{$country == "MC" ? 'selected' : ''}}>Monaco</option>
                                    <option value="MN" {{$country == "MN" ? 'selected' : ''}}>Mongolia</option>
                                    <option value="ME" {{$country == "ME" ? 'selected' : ''}}>Montenegro</option>
                                    <option value="MS" {{$country == "MS" ? 'selected' : ''}}>Montserrat</option>
                                    <option value="MA" {{$country == "MA" ? 'selected' : ''}}>Morocco</option>
                                    <option value="MZ" {{$country == "MZ" ? 'selected' : ''}}>Mozambique</option>
                                    <option value="MM" {{$country == "MM" ? 'selected' : ''}}>Myanmar</option>
                                    <option value="NA" {{$country == "NA" ? 'selected' : ''}}>Namibia</option>
                                    <option value="NR" {{$country == "NR" ? 'selected' : ''}}>Nauru</option>
                                    <option value="NP" {{$country == "NP" ? 'selected' : ''}}>Nepal</option>
                                    <option value="NL" {{$country == "NL" ? 'selected' : ''}}>Netherlands</option>
                                    <option value="NC" {{$country == "NC" ? 'selected' : ''}}>New Caledonia</option>
                                    <option value="NZ" {{$country == "NZ" ? 'selected' : ''}}>New Zealand</option>
                                    <option value="NI" {{$country == "NI" ? 'selected' : ''}}>Nicaragua</option>
                                    <option value="NE" {{$country == "NE" ? 'selected' : ''}}>Niger</option>
                                    <option value="NG" {{$country == "NG" ? 'selected' : ''}}>Nigeria</option>
                                    <option value="NU" {{$country == "NU" ? 'selected' : ''}}>Niue</option>
                                    <option value="NF" {{$country == "NF" ? 'selected' : ''}}>Norfolk Island</option>
                                    <option value="MP" {{$country == "MP" ? 'selected' : ''}}>Northern Mariana Islands</option>
                                    <option value="NO" {{$country == "NO" ? 'selected' : ''}}>Norway</option>
                                    <option value="OM" {{$country == "OM" ? 'selected' : ''}}>Oman</option>
                                    <option value="PK" {{$country == "PK" ? 'selected' : ''}}>Pakistan</option>
                                    <option value="PW" {{$country == "PW" ? 'selected' : ''}}>Palau</option>
                                    <option value="PS" {{$country == "PS" ? 'selected' : ''}}>Palestinian Territory, Occupied</option>
                                    <option value="PA" {{$country == "PA" ? 'selected' : ''}}>Panama</option>
                                    <option value="PG" {{$country == "PG" ? 'selected' : ''}}>Papua New Guinea</option>
                                    <option value="PY" {{$country == "PY" ? 'selected' : ''}}>Paraguay</option>
                                    <option value="PE" {{$country == "PE" ? 'selected' : ''}}>Peru</option>
                                    <option value="PH" {{$country == "PH" ? 'selected' : ''}}>Philippines</option>
                                    <option value="PN" {{$country == "PN" ? 'selected' : ''}}>Pitcairn</option>
                                    <option value="PL" {{$country == "PL" ? 'selected' : ''}}>Poland</option>
                                    <option value="PT" {{$country == "PT" ? 'selected' : ''}}>Portugal</option>
                                    <option value="PR" {{$country == "PR" ? 'selected' : ''}}>Puerto Rico</option>
                                    <option value="QA" {{$country == "QA" ? 'selected' : ''}}>Qatar</option>
                                    <option value="RE" {{$country == "RE" ? 'selected' : ''}}>Réunion</option>
                                    <option value="RO" {{$country == "RO" ? 'selected' : ''}}>Romania</option>
                                    <option value="RU" {{$country == "RU" ? 'selected' : ''}}>Russian Federation</option>
                                    <option value="RW" {{$country == "RW" ? 'selected' : ''}}>Rwanda</option>
                                    <option value="BL" {{$country == "BL" ? 'selected' : ''}}>Saint Barthélemy</option>
                                    <option value="SH" {{$country == "SH" ? 'selected' : ''}}>Saint Helena, Ascension and Tristan da Cunha</option>
                                    <option value="KN" {{$country == "KN" ? 'selected' : ''}}>Saint Kitts and Nevis</option>
                                    <option value="LC" {{$country == "LC" ? 'selected' : ''}}>Saint Lucia</option>
                                    <option value="MF" {{$country == "MF" ? 'selected' : ''}}>Saint Martin (French part)</option>
                                    <option value="PM" {{$country == "PM" ? 'selected' : ''}}>Saint Pierre and Miquelon</option>
                                    <option value="VC" {{$country == "VC" ? 'selected' : ''}}>Saint Vincent and the Grenadines</option>
                                    <option value="WS" {{$country == "WS" ? 'selected' : ''}}>Samoa</option>
                                    <option value="SM" {{$country == "SM" ? 'selected' : ''}}>San Marino</option>
                                    <option value="ST" {{$country == "ST" ? 'selected' : ''}}>Sao Tome and Principe</option>
                                    <option value="SA" {{$country == "SA" ? 'selected' : ''}}>Saudi Arabia</option>
                                    <option value="SN" {{$country == "SN" ? 'selected' : ''}}>Senegal</option>
                                    <option value="RS" {{$country == "RS" ? 'selected' : ''}}>Serbia</option>
                                    <option value="SC" {{$country == "SC" ? 'selected' : ''}}>Seychelles</option>
                                    <option value="SL" {{$country == "SL" ? 'selected' : ''}}>Sierra Leone</option>
                                    <option value="SG" {{$country == "SG" ? 'selected' : ''}}>Singapore</option>
                                    <option value="SX" {{$country == "SX" ? 'selected' : ''}}>Sint Maarten (Dutch part)</option>
                                    <option value="SK" {{$country == "SK" ? 'selected' : ''}}>Slovakia</option>
                                    <option value="SI" {{$country == "SI" ? 'selected' : ''}}>Slovenia</option>
                                    <option value="SB" {{$country == "SB" ? 'selected' : ''}}>Solomon Islands</option>
                                    <option value="SO" {{$country == "SO" ? 'selected' : ''}}>Somalia</option>
                                    <option value="ZA" {{$country == "ZA" ? 'selected' : ''}}>South Africa</option>
                                    <option value="GS" {{$country == "GS" ? 'selected' : ''}}>South Georgia and the South Sandwich Islands</option>
                                    <option value="SS" {{$country == "SS" ? 'selected' : ''}}>South Sudan</option>
                                    <option value="ES" {{$country == "ES" ? 'selected' : ''}}>Spain</option>
                                    <option value="LK" {{$country == "LK" ? 'selected' : ''}}>Sri Lanka</option>
                                    <option value="SD" {{$country == "SD" ? 'selected' : ''}}>Sudan</option>
                                    <option value="SR" {{$country == "SR" ? 'selected' : ''}}>Suriname</option>
                                    <option value="SJ" {{$country == "SJ" ? 'selected' : ''}}>Svalbard and Jan Mayen</option>
                                    <option value="SZ" {{$country == "SZ" ? 'selected' : ''}}>Swaziland</option>
                                    <option value="SE" {{$country == "SE" ? 'selected' : ''}}>Sweden</option>
                                    <option value="CH" {{$country == "CH" ? 'selected' : ''}}>Switzerland</option>
                                    <option value="SY" {{$country == "SY" ? 'selected' : ''}}>Syrian Arab Republic</option>
                                    <option value="TW" {{$country == "TW" ? 'selected' : ''}}>Taiwan, Province of China</option>
                                    <option value="TJ" {{$country == "TJ" ? 'selected' : ''}}>Tajikistan</option>
                                    <option value="TZ" {{$country == "TZ" ? 'selected' : ''}}>Tanzania, United Republic of</option>
                                    <option value="TH" {{$country == "TH" ? 'selected' : ''}}>Thailand</option>
                                    <option value="TL" {{$country == "TL" ? 'selected' : ''}}>Timor-Leste</option>
                                    <option value="TG" {{$country == "TG" ? 'selected' : ''}}>Togo</option>
                                    <option value="TK" {{$country == "TK" ? 'selected' : ''}}>Tokelau</option>
                                    <option value="TO" {{$country == "TO" ? 'selected' : ''}}>Tonga</option>
                                    <option value="TT" {{$country == "TT" ? 'selected' : ''}}>Trinidad and Tobago</option>
                                    <option value="TN" {{$country == "TN" ? 'selected' : ''}}>Tunisia</option>
                                    <option value="TR" {{$country == "TR" ? 'selected' : ''}}>Turkey</option>
                                    <option value="TM" {{$country == "TM" ? 'selected' : ''}}>Turkmenistan</option>
                                    <option value="TC" {{$country == "TC" ? 'selected' : ''}}>Turks and Caicos Islands</option>
                                    <option value="TV" {{$country == "TV" ? 'selected' : ''}}>Tuvalu</option>
                                    <option value="UG" {{$country == "UG" ? 'selected' : ''}}>Uganda</option>
                                    <option value="UA" {{$country == "UA" ? 'selected' : ''}}>Ukraine</option>
                                    <option value="AE" {{$country == "AE" ? 'selected' : ''}}>United Arab Emirates</option>
                                    <option value="GB" {{$country == "GB" ? 'selected' : ''}}>United Kingdom</option>
                                    <option value="US" {{$country == "US" ? 'selected' : ''}}>United States</option>
                                    <option value="UM" {{$country == "UM" ? 'selected' : ''}}>United States Minor Outlying Islands</option>
                                    <option value="UY" {{$country == "UY" ? 'selected' : ''}}>Uruguay</option>
                                    <option value="UZ" {{$country == "UZ" ? 'selected' : ''}}>Uzbekistan</option>
                                    <option value="VU" {{$country == "VU" ? 'selected' : ''}}>Vanuatu</option>
                                    <option value="VE" {{$country == "VE" ? 'selected' : ''}}>Venezuela, Bolivarian Republic of</option>
                                    <option value="VN" {{$country == "VN" ? 'selected' : ''}}>Viet Nam</option>
                                    <option value="VG" {{$country == "VG" ? 'selected' : ''}}>Virgin Islands, British</option>
                                    <option value="VI" {{$country == "VI" ? 'selected' : ''}}>Virgin Islands, U.S.</option>
                                    <option value="WF" {{$country == "WF" ? 'selected' : ''}}>Wallis and Futuna</option>
                                    <option value="EH" {{$country == "EH" ? 'selected' : ''}}>Western Sahara</option>
                                    <option value="YE" {{$country == "YE" ? 'selected' : ''}}>Yemen</option>
                                    <option value="ZM" {{$country == "ZM" ? 'selected' : ''}}>Zambia</option>
                                    <option value="ZW" {{$country == "ZW" ? 'selected' : ''}}>Zimbabwe</option>
                                </select>
                            </div>
                        </div>
                        {{--<div class="col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{trans('messages.language')}} </label>
                                <select name="language[]" id="language" data-maximum-selection-length="3" class="form-control js-select2-custom" required multiple=true>
                                    <option value="en">English(default)</option>
                                    <option value="af">Afrikaans</option>
                                    <option value="sq">Albanian - shqip</option>
                                    <option value="am">Amharic - አማርኛ</option>
                                    <option value="ar">Arabic - العربية</option>
                                    <option value="an">Aragonese - aragonés</option>
                                    <option value="hy">Armenian - հայերեն</option>
                                    <option value="ast">Asturian - asturianu</option>
                                    <option value="az">Azerbaijani - azərbaycan dili</option>
                                    <option value="eu">Basque - euskara</option>
                                    <option value="be">Belarusian - беларуская</option>
                                    <option value="bn">Bengali - বাংলা</option>
                                    <option value="bs">Bosnian - bosanski</option>
                                    <option value="br">Breton - brezhoneg</option>
                                    <option value="bg">Bulgarian - български</option>
                                    <option value="ca">Catalan - català</option>
                                    <option value="ckb">Central Kurdish - کوردی (دەستنوسی عەرەبی)</option>
                                    <option value="zh">Chinese - 中文</option>
                                    <option value="zh-HK">Chinese (Hong Kong) - 中文（香港）</option>
                                    <option value="zh-CN">Chinese (Simplified) - 中文（简体）</option>
                                    <option value="zh-TW">Chinese (Traditional) - 中文（繁體）</option>
                                    <option value="co">Corsican</option>
                                    <option value="hr">Croatian - hrvatski</option>
                                    <option value="cs">Czech - čeština</option>
                                    <option value="da">Danish - dansk</option>
                                    <option value="nl">Dutch - Nederlands</option>
                                    <option value="en-AU">English (Australia)</option>
                                    <option value="en-CA">English (Canada)</option>
                                    <option value="en-IN">English (India)</option>
                                    <option value="en-NZ">English (New Zealand)</option>
                                    <option value="en-ZA">English (South Africa)</option>
                                    <option value="en-GB">English (United Kingdom)</option>
                                    <option value="en-US">English (United States)</option>
                                    <option value="eo">Esperanto - esperanto</option>
                                    <option value="et">Estonian - eesti</option>
                                    <option value="fo">Faroese - føroyskt</option>
                                    <option value="fil">Filipino</option>
                                    <option value="fi">Finnish - suomi</option>
                                    <option value="fr">French - français</option>
                                    <option value="fr-CA">French (Canada) - français (Canada)</option>
                                    <option value="fr-FR">French (France) - français (France)</option>
                                    <option value="fr-CH">French (Switzerland) - français (Suisse)</option>
                                    <option value="gl">Galician - galego</option>
                                    <option value="ka">Georgian - ქართული</option>
                                    <option value="de">German - Deutsch</option>
                                    <option value="de-AT">German (Austria) - Deutsch (Österreich)</option>
                                    <option value="de-DE">German (Germany) - Deutsch (Deutschland)</option>
                                    <option value="de-LI">German (Liechtenstein) - Deutsch (Liechtenstein)</option>
                                    <option value="de-CH">German (Switzerland) - Deutsch (Schweiz)</option>
                                    <option value="el">Greek - Ελληνικά</option>
                                    <option value="gn">Guarani</option>
                                    <option value="gu">Gujarati - ગુજરાતી</option>
                                    <option value="ha">Hausa</option>
                                    <option value="haw">Hawaiian - ʻŌlelo Hawaiʻi</option>
                                    <option value="he">Hebrew - עברית</option>
                                    <option value="hi">Hindi - हिन्दी</option>
                                    <option value="hu">Hungarian - magyar</option>
                                    <option value="is">Icelandic - íslenska</option>
                                    <option value="id">Indonesian - Indonesia</option>
                                    <option value="ia">Interlingua</option>
                                    <option value="ga">Irish - Gaeilge</option>
                                    <option value="it">Italian - italiano</option>
                                    <option value="it-IT">Italian (Italy) - italiano (Italia)</option>
                                    <option value="it-CH">Italian (Switzerland) - italiano (Svizzera)</option>
                                    <option value="ja">Japanese - 日本語</option>
                                    <option value="kn">Kannada - ಕನ್ನಡ</option>
                                    <option value="kk">Kazakh - қазақ тілі</option>
                                    <option value="km">Khmer - ខ្មែរ</option>
                                    <option value="ko">Korean - 한국어</option>
                                    <option value="ku">Kurdish - Kurdî</option>
                                    <option value="ky">Kyrgyz - кыргызча</option>
                                    <option value="lo">Lao - ລາວ</option>
                                    <option value="la">Latin</option>
                                    <option value="lv">Latvian - latviešu</option>
                                    <option value="ln">Lingala - lingála</option>
                                    <option value="lt">Lithuanian - lietuvių</option>
                                    <option value="mk">Macedonian - македонски</option>
                                    <option value="ms">Malay - Bahasa Melayu</option>
                                    <option value="ml">Malayalam - മലയാളം</option>
                                    <option value="mt">Maltese - Malti</option>
                                    <option value="mr">Marathi - मराठी</option>
                                    <option value="mn">Mongolian - монгол</option>
                                    <option value="ne">Nepali - नेपाली</option>
                                    <option value="no">Norwegian - norsk</option>
                                    <option value="nb">Norwegian Bokmål - norsk bokmål</option>
                                    <option value="nn">Norwegian Nynorsk - nynorsk</option>
                                    <option value="oc">Occitan</option>
                                    <option value="or">Oriya - ଓଡ଼ିଆ</option>
                                    <option value="om">Oromo - Oromoo</option>
                                    <option value="ps">Pashto - پښتو</option>
                                    <option value="fa">Persian - فارسی</option>
                                    <option value="pl">Polish - polski</option>
                                    <option value="pt">Portuguese - português</option>
                                    <option value="pt-BR">Portuguese (Brazil) - português (Brasil)</option>
                                    <option value="pt-PT">Portuguese (Portugal) - português (Portugal)</option>
                                    <option value="pa">Punjabi - ਪੰਜਾਬੀ</option>
                                    <option value="qu">Quechua</option>
                                    <option value="ro">Romanian - română</option>
                                    <option value="mo">Romanian (Moldova) - română (Moldova)</option>
                                    <option value="rm">Romansh - rumantsch</option>
                                    <option value="ru">Russian - русский</option>
                                    <option value="gd">Scottish Gaelic</option>
                                    <option value="sr">Serbian - српски</option>
                                    <option value="sh">Serbo-Croatian - Srpskohrvatski</option>
                                    <option value="sn">Shona - chiShona</option>
                                    <option value="sd">Sindhi</option>
                                    <option value="si">Sinhala - සිංහල</option>
                                    <option value="sk">Slovak - slovenčina</option>
                                    <option value="sl">Slovenian - slovenščina</option>
                                    <option value="so">Somali - Soomaali</option>
                                    <option value="st">Southern Sotho</option>
                                    <option value="es">Spanish - español</option>
                                    <option value="es-AR">Spanish (Argentina) - español (Argentina)</option>
                                    <option value="es-419">Spanish (Latin America) - español (Latinoamérica)</option>
                                    <option value="es-MX">Spanish (Mexico) - español (México)</option>
                                    <option value="es-ES">Spanish (Spain) - español (España)</option>
                                    <option value="es-US">Spanish (United States) - español (Estados Unidos)</option>
                                    <option value="su">Sundanese</option>
                                    <option value="sw">Swahili - Kiswahili</option>
                                    <option value="sv">Swedish - svenska</option>
                                    <option value="tg">Tajik - тоҷикӣ</option>
                                    <option value="ta">Tamil - தமிழ்</option>
                                    <option value="tt">Tatar</option>
                                    <option value="te">Telugu - తెలుగు</option>
                                    <option value="th">Thai - ไทย</option>
                                    <option value="ti">Tigrinya - ትግርኛ</option>
                                    <option value="to">Tongan - lea fakatonga</option>
                                    <option value="tr">Turkish - Türkçe</option>
                                    <option value="tk">Turkmen</option>
                                    <option value="tw">Twi</option>
                                    <option value="uk">Ukrainian - українська</option>
                                    <option value="ur">Urdu - اردو</option>
                                    <option value="ug">Uyghur</option>
                                    <option value="uz">Uzbek - o‘zbek</option>
                                    <option value="vi">Vietnamese - Tiếng Việt</option>
                                    <option value="wa">Walloon - wa</option>
                                    <option value="cy">Welsh - Cymraeg</option>
                                    <option value="fy">Western Frisian</option>
                                    <option value="xh">Xhosa</option>
                                    <option value="yi">Yiddish</option>
                                    <option value="yo">Yoruba - Èdè Yorùbá</option>
                                    <option value="zu">Zulu - isiZulu</option>
                                </select>
                            </div>
                        </div>--}}
                        <div class="col-md-4 col-sm-6 col-12">
                            @php($tz=\App\Models\BusinessSetting::where('key','timezone')->first())
                            @php($tz=$tz?$tz->value:0)
                            <div class="form-group">
                                <label class="input-label d-inline text-capitalize">{{__('messages.time_zone')}}</label>
                                <select name="timezone" class="form-control js-select2-custom">
                                    <option value="UTC" {{$tz?($tz==''?'selected':''):''}}>UTC</option>
                                    <option value="Etc/GMT+12"  {{$tz?($tz=='Etc/GMT+12'?'selected':''):''}}>(GMT-12:00) International Date Line West</option>
                                    <option value="Pacific/Midway"  {{$tz?($tz=='Pacific/Midway'?'selected':''):''}}>(GMT-11:00) Midway Island, Samoa</option>
                                    <option value="Pacific/Honolulu"  {{$tz?($tz=='Pacific/Honolulu'?'selected':''):''}}>(GMT-10:00) Hawaii</option>
                                    <option value="US/Alaska"  {{$tz?($tz=='US/Alaska'?'selected':''):''}}>(GMT-09:00) Alaska</option>
                                    <option value="America/Los_Angeles"  {{$tz?($tz=='America/Los_Angeles'?'selected':''):''}}>(GMT-08:00) Pacific Time (US & Canada)</option>
                                    <option value="America/Tijuana"  {{$tz?($tz=='America/Tijuana'?'selected':''):''}}>(GMT-08:00) Tijuana, Baja California</option>
                                    <option value="US/Arizona"  {{$tz?($tz=='US/Arizona'?'selected':''):''}}>(GMT-07:00) Arizona</option>
                                    <option value="America/Chihuahua"  {{$tz?($tz=='America/Chihuahua'?'selected':''):''}}>(GMT-07:00) Chihuahua, La Paz, Mazatlan</option>
                                    <option value="US/Mountain"  {{$tz?($tz=='US/Mountain'?'selected':''):''}}>(GMT-07:00) Mountain Time (US & Canada)</option>
                                    <option value="America/Managua"  {{$tz?($tz=='America/Managua'?'selected':''):''}}>(GMT-06:00) Central America</option>
                                    <option value="US/Central"  {{$tz?($tz=='US/Central'?'selected':''):''}}>(GMT-06:00) Central Time (US & Canada)</option>
                                    <option value="America/Mexico_City"  {{$tz?($tz=='America/Mexico_City'?'selected':''):''}}>(GMT-06:00) Guadalajara, Mexico City, Monterrey</option>
                                    <option value="Canada/Saskatchewan"  {{$tz?($tz=='Canada/Saskatchewan'?'selected':''):''}}>(GMT-06:00) Saskatchewan</option>
                                    <option value="America/Bogota"  {{$tz?($tz=='America/Bogota'?'selected':''):''}}>(GMT-05:00) Bogota, Lima, Quito, Rio Branco</option>
                                    <option value="US/Eastern"  {{$tz?($tz=='US/Eastern'?'selected':''):''}}>(GMT-05:00) Eastern Time (US & Canada)</option>
                                    <option value="US/East-Indiana"  {{$tz?($tz=='US/East-Indiana'?'selected':''):''}}>(GMT-05:00) Indiana (East)</option>
                                    <option value="Canada/Atlantic"  {{$tz?($tz=='Canada/Atlantic'?'selected':''):''}}>(GMT-04:00) Atlantic Time (Canada)</option>
                                    <option value="America/Caracas"  {{$tz?($tz=='America/Caracas'?'selected':''):''}}>(GMT-04:00) Caracas, La Paz</option>
                                    <option value="America/Manaus"  {{$tz?($tz=='America/Manaus'?'selected':''):''}}>(GMT-04:00) Manaus</option>
                                    <option value="America/Santiago"  {{$tz?($tz=='America/Santiago'?'selected':''):''}}>(GMT-04:00) Santiago</option>
                                    <option value="Canada/Newfoundland"  {{$tz?($tz=='Canada/Newfoundland'?'selected':''):''}}>(GMT-03:30) Newfoundland</option>
                                    <option value="America/Sao_Paulo"  {{$tz?($tz=='America/Sao_Paulo'?'selected':''):''}}>(GMT-03:00) Brasilia</option>
                                    <option value="America/Argentina/Buenos_Aires"  {{$tz?($tz=='America/Argentina/Buenos_Aires'?'selected':''):''}}>(GMT-03:00) Buenos Aires, Georgetown</option>
                                    <option value="America/Godthab"  {{$tz?($tz=='America/Godthab'?'selected':''):''}}>(GMT-03:00) Greenland</option>
                                    <option value="America/Montevideo"  {{$tz?($tz=='America/Montevideo'?'selected':''):''}}>(GMT-03:00) Montevideo</option>
                                    <option value="America/Noronha"  {{$tz?($tz=='America/Noronha'?'selected':''):''}}>(GMT-02:00) Mid-Atlantic</option>
                                    <option value="Atlantic/Cape_Verde"  {{$tz?($tz=='Atlantic/Cape_Verde'?'selected':''):''}}>(GMT-01:00) Cape Verde Is.</option>
                                    <option value="Atlantic/Azores"  {{$tz?($tz=='Atlantic/Azores'?'selected':''):''}}>(GMT-01:00) Azores</option>
                                    <option value="Africa/Casablanca"  {{$tz?($tz=='Africa/Casablanca'?'selected':''):''}}>(GMT+00:00) Casablanca, Monrovia, Reykjavik</option>
                                    <option value="Etc/Greenwich"  {{$tz?($tz=='Etc/Greenwich'?'selected':''):''}}>(GMT+00:00) Greenwich Mean Time : Dublin, Edinburgh, Lisbon, London</option>
                                    <option value="Europe/Amsterdam"  {{$tz?($tz=='Europe/Amsterdam'?'selected':''):''}}>(GMT+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna</option>
                                    <option value="Europe/Belgrade"  {{$tz?($tz=='Europe/Belgrade'?'selected':''):''}}>(GMT+01:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague</option>
                                    <option value="Europe/Brussels"  {{$tz?($tz=='Europe/Brussels'?'selected':''):''}}>(GMT+01:00) Brussels, Copenhagen, Madrid, Paris</option>
                                    <option value="Europe/Sarajevo"  {{$tz?($tz=='Europe/Sarajevo'?'selected':''):''}}>(GMT+01:00) Sarajevo, Skopje, Warsaw, Zagreb</option>
                                    <option value="Africa/Lagos"  {{$tz?($tz=='Africa/Lagos'?'selected':''):''}}>(GMT+01:00) West Central Africa</option>
                                    <option value="Asia/Amman"  {{$tz?($tz=='Asia/Amman'?'selected':''):''}}>(GMT+02:00) Amman</option>
                                    <option value="Europe/Athens"  {{$tz?($tz=='Europe/Athens'?'selected':''):''}}>(GMT+02:00) Athens, Bucharest, Istanbul</option>
                                    <option value="Asia/Beirut"  {{$tz?($tz=='Asia/Beirut'?'selected':''):''}}>(GMT+02:00) Beirut</option>
                                    <option value="Africa/Cairo"  {{$tz?($tz=='Africa/Cairo'?'selected':''):''}}>(GMT+02:00) Cairo</option>
                                    <option value="Africa/Harare"  {{$tz?($tz=='Africa/Harare'?'selected':''):''}}>(GMT+02:00) Harare, Pretoria</option>
                                    <option value="Europe/Helsinki"  {{$tz?($tz=='Europe/Helsinki'?'selected':''):''}}>(GMT+02:00) Helsinki, Kyiv, Riga, Sofia, Tallinn, Vilnius</option>
                                    <option value="Asia/Jerusalem"  {{$tz?($tz=='Asia/Jerusalem'?'selected':''):''}}>(GMT+02:00) Jerusalem</option>
                                    <option value="Europe/Minsk"  {{$tz?($tz=='Europe/Minsk'?'selected':''):''}}>(GMT+02:00) Minsk</option>
                                    <option value="Africa/Windhoek"  {{$tz?($tz=='Africa/Windhoek'?'selected':''):''}}>(GMT+02:00) Windhoek</option>
                                    <option value="Asia/Kuwait"  {{$tz?($tz=='Asia/Kuwait'?'selected':''):''}}>(GMT+03:00) Kuwait, Riyadh, Baghdad</option>
                                    <option value="Europe/Moscow"  {{$tz?($tz=='Europe/Moscow'?'selected':''):''}}>(GMT+03:00) Moscow, St. Petersburg, Volgograd</option>
                                    <option value="Africa/Nairobi"  {{$tz?($tz=='Africa/Nairobi'?'selected':''):''}}>(GMT+03:00) Nairobi</option>
                                    <option value="Asia/Tbilisi"  {{$tz?($tz=='Asia/Tbilisi'?'selected':''):''}}>(GMT+03:00) Tbilisi</option>
                                    <option value="Asia/Tehran"  {{$tz?($tz=='Asia/Tehran'?'selected':''):''}}>(GMT+03:30) Tehran</option>
                                    <option value="Asia/Muscat"  {{$tz?($tz=='Asia/Muscat'?'selected':''):''}}>(GMT+04:00) Abu Dhabi, Muscat</option>
                                    <option value="Asia/Baku"  {{$tz?($tz=='Asia/Baku'?'selected':''):''}}>(GMT+04:00) Baku</option>
                                    <option value="Asia/Yerevan"  {{$tz?($tz=='Asia/Yerevan'?'selected':''):''}}>(GMT+04:00) Yerevan</option>
                                    <option value="Asia/Kabul"  {{$tz?($tz=='Asia/Kabul'?'selected':''):''}}>(GMT+04:30) Kabul</option>
                                    <option value="Asia/Yekaterinburg"  {{$tz?($tz=='Asia/Yekaterinburg'?'selected':''):''}}>(GMT+05:00) Yekaterinburg</option>
                                    <option value="Asia/Karachi"  {{$tz?($tz=='Asia/Karachi'?'selected':''):''}}>(GMT+05:00) Islamabad, Karachi, Tashkent</option>
                                    <option value="Asia/Calcutta"  {{$tz?($tz=='Asia/Calcutta'?'selected':''):''}}>(GMT+05:30) Chennai, Kolkata, Mumbai, New Delhi</option>
                                    <!-- <option value="Asia/Calcutta"  {{$tz?($tz=='Asia/Calcutta'?'selected':''):''}}>(GMT+05:30) Sri Jayawardenapura</option> -->
                                    <option value="Asia/Katmandu"  {{$tz?($tz=='Asia/Katmandu'?'selected':''):''}}>(GMT+05:45) Kathmandu</option>
                                    <option value="Asia/Almaty"  {{$tz?($tz=='Asia/Almaty'?'selected':''):''}}>(GMT+06:00) Almaty, Novosibirsk</option>
                                    <option value="Asia/Dhaka"  {{$tz?($tz=='Asia/Dhaka'?'selected':''):''}}>(GMT+06:00) Astana, Dhaka</option>
                                    <option value="Asia/Rangoon"  {{$tz?($tz=='Asia/Rangoon'?'selected':''):''}}>(GMT+06:30) Yangon (Rangoon)</option>
                                    <option value="Asia/Bangkok"  {{$tz?($tz=='"Asia/Bangkok'?'selected':''):''}}>(GMT+07:00) Bangkok, Hanoi, Jakarta</option>
                                    <option value="Asia/Krasnoyarsk"  {{$tz?($tz=='Asia/Krasnoyarsk'?'selected':''):''}}>(GMT+07:00) Krasnoyarsk</option>
                                    <option value="Asia/Hong_Kong"  {{$tz?($tz=='Asia/Hong_Kong'?'selected':''):''}}>(GMT+08:00) Beijing, Chongqing, Hong Kong, Urumqi</option>
                                    <option value="Asia/Kuala_Lumpur"  {{$tz?($tz=='Asia/Kuala_Lumpur'?'selected':''):''}}>(GMT+08:00) Kuala Lumpur, Singapore</option>
                                    <option value="Asia/Irkutsk"  {{$tz?($tz=='Asia/Irkutsk'?'selected':''):''}}>(GMT+08:00) Irkutsk, Ulaan Bataar</option>
                                    <option value="Australia/Perth"  {{$tz?($tz=='Australia/Perth'?'selected':''):''}}>(GMT+08:00) Perth</option>
                                    <option value="Asia/Taipei"  {{$tz?($tz=='Asia/Taipei'?'selected':''):''}}>(GMT+08:00) Taipei</option>
                                    <option value="Asia/Tokyo"  {{$tz?($tz=='Asia/Tokyo'?'selected':''):''}}>(GMT+09:00) Osaka, Sapporo, Tokyo</option>
                                    <option value="Asia/Seoul"  {{$tz?($tz=='Asia/Seoul'?'selected':''):''}}>(GMT+09:00) Seoul</option>
                                    <option value="Asia/Yakutsk"  {{$tz?($tz=='Asia/Yakutsk'?'selected':''):''}}>(GMT+09:00) Yakutsk</option>
                                    <option value="Australia/Adelaide"  {{$tz?($tz=='Australia/Adelaide'?'selected':''):''}}>(GMT+09:30) Adelaide</option>
                                    <option value="Australia/Darwin"  {{$tz?($tz=='Australia/Darwin'?'selected':''):''}}>(GMT+09:30) Darwin</option>
                                    <option value="Australia/Brisbane"  {{$tz?($tz=='Australia/Brisbane'?'selected':''):''}}>(GMT+10:00) Brisbane</option>
                                    <option value="Australia/Canberra"  {{$tz?($tz=='Australia/Canberra'?'selected':''):''}}>(GMT+10:00) Canberra, Melbourne, Sydney</option>
                                    <option value="Australia/Hobart"  {{$tz?($tz=='Australia/Hobart'?'selected':''):''}}>(GMT+10:00) Hobart</option>
                                    <option value="Pacific/Guam"  {{$tz?($tz=='Pacific/Guam'?'selected':''):''}}>(GMT+10:00) Guam, Port Moresby</option>
                                    <option value="Asia/Vladivostok"  {{$tz?($tz=='Asia/Vladivostok'?'selected':''):''}}>(GMT+10:00) Vladivostok</option>
                                    <option value="Asia/Magadan"  {{$tz?($tz=='Asia/Magadan'?'selected':''):''}}>(GMT+11:00) Magadan, Solomon Is., New Caledonia</option>
                                    <option value="Pacific/Auckland"  {{$tz?($tz=='Pacific/Auckland'?'selected':''):''}}>(GMT+12:00) Auckland, Wellington</option>
                                    <option value="Pacific/Fiji"  {{$tz?($tz=='Pacific/Fiji'?'selected':''):''}}>(GMT+12:00) Fiji, Kamchatka, Marshall Is.</option>
                                    <option value="Pacific/Tongatapu"  {{$tz?($tz=='Pacific/Tongatapu'?'selected':''):''}}>(GMT+13:00) Nuku'alofa</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 col-12">
                            @php($tf=\App\Models\BusinessSetting::where('key','timeformat')->first())
                            @php($tf=$tf?$tf->value:'24')
                            <div class="form-group">
                                <label class="input-label d-inline text-capitalize">{{__('messages.time_format')}}</label>
                                <select name="time_format" class="form-control">
                                    <option value="12" {{$tf=='12'?'selected':''}}>{{__('messages.12_hour')}}</option>
                                    <option value="24" {{$tf=='24'?'selected':''}}>{{__('messages.24_hour')}}</option>
                                </select>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-12">
                            @php($schedule_order=\App\Models\BusinessSetting::where('key','schedule_order')->first())
                            @php($schedule_order=$schedule_order?$schedule_order->value:0)
                            <div class="form-group">
                                <label class="input-label d-inline">{{__('messages.scheduled')}} {{__('messages.orders')}}</label><small style="color: red">
                                <!-- <span class="input-label-secondary" title="{{__('messages.customer_varification_toggle')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.customer_varification_toggle')}}"></span> -->
                                 *</small>
                                <div class="input-group input-group-md-down-break">
                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="1" name="schedule_order"
                                                   id="schedule_order" {{$schedule_order==1?'checked':''}}>
                                            <label class="custom-control-label" for="schedule_order">{{__('messages.on')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->

                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="0" name="schedule_order"
                                                   id="schedule_order2" {{$schedule_order==0?'checked':''}}>
                                            <label class="custom-control-label" for="schedule_order2">{{__('messages.off')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-12">
                            @php($order_confirmation_model=\App\Models\BusinessSetting::where('key','order_confirmation_model')->first())
                            @php($order_confirmation_model=$order_confirmation_model?$order_confirmation_model->value:'deliveryman')
                            <div class="form-group">
                                <label class="input-label d-inline">{{__('messages.order_confirmation_model')}}</label><small style="color: red">
                                <span class="input-label-secondary" title="{{__('messages.order_confirmation_model_hint')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}"></span>
                                 *</small>
                                <div class="input-group input-group-md-down-break">
                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="restaurant" name="order_confirmation_model"
                                                   id="order_confirmation_model" {{$order_confirmation_model=='restaurant'?'checked':''}}>
                                            <label class="custom-control-label" for="order_confirmation_model">{{__('messages.vendor')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->

                                    <!-- Custom Radio -->
                                   {{--  <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="deliveryman" name="order_confirmation_model"
                                                   id="order_confirmation_model2" {{$order_confirmation_model=='deliveryman'?'checked':''}}>
                                            <label class="custom-control-label" for="order_confirmation_model2">{{__('messages.deliveryman')}}</label>
                                        </div>
                                    </div> --}}
                                    <!-- End Custom Radio -->
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-4 col-12">
                            @php($canceled_by_restaurant=\App\Models\BusinessSetting::where('key','canceled_by_restaurant')->first())
                            @php($canceled_by_restaurant=$canceled_by_restaurant?$canceled_by_restaurant->value:0)
                            <div class="form-group">
                                <label class="input-label d-inline">{{__('messages.vendor_cancellation_toggle')}}</label><small style="color: red">
                                <!-- <span class="input-label-secondary" title="{{__('messages.customer_varification_toggle')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.customer_varification_toggle')}}"></span> -->
                                 *</small>
                                <div class="input-group input-group-md-down-break">
                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="1" name="canceled_by_restaurant"
                                                   id="canceled_by_restaurant" {{$canceled_by_restaurant==1?'checked':''}}>
                                            <label class="custom-control-label" for="canceled_by_restaurant">{{__('messages.yes')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->

                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="0" name="canceled_by_restaurant"
                                                   id="canceled_by_restaurant2" {{$canceled_by_restaurant==0?'checked':''}}>
                                            <label class="custom-control-label" for="canceled_by_restaurant2">{{__('messages.no')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->
                                </div>
                            </div>
                        </div>
                      {{--   <div class="col-md-4 col-12">
                            @php($canceled_by_deliveryman=\App\Models\BusinessSetting::where('key','canceled_by_deliveryman')->first())
                            @php($canceled_by_deliveryman=$canceled_by_deliveryman?$canceled_by_deliveryman->value:0)
                            <div class="form-group">
                                <label class="input-label d-inline">{{__('messages.deliveryman_cancellation_toggle')}}</label><small style="color: red">
                                <!-- <span class="input-label-secondary" title="{{__('messages.customer_varification_toggle')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.customer_varification_toggle')}}"></span> -->
                                 *</small>
                                <div class="input-group input-group-md-down-break">
                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="1" name="canceled_by_deliveryman"
                                                   id="canceled_by_deliveryman" {{$canceled_by_deliveryman==1?'checked':''}}>
                                            <label class="custom-control-label" for="canceled_by_deliveryman">{{__('messages.yes')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->

                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="0" name="canceled_by_deliveryman"
                                                   id="canceled_by_deliveryman2" {{$canceled_by_deliveryman==0?'checked':''}}>
                                            <label class="custom-control-label" for="canceled_by_deliveryman2">{{__('messages.no')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->
                                </div>
                            </div>
                        </div> --}}
                     {{--    <div class="col-md-4 col-12">
                            @php($show_dm_earning=\App\Models\BusinessSetting::where('key','show_dm_earning')->first())
                            @php($show_dm_earning=$show_dm_earning?$show_dm_earning->value:0)
                            <div class="form-group">
                                <label class="input-label d-inline">{{__('messages.show_earning_for_each_order')}}</label><small style="color: red">
                                <!-- <span class="input-label-secondary" title="{{__('messages.customer_varification_toggle')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.customer_varification_toggle')}}"></span> -->
                                 *</small>
                                <div class="input-group input-group-md-down-break">
                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="1" name="show_dm_earning"
                                                   id="show_dm_earning" {{$show_dm_earning==1?'checked':''}}>
                                            <label class="custom-control-label" for="show_dm_earning">{{__('messages.yes')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->

                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="0" name="show_dm_earning"
                                                   id="show_dm_earning2" {{$show_dm_earning==0?'checked':''}}>
                                            <label class="custom-control-label" for="show_dm_earning2">{{__('messages.no')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->
                                </div>
                            </div>
                        </div> --}}

                    </div>

                    <div class="row">
                        <div class="col-md-4 col-12">
                            @php($admin_order_notification=\App\Models\BusinessSetting::where('key','admin_order_notification')->first())
                            @php($admin_order_notification=$admin_order_notification?$admin_order_notification->value:0)
                            <div class="form-group">
                                <label class="input-label d-inline">{{__('messages.admin')}} {{__('messages.order')}} {{__('messages.notification')}}</label><small style="color: red">*</small>
                                <div class="input-group input-group-md-down-break">
                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="1" name="admin_order_notification"
                                                   id="aon1" {{$admin_order_notification==1?'checked':''}}>
                                            <label class="custom-control-label" for="aon1">{{__('messages.on')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->

                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="0" name="admin_order_notification"
                                                   id="aon2" {{$admin_order_notification==0?'checked':''}}>
                                            <label class="custom-control-label" for="aon2">{{__('messages.off')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-12">
                            @php($ev=\App\Models\BusinessSetting::where('key','customer_verification')->first())
                            @php($ev=$ev?$ev->value:0)
                            <div class="form-group">
                                <label class="input-label d-inline">{{__('messages.customer')}} {{__('messages.verification')}}</label><small style="color: red"><span
                                        class="input-label-secondary" title="{{__('messages.customer_varification_toggle')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.customer_varification_toggle')}}"></span> *</small>
                                <div class="input-group input-group-md-down-break">
                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="1" name="customer_verification"
                                                   id="ev1" {{$ev==1?'checked':''}}>
                                            <label class="custom-control-label" for="ev1">{{__('messages.on')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->

                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="0" name="customer_verification"
                                                   id="ev2" {{$ev==0?'checked':''}}>
                                            <label class="custom-control-label" for="ev2">{{__('messages.off')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-12">
                            @php($odc=\App\Models\BusinessSetting::where('key','order_delivery_verification')->first())
                            @php($odc=$odc?$odc->value:0)
                            <div class="form-group">
                                <label class="input-label d-inline">{{__('messages.order')}}  {{__('messages.verification')}}</label><small style="color: red"><span
                                        class="input-label-secondary" title="{{__('messages.order_varification_toggle')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.order_varification_toggle')}}"></span> *</small>
                                <div class="input-group input-group-md-down-break">
                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="1" name="odc"
                                                   id="odc1" {{$odc==1?'checked':''}}>
                                            <label class="custom-control-label" for="odc1">{{__('messages.on')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->

                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="0" name="odc"
                                                   id="odc2" {{$odc==0?'checked':''}}>
                                            <label class="custom-control-label" for="odc2">{{__('messages.off')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->
                                </div>
                            </div>
                        </div>

                       {{--  <div class="col-md-4 col-12">
                            @php($vnv=\App\Models\BusinessSetting::where('key','toggle_veg_non_veg')->first())
                            @php($vnv=$vnv?$vnv->value:0)
                            <div class="form-group">
                                <label class="input-label d-inline">{{__('messages.veg')}}/{{__('messages.non_veg')}}</label><small style="color: red"><span
                                        class="input-label-secondary" title="{{__('messages.veg_non_veg')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.order_varification_toggle')}}"></span> *</small>
                                <div class="input-group input-group-md-down-break">
                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="1" name="vnv"
                                                   id="vnv1" {{$vnv==1?'checked':''}}>
                                            <label class="custom-control-label" for="vnv1">{{__('messages.on')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->

                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="0" name="vnv"
                                                   id="vnv2" {{$vnv==0?'checked':''}}>
                                            <label class="custom-control-label" for="vnv2">{{__('messages.off')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->
                                </div>
                            </div>
                        </div> --}}

                        <div class="col-md-4 col-12">
                            @php($restaurant_self_registration=\App\Models\BusinessSetting::where('key','toggle_restaurant_registration')->first())
                            @php($restaurant_self_registration=$restaurant_self_registration?$restaurant_self_registration->value:0)
                            <div class="form-group">
                                <label class="input-label d-inline">{{__('messages.vendor_self_registration')}}</label><small style="color: red"><span
                                        class="input-label-secondary" title="{{__('messages.vendor_self_registration')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.vendor_self_registration')}}"></span> *</small>
                                <div class="input-group input-group-md-down-break">
                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="1" name="restaurant_self_registration"
                                                   id="restaurant_self_registration1" {{$restaurant_self_registration==1?'checked':''}}>
                                            <label class="custom-control-label" for="restaurant_self_registration1">{{__('messages.on')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->

                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="0" name="restaurant_self_registration"
                                                   id="restaurant_self_registration2" {{$restaurant_self_registration==0?'checked':''}}>
                                            <label class="custom-control-label" for="restaurant_self_registration2">{{__('messages.off')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->
                                </div>
                            </div>
                        </div>

                      {{--   <div class="col-md-4 col-12">
                            @php($dm_self_registration=\App\Models\BusinessSetting::where('key','toggle_dm_registration')->first())
                            @php($dm_self_registration=$dm_self_registration?$dm_self_registration->value:0)
                            <div class="form-group">
                                <label class="input-label d-inline">{{__('messages.dm_self_registration')}}</label><small style="color: red"><span
                                        class="input-label-secondary" title="{{__('messages.dm_self_registration')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.dm_self_registration')}}"></span> *</small>
                                <div class="input-group input-group-md-down-break">
                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="1" name="dm_self_registration"
                                                   id="dm_self_registration1" {{$dm_self_registration==1?'checked':''}}>
                                            <label class="custom-control-label" for="dm_self_registration1">{{__('messages.on')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->

                                    <!-- Custom Radio -->
                                    <div class="form-control">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="0" name="dm_self_registration"
                                                   id="dm_self_registration2" {{$dm_self_registration==0?'checked':''}}>
                                            <label class="custom-control-label" for="dm_self_registration2">{{__('messages.off')}}</label>
                                        </div>
                                    </div>
                                    <!-- End Custom Radio -->
                                </div>
                            </div>
                        </div> --}}

                    </div>

                    <div class="row">
                        <div class="col-md-6">
                        @php($admin_commission=\App\Models\BusinessSetting::where('key','admin_commission')->first())
                            <div class="form-group p-2">
                                <label class="input-label text-capitalize" for="admin_commission">{{__('messages.default_admin_commission')}}</label>
                                <input type="number" name="admin_commission" class="form-control" id="admin_commission" value="{{$admin_commission?$admin_commission->value:0}}" min="0" max="100" required>
                            </div>
                        </div>


                        <div class="col-md-6">
                        @php($admin_commission=\App\Models\BusinessSetting::where('key','service_coin_on_registration')->first())
                            <div class="form-group p-2">
                                <label class="input-label text-capitalize" >Servicely Coin on Registration</label>
                                <input type="number" name="service_coin_on_registration" class="form-control" value="{{$admin_commission?$admin_commission->value:0}}" min="0"  required>
                            </div>
                        </div>

                        <div class="col-md-6">
                        @php($admin_commission=\App\Models\BusinessSetting::where('key','service_coin_on_referral')->first())
                            <div class="form-group p-2">
                                <label class="input-label text-capitalize" >Servicely Referral Coin</label>
                                <input type="number" name="service_coin_on_referral" class="form-control" value="{{$admin_commission?$admin_commission->value:0}}" min="0"  required>
                            </div>
                        </div>

                        <div class="col-md-6">
                        @php($admin_commission=\App\Models\BusinessSetting::where('key','minimum_coin_transfer')->first())
                            <div class="form-group p-2">
                                <label class="input-label text-capitalize" >Minimum Coin Transfer</label>
                                <input type="number" name="minimum_coin_transfer" class="form-control" value="{{$admin_commission?$admin_commission->value:0}}" min="0"  required>
                            </div>
                        </div>

                        {{-- <div class="col-md-6 col-12">
                        @php($free_delivery_over=\App\Models\BusinessSetting::where('key','free_delivery_over')->first())
                            <div class="form-group p-2 border">
                                <label class="input-label d-inline text-capitalize" for="free_delivery_over">{{__('messages.free_delivery_over')}} ({{\App\CentralLogics\Helpers::currency_symbol()}})</label>
                                <label class="switch ml-3 float-right">
                                    <input type="checkbox" class="status" name="free_delivery_over_status" id="free_delivery_over_status" value="1"
                                        {{isset($free_delivery_over->value)?'checked':''}}>
                                    <span class="slider round"></span>
                                </label>
                                <input type="number" name="free_delivery_over" class="form-control" id="free_delivery_over" value="{{$free_delivery_over?$free_delivery_over->value:0}}" min="0" step=".01" required {{isset($free_delivery_over->value)?'':'readonly'}}>
                            </div>
                        </div> --}}

                        {{-- <div class="col-md-4 col-12">
                        @php($minimum_shipping_charge=\App\Models\BusinessSetting::where('key','minimum_shipping_charge')->first())
                            <div class="form-group">
                                <label class="input-label d-inline text-capitalize" for="minimum_shipping_charge">{{__('messages.minimum_shipping_charge')}}</label>
                                <input type="number" name="minimum_shipping_charge" class="form-control" id="minimum_shipping_charge"  min="0" step=".01" value="{{$minimum_shipping_charge?$minimum_shipping_charge->value:0}}" required>
                            </div>
                        </div> --}}
                        {{-- <div class="col-md-4 col-12">
                        @php($per_km_shipping_charge=\App\Models\BusinessSetting::where('key','per_km_shipping_charge')->first())
                            <div class="form-group">
                                <label class="input-label d-inline text-capitalize" for="per_km_shipping_charge">{{__('messages.per_km_shipping_charge')}}</label>
                                <input type="number" name="per_km_shipping_charge" class="form-control" id="per_km_shipping_charge"  min="0" step=".01" value="{{$per_km_shipping_charge?$per_km_shipping_charge->value:0}}" required>
                            </div>
                        </div>

                        <div class="col-md-4 col-12">
                        @php($dm_maximum_orders=\App\Models\BusinessSetting::where('key','dm_maximum_orders')->first())
                            <div class="form-group">
                                <label class="input-label d-inline text-capitalize" for="dm_maximum_orders">{{__('messages.dm_maximum_order')}}</label><small style="color: red"><span
                                        class="input-label-secondary" title="{{__('messages.dm_maximum_order_hint')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.dm_maximum_order_hint')}}"></span> *</small>
                                <input type="number" name="dm_maximum_orders" class="form-control" id="dm_maximum_orders"  min="1" value="{{$dm_maximum_orders?$dm_maximum_orders->value:1}}" required>
                            </div>
                        </div> --}}
                    </div>

                    <div class="row">
                        @php($phone=\App\Models\BusinessSetting::where('key','phone')->first())
                        <div class="col-md-6 col-12">
                            <div class="form-group">
                                <label class="input-label d-inline" for="exampleFormControlInput1">{{__('messages.phone')}}</label>
                                <input type="text" value="{{$phone->value??''}}"
                                       name="phone" class="form-control"
                                       placeholder="" required>
                            </div>
                        </div>
                        @php($email=\App\Models\BusinessSetting::where('key','email_address')->first())
                        <div class="col-md-6 col-12">
                            <div class="form-group">
                                <label class="input-label d-inline" for="exampleFormControlInput1">{{__('messages.email')}}</label>
                                <input type="email" value="{{$email->value??''}}"
                                       name="email" class="form-control" placeholder=""
                                       required>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-6">
                            @php($address=\App\Models\BusinessSetting::where('key','address')->first())
                            <div class="form-group">
                                <label class="input-label d-inline" for="exampleFormControlInput1">{{__('messages.address')}}</label>
                                <textarea type="text" id="address"
                                       name="address" class="form-control" placeholder="" rows="1"
                                       required>{{$address->value??''}}</textarea>
                            </div>
                            @php($default_location=\App\Models\BusinessSetting::where('key','default_location')->first())
                            @php($default_location=$default_location->value?json_decode($default_location->value, true):0)
                            <div class="form-group">
                                <label class="input-label text-capitalize d-inline" for="latitude">{{__('messages.latitude')}}<span
                                        class="input-label-secondary" title="{{__('messages.click_on_the_map_select_your_defaul_location')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.click_on_the_map_select_your_defaul_location')}}"></span></label>
                                <input type="text" id="latitude"
                                       name="latitude" class="form-control d-inline"
                                       placeholder="Ex : -94.22213" value="{{$default_location?$default_location['lat']:0}}" required readonly>
                            </div>
                            <div class="form-group">
                                <label class="input-label d-inline text-capitalize" for="longitude">{{__('messages.longitude')}}<span
                                        class="input-label-secondary" title="{{__('messages.click_on_the_map_select_your_defaul_location')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.click_on_the_map_select_your_defaul_location')}}"></span></label>
                                <input type="text"
                                       name="longitude" class="form-control"
                                       placeholder="Ex : 103.344322" id="longitude" value="{{$default_location?$default_location['lng']:0}}" required readonly>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <input id="pac-input" class="controls rounded" style="height: 3em;width:fit-content;" title="{{__('messages.search_your_location_here')}}" type="text" placeholder="{{__('messages.search_here')}}"/>
                            <div id="location_map_canvas"></div>
                        </div>
                    </div>

                    <div class="row">
                    @php($footer_text=\App\Models\BusinessSetting::where('key','footer_text')->first())
                        <div class="col-12">
                            <div class="form-group">
                                <label class="input-label d-inline" for="exampleFormControlInput1">{{__('messages.footer')}} {{__('messages.text')}}</label>
                                <textarea type="text" value=""
                                       name="footer_text" class="form-control" placeholder=""
                                       required>{{$footer_text->value??''}}</textarea>
                            </div>
                        </div>
                    </div>

                    @php($logo=\App\Models\BusinessSetting::where('key','logo')->first())
                    @php($logo=$logo->value??'')
                    <div class="form-group">
                        <label class="input-label d-inline">{{__('messages.logo')}}</label><small style="color: red">* ( {{__('messages.ratio')}} 3:1 )</small>
                        <div class="custom-file">
                            <input type="file" name="logo" id="customFileEg1" class="custom-file-input"
                                   accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                            <label class="custom-file-label" for="customFileEg1">{{__('messages.choose')}} {{__('messages.file')}}</label>
                        </div>
                        <hr>
                        <center>
                            <img style="height: 100px;border: 1px solid; border-radius: 10px;" id="viewer"
                                 onerror="this.src='{{asset('public/assets/admin/img/160x160/img2.jpg')}}'"
                                 src="{{asset('storage/app/public/business/'.$logo)}}" alt="logo image"/>
                        </center>
                    </div>
                    <hr>
                    <button type="{{env('APP_MODE')!='demo'?'submit':'button'}}" onclick="{{env('APP_MODE')!='demo'?'':'call_demo()'}}" class="btn btn-primary mb-2">{{trans('messages.submit')}}</button>
                </form>
            </div>
        </div>
    </div>

@endsection

@push('script_2')
    <script>
        {{--@php($language=\App\Models\BusinessSetting::where('key','language')->first())
        @php($language = $language->value ?? null)
        let language = <?php echo($language); ?>;
        $('[id=language]').val(language);--}}

        function maintenance_mode() {
        @if(env('APP_MODE')=='demo')
            toastr.warning('Sorry! You can not enable maintainance mode in demo!');
        @else
            Swal.fire({
                title: 'Are you sure?',
                text: 'Be careful before you turn on/off maintenance mode',
                type: 'warning',
                showCancelButton: true,
                cancelButtonColor: 'default',
                confirmButtonColor: '#377dff',
                cancelButtonText: 'No',
                confirmButtonText: 'Yes',
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                    $.get({
                        url: '{{route('admin.maintenance-mode')}}',
                        contentType: false,
                        processData: false,
                        beforeSend: function () {
                            $('#loading').show();
                        },
                        success: function (data) {
                            toastr.success(data.message);
                        },
                        complete: function () {
                            $('#loading').hide();
                        },
                    });
                } else {
                    location.reload();
                }
            })
        @endif
        };

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
        });
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key={{\App\Models\BusinessSetting::where('key', 'map_api_key')->first()->value}}&libraries=places&v=3.45.8"></script>
    <script>
        function initAutocomplete() {
            var myLatLng = { lat: {{$default_location?$default_location['lat']:'-33.8688'}}, lng: {{$default_location?$default_location['lng']:'151.2195'}} };
            const map = new google.maps.Map(document.getElementById("location_map_canvas"), {
                center: { lat: {{$default_location?$default_location['lat']:'-33.8688'}}, lng: {{$default_location?$default_location['lng']:'151.2195'}} },
                zoom: 13,
                mapTypeId: "roadmap",
            });

            var marker = new google.maps.Marker({
                position: myLatLng,
                map: map,
            });

            marker.setMap( map );
            var geocoder = geocoder = new google.maps.Geocoder();
            google.maps.event.addListener(map, 'click', function (mapsMouseEvent) {
                var coordinates = JSON.stringify(mapsMouseEvent.latLng.toJSON(), null, 2);
                var coordinates = JSON.parse(coordinates);
                var latlng = new google.maps.LatLng( coordinates['lat'], coordinates['lng'] ) ;
                marker.setPosition( latlng );
                map.panTo( latlng );

                document.getElementById('latitude').value = coordinates['lat'];
                document.getElementById('longitude').value = coordinates['lng'];


                geocoder.geocode({ 'latLng': latlng }, function (results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        if (results[1]) {
                            document.getElementById('address').innerHtml = results[1].formatted_address;
                        }
                    }
                });
            });
            // Create the search box and link it to the UI element.
            const input = document.getElementById("pac-input");
            const searchBox = new google.maps.places.SearchBox(input);
            map.controls[google.maps.ControlPosition.TOP_CENTER].push(input);
            // Bias the SearchBox results towards current map's viewport.
            map.addListener("bounds_changed", () => {
                searchBox.setBounds(map.getBounds());
            });
            let markers = [];
            // Listen for the event fired when the user selects a prediction and retrieve
            // more details for that place.
            searchBox.addListener("places_changed", () => {
                const places = searchBox.getPlaces();

                if (places.length == 0) {
                return;
                }
                // Clear out the old markers.
                markers.forEach((marker) => {
                marker.setMap(null);
                });
                markers = [];
                // For each place, get the icon, name and location.
                const bounds = new google.maps.LatLngBounds();
                places.forEach((place) => {
                    if (!place.geometry || !place.geometry.location) {
                        console.log("Returned place contains no geometry");
                        return;
                    }
                    var mrkr = new google.maps.Marker({
                        map,
                        title: place.name,
                        position: place.geometry.location,
                    });
                    google.maps.event.addListener(mrkr, "click", function (event) {
                        document.getElementById('latitude').value = this.position.lat();
                        document.getElementById('longitude').value = this.position.lng();
                    });

                    markers.push(mrkr);

                    if (place.geometry.viewport) {
                        // Only geocodes have viewport.
                        bounds.union(place.geometry.viewport);
                    } else {
                        bounds.extend(place.geometry.location);
                    }
                });
                map.fitBounds(bounds);
            });
        };
        $(document).on('ready', function () {
            initAutocomplete();
            @php($country=\App\Models\BusinessSetting::where('key','country')->first())

            @if($country)
            $("#country option[value='{{$country->value}}']").attr('selected', 'selected').change();
            @endif



            $("#free_delivery_over_status").on('change', function(){
                if($("#free_delivery_over_status").is(':checked')){
                    $('#free_delivery_over').removeAttr('readonly');
                } else {
                    $('#free_delivery_over').attr('readonly', true);
                    $('#free_delivery_over').val('0');
                }
            });
        });

        $(document).on("keydown", "input", function(e) {
          if (e.which==13) e.preventDefault();
        });
    </script>
@endpush