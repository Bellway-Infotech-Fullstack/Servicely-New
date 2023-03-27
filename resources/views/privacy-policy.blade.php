@extends('layouts.landing.app')

@section('title','Privacy Policy')

@section('content')
<style>
    <!--
    /* Font Definitions */
    @font-face {
        font-family: Wingdings;
        panose-1: 5 0 0 0 0 0 0 0 0 0;
    }

    @font-face {
        font-family: "Cambria Math";
        panose-1: 2 4 5 3 5 4 6 3 2 4;
    }

    @font-face {
        font-family: DengXian;
        panose-1: 2 1 6 0 3 1 1 1 1 1;
    }

    @font-face {
        font-family: Calibri;
        panose-1: 2 15 5 2 2 2 4 3 2 4;
    }

    @font-face {
        font-family: "\@DengXian";
        panose-1: 2 1 6 0 3 1 1 1 1 1;
    }

    @font-face {
        font-family: Roboto;
    }

    @font-face {
        font-family: inherit;
        panose-1: 0 0 0 0 0 0 0 0 0 0;
    }

    /* Style Definitions */
    p.MsoNormal,
    li.MsoNormal,
    div.MsoNormal {
        margin-top: 0in;
        margin-right: 0in;
        margin-bottom: 8.0pt;
        margin-left: 0in;
        line-height: 107%;
        font-size: 11.0pt;
        font-family: "Calibri", sans-serif;
    }

    a:link,
    span.MsoHyperlink {
        font-family: "Times New Roman", serif;
        color: #0563C1;
        text-decoration: underline;
    }

    p {
        margin-right: 0in;
        margin-left: 0in;
        font-size: 12.0pt;
        font-family: "Times New Roman", serif;
    }

    .MsoChpDefault {
        font-family: "Calibri", sans-serif;
    }

    .MsoPapDefault {
        margin-bottom: 8.0pt;
        line-height: 107%;
    }

    /* Page Definitions */
    @page WordSection1 {
        size: 8.5in 11.0in;
        margin: 1.0in 1.0in 1.0in 1.0in;
    }

    div.WordSection1 {
        page: WordSection1;
    }

    /* List Definitions */
    ol {
        margin-bottom: 0in;
    }

    ul {
        margin-bottom: 0in;
    }
    -->
</style>

    <main>
        <div class="main-body-div">
            <!-- Top Start -->
            <section class="top-start" style="min-height: 100px">
                <div class="container">
                    <div class="row">
                        <div class="col-12 mt-2 text-center">
                            <h1>{{__('messages.privacy_policy')}}</h1>
                        </div>
                        <div class="col-12" link="#0563C1" vlink="#954F72" style='word-wrap:break-word;
                            text-justify-trim:punctuation'>
                            {{-- {!! $data !!} --}}
                            
                                <div class=WordSection1>
                            
                                    <p class=MsoNormal align=center style='text-align:center'><b><span
                                                style='font-size:24.0pt;line-height:107%'>Privacy Policies</span></b></p>
                            
                                    <p class=MsoNormal align=center style='text-align:center'><b><span
                                                style='font-size:24.0pt;line-height:107%'>&nbsp;</span></b></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>Welcome to Servicly privacy policy (“Privacy Policy” or “Policy”).</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>Moonmoor Private Limited and its affiliates (collectively,
                                            “Servicly”, “we” or “us”) are engaged in the business of providing web &amp;
                                            App based solutions to facilitate connections between customers that seek
                                            specific services and service professionals that offer these services. This
                                            Policy outlines our practices in relation to the collection, storage, usage,
                                            processing, and disclosure of personal data that you have consented to share
                                            with us when you access, use, or otherwise interact with our website available
                                            at https://www. servicly.app/ or mobile application ‘Servicly (collectively,
                                            “Platform’”) or avail services that Servicly offers you on or through the Platform
                                            (collectively, the “Services”). In this Policy, the services offered to you by
                                            service professionals on or through the Platform are referred to as
                                            “Professional Services”.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>At Servicly, we are committed to protecting your personal data and
                                            respecting your privacy. In order to provide you with access to the Services or
                                            the Professional Services, we have to collect and otherwise process certain
                                            data about you. This Policy explains how we process and use personal data about
                                            you.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>Please note that unless specifically defined in this Policy,
                                            capitalized terms shall have the same meaning ascribed to them in our Terms and
                                            Conditions, available at https://www.servicly.app/terms (“Terms”). Please read
                                            this Policy in consonance with the Terms.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>By using the Services, you confirm that you have read and agree to
                                            be bound by this Policy and consent to the processing activities described
                                            under this Policy.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>Please refer to Section 1 to understand how the terms of this
                                            Policy apply to you.</span></p>
                            
                                    <p style='margin:0in;text-align:justify;text-justify:inter-ideograph;
                            background:white;vertical-align:baseline'><strong><span style='font-size:10.5pt;
                            font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>&nbsp;</span></strong></p>
                            
                                    <p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:0in;
                            margin-left:51.0pt;text-align:justify;text-justify:inter-ideograph;text-indent:
                            -.25in;line-height:normal;background:white;vertical-align:baseline'><span
                                            style='font-size:10.5pt;font-family:"inherit",serif;color:black'>1.<span
                                                style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </span></span><strong><span style='font-size:10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>BACKGROUND AND KEY INFORMATION</span></strong></p>
                            
                                    <p style='margin:0in;text-align:justify;text-justify:inter-ideograph;
                            background:white;vertical-align:baseline'><strong><span style='font-size:10.5pt;
                            font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>(a) How this Policy applies:</span></strong></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>This Policy applies to individuals who access or use the Services
                                            or otherwise avail of the Professional Services. For the avoidance of doubt,
                                            references to “you” across this Policy are to an end user that uses the
                                            Platform.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>By using the Platform, you consent to the collection, storage,
                                            usage, and disclosure of your personal data, as described in and collected by
                                            us in accordance with this Policy.</span></p>
                            
                                    <p style='margin:0in;text-align:justify;text-justify:inter-ideograph;
                            background:white;vertical-align:baseline'><strong><span style='font-size:10.5pt;
                            font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>(b) Review and Updates:</span></strong></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>We regularly review and update our Privacy Policy, and we request
                                            you to regularly review this, Policy. It is important that the personal data we
                                            hold about you is accurate and current. Please let us know if your personal
                                            data changes during your relationship with us.</span></p>
                            
                                    <p style='margin:0in;text-align:justify;text-justify:inter-ideograph;
                            background:white;vertical-align:baseline'><strong><span style='font-size:10.5pt;
                            font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>(©) Third-Party Services:</span></strong></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>The Platform may include links to third-party websites, plug-ins,
                                            services, and applications (“Third-Party Services”). Clicking on those links or
                                            enabling those connections may allow third parties to collect or share data
                                            about you. We neither control nor endorse these Third-Party Services and are
                                            not responsible for their privacy statements. When you leave the Platform or
                                            access third-party links through the Platform, we encourage you to read the
                                            privacy policy of such third-party service providers.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>&nbsp;</span></p>
                            
                                    <p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:0in;
                            margin-left:51.0pt;text-align:justify;text-justify:inter-ideograph;text-indent:
                            -.25in;line-height:normal;background:white;vertical-align:baseline'><span
                                            style='font-size:10.5pt;font-family:"inherit",serif;color:black'>2.<span
                                                style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </span></span><strong><span style='font-size:10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>PERSONAL DATA THAT WE COLLECT</span></strong></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(a) We collect different types of personal data about you. This
                                            includes, but is not limited to:</span></p>
                            
                                    <p style='margin:0in;text-align:justify;text-justify:inter-ideograph;
                            background:white;vertical-align:baseline'><span style='font-size:10.5pt;
                            font-family:Roboto;color:black'>(i)&nbsp;</span><strong><span style='font-size:
                            10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>Contact Data</span></strong><span style='font-size:10.5pt;
                            font-family:Roboto;color:black'>, such as you’re mailing or home address,
                                            location, email addresses, and mobile numbers.</span></p>
                            
                                    <p style='margin:0in;text-align:justify;text-justify:inter-ideograph;
                            background:white;vertical-align:baseline'><span style='font-size:10.5pt;
                            font-family:Roboto;color:black'>(ii)&nbsp;</span><strong><span style='font-size:10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>Identity and Profile Data</span></strong><span style='font-size:
                            10.5pt;font-family:Roboto;color:black'>, such as your name, username or similar
                                            identifiers, photographs, and gender.</span></p>
                            
                                    <p style='margin:0in;text-align:justify;text-justify:inter-ideograph;
                            background:white;vertical-align:baseline'><span style='font-size:10.5pt;
                            font-family:Roboto;color:black'>(iii)&nbsp;</span><strong><span style='font-size:10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>Marketing and Communications Data</span></strong><span
                                            style='font-size:10.5pt;font-family:Roboto;color:black'>, such as your address,
                                            email address, information posted in service requests, offers, wants, feedback,
                                            comments, pictures, and discussions in our blog and chat boxes, responses to
                                            user surveys and polls, your preferences in receiving marketing communications
                                            from us and our third parties, and your communication preferences. We also
                                            collect your chat and call records when you communicate with service
                                            professionals through the Platform.</span></p>
                            
                                    <p style='margin:0in;text-align:justify;text-justify:inter-ideograph;
                            background:white;vertical-align:baseline'><span style='font-size:10.5pt;
                            font-family:Roboto;color:black'>(iv)&nbsp;</span><strong><span style='font-size:10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>Technical Data</span></strong><span style='font-size:10.5pt;
                            font-family:Roboto;color:black'>, which includes your IP address, browser type,
                                            internet service provider, details of the operating system, access time, page
                                            views, device ID, device type, frequency of visiting our website, and use of
                                            the Platform, website and mobile application activity, clicks, date and time
                                            stamps, location data, and other technology on the devices that you use to
                                            access the Platform.</span></p>
                            
                                    <p style='margin:0in;text-align:justify;text-justify:inter-ideograph;
                            background:white;vertical-align:baseline'><span style='font-size:10.5pt;
                            font-family:Roboto;color:black'>(v)&nbsp;</span><strong><span style='font-size:
                            10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>Transaction Data</span></strong><span style='font-size:10.5pt;
                            font-family:Roboto;color:black'>, such as details of the Services or
                                            Professional Services you have availed, a limited portion of your credit or
                                            debit card details for tracking transactions that are provided to us by payment
                                            processors, and UPI IDs for processing payments.</span></p>
                            
                                    <p style='margin:0in;text-align:justify;text-justify:inter-ideograph;
                            background:white;vertical-align:baseline'><span style='font-size:10.5pt;
                            font-family:Roboto;color:black'>(vi)&nbsp;</span><strong><span style='font-size:10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>Usage Data</span></strong><span style='font-size:10.5pt;
                            font-family:Roboto;color:black'>, which includes information about how you use
                                            the Services and Professional Services, your activity on the Platform, booking
                                            history, user taps and clicks, user interests, time spent on the Platform,
                                            details about the user journey on the mobile application, and page views.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(b) We also collect, use, and share aggregated data such as
                                            statistical or demographic data for any purpose. Aggregated Data could be
                                            derived from your personal data but is not considered personal data under law
                                            as it does not directly or indirectly reveal your identity. However, if we
                                            combine or connect aggregated data with your personal data so that it can
                                            directly or indirectly identify you, we treat the combined data as personal
                                            data which will be used in accordance with this Policy.</span></p>
                            
                                    <p style='margin:0in;text-align:justify;text-justify:inter-ideograph;
                            background:white;vertical-align:baseline'><strong><span style='font-size:10.5pt;
                            font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>(c)&nbsp;</span></strong><span style='font-size:10.5pt;font-family:
                            Roboto;color:black'>What happens if | refuses to provide my personal data?</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>Where we need to collect personal data by law, or under the terms
                                            of a contract (such as the Terms), and you fail to provide that data when
                                            requested, we may not be able to perform the contract (for example, to provide
                                            you with the Services). In this case, we may have to cancel or limit your
                                            access to the Services.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>&nbsp;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>&nbsp;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>&nbsp;</span></p>
                            
                                    <p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:0in;
                            margin-left:51.0pt;text-align:justify;text-justify:inter-ideograph;text-indent:
                            -.25in;line-height:normal;background:white;vertical-align:baseline'><span
                                            style='font-size:10.5pt;font-family:"inherit",serif;color:black'>3.<span
                                                style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </span></span><strong><span style='font-size:10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>HOW DO WE COLLECT PERSONAL DATA?</span></strong></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>We use different methods to collect personal data from and about
                                            you including through:</span></p>
                            
                                    <p style='margin:0in;text-align:justify;text-justify:inter-ideograph;
                            background:white;vertical-align:baseline'><span style='font-size:10.5pt;
                            font-family:Roboto;color:black'>(a)&nbsp;</span><strong><span style='font-size:
                            10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>Direct Interactions</span></strong><span style='font-size:10.5pt;
                            font-family:Roboto;color:black'>. You provide us with your personal data when
                                            you interact with us. This includes personal data you provide when you:</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(i) create an account or profile with us;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(ii) Use our Services or carry out other activities in connection
                                            with the Services;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(iii) enter a promotion, user poll, or online survey;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(iv) request marketing communications to be sent to you; or</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(v) report a problem with the Platform and/or our Services, give
                                            us feedback or contact us.</span></p>
                            
                                    <p style='margin:0in;text-align:justify;text-justify:inter-ideograph;
                            background:white;vertical-align:baseline'><span style='font-size:10.5pt;
                            font-family:Roboto;color:black'>(b)&nbsp;</span><strong><span style='font-size:
                            10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>Automated technologies or interactions.</span></strong><span
                                            style='font-size:10.5pt;font-family:Roboto;color:black'>&nbsp;Each time you
                                            visit the Platform or use the Services, we will automatically collect Technical
                                            Data about your equipment, browsing actions, and patterns. We collect this
                                            personal data by using cookies, web beacons, pixel tags, server logs, and other
                                            similar technologies. We may also receive Technical Data about you if you visit
                                            other websites or apps that employ our cookies.</span></p>
                            
                                    <p style='margin:0in;text-align:justify;text-justify:inter-ideograph;
                            background:white;vertical-align:baseline'><span style='font-size:10.5pt;
                            font-family:Roboto;color:black'>(c)&nbsp;</span><strong><span style='font-size:
                            10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>Third parties or publicly available sources</span></strong><span
                                            style='font-size:10.5pt;font-family:Roboto;color:black'>. We will receive
                                            personal data about you from various third parties:</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(i) Technical Data from analytics providers such as Facebook and
                                            advertising networks;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(ii) Identity and profile-related Data and Contact Data from
                                            service professionals, publicly available sources, etc.;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(iii) Personal data about you from our affiliate entities.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>&nbsp;</span></p>
                            
                                    <p style='margin:0in;text-align:justify;text-justify:inter-ideograph;
                            background:white;vertical-align:baseline'><strong><span style='font-size:10.5pt;
                            font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>&nbsp;</span></strong></p>
                            
                                    <p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:0in;
                            margin-left:51.0pt;text-align:justify;text-justify:inter-ideograph;text-indent:
                            -.25in;line-height:normal;background:white;vertical-align:baseline'><span
                                            style='font-size:10.5pt;font-family:"inherit",serif;color:black'>4.<span
                                                style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </span></span><strong><span style='font-size:10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>HOW DO WE USE YOUR PERSONAL DATA?</span></strong></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(a) We will only use your personal data when the law allows us to.
                                            Most commonly, we will use your personal data where we need to provide you with
                                            the Services, enable you to use the Professional Services, or where need to
                                            comply with a legal obligation. We use your personal data for the following</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(i) to verify your identity to register you as a user, and create
                                            your user account with us on the Platform;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(ii) to provide the Services to you;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(iii) to enable the provision of Professional Services to you;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(iv) to monitor trends and personalize your experience;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(v) to improve the functionality of our Services based on the
                                            information and feedback we receive from you;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(vi) to improve customer service to effectively respond to your
                                            service requests and support needs;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(vii) to track transactions and process payments;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(viii) to send periodic notifications to manage our relationship
                                            with you including notifying you of changes to the Services, sending you
                                            information and updates pertaining to the Services you have availed, and
                                            receiving occasional company news and updates related to us or the Services;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(ix) to assist with the facilitation of the Professional Services
                                            offered to you, including sending you information and updates about the
                                            Professional Services you have availed;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(x) to market and advertise the Services to you;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(xi) to comply with legal obligations;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(xii) to administer and protect our business and the Services,
                                            including troubleshooting, data analysis, system testing, and performing
                                            internal operations;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(xiii) to improve our business and delivery models;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(xiv) to perform our obligations that arise out of the arrangement
                                            we are about to enter or have entered with you;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(xv) to enforce our Terms &amp; Conditions</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(xvi) to respond to court orders, establish or exercise our legal
                                            rights, or defend ourselves against legal claims.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(b) You agree and acknowledge that by using our Services and
                                            creating an account with us on the Platform, you authorize us, our service
                                            professionals, associate partners, and affiliates to contact you via email, phone,
                                            or otherwise. This is to provide the Services to you and ensure that you are
                                            aware of all the features of the Services and for related purposes.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(c) You agree and acknowledge that any and all information
                                            pertaining to you, whether or not you directly provide it to us (via the
                                            Services or otherwise), including but not limited to personal correspondence
                                            such as emails, instructions from you, etc., may be collected, compiled, and
                                            shared by us in order to render the Services to you. This may include but not
                                            be limited to service professionals who provide or seek to provide you with
                                            Professional Services, vendors, social media companies, third-party service
                                            providers, storage providers, data analytics providers, consultants, lawyers,
                                            and auditors. We may also share this information with other entities in the
                                            Servicly group in connection with the above-mentioned purposes.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(d) You agree and acknowledge that we may share data without your
                                            consent when it is required by law or by any court or government agency or
                                            authority to disclose such information. Such disclosures are made in good faith
                                            and belief that it is reasonably necessary to do so for enforcing this Policy
                                            or the Terms, or in order to comply with any applicable laws and regulations.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>&nbsp;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>&nbsp;</span></p>
                            
                                    <p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:0in;
                            margin-left:51.0pt;text-align:justify;text-justify:inter-ideograph;text-indent:
                            -.25in;line-height:normal;background:white;vertical-align:baseline'><span
                                            style='font-size:10.5pt;font-family:"inherit",serif;color:black'>5.<span
                                                style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </span></span><strong><span style='font-size:10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>COOKIES</span></strong></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(a) Cookies are small files that a site or its service provider
                                            transfers to your device’s hard drive through your web browser (if you permit
                                            it to) that enables the sites or service providers’ systems to recognize your
                                            browser and capture and remember certain information.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(b) We use cookies to help us distinguish you from other users of
                                            the Platform, understand and save your preferences for future visits, keep
                                            track of advertisements and compile aggregate data about site traffic and site
                                            interaction so that we can offer you a seamless user experience. We may
                                            contract third-party service providers to assist us in better understanding our
                                            site visitors. These service providers are not permitted to use the information
                                            collected on our behalf except to help us conduct and improve our business.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(c) Additionally, you may encounter cookies or other similar
                                            devices on certain pages of the Platform that are placed by third parties. We
                                            do not control the use of cookies by third parties. If you send us personal
                                            correspondence, such as emails, or if other users or third parties send us
                                            correspondence about your activities or postings on the Platform, we may
                                            collect such information within a file specific to you.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>&nbsp;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>&nbsp;</span></p>
                            
                                    <p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:0in;
                            margin-left:51.0pt;text-align:justify;text-justify:inter-ideograph;text-indent:
                            -.25in;line-height:normal;background:white;vertical-align:baseline'><span
                                            style='font-size:10.5pt;font-family:"inherit",serif;color:black'>6.<span
                                                style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </span></span><strong><span style='font-size:10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>DISCLOSURES OF YOUR PERSONAL DATA</span></strong></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(a) We may share your personal data with third parties set out
                                            below for the purposes set out in Section 4:</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(i) Service professionals to enable them to provide you with
                                            Professional Services;</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(ii) Internal third parties, which are other companies within the
                                            Servicly.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(iii) External third parties such as:</span></p>
                            
                                    <p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:0in;
                            margin-left:51.0pt;text-align:justify;text-justify:inter-ideograph;text-indent:
                            -.25in;line-height:normal;background:white;vertical-align:baseline'><span
                                            style='font-size:10.0pt;font-family:Symbol;color:black'>·<span
                                                style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </span></span><span style='font-size:10.5pt;font-family:"inherit",serif;
                            color:black'>Trusted third parties such as our associate partners, and service
                                            providers that provide services for us or on our behalf. This includes hosting
                                            and operating our Platform, providing marketing assistance, conducting our
                                            business, processing payments and transaction-related processes, transmitting
                                            content, and providing our Services to you;</span></p>
                            
                                    <p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:0in;
                            margin-left:51.0pt;text-align:justify;text-justify:inter-ideograph;text-indent:
                            -.25in;line-height:normal;background:white;vertical-align:baseline'><span
                                            style='font-size:10.0pt;font-family:Symbol;color:black'>·<span
                                                style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </span></span><span style='font-size:10.5pt;font-family:"inherit",serif;
                            color:black'>Analytic service providers and advertising networks that conduct
                                            web analytics for us to help us improve the Platform. These analytics providers
                                            may use cookies and other technologies to perform their services;</span></p>
                            
                                    <p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:0in;
                            margin-left:51.0pt;text-align:justify;text-justify:inter-ideograph;text-indent:
                            -.25in;line-height:normal;background:white;vertical-align:baseline'><span
                                            style='font-size:10.0pt;font-family:Symbol;color:black'>·<span
                                                style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </span></span><span style='font-size:10.5pt;font-family:"inherit",serif;
                            color:black'>Other registered users on our Platform upon your request or where
                                            you explicitly consent to such disclosure; and</span></p>
                            
                                    <p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:0in;
                            margin-left:51.0pt;text-align:justify;text-justify:inter-ideograph;text-indent:
                            -.25in;line-height:normal;background:white;vertical-align:baseline'><span
                                            style='font-size:10.0pt;font-family:Symbol;color:black'>·<span
                                                style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </span></span><span style='font-size:10.5pt;font-family:"inherit",serif;
                            color:black'>Regulators and other bodies, as required by law or regulation.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(b) We require all third parties to respect the security of your
                                            personal data and to treat it in accordance with the law. We do not allow our
                                            third-party</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>service providers to use your personal data for their own purposes
                                            and only permit them to process your personal data for specified purposes and
                                            in accordance with our instructions.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>&nbsp;</span></p>
                            
                                    <p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:0in;
                            margin-left:51.0pt;text-align:justify;text-justify:inter-ideograph;text-indent:
                            -.25in;line-height:normal;background:white;vertical-align:baseline'><span
                                            style='font-size:10.5pt;font-family:"inherit",serif;color:black'>7.<span
                                                style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </span></span><strong><span style='font-size:10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>YOUR RIGHTS IN RELATION TO YOUR PERSONAL DATA</span></strong></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(a) Access and Updating your Personal Data: You hereby warrant
                                            that all personal data that you provide us with is accurate, up-to-date, and
                                            true. When you use our Services, we make our best efforts to provide you with
                                            the ability to access and correct inaccurate or deficient data, subject to any
                                            legal requirements. You can request Servicly for a copy of your personal data
                                            by sending an email to. Servicly may take up to 5 (Five) working days to
                                            respond to such a request.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(b) Opting-out of Marketing and Promotional Communications: When
                                            we send you marketing and promotional content through email, we make our best
                                            efforts to provide you with the ability to opt-out of such communications by
                                            using the opt-out instructions provided in such emails. You understand and
                                            acknowledge that it may take us up to 10 (Ten) business days to give effect to you
                                            opt-out request. Please note that we may still send you emails about your user
                                            account or any Services you have requested or received from us.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>&nbsp;</span></p>
                            
                                    <p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:0in;
                            margin-left:51.0pt;text-align:justify;text-justify:inter-ideograph;text-indent:
                            -.25in;line-height:normal;background:white;vertical-align:baseline'><span
                                            style='font-size:10.5pt;font-family:"inherit",serif;color:black'>8.<span
                                                style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </span></span><strong><span style='font-size:10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>DELETION OF ACCOUNT AND PERSONAL DATA</span></strong></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            .5in;text-align:justify;text-justify:inter-ideograph;text-indent:-.25in;
                            background:white;vertical-align:baseline'><span style='font-size:10.5pt;
                            font-family:Roboto;color:black'>(a)<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;
                                            </span></span><span style='font-size:10.5pt;font-family:Roboto;color:black'>Notwithstanding
                                            anything contained in the Terms, you may delete your account as well as your
                                            personal data stored with Servicly by sending an email to. Servicly may take up
                                            to 7 (seven) working days to process your request. Once your account is
                                            deleted, you will lose access to all Services. For the avoidance of doubt, it
                                            is hereby clarified that all data with respect to transactions performed by you
                                            on the Platform will be retained in accordance with applicable law.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            .25in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>&nbsp;</span></p>
                            
                                    <p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:0in;
                            margin-left:51.0pt;text-align:justify;text-justify:inter-ideograph;text-indent:
                            -.25in;line-height:normal;background:white;vertical-align:baseline'><span
                                            style='font-size:10.5pt;font-family:"inherit",serif;color:black'>9.<span
                                                style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </span></span><strong><span style='font-size:10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>TRANSFERS OF YOUR PERSONAL DATA</span></strong></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(a) We comply with applicable laws in respect of the storage and transfer
                                            of personal data. As a part of your use of the Services, the information and
                                            personal data you provide to us may be transferred to and stored in countries
                                            other than the country you are based in. This may happen if any of our servers
                                            are from time to time located in a country other than the one you are based in,
                                            or one of our vendors, partners, or service providers is located in a country
                                            other than the one you are based in.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(b) By submitting your information and personal data to us, you
                                            agree to the transfer, storage, and processing of such information and personal
                                            data in the manner described above.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>&nbsp;</span></p>
                            
                                    <p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:0in;
                            margin-left:51.0pt;text-align:justify;text-justify:inter-ideograph;text-indent:
                            -.25in;line-height:normal;background:white;vertical-align:baseline'><span
                                            style='font-size:10.5pt;font-family:"inherit",serif;color:black'>10.<span
                                                style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span></span><strong><span style='font-size:10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>DATA SECURITY</span></strong></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(a) We implement appropriate security measures and
                                            privacy-protective features on our Platform including encryption, password
                                            protection, call masking, and physical security measures to protect your
                                            personal data from unauthorized access and disclosure, and follow standards
                                            prescribed by applicable law.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(b) Where you have chosen a password that enables you to access
                                            certain parts of the Services or Professional Services, you are responsible for
                                            keeping this password secret and confidential. We will not be responsible for
                                            any unauthorized use of your information, for any lost, stolen, or compromised
                                            passwords, or for any activity on your user account due to such unauthorized
                                            disclosure of your password. In the event, your password has been compromised
                                            in any manner whatsoever, you should promptly notify us to enable us to
                                            initiate a change of password.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>&nbsp;</span></p>
                            
                                    <p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:0in;
                            margin-left:51.0pt;text-align:justify;text-justify:inter-ideograph;text-indent:
                            -.25in;line-height:normal;background:white;vertical-align:baseline'><span
                                            style='font-size:10.5pt;font-family:"inherit",serif;color:black'>11.<span
                                                style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span></span><strong><span style='font-size:10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>DATA RETENTION</span></strong></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(a) You agree and acknowledge that your personal data will
                                            continue to be stored and retained by us for as long as necessary to fulfill
                                            our stated purpose(s) and for a reasonable period after the termination of your
                                            account on the Platform or access to the Services to comply with our legal
                                            rights and obligations.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(b) In some circumstances, we may aggregate your personal data (so
                                            that it can no longer be associated with you) for research or statistical
                                            purposes, in which case we may use this information indefinitely without
                                            further notice to you.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>&nbsp;</span></p>
                            
                                    <p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:0in;
                            margin-left:51.0pt;text-align:justify;text-justify:inter-ideograph;text-indent:
                            -.25in;line-height:normal;background:white;vertical-align:baseline'><span
                                            style='font-size:10.5pt;font-family:"inherit",serif;color:black'>12.<span
                                                style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span></span><strong><span style='font-size:10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>BUSINESS TRANSITIONS</span></strong></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>You are aware that in the event we go through a business
                                            transition, such as a merger, acquisition by another organization, or sale of
                                            all or a portion of our assets, your personal data might be among the assets
                                            transferred.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>&nbsp;</span></p>
                            
                                    <p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:0in;
                            margin-left:51.0pt;text-align:justify;text-justify:inter-ideograph;text-indent:
                            -.25in;line-height:normal;background:white;vertical-align:baseline'><span
                                            style='font-size:10.5pt;font-family:"inherit",serif;color:black'>13.<span
                                                style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span></span><strong><span style='font-size:10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>USER-GENERATED CONTENT</span></strong></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>We invite you to post content on our Platform, including your
                                            comments, feedback, pictures, or any other information that you would like to
                                            be made available on our Platform. Please note that such content will be
                                            available to all visitors to our Platform and may become public. We cannot
                                            prevent such information from being used in a manner that is contrary to this
                                            Policy, applicable laws, or your personal privacy, and we disclaim all
                                            liability (express or implied) in this regard. Further, you agree to comply
                                            with all applicable laws in relation to the content uploaded or otherwise
                                            shared by you on our Platform. You understand and acknowledge that you will be
                                            solely responsible for any information published by you on our Platform that
                                            violates applicable laws.</span></p>
                            
                                    <p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:0in;
                            margin-left:51.0pt;text-align:justify;text-justify:inter-ideograph;text-indent:
                            -.25in;line-height:normal;background:white;vertical-align:baseline'><span
                                            style='font-size:10.5pt;font-family:"inherit",serif;color:black'>14.<span
                                                style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span></span><strong><span style='font-size:10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>UPDATES TO THIS POLICY</span></strong></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(a) We may occasionally update this Policy. If we make changes to
                                            this Policy, we will upload the revised policy on the Platform or share it with
                                            you through other means, such as email. To the extent permitted under
                                            applicable law, by using our Platform after such notice, you consent to updates
                                            made to this Policy.</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>(b) We encourage you to periodically review this Policy for the
                                            latest information on our privacy practices.</span></p>
                            
                                    <p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:0in;
                            margin-left:51.0pt;text-align:justify;text-justify:inter-ideograph;text-indent:
                            -.25in;line-height:normal;background:white;vertical-align:baseline'><span
                                            style='font-size:10.5pt;font-family:"inherit",serif;color:black'>15.<span
                                                style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span></span><strong><span style='font-size:10.5pt;font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>GRIEVANCE OFFICER</span></strong></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>If you have any questions about this Policy, how we process or
                                            handle your personal data, or otherwise, you may reach out to us, with your
                                            queries, grievances, feedback, and comments
                                            at&nbsp;privacy@servicly.app&nbsp;or contact our grievance officer whose
                                            contact details are provided below:</span></p>
                            
                                    <p style='margin:0in;text-align:justify;text-justify:inter-ideograph;
                            background:white;vertical-align:baseline'><b><span style='font-size:10.5pt;
                            font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>Grievance Officers</span></b></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>Name Miss. Neha Jaiswal</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>Designation: COO (Management)</span></p>
                            
                                    <p style='margin:0in;text-align:justify;text-justify:inter-ideograph;
                            background:white;vertical-align:baseline'><span style='font-size:10.5pt;
                            font-family:Roboto;color:black'>Email:&nbsp;</span><span style='color:black'><a
                                                href="mailto:privacy@servicly.app"><span style='font-size:10.5pt;font-family:
                            "inherit",serif;color:#333333;border:none windowtext 1.0pt;padding:0in'>privacy@servicly.app</span></a></span></p>
                            
                                    <p style='margin:0in;text-align:justify;text-justify:inter-ideograph;
                            background:white;vertical-align:baseline'><b><span style='font-size:10.5pt;
                            font-family:"inherit",serif;color:black;border:none windowtext 1.0pt;
                            padding:0in'>Head Legal &amp; IT Department</span></b></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>Name: Mr. Aaryan Jha</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>Designation: CEO (Legal &amp; IT)</span></p>
                            
                                    <p style='margin-top:0in;margin-right:0in;margin-bottom:15.0pt;margin-left:
                            0in;text-align:justify;text-justify:inter-ideograph;background:white;
                            vertical-align:baseline'><span style='font-size:10.5pt;font-family:Roboto;
                            color:black'>Email:&nbsp;legal@servicly.app</span></p>
                            
                                    <p class=MsoNormal style='text-align:justify;text-justify:inter-ideograph'><b><span
                                                style='font-size:16.0pt;line-height:107%'>&nbsp;</span></b></p>
                            
                                </div>



                        </div>
                    </div>
                </div>
            </section>
            <!-- Top End -->
        </div>
    </main>
@endsection
