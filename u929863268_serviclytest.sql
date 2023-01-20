-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 20, 2023 at 01:28 PM
-- Server version: 10.5.15-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u929863268_serviclytest`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `current_balance` decimal(24,2) NOT NULL,
  `amount` decimal(24,2) NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `add_ons`
--

CREATE TABLE `add_ons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`, `zone_id`) VALUES
(1, 'Test', 'Acc', '09099999999', 'test@test.com', NULL, '$2y$10$HMltTdRzL4BUuppm7tn9K.O.L7ffR1C/HVCF5BBf4ysbRvdllK58a', 'klDTdahGAHgPmFMCddrxpAlQIolgoFO9xuBUJiCwmrjboKGsLGu1Tz0c6D7L', '2022-07-06 09:59:01', '2022-07-06 09:59:01', 1, NULL),
(2, 'Rahul', 'Singh', '9667202227', 'aaryanjhaaj@gmail.com', '2022-10-15-634ab210cd0f3.png', '$2y$10$xKcbVCh7ZAbZ6F/I8MSNi.f7AYPtfioMQOAYDBCrPfjC4qgeOuFQC', NULL, '2022-10-15 18:43:52', '2022-10-15 18:43:52', 5, 5),
(3, 'Karan', 'Rajput', '1345678889', 'manager@gmail.com', '2023-01-09-63bbb31e2b4a8.png', '$2y$10$MO.QBv2bQSDsUP7bs2ERFudSdtFCEi8iEU2RkvyEWwry9tbL5H7he', NULL, '2023-01-09 11:54:30', '2023-01-09 15:49:59', 8, 4);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `modules`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL),
(5, 'Booking', '[\"booking\"]', 1, '2022-10-15 18:42:24', '2022-10-15 18:42:24'),
(7, 'Manager', '[\"banner\"]', 1, '2023-01-09 11:53:00', '2023-01-09 11:53:00'),
(8, 'Booking Manager', '[\"booking\"]', 1, '2023-01-09 15:49:43', '2023-01-09 15:49:43');

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `total_commission_earning` decimal(24,2) NOT NULL DEFAULT 0.00,
  `digital_received` decimal(24,2) NOT NULL DEFAULT 0.00,
  `manual_received` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `total_commission_earning`, `digital_received`, `manual_received`, `created_at`, `updated_at`, `delivery_charge`) VALUES
(1, 1, '5249.30', '0.00', '10580.00', '2022-09-27 13:56:05', '2023-01-12 13:51:18', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'best servicing', '2022-08-26 02:31:01', '2022-08-26 02:31:01');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `data` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `type`, `image`, `status`, `data`, `created_at`, `updated_at`, `zone_id`) VALUES
(35, 'new banner', 'vendor_wise', '2023-01-11-63bea1c3e31e4.png', 1, '9', '2023-01-11 17:17:15', '2023-01-11 17:17:15', 4),
(36, 'new banner', 'vendor_wise', '2023-01-11-63bea1dc2522b.png', 1, '20', '2023-01-11 17:17:40', '2023-01-11 17:17:40', 4),
(37, 'new banner', 'vendor_wise', '2023-01-11-63bea1f8884cb.png', 1, '20', '2023-01-11 17:18:08', '2023-01-11 17:18:08', 4),
(38, 'new banner', 'vendor_wise', '2023-01-11-63bea20d16f51.png', 1, '20', '2023-01-11 17:18:29', '2023-01-11 17:18:29', 4);

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'cash_on_delivery', '{\"status\":\"0\"}', '2021-05-11 03:56:38', '2022-08-15 12:37:02'),
(2, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2021-05-11 03:57:02', '2022-09-15 16:40:45'),
(4, 'mail_config', '{\"name\":\"vishnu\",\"host\":\"charan\",\"driver\":\"vishnu charan\",\"port\":\"vishnu charan\",\"username\":\"ram\",\"email_id\":\"rina@gmail.com\",\"encryption\":\"agfgf\",\"password\":\"1234567\"}', NULL, '2022-11-05 15:01:58'),
(5, 'fcm_project_id', NULL, NULL, NULL),
(6, 'push_notification_key', NULL, NULL, NULL),
(7, 'order_pending_message', '{\"status\":1,\"message\":\"Booking Pending\"}', NULL, NULL),
(8, 'order_confirmation_msg', '{\"status\":1,\"message\":\"Booking confirm successfully\"}', NULL, NULL),
(9, 'order_processing_message', '{\"status\":1,\"message\":\"Booking in processing\"}', NULL, NULL),
(10, 'out_for_delivery_message', '{\"status\":1,\"message\":null}', NULL, NULL),
(11, 'order_delivered_message', '{\"status\":1,\"message\":\"booking completed\"}', NULL, NULL),
(12, 'delivery_boy_assign_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(13, 'delivery_boy_start_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(14, 'delivery_boy_delivered_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(15, 'terms_and_conditions', '<p>1.&nbsp;<strong>Introduction</strong></p>\r\n\r\n<p>Welcome to&nbsp;<strong>servicly.com</strong>&nbsp;(&ldquo;Company&rdquo;, &ldquo;we&rdquo;, &ldquo;our&rdquo;, &ldquo;us&rdquo;)!</p>\r\n\r\n<p>These Terms of Service (&ldquo;Terms&rdquo;, &ldquo;Terms of Service&rdquo;) govern your use of our website located at&nbsp;<strong>http://servicly.p4moviemaker.com/</strong>&nbsp;(together or individually &ldquo;Service&rdquo;) operated by&nbsp;<strong>servicly.com</strong>.</p>\r\n\r\n<p>Our Privacy Policy also governs your use of our Service and explains how we collect, safeguard and disclose information that results from your use of our web pages.</p>\r\n\r\n<p>Your agreement with us includes these Terms and our Privacy Policy (&ldquo;Agreements&rdquo;). You acknowledge that you have read and understood Agreements, and agree to be bound of them.</p>\r\n\r\n<p>If you do not agree with (or cannot comply with) Agreements, then you may not use the Service, but please let us know by emailing at&nbsp;<strong>admin@admin.com</strong>&nbsp;so we can try to find a solution. These Terms apply to all visitors, users and others who wish to access or use Service.</p>\r\n\r\n<p>2.&nbsp;<strong>Communications</strong></p>\r\n\r\n<p>By using our Service, you agree to subscribe to newsletters, marketing or promotional materials and other information we may send. However, you may opt out of receiving any, or all, of these communications from us by following the unsubscribe link or by emailing at&nbsp;admin@admin.com.</p>\r\n\r\n<p>3.&nbsp;<strong>Purchases</strong></p>\r\n\r\n<p>If you wish to purchase any product or service made available through Service (&ldquo;Purchase&rdquo;), you may be asked to supply certain information relevant to your Purchase including but not limited to, your credit or debit card number, the expiration date of your card, your billing address, and your shipping information.</p>\r\n\r\n<p>You represent and warrant that: (i) you have the legal right to use any card(s) or other payment method(s) in connection with any Purchase; and that (ii) the information you supply to us is true, correct and complete.</p>\r\n\r\n<p>We may employ the use of third party services for the purpose of facilitating payment and the completion of Purchases. By submitting your information, you grant us the right to provide the information to these third parties subject to our Privacy Policy.</p>\r\n\r\n<p>We reserve the right to refuse or cancel your order at any time for reasons including but not limited to: product or service availability, errors in the description or price of the product or service, error in your order or other reasons.</p>\r\n\r\n<p>We reserve the right to refuse or cancel your order if fraud or an unauthorized or illegal transaction is suspected.</p>\r\n\r\n<p>4.&nbsp;<strong>Contests, Sweepstakes and Promotions</strong></p>\r\n\r\n<p>Any contests, sweepstakes or other promotions (collectively, &ldquo;Promotions&rdquo;) made available through Service may be governed by rules that are separate from these Terms of Service. If you participate in any Promotions, please review the applicable rules as well as our Privacy Policy. If the rules for a Promotion conflict with these Terms of Service, Promotion rules will apply.</p>\r\n\r\n<p>5.&nbsp;<strong>Subscriptions</strong></p>\r\n\r\n<p>Some parts of Service are billed on a subscription basis (&quot;Subscription(s)&quot;). You will be billed in advance on a recurring and periodic basis (&quot;Billing Cycle&quot;). Billing cycles will be set depending on the type of subscription plan you select when purchasing a Subscription.</p>\r\n\r\n<p>At the end of each Billing Cycle, your Subscription will automatically renew under the exact same conditions unless you cancel it or&nbsp;servicly.com&nbsp;cancels it. You may cancel your Subscription renewal either through your online account management page or by contacting&nbsp;admin@admin.com&nbsp;customer support team.</p>\r\n\r\n<p>A valid payment method is required to process the payment for your subscription. You shall provide&nbsp;servicly.com&nbsp;with accurate and complete billing information that may include but not limited to full name, address, state, postal or zip code, telephone number, and a valid payment method information. By submitting such payment information, you automatically authorize&nbsp;servicly.com&nbsp;to charge all Subscription fees incurred through your account to any such payment instruments.</p>\r\n\r\n<p>Should automatic billing fail to occur for any reason,&nbsp;servicly.com&nbsp;reserves the right to terminate your access to the Service with immediate effect.</p>\r\n\r\n<p>6.&nbsp;<strong>Free Trial</strong></p>\r\n\r\n<p>servicly.com&nbsp;may, at its sole discretion, offer a Subscription with a free trial for a limited period of time (&quot;Free Trial&quot;).</p>\r\n\r\n<p>You may be required to enter your billing information in order to sign up for Free Trial.</p>\r\n\r\n<p>If you do enter your billing information when signing up for Free Trial, you will not be charged by&nbsp;servicly.com&nbsp;until Free Trial has expired. On the last day of Free Trial period, unless you cancelled your Subscription, you will be automatically charged the applicable Subscription fees for the type of Subscription you have selected.</p>\r\n\r\n<p>At any time and without notice,&nbsp;servicly.com&nbsp;reserves the right to (i) modify Terms of Service of Free Trial offer, or (ii) cancel such Free Trial offer.</p>\r\n\r\n<p>7.&nbsp;<strong>Fee Changes</strong></p>\r\n\r\n<p>servicly.com, in its sole discretion and at any time, may modify Subscription fees for the Subscriptions. Any Subscription fee change will become effective at the end of the then-current Billing Cycle.</p>\r\n\r\n<p>servicly.com&nbsp;will provide you with a reasonable prior notice of any change in Subscription fees to give you an opportunity to terminate your Subscription before such change becomes effective.</p>\r\n\r\n<p>Your continued use of Service after Subscription fee change comes into effect constitutes your agreement to pay the modified Subscription fee amount.</p>\r\n\r\n<p>8.&nbsp;<strong>Refunds</strong></p>\r\n\r\n<p>We issue refunds for Contracts within&nbsp;<strong>30&nbsp;days</strong>&nbsp;of the original purchase of the Contract.</p>\r\n\r\n<p>9.&nbsp;<strong>Content</strong></p>\r\n\r\n<p>Our Service allows you to post, link, store, share and otherwise make available certain information, text, graphics, videos, or other material (&ldquo;Content&rdquo;). You are responsible for Content that you post on or through Service, including its legality, reliability, and appropriateness.</p>\r\n\r\n<p>By posting Content on or through Service, You represent and warrant that: (i) Content is yours (you own it) and/or you have the right to use it and the right to grant us the rights and license as provided in these Terms, and (ii) that the posting of your Content on or through Service does not violate the privacy rights, publicity rights, copyrights, contract rights or any other rights of any person or entity. We reserve the right to terminate the account of anyone found to be infringing on a copyright.</p>\r\n\r\n<p>You retain any and all of your rights to any Content you submit, post or display on or through Service and you are responsible for protecting those rights. We take no responsibility and assume no liability for Content you or any third party posts on or through Service. However, by posting Content using Service you grant us the right and license to use, modify, publicly perform, publicly display, reproduce, and distribute such Content on and through Service. You agree that this license includes the right for us to make your Content available to other users of Service, who may also use your Content subject to these Terms.</p>\r\n\r\n<p>servicly.com&nbsp;has the right but not the obligation to monitor and edit all Content provided by users.</p>\r\n\r\n<p>In addition, Content found on or through this Service are the property of&nbsp;servicly.com&nbsp;or used with permission. You may not distribute, modify, transmit, reuse, download, repost, copy, or use said Content, whether in whole or in part, for commercial purposes or for personal gain, without express advance written permission from us.</p>\r\n\r\n<p>10.&nbsp;<strong>Prohibited Uses</strong></p>\r\n\r\n<p>You may use Service only for lawful purposes and in accordance with Terms. You agree not to use Service:</p>\r\n\r\n<p>0.1. In any way that violates any applicable national or international law or regulation.</p>\r\n\r\n<p>0.2. For the purpose of exploiting, harming, or attempting to exploit or harm minors in any way by exposing them to inappropriate content or otherwise.</p>\r\n\r\n<p>0.3. To transmit, or procure the sending of, any advertising or promotional material, including any &ldquo;junk mail&rdquo;, &ldquo;chain letter,&rdquo; &ldquo;spam,&rdquo; or any other similar solicitation.</p>\r\n\r\n<p>0.4. To impersonate or attempt to impersonate Company, a Company employee, another user, or any other person or entity.</p>\r\n\r\n<p>0.5. In any way that infringes upon the rights of others, or in any way is illegal, threatening, fraudulent, or harmful, or in connection with any unlawful, illegal, fraudulent, or harmful purpose or activity.</p>\r\n\r\n<p>0.6. To engage in any other conduct that restricts or inhibits anyone&rsquo;s use or enjoyment of Service, or which, as determined by us, may harm or offend Company or users of Service or expose them to liability.</p>\r\n\r\n<p>Additionally, you agree not to:</p>\r\n\r\n<p>0.1. Use Service in any manner that could disable, overburden, damage, or impair Service or interfere with any other party&rsquo;s use of Service, including their ability to engage in real time activities through Service.</p>\r\n\r\n<p>0.2. Use any robot, spider, or other automatic device, process, or means to access Service for any purpose, including monitoring or copying any of the material on Service.</p>\r\n\r\n<p>0.3. Use any manual process to monitor or copy any of the material on Service or for any other unauthorized purpose without our prior written consent.</p>\r\n\r\n<p>0.4. Use any device, software, or routine that interferes with the proper working of Service.</p>\r\n\r\n<p>0.5. Introduce any viruses, trojan horses, worms, logic bombs, or other material which is malicious or technologically harmful.</p>\r\n\r\n<p>0.6. Attempt to gain unauthorized access to, interfere with, damage, or disrupt any parts of Service, the server on which Service is stored, or any server, computer, or database connected to Service.</p>\r\n\r\n<p>0.7. Attack Service via a denial-of-service attack or a distributed denial-of-service attack.</p>\r\n\r\n<p>0.8. Take any action that may damage or falsify Company rating.</p>\r\n\r\n<p>0.9. Otherwise attempt to interfere with the proper working of Service.</p>\r\n\r\n<p>11.&nbsp;<strong>Analytics</strong></p>\r\n\r\n<p>We may use third-party Service Providers to monitor and analyze the use of our Service.</p>\r\n\r\n<p>12.&nbsp;<strong>No Use By Minors</strong></p>\r\n\r\n<p>Service is intended only for access and use by individuals at least eighteen (18) years old. By accessing or using Service, you warrant and represent that you are at least eighteen (18) years of age and with the full authority, right, and capacity to enter into this agreement and abide by all of the terms and conditions of Terms. If you are not at least eighteen (18) years old, you are prohibited from both the access and usage of Service.</p>\r\n\r\n<p>13.&nbsp;<strong>Accounts</strong></p>\r\n\r\n<p>When you create an account with us, you guarantee that you are above the age of 18, and that the information you provide us is accurate, complete, and current at all times. Inaccurate, incomplete, or obsolete information may result in the immediate termination of your account on Service.</p>\r\n\r\n<p>You are responsible for maintaining the confidentiality of your account and password, including but not limited to the restriction of access to your computer and/or account. You agree to accept responsibility for any and all activities or actions that occur under your account and/or password, whether your password is with our Service or a third-party service. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account.</p>\r\n\r\n<p>You may not use as a username the name of another person or entity or that is not lawfully available for use, a name or trademark that is subject to any rights of another person or entity other than you, without appropriate authorization. You may not use as a username any name that is offensive, vulgar or obscene.</p>\r\n\r\n<p>We reserve the right to refuse service, terminate accounts, remove or edit content, or cancel orders in our sole discretion.</p>\r\n\r\n<p>14.&nbsp;<strong>Intellectual Property</strong></p>\r\n\r\n<p>Service and its original content (excluding Content provided by users), features and functionality are and will remain the exclusive property of&nbsp;servicly.com&nbsp;and its licensors. Service is protected by copyright, trademark, and other laws of&nbsp;and foreign countries. Our trademarks may not be used in connection with any product or service without the prior written consent of&nbsp;servicly.com.</p>\r\n\r\n<p>15.&nbsp;<strong>Copyright Policy</strong></p>\r\n\r\n<p>We respect the intellectual property rights of others. It is our policy to respond to any claim that Content posted on Service infringes on the copyright or other intellectual property rights (&ldquo;Infringement&rdquo;) of any person or entity.</p>\r\n\r\n<p>If you are a copyright owner, or authorized on behalf of one, and you believe that the copyrighted work has been copied in a way that constitutes copyright infringement, please submit your claim via email to&nbsp;admin@admin.com, with the subject line: &ldquo;Copyright Infringement&rdquo; and include in your claim a detailed description of the alleged Infringement as detailed below, under &ldquo;DMCA Notice and Procedure for Copyright Infringement Claims&rdquo;</p>\r\n\r\n<p>You may be held accountable for damages (including costs and attorneys&rsquo; fees) for misrepresentation or bad-faith claims on the infringement of any Content found on and/or through Service on your copyright.</p>\r\n\r\n<p>16.&nbsp;<strong>DMCA Notice and Procedure for Copyright Infringement Claims</strong></p>\r\n\r\n<p>You may submit a notification pursuant to the Digital Millennium Copyright Act (DMCA) by providing our Copyright Agent with the following information in writing (see 17 U.S.C 512(c)(3) for further detail):</p>\r\n\r\n<p>0.1. an electronic or physical signature of the person authorized to act on behalf of the owner of the copyright&rsquo;s interest;</p>\r\n\r\n<p>0.2. a description of the copyrighted work that you claim has been infringed, including the URL (i.e., web page address) of the location where the copyrighted work exists or a copy of the copyrighted work;</p>\r\n\r\n<p>0.3. identification of the URL or other specific location on Service where the material that you claim is infringing is located;</p>\r\n\r\n<p>0.4. your address, telephone number, and email address;</p>\r\n\r\n<p>0.5. a statement by you that you have a good faith belief that the disputed use is not authorized by the copyright owner, its agent, or the law;</p>\r\n\r\n<p>0.6. a statement by you, made under penalty of perjury, that the above information in your notice is accurate and that you are the copyright owner or authorized to act on the copyright owner&rsquo;s behalf.</p>\r\n\r\n<p>You can contact our Copyright Agent via email at&nbsp;admin@admin.com.</p>\r\n\r\n<p>17.&nbsp;<strong>Error Reporting and Feedback</strong></p>\r\n\r\n<p>You may provide us either directly at&nbsp;admin@admin.com&nbsp;or via third party sites and tools with information and feedback concerning errors, suggestions for improvements, ideas, problems, complaints, and other matters related to our Service (&ldquo;Feedback&rdquo;). You acknowledge and agree that: (i) you shall not retain, acquire or assert any intellectual property right or other right, title or interest in or to the Feedback; (ii) Company may have development ideas similar to the Feedback; (iii) Feedback does not contain confidential information or proprietary information from you or any third party; and (iv) Company is not under any obligation of confidentiality with respect to the Feedback. In the event the transfer of the ownership to the Feedback is not possible due to applicable mandatory laws, you grant Company and its affiliates an exclusive, transferable, irrevocable, free-of-charge, sub-licensable, unlimited and perpetual right to use (including copy, modify, create derivative works, publish, distribute and commercialize) Feedback in any manner and for any purpose.</p>\r\n\r\n<p>18.&nbsp;<strong>Links To Other Web Sites</strong></p>\r\n\r\n<p>Our Service may contain links to third party web sites or services that are not owned or controlled by&nbsp;servicly.com.</p>\r\n\r\n<p>servicly.com&nbsp;has no control over, and assumes no responsibility for the content, privacy policies, or practices of any third party web sites or services. We do not warrant the offerings of any of these entities/individuals or their websites.</p>\r\n\r\n<p>For example, the outlined&nbsp;<a href=\"https://policymaker.io/terms-and-conditions/\">Terms of Use</a>&nbsp;have been created using&nbsp;<a href=\"https://policymaker.io/\">PolicyMaker.io</a>, a free web application for generating high-quality legal documents. PolicyMaker&rsquo;s&nbsp;<a href=\"https://policymaker.io/terms-and-conditions/\">Terms and Conditions generator</a>&nbsp;is an easy-to-use free tool for creating an excellent standard Terms of Service template for a website, blog, e-commerce store or app.</p>\r\n\r\n<p>YOU ACKNOWLEDGE AND AGREE THAT COMPANY SHALL NOT BE RESPONSIBLE OR LIABLE, DIRECTLY OR INDIRECTLY, FOR ANY DAMAGE OR LOSS CAUSED OR ALLEGED TO BE CAUSED BY OR IN CONNECTION WITH USE OF OR RELIANCE ON ANY SUCH CONTENT, GOODS OR SERVICES AVAILABLE ON OR THROUGH ANY SUCH THIRD PARTY WEB SITES OR SERVICES.</p>\r\n\r\n<p>WE STRONGLY ADVISE YOU TO READ THE TERMS OF SERVICE AND PRIVACY POLICIES OF ANY THIRD PARTY WEB SITES OR SERVICES THAT YOU VISIT.</p>\r\n\r\n<p>19.&nbsp;<strong>Disclaimer Of Warranty</strong></p>\r\n\r\n<p>THESE SERVICES ARE PROVIDED BY COMPANY ON AN &ldquo;AS IS&rdquo; AND &ldquo;AS AVAILABLE&rdquo; BASIS. COMPANY MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, AS TO THE OPERATION OF THEIR SERVICES, OR THE INFORMATION, CONTENT OR MATERIALS INCLUDED THEREIN. YOU EXPRESSLY AGREE THAT YOUR USE OF THESE SERVICES, THEIR CONTENT, AND ANY SERVICES OR ITEMS OBTAINED FROM US IS AT YOUR SOLE RISK.</p>\r\n\r\n<p>NEITHER COMPANY NOR ANY PERSON ASSOCIATED WITH COMPANY MAKES ANY WARRANTY OR REPRESENTATION WITH RESPECT TO THE COMPLETENESS, SECURITY, RELIABILITY, QUALITY, ACCURACY, OR AVAILABILITY OF THE SERVICES. WITHOUT LIMITING THE FOREGOING, NEITHER COMPANY NOR ANYONE ASSOCIATED WITH COMPANY REPRESENTS OR WARRANTS THAT THE SERVICES, THEIR CONTENT, OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE SERVICES WILL BE ACCURATE, RELIABLE, ERROR-FREE, OR UNINTERRUPTED, THAT DEFECTS WILL BE CORRECTED, THAT THE SERVICES OR THE SERVER THAT MAKES IT AVAILABLE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT THE SERVICES OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE SERVICES WILL OTHERWISE MEET YOUR NEEDS OR EXPECTATIONS.</p>\r\n\r\n<p>COMPANY HEREBY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, STATUTORY, OR OTHERWISE, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, AND FITNESS FOR PARTICULAR PURPOSE.</p>\r\n\r\n<p>THE FOREGOING DOES NOT AFFECT ANY WARRANTIES WHICH CANNOT BE EXCLUDED OR LIMITED UNDER APPLICABLE LAW.</p>\r\n\r\n<p>20.&nbsp;<strong>Limitation Of Liability</strong></p>\r\n\r\n<p>EXCEPT AS PROHIBITED BY LAW, YOU WILL HOLD US AND OUR OFFICERS, DIRECTORS, EMPLOYEES, AND AGENTS HARMLESS FOR ANY INDIRECT, PUNITIVE, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGE, HOWEVER IT ARISES (INCLUDING ATTORNEYS&rsquo; FEES AND ALL RELATED COSTS AND EXPENSES OF LITIGATION AND ARBITRATION, OR AT TRIAL OR ON APPEAL, IF ANY, WHETHER OR NOT LITIGATION OR ARBITRATION IS INSTITUTED), WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE, OR OTHER TORTIOUS ACTION, OR ARISING OUT OF OR IN CONNECTION WITH THIS AGREEMENT, INCLUDING WITHOUT LIMITATION ANY CLAIM FOR PERSONAL INJURY OR PROPERTY DAMAGE, ARISING FROM THIS AGREEMENT AND ANY VIOLATION BY YOU OF ANY FEDERAL, STATE, OR LOCAL LAWS, STATUTES, RULES, OR REGULATIONS, EVEN IF COMPANY HAS BEEN PREVIOUSLY ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. EXCEPT AS PROHIBITED BY LAW, IF THERE IS LIABILITY FOUND ON THE PART OF COMPANY, IT WILL BE LIMITED TO THE AMOUNT PAID FOR THE PRODUCTS AND/OR SERVICES, AND UNDER NO CIRCUMSTANCES WILL THERE BE CONSEQUENTIAL OR PUNITIVE DAMAGES. SOME STATES DO NOT ALLOW THE EXCLUSION OR LIMITATION OF PUNITIVE, INCIDENTAL OR CONSEQUENTIAL DAMAGES, SO THE PRIOR LIMITATION OR EXCLUSION MAY NOT APPLY TO YOU.</p>\r\n\r\n<p>21.&nbsp;<strong>Termination</strong></p>\r\n\r\n<p>We may terminate or suspend your account and bar access to Service immediately, without prior notice or liability, under our sole discretion, for any reason whatsoever and without limitation, including but not limited to a breach of Terms.</p>\r\n\r\n<p>If you wish to terminate your account, you may simply discontinue using Service.</p>\r\n\r\n<p>All provisions of Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.</p>\r\n\r\n<p>22.&nbsp;<strong>Governing Law</strong></p>\r\n\r\n<p>These Terms shall be governed and construed in accordance with the laws of&nbsp;india, which governing law applies to agreement without regard to its conflict of law provisions.</p>\r\n\r\n<p>Our failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service and supersede and replace any prior agreements we might have had between us regarding Service.</p>\r\n\r\n<p>23.&nbsp;<strong>Changes To Service</strong></p>\r\n\r\n<p>We reserve the right to withdraw or amend our Service, and any service or material we provide via Service, in our sole discretion without notice. We will not be liable if for any reason all or any part of Service is unavailable at any time or for any period. From time to time, we may restrict access to some parts of Service, or the entire Service, to users, including registered users.</p>\r\n\r\n<p>24.&nbsp;<strong>Amendments To Terms</strong></p>\r\n\r\n<p>We may amend Terms at any time by posting the amended terms on this site. It is your responsibility to review these Terms periodically.</p>\r\n\r\n<p>Your continued use of the Platform following the posting of revised Terms means that you accept and agree to the changes. You are expected to check this page frequently so you are aware of any changes, as they are binding on you.</p>\r\n\r\n<p>By continuing to access or use our Service after any revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, you are no longer authorized to use Service.</p>\r\n\r\n<p>25.&nbsp;<strong>Waiver And Severability</strong></p>\r\n\r\n<p>No waiver by Company of any term or condition set forth in Terms shall be deemed a further or continuing waiver of such term or condition or a waiver of any other term or condition, and any failure of Company to assert a right or provision under Terms shall not constitute a waiver of such right or provision.</p>\r\n\r\n<p>If any provision of Terms is held by a court or other tribunal of competent jurisdiction to be invalid, illegal or unenforceable for any reason, such provision shall be eliminated or limited to the minimum extent such that the remaining provisions of Terms will continue in full force and effect.</p>\r\n\r\n<p>26.&nbsp;<strong>Acknowledgement</strong></p>\r\n\r\n<p>BY USING SERVICE OR OTHER SERVICES PROVIDED BY US, YOU ACKNOWLEDGE THAT YOU HAVE READ THESE TERMS OF SERVICE AND AGREE TO BE BOUND BY THEM.</p>\r\n\r\n<p>27.&nbsp;<strong>Contact Us</strong></p>\r\n\r\n<p>Please send your feedback, comments, requests for technical support by email:&nbsp;<strong>admin@admin.com</strong>.</p>\r\n\r\n<p>These&nbsp;<a href=\"https://policymaker.io/terms-and-conditions/\">Terms of Service</a>&nbsp;were created for&nbsp;<strong>http://servicly.p4moviemaker.com/</strong>&nbsp;by&nbsp;<a href=\"https://policymaker.io/\">PolicyMaker.io</a>&nbsp;on&nbsp;2022-09-22.</p>', NULL, '2022-09-22 13:04:08'),
(16, 'business_name', 'Test Business', NULL, NULL),
(17, 'currency', 'INR', NULL, NULL),
(18, 'logo', NULL, NULL, NULL),
(19, 'phone', '0123456789', NULL, NULL),
(20, 'email_address', 'admin@admin.com', NULL, NULL),
(21, 'address', '307 AVENUE, BERTHELOT, 69008 LYON', NULL, NULL),
(22, 'footer_text', 'Copyright &copy; 2022 Servicely, All Rights Reserved', NULL, NULL),
(23, 'customer_verification', '1', NULL, NULL),
(24, 'map_api_key', 'AIzaSyBYat2dy-0qFA_RiAyyFyY1XuYbCEMwfZQ', NULL, NULL);
INSERT INTO `business_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(25, 'privacy_policy', '<p>1.&nbsp;<strong>Introduction</strong></p>\r\n\r\n<p>Welcome to&nbsp;<strong>servicly.com</strong>&nbsp;(&ldquo;Company&rdquo;, &ldquo;we&rdquo;, &ldquo;our&rdquo;, &ldquo;us&rdquo;)!</p>\r\n\r\n<p>These Terms of Service (&ldquo;Terms&rdquo;, &ldquo;Terms of Service&rdquo;) govern your use of our website located at&nbsp;<strong>http://servicly.p4moviemaker.com/</strong>&nbsp;(together or individually &ldquo;Service&rdquo;) operated by&nbsp;<strong>servicly.com</strong>.</p>\r\n\r\n<p>Our Privacy Policy also governs your use of our Service and explains how we collect, safeguard and disclose information that results from your use of our web pages.</p>\r\n\r\n<p>Your agreement with us includes these Terms and our Privacy Policy (&ldquo;Agreements&rdquo;). You acknowledge that you have read and understood Agreements, and agree to be bound of them.</p>\r\n\r\n<p>If you do not agree with (or cannot comply with) Agreements, then you may not use the Service, but please let us know by emailing at&nbsp;<strong>admin@admin.com</strong>&nbsp;so we can try to find a solution. These Terms apply to all visitors, users and others who wish to access or use Service.</p>\r\n\r\n<p>2.&nbsp;<strong>Communications</strong></p>\r\n\r\n<p>By using our Service, you agree to subscribe to newsletters, marketing or promotional materials and other information we may send. However, you may opt out of receiving any, or all, of these communications from us by following the unsubscribe link or by emailing at&nbsp;admin@admin.com.</p>\r\n\r\n<p>3.&nbsp;<strong>Purchases</strong></p>\r\n\r\n<p>If you wish to purchase any product or service made available through Service (&ldquo;Purchase&rdquo;), you may be asked to supply certain information relevant to your Purchase including but not limited to, your credit or debit card number, the expiration date of your card, your billing address, and your shipping information.</p>\r\n\r\n<p>You represent and warrant that: (i) you have the legal right to use any card(s) or other payment method(s) in connection with any Purchase; and that (ii) the information you supply to us is true, correct and complete.</p>\r\n\r\n<p>We may employ the use of third party services for the purpose of facilitating payment and the completion of Purchases. By submitting your information, you grant us the right to provide the information to these third parties subject to our Privacy Policy.</p>\r\n\r\n<p>We reserve the right to refuse or cancel your order at any time for reasons including but not limited to: product or service availability, errors in the description or price of the product or service, error in your order or other reasons.</p>\r\n\r\n<p>We reserve the right to refuse or cancel your order if fraud or an unauthorized or illegal transaction is suspected.</p>\r\n\r\n<p>4.&nbsp;<strong>Contests, Sweepstakes and Promotions</strong></p>\r\n\r\n<p>Any contests, sweepstakes or other promotions (collectively, &ldquo;Promotions&rdquo;) made available through Service may be governed by rules that are separate from these Terms of Service. If you participate in any Promotions, please review the applicable rules as well as our Privacy Policy. If the rules for a Promotion conflict with these Terms of Service, Promotion rules will apply.</p>\r\n\r\n<p>5.&nbsp;<strong>Subscriptions</strong></p>\r\n\r\n<p>Some parts of Service are billed on a subscription basis (&quot;Subscription(s)&quot;). You will be billed in advance on a recurring and periodic basis (&quot;Billing Cycle&quot;). Billing cycles will be set depending on the type of subscription plan you select when purchasing a Subscription.</p>\r\n\r\n<p>At the end of each Billing Cycle, your Subscription will automatically renew under the exact same conditions unless you cancel it or&nbsp;servicly.com&nbsp;cancels it. You may cancel your Subscription renewal either through your online account management page or by contacting&nbsp;admin@admin.com&nbsp;customer support team.</p>\r\n\r\n<p>A valid payment method is required to process the payment for your subscription. You shall provide&nbsp;servicly.com&nbsp;with accurate and complete billing information that may include but not limited to full name, address, state, postal or zip code, telephone number, and a valid payment method information. By submitting such payment information, you automatically authorize&nbsp;servicly.com&nbsp;to charge all Subscription fees incurred through your account to any such payment instruments.</p>\r\n\r\n<p>Should automatic billing fail to occur for any reason,&nbsp;servicly.com&nbsp;reserves the right to terminate your access to the Service with immediate effect.</p>\r\n\r\n<p>6.&nbsp;<strong>Free Trial</strong></p>\r\n\r\n<p>servicly.com&nbsp;may, at its sole discretion, offer a Subscription with a free trial for a limited period of time (&quot;Free Trial&quot;).</p>\r\n\r\n<p>You may be required to enter your billing information in order to sign up for Free Trial.</p>\r\n\r\n<p>If you do enter your billing information when signing up for Free Trial, you will not be charged by&nbsp;servicly.com&nbsp;until Free Trial has expired. On the last day of Free Trial period, unless you cancelled your Subscription, you will be automatically charged the applicable Subscription fees for the type of Subscription you have selected.</p>\r\n\r\n<p>At any time and without notice,&nbsp;servicly.com&nbsp;reserves the right to (i) modify Terms of Service of Free Trial offer, or (ii) cancel such Free Trial offer.</p>\r\n\r\n<p>7.&nbsp;<strong>Fee Changes</strong></p>\r\n\r\n<p>servicly.com, in its sole discretion and at any time, may modify Subscription fees for the Subscriptions. Any Subscription fee change will become effective at the end of the then-current Billing Cycle.</p>\r\n\r\n<p>servicly.com&nbsp;will provide you with a reasonable prior notice of any change in Subscription fees to give you an opportunity to terminate your Subscription before such change becomes effective.</p>\r\n\r\n<p>Your continued use of Service after Subscription fee change comes into effect constitutes your agreement to pay the modified Subscription fee amount.</p>\r\n\r\n<p>8.&nbsp;<strong>Refunds</strong></p>\r\n\r\n<p>We issue refunds for Contracts within&nbsp;<strong>30&nbsp;days</strong>&nbsp;of the original purchase of the Contract.</p>\r\n\r\n<p>9.&nbsp;<strong>Content</strong></p>\r\n\r\n<p>Our Service allows you to post, link, store, share and otherwise make available certain information, text, graphics, videos, or other material (&ldquo;Content&rdquo;). You are responsible for Content that you post on or through Service, including its legality, reliability, and appropriateness.</p>\r\n\r\n<p>By posting Content on or through Service, You represent and warrant that: (i) Content is yours (you own it) and/or you have the right to use it and the right to grant us the rights and license as provided in these Terms, and (ii) that the posting of your Content on or through Service does not violate the privacy rights, publicity rights, copyrights, contract rights or any other rights of any person or entity. We reserve the right to terminate the account of anyone found to be infringing on a copyright.</p>\r\n\r\n<p>You retain any and all of your rights to any Content you submit, post or display on or through Service and you are responsible for protecting those rights. We take no responsibility and assume no liability for Content you or any third party posts on or through Service. However, by posting Content using Service you grant us the right and license to use, modify, publicly perform, publicly display, reproduce, and distribute such Content on and through Service. You agree that this license includes the right for us to make your Content available to other users of Service, who may also use your Content subject to these Terms.</p>\r\n\r\n<p>servicly.com&nbsp;has the right but not the obligation to monitor and edit all Content provided by users.</p>\r\n\r\n<p>In addition, Content found on or through this Service are the property of&nbsp;servicly.com&nbsp;or used with permission. You may not distribute, modify, transmit, reuse, download, repost, copy, or use said Content, whether in whole or in part, for commercial purposes or for personal gain, without express advance written permission from us.</p>\r\n\r\n<p>10.&nbsp;<strong>Prohibited Uses</strong></p>\r\n\r\n<p>You may use Service only for lawful purposes and in accordance with Terms. You agree not to use Service:</p>\r\n\r\n<p>0.1. In any way that violates any applicable national or international law or regulation.</p>\r\n\r\n<p>0.2. For the purpose of exploiting, harming, or attempting to exploit or harm minors in any way by exposing them to inappropriate content or otherwise.</p>\r\n\r\n<p>0.3. To transmit, or procure the sending of, any advertising or promotional material, including any &ldquo;junk mail&rdquo;, &ldquo;chain letter,&rdquo; &ldquo;spam,&rdquo; or any other similar solicitation.</p>\r\n\r\n<p>0.4. To impersonate or attempt to impersonate Company, a Company employee, another user, or any other person or entity.</p>\r\n\r\n<p>0.5. In any way that infringes upon the rights of others, or in any way is illegal, threatening, fraudulent, or harmful, or in connection with any unlawful, illegal, fraudulent, or harmful purpose or activity.</p>\r\n\r\n<p>0.6. To engage in any other conduct that restricts or inhibits anyone&rsquo;s use or enjoyment of Service, or which, as determined by us, may harm or offend Company or users of Service or expose them to liability.</p>\r\n\r\n<p>Additionally, you agree not to:</p>\r\n\r\n<p>0.1. Use Service in any manner that could disable, overburden, damage, or impair Service or interfere with any other party&rsquo;s use of Service, including their ability to engage in real time activities through Service.</p>\r\n\r\n<p>0.2. Use any robot, spider, or other automatic device, process, or means to access Service for any purpose, including monitoring or copying any of the material on Service.</p>\r\n\r\n<p>0.3. Use any manual process to monitor or copy any of the material on Service or for any other unauthorized purpose without our prior written consent.</p>\r\n\r\n<p>0.4. Use any device, software, or routine that interferes with the proper working of Service.</p>\r\n\r\n<p>0.5. Introduce any viruses, trojan horses, worms, logic bombs, or other material which is malicious or technologically harmful.</p>\r\n\r\n<p>0.6. Attempt to gain unauthorized access to, interfere with, damage, or disrupt any parts of Service, the server on which Service is stored, or any server, computer, or database connected to Service.</p>\r\n\r\n<p>0.7. Attack Service via a denial-of-service attack or a distributed denial-of-service attack.</p>\r\n\r\n<p>0.8. Take any action that may damage or falsify Company rating.</p>\r\n\r\n<p>0.9. Otherwise attempt to interfere with the proper working of Service.</p>\r\n\r\n<p>11.&nbsp;<strong>Analytics</strong></p>\r\n\r\n<p>We may use third-party Service Providers to monitor and analyze the use of our Service.</p>\r\n\r\n<p>12.&nbsp;<strong>No Use By Minors</strong></p>\r\n\r\n<p>Service is intended only for access and use by individuals at least eighteen (18) years old. By accessing or using Service, you warrant and represent that you are at least eighteen (18) years of age and with the full authority, right, and capacity to enter into this agreement and abide by all of the terms and conditions of Terms. If you are not at least eighteen (18) years old, you are prohibited from both the access and usage of Service.</p>\r\n\r\n<p>13.&nbsp;<strong>Accounts</strong></p>\r\n\r\n<p>When you create an account with us, you guarantee that you are above the age of 18, and that the information you provide us is accurate, complete, and current at all times. Inaccurate, incomplete, or obsolete information may result in the immediate termination of your account on Service.</p>\r\n\r\n<p>You are responsible for maintaining the confidentiality of your account and password, including but not limited to the restriction of access to your computer and/or account. You agree to accept responsibility for any and all activities or actions that occur under your account and/or password, whether your password is with our Service or a third-party service. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account.</p>\r\n\r\n<p>You may not use as a username the name of another person or entity or that is not lawfully available for use, a name or trademark that is subject to any rights of another person or entity other than you, without appropriate authorization. You may not use as a username any name that is offensive, vulgar or obscene.</p>\r\n\r\n<p>We reserve the right to refuse service, terminate accounts, remove or edit content, or cancel orders in our sole discretion.</p>\r\n\r\n<p>14.&nbsp;<strong>Intellectual Property</strong></p>\r\n\r\n<p>Service and its original content (excluding Content provided by users), features and functionality are and will remain the exclusive property of&nbsp;servicly.com&nbsp;and its licensors. Service is protected by copyright, trademark, and other laws of&nbsp;and foreign countries. Our trademarks may not be used in connection with any product or service without the prior written consent of&nbsp;servicly.com.</p>\r\n\r\n<p>15.&nbsp;<strong>Copyright Policy</strong></p>\r\n\r\n<p>We respect the intellectual property rights of others. It is our policy to respond to any claim that Content posted on Service infringes on the copyright or other intellectual property rights (&ldquo;Infringement&rdquo;) of any person or entity.</p>\r\n\r\n<p>If you are a copyright owner, or authorized on behalf of one, and you believe that the copyrighted work has been copied in a way that constitutes copyright infringement, please submit your claim via email to&nbsp;admin@admin.com, with the subject line: &ldquo;Copyright Infringement&rdquo; and include in your claim a detailed description of the alleged Infringement as detailed below, under &ldquo;DMCA Notice and Procedure for Copyright Infringement Claims&rdquo;</p>\r\n\r\n<p>You may be held accountable for damages (including costs and attorneys&rsquo; fees) for misrepresentation or bad-faith claims on the infringement of any Content found on and/or through Service on your copyright.</p>\r\n\r\n<p>16.&nbsp;<strong>DMCA Notice and Procedure for Copyright Infringement Claims</strong></p>\r\n\r\n<p>You may submit a notification pursuant to the Digital Millennium Copyright Act (DMCA) by providing our Copyright Agent with the following information in writing (see 17 U.S.C 512(c)(3) for further detail):</p>\r\n\r\n<p>0.1. an electronic or physical signature of the person authorized to act on behalf of the owner of the copyright&rsquo;s interest;</p>\r\n\r\n<p>0.2. a description of the copyrighted work that you claim has been infringed, including the URL (i.e., web page address) of the location where the copyrighted work exists or a copy of the copyrighted work;</p>\r\n\r\n<p>0.3. identification of the URL or other specific location on Service where the material that you claim is infringing is located;</p>\r\n\r\n<p>0.4. your address, telephone number, and email address;</p>\r\n\r\n<p>0.5. a statement by you that you have a good faith belief that the disputed use is not authorized by the copyright owner, its agent, or the law;</p>\r\n\r\n<p>0.6. a statement by you, made under penalty of perjury, that the above information in your notice is accurate and that you are the copyright owner or authorized to act on the copyright owner&rsquo;s behalf.</p>\r\n\r\n<p>You can contact our Copyright Agent via email at&nbsp;admin@admin.com.</p>\r\n\r\n<p>17.&nbsp;<strong>Error Reporting and Feedback</strong></p>\r\n\r\n<p>You may provide us either directly at&nbsp;admin@admin.com&nbsp;or via third party sites and tools with information and feedback concerning errors, suggestions for improvements, ideas, problems, complaints, and other matters related to our Service (&ldquo;Feedback&rdquo;). You acknowledge and agree that: (i) you shall not retain, acquire or assert any intellectual property right or other right, title or interest in or to the Feedback; (ii) Company may have development ideas similar to the Feedback; (iii) Feedback does not contain confidential information or proprietary information from you or any third party; and (iv) Company is not under any obligation of confidentiality with respect to the Feedback. In the event the transfer of the ownership to the Feedback is not possible due to applicable mandatory laws, you grant Company and its affiliates an exclusive, transferable, irrevocable, free-of-charge, sub-licensable, unlimited and perpetual right to use (including copy, modify, create derivative works, publish, distribute and commercialize) Feedback in any manner and for any purpose.</p>\r\n\r\n<p>18.&nbsp;<strong>Links To Other Web Sites</strong></p>\r\n\r\n<p>Our Service may contain links to third party web sites or services that are not owned or controlled by&nbsp;servicly.com.</p>\r\n\r\n<p>servicly.com&nbsp;has no control over, and assumes no responsibility for the content, privacy policies, or practices of any third party web sites or services. We do not warrant the offerings of any of these entities/individuals or their websites.</p>\r\n\r\n<p>For example, the outlined&nbsp;<a href=\"https://policymaker.io/terms-and-conditions/\">Terms of Use</a>&nbsp;have been created using&nbsp;<a href=\"https://policymaker.io/\">PolicyMaker.io</a>, a free web application for generating high-quality legal documents. PolicyMaker&rsquo;s&nbsp;<a href=\"https://policymaker.io/terms-and-conditions/\">Terms and Conditions generator</a>&nbsp;is an easy-to-use free tool for creating an excellent standard Terms of Service template for a website, blog, e-commerce store or app.</p>\r\n\r\n<p>YOU ACKNOWLEDGE AND AGREE THAT COMPANY SHALL NOT BE RESPONSIBLE OR LIABLE, DIRECTLY OR INDIRECTLY, FOR ANY DAMAGE OR LOSS CAUSED OR ALLEGED TO BE CAUSED BY OR IN CONNECTION WITH USE OF OR RELIANCE ON ANY SUCH CONTENT, GOODS OR SERVICES AVAILABLE ON OR THROUGH ANY SUCH THIRD PARTY WEB SITES OR SERVICES.</p>\r\n\r\n<p>WE STRONGLY ADVISE YOU TO READ THE TERMS OF SERVICE AND PRIVACY POLICIES OF ANY THIRD PARTY WEB SITES OR SERVICES THAT YOU VISIT.</p>\r\n\r\n<p>19.&nbsp;<strong>Disclaimer Of Warranty</strong></p>\r\n\r\n<p>THESE SERVICES ARE PROVIDED BY COMPANY ON AN &ldquo;AS IS&rdquo; AND &ldquo;AS AVAILABLE&rdquo; BASIS. COMPANY MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, AS TO THE OPERATION OF THEIR SERVICES, OR THE INFORMATION, CONTENT OR MATERIALS INCLUDED THEREIN. YOU EXPRESSLY AGREE THAT YOUR USE OF THESE SERVICES, THEIR CONTENT, AND ANY SERVICES OR ITEMS OBTAINED FROM US IS AT YOUR SOLE RISK.</p>\r\n\r\n<p>NEITHER COMPANY NOR ANY PERSON ASSOCIATED WITH COMPANY MAKES ANY WARRANTY OR REPRESENTATION WITH RESPECT TO THE COMPLETENESS, SECURITY, RELIABILITY, QUALITY, ACCURACY, OR AVAILABILITY OF THE SERVICES. WITHOUT LIMITING THE FOREGOING, NEITHER COMPANY NOR ANYONE ASSOCIATED WITH COMPANY REPRESENTS OR WARRANTS THAT THE SERVICES, THEIR CONTENT, OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE SERVICES WILL BE ACCURATE, RELIABLE, ERROR-FREE, OR UNINTERRUPTED, THAT DEFECTS WILL BE CORRECTED, THAT THE SERVICES OR THE SERVER THAT MAKES IT AVAILABLE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT THE SERVICES OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE SERVICES WILL OTHERWISE MEET YOUR NEEDS OR EXPECTATIONS.</p>\r\n\r\n<p>COMPANY HEREBY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, STATUTORY, OR OTHERWISE, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, AND FITNESS FOR PARTICULAR PURPOSE.</p>\r\n\r\n<p>THE FOREGOING DOES NOT AFFECT ANY WARRANTIES WHICH CANNOT BE EXCLUDED OR LIMITED UNDER APPLICABLE LAW.</p>\r\n\r\n<p>20.&nbsp;<strong>Limitation Of Liability</strong></p>\r\n\r\n<p>EXCEPT AS PROHIBITED BY LAW, YOU WILL HOLD US AND OUR OFFICERS, DIRECTORS, EMPLOYEES, AND AGENTS HARMLESS FOR ANY INDIRECT, PUNITIVE, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGE, HOWEVER IT ARISES (INCLUDING ATTORNEYS&rsquo; FEES AND ALL RELATED COSTS AND EXPENSES OF LITIGATION AND ARBITRATION, OR AT TRIAL OR ON APPEAL, IF ANY, WHETHER OR NOT LITIGATION OR ARBITRATION IS INSTITUTED), WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE, OR OTHER TORTIOUS ACTION, OR ARISING OUT OF OR IN CONNECTION WITH THIS AGREEMENT, INCLUDING WITHOUT LIMITATION ANY CLAIM FOR PERSONAL INJURY OR PROPERTY DAMAGE, ARISING FROM THIS AGREEMENT AND ANY VIOLATION BY YOU OF ANY FEDERAL, STATE, OR LOCAL LAWS, STATUTES, RULES, OR REGULATIONS, EVEN IF COMPANY HAS BEEN PREVIOUSLY ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. EXCEPT AS PROHIBITED BY LAW, IF THERE IS LIABILITY FOUND ON THE PART OF COMPANY, IT WILL BE LIMITED TO THE AMOUNT PAID FOR THE PRODUCTS AND/OR SERVICES, AND UNDER NO CIRCUMSTANCES WILL THERE BE CONSEQUENTIAL OR PUNITIVE DAMAGES. SOME STATES DO NOT ALLOW THE EXCLUSION OR LIMITATION OF PUNITIVE, INCIDENTAL OR CONSEQUENTIAL DAMAGES, SO THE PRIOR LIMITATION OR EXCLUSION MAY NOT APPLY TO YOU.</p>\r\n\r\n<p>21.&nbsp;<strong>Termination</strong></p>\r\n\r\n<p>We may terminate or suspend your account and bar access to Service immediately, without prior notice or liability, under our sole discretion, for any reason whatsoever and without limitation, including but not limited to a breach of Terms.</p>\r\n\r\n<p>If you wish to terminate your account, you may simply discontinue using Service.</p>\r\n\r\n<p>All provisions of Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.</p>\r\n\r\n<p>22.&nbsp;<strong>Governing Law</strong></p>\r\n\r\n<p>These Terms shall be governed and construed in accordance with the laws of&nbsp;india, which governing law applies to agreement without regard to its conflict of law provisions.</p>\r\n\r\n<p>Our failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service and supersede and replace any prior agreements we might have had between us regarding Service.</p>\r\n\r\n<p>23.&nbsp;<strong>Changes To Service</strong></p>\r\n\r\n<p>We reserve the right to withdraw or amend our Service, and any service or material we provide via Service, in our sole discretion without notice. We will not be liable if for any reason all or any part of Service is unavailable at any time or for any period. From time to time, we may restrict access to some parts of Service, or the entire Service, to users, including registered users.</p>\r\n\r\n<p>24.&nbsp;<strong>Amendments To Terms</strong></p>\r\n\r\n<p>We may amend Terms at any time by posting the amended terms on this site. It is your responsibility to review these Terms periodically.</p>\r\n\r\n<p>Your continued use of the Platform following the posting of revised Terms means that you accept and agree to the changes. You are expected to check this page frequently so you are aware of any changes, as they are binding on you.</p>\r\n\r\n<p>By continuing to access or use our Service after any revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, you are no longer authorized to use Service.</p>\r\n\r\n<p>25.&nbsp;<strong>Waiver And Severability</strong></p>\r\n\r\n<p>No waiver by Company of any term or condition set forth in Terms shall be deemed a further or continuing waiver of such term or condition or a waiver of any other term or condition, and any failure of Company to assert a right or provision under Terms shall not constitute a waiver of such right or provision.</p>\r\n\r\n<p>If any provision of Terms is held by a court or other tribunal of competent jurisdiction to be invalid, illegal or unenforceable for any reason, such provision shall be eliminated or limited to the minimum extent such that the remaining provisions of Terms will continue in full force and effect.</p>\r\n\r\n<p>26.&nbsp;<strong>Acknowledgement</strong></p>\r\n\r\n<p>BY USING SERVICE OR OTHER SERVICES PROVIDED BY US, YOU ACKNOWLEDGE THAT YOU HAVE READ THESE TERMS OF SERVICE AND AGREE TO BE BOUND BY THEM.</p>\r\n\r\n<p>27.&nbsp;<strong>Contact Us</strong></p>\r\n\r\n<p>Please send your feedback, comments, requests for technical support by email:&nbsp;<strong>admin@admin.com</strong>.</p>\r\n\r\n<p>These&nbsp;<a href=\"https://policymaker.io/terms-and-conditions/\">Terms of Service</a>&nbsp;were created for&nbsp;<strong>http://servicly.p4moviemaker.com/</strong>&nbsp;by&nbsp;<a href=\"https://policymaker.io/\">PolicyMaker.io</a>&nbsp;on&nbsp;2022-09-22.</p>', NULL, '2022-09-22 13:04:48');
INSERT INTO `business_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(26, 'about_us', '<p>1.&nbsp;<strong>Introduction</strong></p>\r\n\r\n<p>Welcome to&nbsp;<strong>servicly.com</strong>&nbsp;(&ldquo;Company&rdquo;, &ldquo;we&rdquo;, &ldquo;our&rdquo;, &ldquo;us&rdquo;)!</p>\r\n\r\n<p>These Terms of Service (&ldquo;Terms&rdquo;, &ldquo;Terms of Service&rdquo;) govern your use of our website located at&nbsp;<strong>http://servicly.p4moviemaker.com/</strong>&nbsp;(together or individually &ldquo;Service&rdquo;) operated by&nbsp;<strong>servicly.com</strong>.</p>\r\n\r\n<p>Our Privacy Policy also governs your use of our Service and explains how we collect, safeguard and disclose information that results from your use of our web pages.</p>\r\n\r\n<p>Your agreement with us includes these Terms and our Privacy Policy (&ldquo;Agreements&rdquo;). You acknowledge that you have read and understood Agreements, and agree to be bound of them.</p>\r\n\r\n<p>If you do not agree with (or cannot comply with) Agreements, then you may not use the Service, but please let us know by emailing at&nbsp;<strong>admin@admin.com</strong>&nbsp;so we can try to find a solution. These Terms apply to all visitors, users and others who wish to access or use Service.</p>\r\n\r\n<p>2.&nbsp;<strong>Communications</strong></p>\r\n\r\n<p>By using our Service, you agree to subscribe to newsletters, marketing or promotional materials and other information we may send. However, you may opt out of receiving any, or all, of these communications from us by following the unsubscribe link or by emailing at&nbsp;admin@admin.com.</p>\r\n\r\n<p>3.&nbsp;<strong>Purchases</strong></p>\r\n\r\n<p>If you wish to purchase any product or service made available through Service (&ldquo;Purchase&rdquo;), you may be asked to supply certain information relevant to your Purchase including but not limited to, your credit or debit card number, the expiration date of your card, your billing address, and your shipping information.</p>\r\n\r\n<p>You represent and warrant that: (i) you have the legal right to use any card(s) or other payment method(s) in connection with any Purchase; and that (ii) the information you supply to us is true, correct and complete.</p>\r\n\r\n<p>We may employ the use of third party services for the purpose of facilitating payment and the completion of Purchases. By submitting your information, you grant us the right to provide the information to these third parties subject to our Privacy Policy.</p>\r\n\r\n<p>We reserve the right to refuse or cancel your order at any time for reasons including but not limited to: product or service availability, errors in the description or price of the product or service, error in your order or other reasons.</p>\r\n\r\n<p>We reserve the right to refuse or cancel your order if fraud or an unauthorized or illegal transaction is suspected.</p>\r\n\r\n<p>4.&nbsp;<strong>Contests, Sweepstakes and Promotions</strong></p>\r\n\r\n<p>Any contests, sweepstakes or other promotions (collectively, &ldquo;Promotions&rdquo;) made available through Service may be governed by rules that are separate from these Terms of Service. If you participate in any Promotions, please review the applicable rules as well as our Privacy Policy. If the rules for a Promotion conflict with these Terms of Service, Promotion rules will apply.</p>\r\n\r\n<p>5.&nbsp;<strong>Subscriptions</strong></p>\r\n\r\n<p>Some parts of Service are billed on a subscription basis (&quot;Subscription(s)&quot;). You will be billed in advance on a recurring and periodic basis (&quot;Billing Cycle&quot;). Billing cycles will be set depending on the type of subscription plan you select when purchasing a Subscription.</p>\r\n\r\n<p>At the end of each Billing Cycle, your Subscription will automatically renew under the exact same conditions unless you cancel it or&nbsp;servicly.com&nbsp;cancels it. You may cancel your Subscription renewal either through your online account management page or by contacting&nbsp;admin@admin.com&nbsp;customer support team.</p>\r\n\r\n<p>A valid payment method is required to process the payment for your subscription. You shall provide&nbsp;servicly.com&nbsp;with accurate and complete billing information that may include but not limited to full name, address, state, postal or zip code, telephone number, and a valid payment method information. By submitting such payment information, you automatically authorize&nbsp;servicly.com&nbsp;to charge all Subscription fees incurred through your account to any such payment instruments.</p>\r\n\r\n<p>Should automatic billing fail to occur for any reason,&nbsp;servicly.com&nbsp;reserves the right to terminate your access to the Service with immediate effect.</p>\r\n\r\n<p>6.&nbsp;<strong>Free Trial</strong></p>\r\n\r\n<p>servicly.com&nbsp;may, at its sole discretion, offer a Subscription with a free trial for a limited period of time (&quot;Free Trial&quot;).</p>\r\n\r\n<p>You may be required to enter your billing information in order to sign up for Free Trial.</p>\r\n\r\n<p>If you do enter your billing information when signing up for Free Trial, you will not be charged by&nbsp;servicly.com&nbsp;until Free Trial has expired. On the last day of Free Trial period, unless you cancelled your Subscription, you will be automatically charged the applicable Subscription fees for the type of Subscription you have selected.</p>\r\n\r\n<p>At any time and without notice,&nbsp;servicly.com&nbsp;reserves the right to (i) modify Terms of Service of Free Trial offer, or (ii) cancel such Free Trial offer.</p>\r\n\r\n<p>7.&nbsp;<strong>Fee Changes</strong></p>\r\n\r\n<p>servicly.com, in its sole discretion and at any time, may modify Subscription fees for the Subscriptions. Any Subscription fee change will become effective at the end of the then-current Billing Cycle.</p>\r\n\r\n<p>servicly.com&nbsp;will provide you with a reasonable prior notice of any change in Subscription fees to give you an opportunity to terminate your Subscription before such change becomes effective.</p>\r\n\r\n<p>Your continued use of Service after Subscription fee change comes into effect constitutes your agreement to pay the modified Subscription fee amount.</p>\r\n\r\n<p>8.&nbsp;<strong>Refunds</strong></p>\r\n\r\n<p>We issue refunds for Contracts within&nbsp;<strong>30&nbsp;days</strong>&nbsp;of the original purchase of the Contract.</p>\r\n\r\n<p>9.&nbsp;<strong>Content</strong></p>\r\n\r\n<p>Our Service allows you to post, link, store, share and otherwise make available certain information, text, graphics, videos, or other material (&ldquo;Content&rdquo;). You are responsible for Content that you post on or through Service, including its legality, reliability, and appropriateness.</p>\r\n\r\n<p>By posting Content on or through Service, You represent and warrant that: (i) Content is yours (you own it) and/or you have the right to use it and the right to grant us the rights and license as provided in these Terms, and (ii) that the posting of your Content on or through Service does not violate the privacy rights, publicity rights, copyrights, contract rights or any other rights of any person or entity. We reserve the right to terminate the account of anyone found to be infringing on a copyright.</p>\r\n\r\n<p>You retain any and all of your rights to any Content you submit, post or display on or through Service and you are responsible for protecting those rights. We take no responsibility and assume no liability for Content you or any third party posts on or through Service. However, by posting Content using Service you grant us the right and license to use, modify, publicly perform, publicly display, reproduce, and distribute such Content on and through Service. You agree that this license includes the right for us to make your Content available to other users of Service, who may also use your Content subject to these Terms.</p>\r\n\r\n<p>servicly.com&nbsp;has the right but not the obligation to monitor and edit all Content provided by users.</p>\r\n\r\n<p>In addition, Content found on or through this Service are the property of&nbsp;servicly.com&nbsp;or used with permission. You may not distribute, modify, transmit, reuse, download, repost, copy, or use said Content, whether in whole or in part, for commercial purposes or for personal gain, without express advance written permission from us.</p>\r\n\r\n<p>10.&nbsp;<strong>Prohibited Uses</strong></p>\r\n\r\n<p>You may use Service only for lawful purposes and in accordance with Terms. You agree not to use Service:</p>\r\n\r\n<p>0.1. In any way that violates any applicable national or international law or regulation.</p>\r\n\r\n<p>0.2. For the purpose of exploiting, harming, or attempting to exploit or harm minors in any way by exposing them to inappropriate content or otherwise.</p>\r\n\r\n<p>0.3. To transmit, or procure the sending of, any advertising or promotional material, including any &ldquo;junk mail&rdquo;, &ldquo;chain letter,&rdquo; &ldquo;spam,&rdquo; or any other similar solicitation.</p>\r\n\r\n<p>0.4. To impersonate or attempt to impersonate Company, a Company employee, another user, or any other person or entity.</p>\r\n\r\n<p>0.5. In any way that infringes upon the rights of others, or in any way is illegal, threatening, fraudulent, or harmful, or in connection with any unlawful, illegal, fraudulent, or harmful purpose or activity.</p>\r\n\r\n<p>0.6. To engage in any other conduct that restricts or inhibits anyone&rsquo;s use or enjoyment of Service, or which, as determined by us, may harm or offend Company or users of Service or expose them to liability.</p>\r\n\r\n<p>Additionally, you agree not to:</p>\r\n\r\n<p>0.1. Use Service in any manner that could disable, overburden, damage, or impair Service or interfere with any other party&rsquo;s use of Service, including their ability to engage in real time activities through Service.</p>\r\n\r\n<p>0.2. Use any robot, spider, or other automatic device, process, or means to access Service for any purpose, including monitoring or copying any of the material on Service.</p>\r\n\r\n<p>0.3. Use any manual process to monitor or copy any of the material on Service or for any other unauthorized purpose without our prior written consent.</p>\r\n\r\n<p>0.4. Use any device, software, or routine that interferes with the proper working of Service.</p>\r\n\r\n<p>0.5. Introduce any viruses, trojan horses, worms, logic bombs, or other material which is malicious or technologically harmful.</p>\r\n\r\n<p>0.6. Attempt to gain unauthorized access to, interfere with, damage, or disrupt any parts of Service, the server on which Service is stored, or any server, computer, or database connected to Service.</p>\r\n\r\n<p>0.7. Attack Service via a denial-of-service attack or a distributed denial-of-service attack.</p>\r\n\r\n<p>0.8. Take any action that may damage or falsify Company rating.</p>\r\n\r\n<p>0.9. Otherwise attempt to interfere with the proper working of Service.</p>\r\n\r\n<p>11.&nbsp;<strong>Analytics</strong></p>\r\n\r\n<p>We may use third-party Service Providers to monitor and analyze the use of our Service.</p>\r\n\r\n<p>12.&nbsp;<strong>No Use By Minors</strong></p>\r\n\r\n<p>Service is intended only for access and use by individuals at least eighteen (18) years old. By accessing or using Service, you warrant and represent that you are at least eighteen (18) years of age and with the full authority, right, and capacity to enter into this agreement and abide by all of the terms and conditions of Terms. If you are not at least eighteen (18) years old, you are prohibited from both the access and usage of Service.</p>\r\n\r\n<p>13.&nbsp;<strong>Accounts</strong></p>\r\n\r\n<p>When you create an account with us, you guarantee that you are above the age of 18, and that the information you provide us is accurate, complete, and current at all times. Inaccurate, incomplete, or obsolete information may result in the immediate termination of your account on Service.</p>\r\n\r\n<p>You are responsible for maintaining the confidentiality of your account and password, including but not limited to the restriction of access to your computer and/or account. You agree to accept responsibility for any and all activities or actions that occur under your account and/or password, whether your password is with our Service or a third-party service. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account.</p>\r\n\r\n<p>You may not use as a username the name of another person or entity or that is not lawfully available for use, a name or trademark that is subject to any rights of another person or entity other than you, without appropriate authorization. You may not use as a username any name that is offensive, vulgar or obscene.</p>\r\n\r\n<p>We reserve the right to refuse service, terminate accounts, remove or edit content, or cancel orders in our sole discretion.</p>\r\n\r\n<p>14.&nbsp;<strong>Intellectual Property</strong></p>\r\n\r\n<p>Service and its original content (excluding Content provided by users), features and functionality are and will remain the exclusive property of&nbsp;servicly.com&nbsp;and its licensors. Service is protected by copyright, trademark, and other laws of&nbsp;and foreign countries. Our trademarks may not be used in connection with any product or service without the prior written consent of&nbsp;servicly.com.</p>\r\n\r\n<p>15.&nbsp;<strong>Copyright Policy</strong></p>\r\n\r\n<p>We respect the intellectual property rights of others. It is our policy to respond to any claim that Content posted on Service infringes on the copyright or other intellectual property rights (&ldquo;Infringement&rdquo;) of any person or entity.</p>\r\n\r\n<p>If you are a copyright owner, or authorized on behalf of one, and you believe that the copyrighted work has been copied in a way that constitutes copyright infringement, please submit your claim via email to&nbsp;admin@admin.com, with the subject line: &ldquo;Copyright Infringement&rdquo; and include in your claim a detailed description of the alleged Infringement as detailed below, under &ldquo;DMCA Notice and Procedure for Copyright Infringement Claims&rdquo;</p>\r\n\r\n<p>You may be held accountable for damages (including costs and attorneys&rsquo; fees) for misrepresentation or bad-faith claims on the infringement of any Content found on and/or through Service on your copyright.</p>\r\n\r\n<p>16.&nbsp;<strong>DMCA Notice and Procedure for Copyright Infringement Claims</strong></p>\r\n\r\n<p>You may submit a notification pursuant to the Digital Millennium Copyright Act (DMCA) by providing our Copyright Agent with the following information in writing (see 17 U.S.C 512(c)(3) for further detail):</p>\r\n\r\n<p>0.1. an electronic or physical signature of the person authorized to act on behalf of the owner of the copyright&rsquo;s interest;</p>\r\n\r\n<p>0.2. a description of the copyrighted work that you claim has been infringed, including the URL (i.e., web page address) of the location where the copyrighted work exists or a copy of the copyrighted work;</p>\r\n\r\n<p>0.3. identification of the URL or other specific location on Service where the material that you claim is infringing is located;</p>\r\n\r\n<p>0.4. your address, telephone number, and email address;</p>\r\n\r\n<p>0.5. a statement by you that you have a good faith belief that the disputed use is not authorized by the copyright owner, its agent, or the law;</p>\r\n\r\n<p>0.6. a statement by you, made under penalty of perjury, that the above information in your notice is accurate and that you are the copyright owner or authorized to act on the copyright owner&rsquo;s behalf.</p>\r\n\r\n<p>You can contact our Copyright Agent via email at&nbsp;admin@admin.com.</p>\r\n\r\n<p>17.&nbsp;<strong>Error Reporting and Feedback</strong></p>\r\n\r\n<p>You may provide us either directly at&nbsp;admin@admin.com&nbsp;or via third party sites and tools with information and feedback concerning errors, suggestions for improvements, ideas, problems, complaints, and other matters related to our Service (&ldquo;Feedback&rdquo;). You acknowledge and agree that: (i) you shall not retain, acquire or assert any intellectual property right or other right, title or interest in or to the Feedback; (ii) Company may have development ideas similar to the Feedback; (iii) Feedback does not contain confidential information or proprietary information from you or any third party; and (iv) Company is not under any obligation of confidentiality with respect to the Feedback. In the event the transfer of the ownership to the Feedback is not possible due to applicable mandatory laws, you grant Company and its affiliates an exclusive, transferable, irrevocable, free-of-charge, sub-licensable, unlimited and perpetual right to use (including copy, modify, create derivative works, publish, distribute and commercialize) Feedback in any manner and for any purpose.</p>\r\n\r\n<p>18.&nbsp;<strong>Links To Other Web Sites</strong></p>\r\n\r\n<p>Our Service may contain links to third party web sites or services that are not owned or controlled by&nbsp;servicly.com.</p>\r\n\r\n<p>servicly.com&nbsp;has no control over, and assumes no responsibility for the content, privacy policies, or practices of any third party web sites or services. We do not warrant the offerings of any of these entities/individuals or their websites.</p>\r\n\r\n<p>For example, the outlined&nbsp;<a href=\"https://policymaker.io/terms-and-conditions/\">Terms of Use</a>&nbsp;have been created using&nbsp;<a href=\"https://policymaker.io/\">PolicyMaker.io</a>, a free web application for generating high-quality legal documents. PolicyMaker&rsquo;s&nbsp;<a href=\"https://policymaker.io/terms-and-conditions/\">Terms and Conditions generator</a>&nbsp;is an easy-to-use free tool for creating an excellent standard Terms of Service template for a website, blog, e-commerce store or app.</p>\r\n\r\n<p>YOU ACKNOWLEDGE AND AGREE THAT COMPANY SHALL NOT BE RESPONSIBLE OR LIABLE, DIRECTLY OR INDIRECTLY, FOR ANY DAMAGE OR LOSS CAUSED OR ALLEGED TO BE CAUSED BY OR IN CONNECTION WITH USE OF OR RELIANCE ON ANY SUCH CONTENT, GOODS OR SERVICES AVAILABLE ON OR THROUGH ANY SUCH THIRD PARTY WEB SITES OR SERVICES.</p>\r\n\r\n<p>WE STRONGLY ADVISE YOU TO READ THE TERMS OF SERVICE AND PRIVACY POLICIES OF ANY THIRD PARTY WEB SITES OR SERVICES THAT YOU VISIT.</p>\r\n\r\n<p>19.&nbsp;<strong>Disclaimer Of Warranty</strong></p>\r\n\r\n<p>THESE SERVICES ARE PROVIDED BY COMPANY ON AN &ldquo;AS IS&rdquo; AND &ldquo;AS AVAILABLE&rdquo; BASIS. COMPANY MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, AS TO THE OPERATION OF THEIR SERVICES, OR THE INFORMATION, CONTENT OR MATERIALS INCLUDED THEREIN. YOU EXPRESSLY AGREE THAT YOUR USE OF THESE SERVICES, THEIR CONTENT, AND ANY SERVICES OR ITEMS OBTAINED FROM US IS AT YOUR SOLE RISK.</p>\r\n\r\n<p>NEITHER COMPANY NOR ANY PERSON ASSOCIATED WITH COMPANY MAKES ANY WARRANTY OR REPRESENTATION WITH RESPECT TO THE COMPLETENESS, SECURITY, RELIABILITY, QUALITY, ACCURACY, OR AVAILABILITY OF THE SERVICES. WITHOUT LIMITING THE FOREGOING, NEITHER COMPANY NOR ANYONE ASSOCIATED WITH COMPANY REPRESENTS OR WARRANTS THAT THE SERVICES, THEIR CONTENT, OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE SERVICES WILL BE ACCURATE, RELIABLE, ERROR-FREE, OR UNINTERRUPTED, THAT DEFECTS WILL BE CORRECTED, THAT THE SERVICES OR THE SERVER THAT MAKES IT AVAILABLE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT THE SERVICES OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE SERVICES WILL OTHERWISE MEET YOUR NEEDS OR EXPECTATIONS.</p>\r\n\r\n<p>COMPANY HEREBY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, STATUTORY, OR OTHERWISE, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, AND FITNESS FOR PARTICULAR PURPOSE.</p>\r\n\r\n<p>THE FOREGOING DOES NOT AFFECT ANY WARRANTIES WHICH CANNOT BE EXCLUDED OR LIMITED UNDER APPLICABLE LAW.</p>\r\n\r\n<p>20.&nbsp;<strong>Limitation Of Liability</strong></p>\r\n\r\n<p>EXCEPT AS PROHIBITED BY LAW, YOU WILL HOLD US AND OUR OFFICERS, DIRECTORS, EMPLOYEES, AND AGENTS HARMLESS FOR ANY INDIRECT, PUNITIVE, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGE, HOWEVER IT ARISES (INCLUDING ATTORNEYS&rsquo; FEES AND ALL RELATED COSTS AND EXPENSES OF LITIGATION AND ARBITRATION, OR AT TRIAL OR ON APPEAL, IF ANY, WHETHER OR NOT LITIGATION OR ARBITRATION IS INSTITUTED), WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE, OR OTHER TORTIOUS ACTION, OR ARISING OUT OF OR IN CONNECTION WITH THIS AGREEMENT, INCLUDING WITHOUT LIMITATION ANY CLAIM FOR PERSONAL INJURY OR PROPERTY DAMAGE, ARISING FROM THIS AGREEMENT AND ANY VIOLATION BY YOU OF ANY FEDERAL, STATE, OR LOCAL LAWS, STATUTES, RULES, OR REGULATIONS, EVEN IF COMPANY HAS BEEN PREVIOUSLY ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. EXCEPT AS PROHIBITED BY LAW, IF THERE IS LIABILITY FOUND ON THE PART OF COMPANY, IT WILL BE LIMITED TO THE AMOUNT PAID FOR THE PRODUCTS AND/OR SERVICES, AND UNDER NO CIRCUMSTANCES WILL THERE BE CONSEQUENTIAL OR PUNITIVE DAMAGES. SOME STATES DO NOT ALLOW THE EXCLUSION OR LIMITATION OF PUNITIVE, INCIDENTAL OR CONSEQUENTIAL DAMAGES, SO THE PRIOR LIMITATION OR EXCLUSION MAY NOT APPLY TO YOU.</p>\r\n\r\n<p>21.&nbsp;<strong>Termination</strong></p>\r\n\r\n<p>We may terminate or suspend your account and bar access to Service immediately, without prior notice or liability, under our sole discretion, for any reason whatsoever and without limitation, including but not limited to a breach of Terms.</p>\r\n\r\n<p>If you wish to terminate your account, you may simply discontinue using Service.</p>\r\n\r\n<p>All provisions of Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.</p>\r\n\r\n<p>22.&nbsp;<strong>Governing Law</strong></p>\r\n\r\n<p>These Terms shall be governed and construed in accordance with the laws of&nbsp;india, which governing law applies to agreement without regard to its conflict of law provisions.</p>\r\n\r\n<p>Our failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service and supersede and replace any prior agreements we might have had between us regarding Service.</p>\r\n\r\n<p>23.&nbsp;<strong>Changes To Service</strong></p>\r\n\r\n<p>We reserve the right to withdraw or amend our Service, and any service or material we provide via Service, in our sole discretion without notice. We will not be liable if for any reason all or any part of Service is unavailable at any time or for any period. From time to time, we may restrict access to some parts of Service, or the entire Service, to users, including registered users.</p>\r\n\r\n<p>24.&nbsp;<strong>Amendments To Terms</strong></p>\r\n\r\n<p>We may amend Terms at any time by posting the amended terms on this site. It is your responsibility to review these Terms periodically.</p>\r\n\r\n<p>Your continued use of the Platform following the posting of revised Terms means that you accept and agree to the changes. You are expected to check this page frequently so you are aware of any changes, as they are binding on you.</p>\r\n\r\n<p>By continuing to access or use our Service after any revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, you are no longer authorized to use Service.</p>\r\n\r\n<p>25.&nbsp;<strong>Waiver And Severability</strong></p>\r\n\r\n<p>No waiver by Company of any term or condition set forth in Terms shall be deemed a further or continuing waiver of such term or condition or a waiver of any other term or condition, and any failure of Company to assert a right or provision under Terms shall not constitute a waiver of such right or provision.</p>\r\n\r\n<p>If any provision of Terms is held by a court or other tribunal of competent jurisdiction to be invalid, illegal or unenforceable for any reason, such provision shall be eliminated or limited to the minimum extent such that the remaining provisions of Terms will continue in full force and effect.</p>\r\n\r\n<p>26.&nbsp;<strong>Acknowledgement</strong></p>\r\n\r\n<p>BY USING SERVICE OR OTHER SERVICES PROVIDED BY US, YOU ACKNOWLEDGE THAT YOU HAVE READ THESE TERMS OF SERVICE AND AGREE TO BE BOUND BY THEM.</p>\r\n\r\n<p>27.&nbsp;<strong>Contact Us</strong></p>\r\n\r\n<p>Please send your feedback, comments, requests for technical support by email:&nbsp;<strong>admin@admin.com</strong>.</p>\r\n\r\n<p>These&nbsp;<a href=\"https://policymaker.io/terms-and-conditions/\">Terms of Service</a>&nbsp;were created for&nbsp;<strong>http://servicly.p4moviemaker.com/</strong>&nbsp;by&nbsp;<a href=\"https://policymaker.io/\">PolicyMaker.io</a>&nbsp;on&nbsp;2022-09-22.</p>', NULL, '2022-09-22 13:05:09'),
(27, 'minimum_shipping_charge', NULL, NULL, NULL),
(28, 'per_km_shipping_charge', NULL, NULL, NULL),
(29, 'ssl_commerz_payment', '{\"status\":\"0\",\"store_id\":null,\"store_password\":null}', '2021-07-04 08:52:20', '2022-09-15 16:40:12'),
(30, 'razor_pay', '{\"status\":\"1\",\"razor_key\":\"rzp_test_WZu8B3H1Bec0W9\",\"razor_secret\":\"PHOUvQ7gGf8HgNP34Zq4V9KT\"}', '2021-07-04 08:53:04', '2022-09-06 17:12:44'),
(31, 'digital_payment', '{\"status\":\"1\"}', '2021-07-04 08:53:10', '2021-10-16 03:11:55'),
(32, 'paypal', '{\"status\":\"0\",\"paypal_client_id\":null,\"paypal_secret\":null}', '2021-07-04 08:53:18', '2022-09-15 16:40:36'),
(33, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":null,\"merchantEmail\":null}', '2021-07-04 09:14:07', '2021-10-16 03:12:17'),
(34, 'senang_pay', '{\"status\":null,\"secret_key\":null,\"published_key\":null,\"merchant_id\":null}', '2021-07-04 09:14:13', '2021-09-09 22:28:04'),
(35, 'order_handover_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(36, 'order_cancled_message', '{\"status\":1,\"message\":\"Booking canceled\"}', NULL, NULL),
(37, 'timezone', 'Asia/Calcutta', NULL, NULL),
(38, 'order_delivery_verification', '1', NULL, NULL),
(39, 'currency_symbol_position', 'left', NULL, NULL),
(40, 'schedule_order', '0', NULL, NULL),
(41, 'app_minimum_version', '0', NULL, NULL),
(42, 'tax', NULL, NULL, NULL),
(43, 'admin_commission', '100', NULL, NULL),
(44, 'country', 'IN', NULL, NULL),
(45, 'app_url', 'up_comming', NULL, NULL),
(46, 'default_location', '{\"lat\":\"0\",\"lng\":\"0\"}', NULL, NULL),
(47, 'twilio_sms', '{\"status\":\"1\",\"sid\":\"AC8730ef35a2f4c5266e4f63e84c9e5709\",\"messaging_service_id\":null,\"token\":\"76e3cb0c5c9f855e6765aa55773f7120\",\"from\":\"+19897046722\",\"otp_template\":\"Your otp is #OTP#.\"}', '2022-10-01 15:25:21', '2022-10-01 15:25:21'),
(48, 'nexmo_sms', '{\"status\":0,\"api_key\":null,\"api_secret\":null,\"signature_secret\":\"\",\"private_key\":\"\",\"application_id\":\"\",\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}', '2022-10-01 15:25:21', '2022-10-01 15:25:21'),
(49, '2factor_sms', '{\"status\":0,\"api_key\":\"Your otp is #OTP#.\"}', '2022-10-01 15:25:21', '2022-10-01 15:25:21'),
(50, 'msg91_sms', '{\"status\": 1,\"template_id\":null,\"authkey\": \"381752AKZDxYXGt2i6317ae3eP1\"}', '2022-10-01 15:25:21', '2022-10-01 15:25:21'),
(51, 'admin_order_notification', '1', NULL, NULL),
(52, 'free_delivery_over', NULL, NULL, NULL),
(53, 'maintenance_mode', '0', '2021-09-09 21:33:55', '2021-09-09 21:33:58'),
(54, 'app_minimum_version_android', NULL, NULL, NULL),
(55, 'app_minimum_version_ios', NULL, NULL, NULL),
(56, 'app_url_android', NULL, NULL, NULL),
(57, 'app_url_ios', NULL, NULL, NULL),
(58, 'dm_maximum_orders', NULL, NULL, NULL),
(59, 'flutterwave', '{\"status\":\"0\",\"public_key\":\"FLWPUBK_TEST-a2de4c414d6872e3b637cad738297328-X\",\"secret_key\":\"FLWSECK_TEST-13471bde97bfe4c6e3d4ca60bc9220ab-X\",\"hash\":\"FLWSECK_TESTacfdbc1615d1\"}', '2021-09-23 06:51:28', '2022-09-15 16:41:04'),
(60, 'order_confirmation_model', 'restaurant', NULL, NULL),
(61, 'mercadopago', '{\"status\":null,\"public_key\":null,\"access_token\":null}', NULL, '2021-10-16 03:12:09'),
(62, 'popular_food', '1', NULL, NULL),
(63, 'popular_restaurant', '1', NULL, NULL),
(64, 'new_restaurant', '1', NULL, NULL),
(65, 'landing_page_text', '{\"header_title_1\":null,\"header_title_2\":null,\"header_title_3\":null,\"about_title\":null,\"why_choose_us\":null,\"why_choose_us_title\":null,\"testimonial_title\":null,\"footer_article\":null}', '2021-10-31 15:21:57', '2021-10-31 15:21:57'),
(66, 'landing_page_links', '{\"app_url_android_status\":\"1\",\"app_url_android\":null,\"app_url_ios_status\":\"1\",\"app_url_ios\":null,\"web_app_url_status\":\"1\",\"web_app_url\":\"servicly.app\"}', '2021-10-31 15:21:57', '2021-10-31 15:21:57'),
(67, 'speciality', '[{\"img\":\"2022-08-30-630dc81ebdb33.png\",\"title\":\"electricity\"},{\"img\":\"2022-08-30-630dc81ec9a8c.png\",\"title\":\"electricity\"}]', '2021-10-31 15:21:57', '2022-08-30 01:19:03'),
(68, 'testimonial', '[{\"img\":\"2022-09-14-6321c3f7691ad.png\",\"name\":\"test@test.com\",\"position\":\"Best services\",\"detail\":\"Best service\"}]', '2021-10-31 15:21:57', '2022-08-11 03:53:17'),
(69, 'most_reviewed_foods', '1', NULL, NULL),
(70, 'paymob_accept', '{\"status\":\"0\",\"api_key\":null,\"iframe_id\":null,\"integration_id\":null,\"hmac\":null}', NULL, '2021-11-12 21:02:39'),
(71, 'timeformat', '12', NULL, NULL),
(72, 'canceled_by_restaurant', '0', NULL, NULL),
(73, 'canceled_by_deliveryman', NULL, NULL, NULL),
(74, 'show_dm_earning', NULL, NULL, NULL),
(75, 'toggle_veg_non_veg', NULL, NULL, NULL),
(76, 'toggle_dm_registration', NULL, NULL, NULL),
(77, 'toggle_restaurant_registration', '1', NULL, NULL),
(78, 'recaptcha', '{\"status\":\"0\",\"site_key\":null,\"secret_key\":null}', '2022-01-09 20:03:59', '2022-01-09 20:03:59'),
(79, 'landing_page_images', '{\"top_content_image\":\"2022-08-30-630dc795b70d6.png\",\"about_us_image\":\"2022-08-30-630dc795b7299.png\"}', '2022-01-10 16:09:54', '2022-01-10 16:09:54'),
(80, 'map_api_key_server', 'AIzaSyBYat2dy-0qFA_RiAyyFyY1XuYbCEMwfZQ', NULL, NULL),
(81, 'service_coin_on_registration', '50', NULL, NULL),
(82, 'service_coin_on_referral', '10', NULL, NULL),
(83, 'minimum_coin_transfer', '500', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_vendor`
--

CREATE TABLE `campaign_vendor` (
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaign_vendor`
--

INSERT INTO `campaign_vendor` (`campaign_id`, `vendor_id`) VALUES
(1, 8),
(2, 8),
(2, 9),
(2, 9),
(2, 9),
(3, 14),
(2, 14),
(2, 10),
(5, 10),
(7, 11),
(8, 11);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `parent_id`, `position`, `status`, `created_at`, `updated_at`, `priority`) VALUES
(60, 'Electrician', '2023-01-11-63be995c6357e.png', 0, 0, 1, '2023-01-11 16:41:24', '2023-01-11 16:41:24', 0),
(61, 'Car Washing', '2023-01-11-63be9c27b9500.png', 0, 0, 1, '2023-01-11 16:53:19', '2023-01-11 16:53:19', 0),
(62, 'Carpenter', '2023-01-11-63be9c90ba410.png', 0, 0, 1, '2023-01-11 16:55:04', '2023-01-11 16:55:04', 0),
(63, 'Plumber Service', '2023-01-11-63be9cb202ffb.png', 0, 0, 1, '2023-01-11 16:55:38', '2023-01-11 16:55:38', 0),
(64, 'Repairing Service', '2023-01-11-63be9db5e7677.png', 0, 0, 1, '2023-01-11 16:59:57', '2023-01-11 16:59:57', 0),
(65, 'Cleaning Pest Control', '2023-01-11-63beadf6f3345.png', 0, 0, 1, '2023-01-11 18:09:18', '2023-01-11 18:09:18', 0);

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `coupon_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `limit` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_uses` bigint(20) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `title`, `code`, `start_date`, `expire_date`, `min_purchase`, `max_discount`, `discount`, `discount_type`, `coupon_type`, `limit`, `status`, `created_at`, `updated_at`, `data`, `total_uses`) VALUES
(5, 'Electrician', '123456', '2022-09-21', '2023-09-22', '0.00', '0.00', '10.00', 'amount', 'service_wise', 10, 1, '2022-09-21 13:17:23', '2022-09-21 13:17:23', '[\"28\"]', 0),
(6, 'Gardening', '1234', '2022-09-22', '2023-09-22', '0.00', '0.00', '10.00', 'amount', 'service_wise', 10, 1, '2022-09-22 16:47:23', '2022-09-22 16:47:23', '[\"24\"]', 0),
(7, 'electrical', '12345', '2022-09-26', '2023-09-27', '0.00', '0.00', '10.00', 'amount', 'zone_wise', 20, 1, '2022-09-26 18:03:26', '2022-09-26 18:03:26', '[\"4\"]', 0);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_rate` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency_code`, `currency_symbol`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', '$', '1.00', NULL, NULL),
(2, 'Canadian Dollar', 'CAD', 'CA$', '1.00', NULL, NULL),
(3, 'Euro', 'EUR', '€', '1.00', NULL, NULL),
(4, 'United Arab Emirates Dirham', 'AED', 'د.إ.‏', '1.00', NULL, NULL),
(5, 'Afghan Afghani', 'AFN', '؋', '1.00', NULL, NULL),
(6, 'Albanian Lek', 'ALL', 'L', '1.00', NULL, NULL),
(7, 'Armenian Dram', 'AMD', '֏', '1.00', NULL, NULL),
(8, 'Argentine Peso', 'ARS', '$', '1.00', NULL, NULL),
(9, 'Australian Dollar', 'AUD', '$', '1.00', NULL, NULL),
(10, 'Azerbaijani Manat', 'AZN', '₼', '1.00', NULL, NULL),
(11, 'Bosnia-Herzegovina Convertible Mark', 'BAM', 'KM', '1.00', NULL, NULL),
(12, 'Bangladeshi Taka', 'BDT', '৳', '1.00', NULL, NULL),
(13, 'Bulgarian Lev', 'BGN', 'лв.', '1.00', NULL, NULL),
(14, 'Bahraini Dinar', 'BHD', 'د.ب.‏', '1.00', NULL, NULL),
(15, 'Burundian Franc', 'BIF', 'FBu', '1.00', NULL, NULL),
(16, 'Brunei Dollar', 'BND', 'B$', '1.00', NULL, NULL),
(17, 'Bolivian Boliviano', 'BOB', 'Bs', '1.00', NULL, NULL),
(18, 'Brazilian Real', 'BRL', 'R$', '1.00', NULL, NULL),
(19, 'Botswanan Pula', 'BWP', 'P', '1.00', NULL, NULL),
(20, 'Belarusian Ruble', 'BYN', 'Br', '1.00', NULL, NULL),
(21, 'Belize Dollar', 'BZD', '$', '1.00', NULL, NULL),
(22, 'Congolese Franc', 'CDF', 'FC', '1.00', NULL, NULL),
(23, 'Swiss Franc', 'CHF', 'CHf', '1.00', NULL, NULL),
(24, 'Chilean Peso', 'CLP', '$', '1.00', NULL, NULL),
(25, 'Chinese Yuan', 'CNY', '¥', '1.00', NULL, NULL),
(26, 'Colombian Peso', 'COP', '$', '1.00', NULL, NULL),
(27, 'Costa Rican Colón', 'CRC', '₡', '1.00', NULL, NULL),
(28, 'Cape Verdean Escudo', 'CVE', '$', '1.00', NULL, NULL),
(29, 'Czech Republic Koruna', 'CZK', 'Kč', '1.00', NULL, NULL),
(30, 'Djiboutian Franc', 'DJF', 'Fdj', '1.00', NULL, NULL),
(31, 'Danish Krone', 'DKK', 'Kr.', '1.00', NULL, NULL),
(32, 'Dominican Peso', 'DOP', 'RD$', '1.00', NULL, NULL),
(33, 'Algerian Dinar', 'DZD', 'د.ج.‏', '1.00', NULL, NULL),
(34, 'Estonian Kroon', 'EEK', 'kr', '1.00', NULL, NULL),
(35, 'Egyptian Pound', 'EGP', 'E£‏', '1.00', NULL, NULL),
(36, 'Eritrean Nakfa', 'ERN', 'Nfk', '1.00', NULL, NULL),
(37, 'Ethiopian Birr', 'ETB', 'Br', '1.00', NULL, NULL),
(38, 'British Pound Sterling', 'GBP', '£', '1.00', NULL, NULL),
(39, 'Georgian Lari', 'GEL', 'GEL', '1.00', NULL, NULL),
(40, 'Ghanaian Cedi', 'GHS', 'GH¢', '1.00', NULL, NULL),
(41, 'Guinean Franc', 'GNF', 'FG', '1.00', NULL, NULL),
(42, 'Guatemalan Quetzal', 'GTQ', 'Q', '1.00', NULL, NULL),
(43, 'Hong Kong Dollar', 'HKD', 'HK$', '1.00', NULL, NULL),
(44, 'Honduran Lempira', 'HNL', 'L', '1.00', NULL, NULL),
(45, 'Croatian Kuna', 'HRK', 'kn', '1.00', NULL, NULL),
(46, 'Hungarian Forint', 'HUF', 'Ft', '1.00', NULL, NULL),
(47, 'Indonesian Rupiah', 'IDR', 'Rp', '1.00', NULL, NULL),
(48, 'Israeli New Sheqel', 'ILS', '₪', '1.00', NULL, NULL),
(49, 'Indian Rupee', 'INR', '₹', '1.00', NULL, NULL),
(50, 'Iraqi Dinar', 'IQD', 'ع.د', '1.00', NULL, NULL),
(51, 'Iranian Rial', 'IRR', '﷼', '1.00', NULL, NULL),
(52, 'Icelandic Króna', 'ISK', 'kr', '1.00', NULL, NULL),
(53, 'Jamaican Dollar', 'JMD', '$', '1.00', NULL, NULL),
(54, 'Jordanian Dinar', 'JOD', 'د.ا‏', '1.00', NULL, NULL),
(55, 'Japanese Yen', 'JPY', '¥', '1.00', NULL, NULL),
(56, 'Kenyan Shilling', 'KES', 'Ksh', '1.00', NULL, NULL),
(57, 'Cambodian Riel', 'KHR', '៛', '1.00', NULL, NULL),
(58, 'Comorian Franc', 'KMF', 'FC', '1.00', NULL, NULL),
(59, 'South Korean Won', 'KRW', 'CF', '1.00', NULL, NULL),
(60, 'Kuwaiti Dinar', 'KWD', 'د.ك.‏', '1.00', NULL, NULL),
(61, 'Kazakhstani Tenge', 'KZT', '₸.', '1.00', NULL, NULL),
(62, 'Lebanese Pound', 'LBP', 'ل.ل.‏', '1.00', NULL, NULL),
(63, 'Sri Lankan Rupee', 'LKR', 'Rs', '1.00', NULL, NULL),
(64, 'Lithuanian Litas', 'LTL', 'Lt', '1.00', NULL, NULL),
(65, 'Latvian Lats', 'LVL', 'Ls', '1.00', NULL, NULL),
(66, 'Libyan Dinar', 'LYD', 'د.ل.‏', '1.00', NULL, NULL),
(67, 'Moroccan Dirham', 'MAD', 'د.م.‏', '1.00', NULL, NULL),
(68, 'Moldovan Leu', 'MDL', 'L', '1.00', NULL, NULL),
(69, 'Malagasy Ariary', 'MGA', 'Ar', '1.00', NULL, NULL),
(70, 'Macedonian Denar', 'MKD', 'Ден', '1.00', NULL, NULL),
(71, 'Myanma Kyat', 'MMK', 'K', '1.00', NULL, NULL),
(72, 'Macanese Pataca', 'MOP', 'MOP$', '1.00', NULL, NULL),
(73, 'Mauritian Rupee', 'MUR', 'Rs', '1.00', NULL, NULL),
(74, 'Mexican Peso', 'MXN', '$', '1.00', NULL, NULL),
(75, 'Malaysian Ringgit', 'MYR', 'RM', '1.00', NULL, NULL),
(76, 'Mozambican Metical', 'MZN', 'MT', '1.00', NULL, NULL),
(77, 'Namibian Dollar', 'NAD', 'N$', '1.00', NULL, NULL),
(78, 'Nigerian Naira', 'NGN', '₦', '1.00', NULL, NULL),
(79, 'Nicaraguan Córdoba', 'NIO', 'C$', '1.00', NULL, NULL),
(80, 'Norwegian Krone', 'NOK', 'kr', '1.00', NULL, NULL),
(81, 'Nepalese Rupee', 'NPR', 'Re.', '1.00', NULL, NULL),
(82, 'New Zealand Dollar', 'NZD', '$', '1.00', NULL, NULL),
(83, 'Omani Rial', 'OMR', 'ر.ع.‏', '1.00', NULL, NULL),
(84, 'Panamanian Balboa', 'PAB', 'B/.', '1.00', NULL, NULL),
(85, 'Peruvian Nuevo Sol', 'PEN', 'S/', '1.00', NULL, NULL),
(86, 'Philippine Peso', 'PHP', '₱', '1.00', NULL, NULL),
(87, 'Pakistani Rupee', 'PKR', 'Rs', '1.00', NULL, NULL),
(88, 'Polish Zloty', 'PLN', 'zł', '1.00', NULL, NULL),
(89, 'Paraguayan Guarani', 'PYG', '₲', '1.00', NULL, NULL),
(90, 'Qatari Rial', 'QAR', 'ر.ق.‏', '1.00', NULL, NULL),
(91, 'Romanian Leu', 'RON', 'lei', '1.00', NULL, NULL),
(92, 'Serbian Dinar', 'RSD', 'din.', '1.00', NULL, NULL),
(93, 'Russian Ruble', 'RUB', '₽.', '1.00', NULL, NULL),
(94, 'Rwandan Franc', 'RWF', 'FRw', '1.00', NULL, NULL),
(95, 'Saudi Riyal', 'SAR', 'ر.س.‏', '1.00', NULL, NULL),
(96, 'Sudanese Pound', 'SDG', 'ج.س.', '1.00', NULL, NULL),
(97, 'Swedish Krona', 'SEK', 'kr', '1.00', NULL, NULL),
(98, 'Singapore Dollar', 'SGD', '$', '1.00', NULL, NULL),
(99, 'Somali Shilling', 'SOS', 'Sh.so.', '1.00', NULL, NULL),
(100, 'Syrian Pound', 'SYP', 'LS‏', '1.00', NULL, NULL),
(101, 'Thai Baht', 'THB', '฿', '1.00', NULL, NULL),
(102, 'Tunisian Dinar', 'TND', 'د.ت‏', '1.00', NULL, NULL),
(103, 'Tongan Paʻanga', 'TOP', 'T$', '1.00', NULL, NULL),
(104, 'Turkish Lira', 'TRY', '₺', '1.00', NULL, NULL),
(105, 'Trinidad and Tobago Dollar', 'TTD', '$', '1.00', NULL, NULL),
(106, 'New Taiwan Dollar', 'TWD', 'NT$', '1.00', NULL, NULL),
(107, 'Tanzanian Shilling', 'TZS', 'TSh', '1.00', NULL, NULL),
(108, 'Ukrainian Hryvnia', 'UAH', '₴', '1.00', NULL, NULL),
(109, 'Ugandan Shilling', 'UGX', 'USh', '1.00', NULL, NULL),
(110, 'Uruguayan Peso', 'UYU', '$', '1.00', NULL, NULL),
(111, 'Uzbekistan Som', 'UZS', 'so\'m', '1.00', NULL, NULL),
(112, 'Venezuelan Bolívar', 'VEF', 'Bs.F.', '1.00', NULL, NULL),
(113, 'Vietnamese Dong', 'VND', '₫', '1.00', NULL, NULL),
(114, 'CFA Franc BEAC', 'XAF', 'FCFA', '1.00', NULL, NULL),
(115, 'CFA Franc BCEAO', 'XOF', 'CFA', '1.00', NULL, NULL),
(116, 'Yemeni Rial', 'YER', '﷼‏', '1.00', NULL, NULL),
(117, 'South African Rand', 'ZAR', 'R', '1.00', NULL, NULL),
(118, 'Zambian Kwacha', 'ZMK', 'ZK', '1.00', NULL, NULL),
(119, 'Zimbabwean Dollar', 'ZWL', 'Z$', '1.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_addresses`
--

INSERT INTO `customer_addresses` (`id`, `address_type`, `contact_person_number`, `address`, `latitude`, `longitude`, `user_id`, `contact_person_name`, `created_at`, `updated_at`, `zone_id`) VALUES
(3, 'home', '+919598324808', 'A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India', '22.728673458875132', '75.89584093540907', 5, 'Test Acc', '2022-08-18 23:07:53', '2022-08-18 23:07:53', 4),
(4, 'home', '+918305137336', 'B-402, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India', '22.728684282282014', '75.89584596455097', 9, 'vishnu charan', '2022-08-22 22:35:46', '2022-08-22 22:35:46', 4),
(5, 'home', '+919598324808', 'Indore, Madhya Pradesh, India', '22.71956881492173', '75.85772573947906', 5, 'Test Acc', '2022-09-01 02:37:34', '2022-09-01 02:37:34', 4),
(7, 'home', '+915661659169', 'A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India', '22.72869077632571', '75.89583188295364', 29, 'Swati Dixit', '2022-09-15 16:27:22', '2022-09-15 16:27:22', 4),
(10, 'home', '+919667202227', 'F- 1/4, Munirka Marg, Block F, Vasant Vihar, New Delhi, Delhi 110057, India', '28.5580338430585', '77.16199714690447', 21, 'Aaryan Jha', '2022-09-23 17:47:51', '2022-09-23 17:47:51', 4),
(11, 'home', '+919667202227', 'B-38, Shivam, Block G, Janakpuri, Delhi, 110018', '28.62309943430196', '77.03885961323977', 21, 'Aaryan Jha', '2022-11-04 17:07:56', '2022-11-04 17:07:56', 4),
(12, 'home', '+918602514661', '21, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452001, India', '22.7287775', '75.8958486', 27, 'Puja Sharma', '2022-11-15 11:49:43', '2022-11-15 11:49:43', 4);

-- --------------------------------------------------------

--
-- Table structure for table `customer_notifications`
--

CREATE TABLE `customer_notifications` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `is_seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man_wallets`
--

CREATE TABLE `delivery_man_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `collected_cash` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT 0.00,
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `earning` tinyint(1) NOT NULL DEFAULT 1,
  `current_orders` int(11) NOT NULL DEFAULT 0,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'zone_wise',
  `restaurant_id` bigint(20) DEFAULT NULL,
  `application_status` enum('approved','denied','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `d_m_reviews`
--

CREATE TABLE `d_m_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_verifications`
--

CREATE TABLE `email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_roles`
--

CREATE TABLE `employee_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_roles`
--

INSERT INTO `employee_roles` (`id`, `name`, `modules`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Vishnu charan', '[\"service\",\"booking\",\"vendor_setup\",\"wallet\",\"bank_info\",\"employee\",\"my_shop\",\"custom_role\",\"campaign\",\"reviews\"]', 1, '2022-10-03 21:57:02', '2022-10-03 21:57:02');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_ons` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `available_time_starts` time DEFAULT NULL,
  `available_time_ends` time DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_campaigns`
--

CREATE TABLE `item_campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_ons` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `service_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mail_configs`
--

CREATE TABLE `mail_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encryption` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_05_05_081114_create_admins_table', 1),
(5, '2021_05_05_102600_create_attributes_table', 1),
(6, '2021_05_05_102742_create_categories_table', 1),
(7, '2021_05_06_102004_create_vendors_table', 1),
(8, '2021_05_06_153204_create_restaurants_table', 1),
(9, '2021_05_08_113436_create_add_ons_table', 2),
(47, '2021_05_08_123446_create_food_table', 10),
(48, '2021_05_08_141209_create_currencies_table', 10),
(49, '2021_05_09_050232_create_orders_table', 10),
(50, '2021_05_09_051907_create_reviews_table', 10),
(51, '2021_05_09_054237_create_order_details_table', 10),
(52, '2021_05_10_105324_create_mail_configs_table', 10),
(53, '2021_05_10_152713_create_business_settings_table', 10),
(54, '2021_05_11_111722_create_banners_table', 11),
(55, '2021_05_11_134442_create_coupons_table', 11),
(56, '2021_05_12_053344_create_conversations_table', 11),
(57, '2021_05_12_055454_create_delivery_men_table', 12),
(58, '2021_05_12_060138_create_d_m_reviews_table', 12),
(59, '2021_05_12_060527_create_track_deliverymen_table', 12),
(60, '2021_05_12_061345_create_email_verifications_table', 12),
(61, '2021_05_12_061454_create_delivery_histories_table', 12),
(62, '2021_05_12_061718_create_wishlists_table', 12),
(63, '2021_05_12_061924_create_notifications_table', 12),
(64, '2021_05_12_062152_create_customer_addresses_table', 12),
(68, '2021_05_12_062412_create_order_delivery_histories_table', 13),
(69, '2021_05_19_115112_create_zones_table', 13),
(70, '2021_05_19_120612_create_restaurant_zone_table', 13),
(71, '2021_06_07_103835_add_column_to_vendor_table', 14),
(73, '2021_06_07_112335_add_column_to_vendors_table', 15),
(74, '2021_06_08_162354_add_column_to_restaurants_table', 16),
(77, '2021_06_09_115719_add_column_to_add_ons_table', 17),
(78, '2021_06_10_091547_add_column_to_coupons_table', 18),
(79, '2021_06_12_070530_rename_banners_table', 19),
(80, '2021_06_12_091154_add_column_on_campaigns_table', 20),
(87, '2021_06_12_091848_create_item_campaigns_table', 21),
(92, '2021_06_13_155531_create_campaign_restaurant_table', 22),
(93, '2021_06_14_090520_add_item_campaign_id_column_to_reviews_table', 23),
(94, '2021_06_14_091735_add_item_campaign_id_column_to_order_details_table', 24),
(95, '2021_06_14_120713_create_new_banners_table', 25),
(96, '2021_06_15_103656_add_zone_id_column_to_banners_table', 26),
(97, '2021_06_16_110322_create_discounts_table', 27),
(100, '2021_06_17_150243_create_withdraw_requests_table', 28),
(103, '2016_06_01_000001_create_oauth_auth_codes_table', 30),
(104, '2016_06_01_000002_create_oauth_access_tokens_table', 30),
(105, '2016_06_01_000003_create_oauth_refresh_tokens_table', 30),
(106, '2016_06_01_000004_create_oauth_clients_table', 30),
(107, '2016_06_01_000005_create_oauth_personal_access_clients_table', 30),
(108, '2021_06_21_051135_add_delivery_charge_to_orders_table', 31),
(110, '2021_06_23_080009_add_role_id_to_admins_table', 32),
(111, '2021_06_27_140224_add_interest_column_to_users_table', 33),
(113, '2021_06_27_142558_change_column_to_restaurants_table', 34),
(114, '2021_06_27_152139_add_restaurant_id_column_to_wishlists_table', 35),
(115, '2021_06_28_142443_add_restaurant_id_column_to_customer_addresses_table', 36),
(118, '2021_06_29_134119_add_schedule_column_to_orders_table', 37),
(122, '2021_06_30_084854_add_cm_firebase_token_column_to_users_table', 38),
(123, '2021_06_30_133932_add_code_column_to_coupons_table', 39),
(127, '2021_07_01_151103_change_column_food_id_from_admin_wallet_histories_table', 40),
(129, '2021_07_04_142159_add_callback_column_to_orders_table', 41),
(131, '2021_07_05_155506_add_cm_firebase_token_to_vendors_table', 42),
(133, '2021_07_05_162404_add_otp_to_orders_table', 43),
(134, '2021_07_13_133941_create_admin_roles_table', 44),
(135, '2021_07_14_074431_add_status_to_delivery_men_table', 45),
(136, '2021_07_14_104102_create_vendor_employees_table', 46),
(137, '2021_07_14_110011_create_employee_roles_table', 46),
(138, '2021_07_15_124141_add_cover_photo_to_restaurants_table', 47),
(143, '2021_06_17_145949_create_wallets_table', 48),
(144, '2021_06_19_052600_create_admin_wallets_table', 48),
(145, '2021_07_19_103748_create_delivery_man_wallets_table', 48),
(146, '2021_07_19_105442_create_account_transactions_table', 48),
(147, '2021_07_19_110152_create_order_transactions_table', 48),
(148, '2021_07_19_134356_add_column_to_notifications_table', 49),
(149, '2021_07_25_125316_add_available_to_delivery_men_table', 50),
(150, '2021_07_25_154722_add_columns_to_restaurants_table', 51),
(151, '2021_07_29_162336_add_schedule_order_column_to_restaurants_table', 52),
(152, '2021_07_31_140756_create_phone_verifications_table', 53),
(153, '2021_08_01_151717_add_column_to_order_transactions_table', 54),
(154, '2021_08_01_163520_add_column_to_admin_wallets_table', 54),
(155, '2021_08_02_141909_change_time_column_to_restaurants_table', 55),
(157, '2021_08_02_183356_add_tax_column_to_restaurants_table', 56),
(158, '2021_08_04_215618_add_zone_id_column_to_restaurants_table', 57),
(159, '2021_08_06_123001_add_address_column_to_orders_table', 58),
(160, '2021_08_06_123326_add_zone_wise_topic_column_to_zones_table', 58),
(161, '2021_08_08_112127_add_scheduled_column_on_orders_table', 59),
(162, '2021_08_08_203108_add_status_column_to_users_table', 60),
(163, '2021_08_11_193805_add_product_discount_ammount_column_to_orders_table', 61),
(165, '2021_08_12_112511_add_addons_column_to_order_details_table', 62),
(166, '2021_08_12_195346_add_zone_id_to_notifications_table', 63),
(167, '2021_08_14_110131_create_user_notifications_table', 64),
(168, '2021_08_14_175657_add_order_count_column_to_foods_table', 65),
(169, '2021_08_14_180044_add_order_count_column_to_users_table', 65),
(170, '2021_08_19_051055_add_earnign_column_to_deliverymen_table', 66),
(171, '2021_08_19_051721_add_original_delivery_charge_column_to_orders_table', 66),
(172, '2021_08_19_055839_create_provide_d_m_earnings_table', 67),
(173, '2021_08_19_112810_add_original_delivery_charge_column_to_order_transactions_table', 67),
(174, '2021_08_19_114851_add_columns_to_delivery_man_wallets_table', 67),
(175, '2021_08_21_162616_change_comission_column_to_restaurants_table', 68),
(176, '2021_06_17_054551_create_soft_credentials_table', 69),
(177, '2021_08_22_232507_add_failed_column_to_orders_table', 69),
(178, '2021_09_04_172723_add_column_reviews_section_to_restaurants_table', 69),
(179, '2021_09_11_164936_change_delivery_address_column_to_orders_table', 70),
(180, '2021_09_11_165426_change_address_column_to_customer_addresses_table', 70),
(181, '2021_09_23_120332_change_available_column_to_delivery_men_table', 71),
(182, '2021_10_03_214536_add_active_column_to_restaurants_table', 72),
(183, '2021_10_04_123739_add_priority_column_to_categories_table', 72),
(184, '2021_10_06_200730_add_restaurant_id_column_to_demiverymen_table', 72),
(185, '2021_10_07_223332_add_self_delivery_column_to_restaurants_table', 72),
(186, '2021_10_11_214123_change_add_ons_column_to_order_details_table', 72),
(187, '2021_10_11_215352_add_adjustment_column_to_orders_table', 72),
(188, '2021_10_24_184553_change_column_to_account_transactions_table', 73),
(189, '2021_10_24_185143_change_column_to_add_ons_table', 73),
(190, '2021_10_24_185525_change_column_to_admin_roles_table', 73),
(191, '2021_10_24_185831_change_column_to_admin_wallets_table', 73),
(192, '2021_10_24_190550_change_column_to_coupons_table', 73),
(193, '2021_10_24_190826_change_column_to_delivery_man_wallets_table', 73),
(194, '2021_10_24_191018_change_column_to_discounts_table', 73),
(195, '2021_10_24_191209_change_column_to_employee_roles_table', 73),
(196, '2021_10_24_191343_change_column_to_food_table', 73),
(197, '2021_10_24_191514_change_column_to_item_campaigns_table', 73),
(198, '2021_10_24_191626_change_column_to_orders_table', 73),
(199, '2021_10_24_191938_change_column_to_order_details_table', 73),
(200, '2021_10_24_192341_change_column_to_order_transactions_table', 73),
(201, '2021_10_24_192621_change_column_to_provide_d_m_earnings_table', 73),
(202, '2021_10_24_192820_change_column_type_to_restaurants_table', 73),
(203, '2021_10_24_192959_change_column_type_to_restaurant_wallets_table', 73),
(204, '2021_11_02_123115_add_delivery_time_column_to_restaurants_table', 74),
(205, '2021_11_02_170217_add_total_uses_column_to_coupons_table', 74),
(206, '2021_12_01_131746_add_status_column_to_reviews_table', 75),
(207, '2021_12_01_135115_add_status_column_to_d_m_reviews_table', 75),
(208, '2021_12_13_125126_rename_comlumn_set_menu_to_food_table', 75),
(209, '2021_12_13_132438_add_zone_id_column_to_admins_table', 75),
(210, '2021_12_18_174714_add_application_status_column_to_delivery_men_table', 75),
(211, '2021_12_20_185736_change_status_column_to_vendors_table', 75),
(212, '2021_12_22_114414_create_translations_table', 75),
(213, '2022_01_05_133920_add_sosial_data_column_to_users_table', 75),
(214, '2022_01_05_172441_add_veg_non_veg_column_to_restaurants_table', 75),
(215, '2022_07_17_051620_services', 76),
(216, '2022_07_17_061835_add_new_columns_to_vendors_table', 76),
(217, '2022_08_03_203430_create_referrals_table', 77);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tergat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `description`, `image`, `status`, `created_at`, `updated_at`, `tergat`, `zone_id`) VALUES
(1, 'delivey', 'we are new services added.', '2022-08-30-630dba482c862.png', 1, '2022-08-30 00:20:40', '2022-08-30 00:20:40', 'customer', 4),
(2, 'electrical service', 'electrical service', '2022-09-07-6318942db0c6d.png', 1, '2022-09-07 05:53:01', '2022-09-07 05:53:01', 'vendor', 4),
(3, 'electrical service', 'electrical service', '2022-09-07-6318943ed236e.png', 1, '2022-09-07 05:53:18', '2022-09-07 05:53:18', 'vendor', 4),
(5, 'please complete soon..', 'your booking successfully', '2022-10-01-633819c648d9d.png', 1, '2022-10-01 16:13:18', '2022-10-01 16:17:57', 'customer', 5);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('02c187400441f53687a30af580361503d21ab9e30fc263f729536e3e6fb8e013c5f10f170df66154', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-14 07:26:44', '2021-08-14 07:26:44', '2022-08-14 13:26:44'),
('03491bfb9ad60e7a51e76d3f0fbb9e4aa7edf769658bdf57c1b5eca941f13dd00d5bd4f21c6f6d08', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-03 19:33:29', '2022-08-03 19:33:29', '2023-08-03 20:33:29'),
('03652f98734cb46633be656afd61eb9d6bef93da6cb3f97e5d862e758bc8a7458f4271c9fc525a03', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-04 04:56:56', '2021-07-04 04:56:56', '2022-07-04 10:56:56'),
('0432b707b5948489ef6b7ae11c7db79f6957d4ada6bba28b8b4d16e97bc3745d0e2ddb3e0856babb', 47, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 15:22:58', '2022-10-06 15:22:58', '2023-10-06 15:22:58'),
('06af012e563580a2a878cbcff3874743416ba8bfdb0d8a3853545605fd899494ecde310d5780e4c3', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-01 23:27:54', '2022-09-01 23:27:54', '2023-09-01 23:27:54'),
('07b1a996b1239d62a5123e3a89bf0a6038eb9cc2d340cada477a9f63e0a5bf8f03e43befefc1128d', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-12 04:28:42', '2022-09-12 04:28:42', '2023-09-12 04:28:42'),
('08632dcc4617aec095f6e3437db74123f2f02eb314b5e13010b640515a9413d41dc45ade130e61a3', 36, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-21 16:18:57', '2022-09-21 16:18:57', '2023-09-21 16:18:57'),
('0936fed141c7227163ed478616e03132d720a0d692b0409265397a3b39d1551f4a6a42e9a8558b7c', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-01 16:12:57', '2022-10-01 16:12:57', '2023-10-01 16:12:57'),
('0a0d134aa3e72407d3fd798a85254b9b5c8aa24b48b470ed21934d7f8e43b46c4b2c2a97fab9aef3', 35, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-20 17:34:43', '2022-09-20 17:34:43', '2023-09-20 17:34:43'),
('0b114a145e0c7207782fd608b979d43698b83eaf34067ecce454a04bc706a5f5be871f2135cc964a', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-08 15:46:53', '2022-07-08 15:46:53', '2023-07-08 16:46:53'),
('0cb2f6e216ade1847fcfbc09838741e51b85013dab23801d94a78e5380ef6f479e05f271c209def0', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-21 16:00:32', '2022-09-21 16:00:32', '2023-09-21 16:00:32'),
('0ce77d214106aa7d2691f22e57a52d61e83c4a74e232b6cf6409728c337a731412d5f011c265abf9', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-08 14:51:24', '2021-08-08 14:51:24', '2022-08-08 20:51:24'),
('0e5f5e7783e9fa84f2077eaabcbb9467d3691cd9785990ff0bf3573330ae4dbe9a808b6bcf927250', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-22 18:37:37', '2022-09-22 18:37:37', '2023-09-22 18:37:37'),
('0e666cfd7daa852ab002a53486f3e117f61aa7dd6ac6ebc073d9e7f1eb65c390d4da418a81ef21ce', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 16:32:57', '2022-09-28 16:32:57', '2023-09-28 16:32:57'),
('1187abcfdafefd67c1d14d25c462487355f9961c8a884690ee64c5564e246b79b75284eb577a8cad', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 16:32:56', '2022-10-06 16:32:56', '2023-10-06 16:32:56'),
('1273559c721fe74e90556b65d4c3d51c6de9eca8f4f82094cc7adb69cf4b60ad33dbbb93f2e9d159', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 13:10:24', '2022-10-06 13:10:24', '2023-10-06 13:10:24'),
('135bb6de314d95817a776170c6489dbd3199176bac76fe652bdac855162998650bdda95cf2499abf', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-03 19:31:52', '2022-08-03 19:31:52', '2023-08-03 20:31:52'),
('13b536d6c79e87835a8368e9fa8b52ec34cdb80e28119086e68e993a1ed9c890335f2eb8b9592b3c', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 15:14:51', '2022-10-06 15:14:51', '2023-10-06 15:14:51'),
('15f1623e4c7fd05802c47ba4fdeec0c966721a8587f20415e35b07b72c292fc8f0cdbf1629532bfe', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 15:52:14', '2022-10-06 15:52:14', '2023-10-06 15:52:14'),
('1636bcd12cc33eedb8a7f3853fda6574e9c27bc8fbea9564b92507c2c0fa4d955f1695ed451b4f07', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-22 18:24:02', '2022-09-22 18:24:02', '2023-09-22 18:24:02'),
('167a42f84ef7fea479a8c4167585b3af7fd6c884f3fc0abb3c94f7cf8210fc80a587aa3fc3fcb816', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-15 14:04:43', '2022-10-15 14:04:43', '2023-10-15 14:04:43'),
('16ddfe16ebfd377040d6cc0fbe4192cba0284122c2fcac5825e2de215fd7091a1be39069f6328653', 43, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 16:46:49', '2022-09-28 16:46:49', '2023-09-28 16:46:49'),
('175f1e15b86d00cf0313deabe23ad3dcdc9a6c570876d9a44fec1ebaeede408365491e38affe54d4', 44, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 17:12:56', '2022-09-28 17:12:56', '2023-09-28 17:12:56'),
('175ff75636795fbb235d5370859c02eab9fc6467b058af07a6f251345b3b2b09a28b6a284594d080', 14, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-19 03:00:58', '2022-08-19 03:00:58', '2023-08-19 03:00:58'),
('1796645666d7dd6ef53186e095fb9c39d2128e5cca19f2e1ac8e7e7da82d6174fe98b14e94925188', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-04 07:35:29', '2021-08-04 07:35:29', '2022-08-04 13:35:29'),
('184e9300518cdf4284237c13aef3b41ff69f2d5189867ba748bbe08db671245ea9114d99049c0499', 31, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-19 19:44:39', '2022-09-19 19:44:39', '2023-09-19 19:44:39'),
('18efa3aeab4a67af1cd38b729a345fd23d07e4f228d79b8650d9335d212881f0a95c4c1b10f68209', 47, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 15:28:18', '2022-10-06 15:28:18', '2023-10-06 15:28:18'),
('1c9063e79c47f1b55e32b7506f6f45939300c4388813784d809bb65af1b272209d0e860f1749b49b', 32, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-20 13:38:58', '2022-09-20 13:38:58', '2023-09-20 13:38:58'),
('1dfdc490e87dff259b7a2d6d60014e9a8abbf8f894b33ddec141a52f893ed9ac6733560306c646b1', 16, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-26 01:03:59', '2022-08-26 01:03:59', '2023-08-26 01:03:59'),
('1f6715192cadf83f1a15d0038cad26d151f16a94431f7e13fbf698197ec717ce1e894249cb759d54', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-16 23:23:31', '2022-08-16 23:23:31', '2023-08-16 23:23:31'),
('204a133a042d3460b9b7d062fd39d22db7c54a191ee80a7979a59fda3914b3c5621039e767598f98', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-08 07:29:55', '2022-07-08 07:29:55', '2023-07-08 08:29:55'),
('21112ae6edd6cb28529821d8cee7b58a60921cce08685ccacb59d974471484e991c38e3e1468f75a', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-07 14:29:23', '2022-07-07 14:29:23', '2023-07-07 15:29:23'),
('230aab30089f6560271de7047193fa54fefb24d0f5cc1f9254b17ba9ecdaa43984c620f52c9dcaea', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-22 17:42:55', '2022-09-22 17:42:55', '2023-09-22 17:42:55'),
('23122a529c3e1fc4c2a50661d399b905c9539e59c288ff3b65b5774edf9d5a959442fd74e2c94246', 50, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-04 12:26:17', '2022-10-04 12:26:17', '2023-10-04 12:26:17'),
('23baf109a1829abb1f9d6cc0372d4398a9f997b75f07c0c010e5a073ddf9c1996ad239b900e47c75', 4, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-08 07:27:36', '2022-07-08 07:27:36', '2023-07-08 08:27:36'),
('23ca1f2dafe153c0e4a384916d55c59996a3d3a7c329675a4a021223af21b7fcc81c3d8213e581c6', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-15 15:48:47', '2022-09-15 15:48:47', '2023-09-15 15:48:47'),
('25232bd099119383ae811c9cfecde6bebc0ec8c0c3b9a0474d175ed25fdb5388857006a03f13f469', 25, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-14 13:34:30', '2022-10-14 13:34:30', '2023-10-14 13:34:30'),
('253231dcdfd0c53a378d4e6ee61456e7a1da491e0e8ca799e5f582051125864f25c3ae675e770847', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-10 00:52:34', '2022-08-10 00:52:34', '2023-08-10 01:52:34'),
('259b5446f58e884397dcab1d9e923cf27d72222dcc2f5fac472ae29fca660ba2b077e769968fc9eb', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 15:51:44', '2022-09-28 15:51:44', '2023-09-28 15:51:44'),
('26e262570cb15cc9b85b6c66de5415e7d174f3a637460112a686e860831f79229f0d22c39f9b2150', 3, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-08 07:12:26', '2022-07-08 07:12:26', '2023-07-08 08:12:26'),
('26e8d26713b2ad1572c1142dcbd64071d5b826463a2979b818af476e2dc3098616f99e6a4e7d90cf', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-22 22:27:42', '2022-08-22 22:27:42', '2023-08-22 22:27:42'),
('28453186c71b17e9fcd15463b63d69d45195733e51d9c2537cc43e70ce9ca07256fa7b64819967a1', 8, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-16 23:01:42', '2022-08-16 23:01:42', '2023-08-16 23:01:42'),
('2919672ecc1e3dd9f2759d15f8cc54882d1d9f780cfda82fb83c8359de8654492ea6703956a7c50d', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-15 08:22:28', '2021-07-15 08:22:28', '2022-07-15 14:22:28'),
('2a021e4d743e999a0b34925175ef6d067b56e41e3baa8a830cbf33baf135656eb74d00b21428da83', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-19 19:41:27', '2022-09-19 19:41:27', '2023-09-19 19:41:27'),
('2a257f4eb343ff41227710ef4e65ad34b37995f45818192b2e1437ffe90d4bedc22b976aa2f1b8a8', 36, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 15:26:48', '2022-10-06 15:26:48', '2023-10-06 15:26:48'),
('2a59f12e0d228411296b2dd09134d913d7234b10c90d5591b081fdaafdf65d49f84d3bb6b6fe04e0', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-07 13:40:40', '2022-10-07 13:40:40', '2023-10-07 13:40:40'),
('2af59648d1639680cbfea5933e7905e3c879b4e4ed111833bf4f27bea6019e8f8a177296188104d0', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-08 14:03:36', '2022-07-08 14:03:36', '2023-07-08 15:03:36'),
('2ba0a28f260c83d427de794ec5e47f70eca2ad1c12a2590476bed899f751e8da1c0ad4742509789e', 25, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-14 00:55:23', '2022-09-14 00:55:23', '2023-09-14 00:55:23'),
('2bd87a591442122a9175d0bc2eb43198d5099edf6c5d97a0c3850e8bf0c7e19f8358d83139e0b17b', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-07 14:17:46', '2022-07-07 14:17:46', '2023-07-07 15:17:46'),
('2c19bd68cec1fb4dbcc03ab5b76740dddb250d2c75170b303e6728348497ef69beaaa05d9c8e7eae', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-19 15:39:48', '2022-10-19 15:39:48', '2023-10-19 15:39:48'),
('2c927332f629611f73f6155466bd7c754e9dfc8f46f647c9e6fe4810c5f945cdbf9af19af47f4837', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-07 13:04:42', '2022-07-07 13:04:42', '2023-07-07 14:04:42'),
('2d2472c9b1bd4cacf2ba65a1ce451eb0981b6d2db4071dbfa18564bf9c590c57acd757570bb5e295', 15, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-26 01:03:14', '2022-08-26 01:03:14', '2023-08-26 01:03:14'),
('2d434e594f360bae3d7b409e4416cca714ab6672c30a13f0b79a0bdc911964069d9f04d03092ec42', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-01 17:33:31', '2022-10-01 17:33:31', '2023-10-01 17:33:31'),
('2f1539a80a52a73e046eb9ec534de6ffe46a77be98574747eea2f824d5eb4ed11bbeccf6b6f8515a', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-09 05:15:48', '2022-09-09 05:15:48', '2023-09-09 05:15:48'),
('2f49586a4ac33179f846e60afba15e655ceef494cd64f6812d4ab109336f5fb008cb3005137f700c', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-03 13:21:13', '2021-08-03 13:21:13', '2022-08-03 19:21:13'),
('303972823c8890622ea37bc17ef332369b6032d8dfc051e0ec40b10299f9a0285bb65f006cc86026', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 17:22:41', '2022-09-28 17:22:41', '2023-09-28 17:22:41'),
('3115e428f22908fa2d94bf2804d1ed2d9929cb27da233aedf24c8bc71dc8066f91b0c63a795c26e9', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-31 08:33:37', '2021-07-31 08:33:37', '2022-07-31 14:33:37'),
('33e829e51dee502111c566d41a8505ccfb681d7e1dbe591e880c52c47499e24b0974fca1c3c03e02', 53, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-04 12:33:34', '2022-10-04 12:33:34', '2023-10-04 12:33:34'),
('36217e984b8904eb4dfd30ed62eef9d725c1e8e63a6c1485bb084ef323ad5eea852c84e17560bd54', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-14 00:51:51', '2021-07-14 00:51:51', '2022-07-14 06:51:51'),
('376552483514d14facb5990e422701f983f3b0d3b5f107d5cc3597333ac2befba3a70d899b736926', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-01 23:20:52', '2022-09-01 23:20:52', '2023-09-01 23:20:52'),
('38acf5a138950e8f428278b3f46b9fd0bd97929924543e198a7cebf07ab8bbb76204302dd2307596', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-26 17:53:00', '2022-09-26 17:53:00', '2023-09-26 17:53:00'),
('39a6d6fbcbb61d336018b6c921d0f1b75bd74e32105346d5466cb49993390d62688ee4279223b530', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-09 05:59:24', '2022-09-09 05:59:24', '2023-09-09 05:59:24'),
('39e63aa81573c9e2a2b96d99c5ccfb3d4cd2409368bf788d83498a39a40b4688700415e5dcd0657d', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 16:13:04', '2022-10-06 16:13:04', '2023-10-06 16:13:04'),
('3abfb4980fdf3c858e1c371352db40dae9e1e40f095b00dcd09c84ff7c8189a305f1be985e4274b3', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-19 03:50:53', '2021-06-19 03:50:53', '2022-06-19 09:50:53'),
('3cd3269423e543961a7b64e8169875725eb47f8d0f309c69a4a770258de65e9c02057ed9000942da', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-04 07:35:04', '2021-08-04 07:35:04', '2022-08-04 13:35:04'),
('3e923b1f4084faba1a2e5448bd8b72e09b74db6ed25fbe14f6960a5f005107496cc507c1ba15c6e1', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-22 01:32:58', '2021-06-22 01:32:58', '2022-06-22 07:32:58'),
('3fbcb956a12332415281c239116da8797bd6f357d42fe9088014c14cce5652250023bd10b7b4480c', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-03 16:18:12', '2022-10-03 16:18:12', '2023-10-03 16:18:12'),
('412dff3cdf7918f348c2c2214d1e9da1a2152daa92c7f889a60790bb24ac55646bb5cb36c1d04020', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-02 07:08:14', '2022-09-02 07:08:14', '2023-09-02 07:08:14'),
('4140d5b9b3d16e4bbef1b676b01f13f75d9c3fb2cada6548e50b0b2679562aace3b9b44f82f15f30', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-19 17:10:26', '2021-08-19 17:10:26', '2022-08-19 23:10:26'),
('41aee83c5040c38e0d856ff217aee8ed058fedad061715fc54bded39169fabe481a7dc4fe4b92508', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 15:30:10', '2022-10-06 15:30:10', '2023-10-06 15:30:10'),
('42092136f4291d9608e29220f5555a863097e68869f30e5916e7b9ad9e324574d4e9f2d92e751313', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-22 18:30:49', '2022-09-22 18:30:49', '2023-09-22 18:30:49'),
('423261402f5a4920f6f4d72606eb3965b433e9b553d7067fe89d9c5cf673b7f9e4333ab8e6651628', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-02 10:40:07', '2022-09-02 10:40:07', '2023-09-02 10:40:07'),
('43555c8afacbb355d5e38c3e33e6ec62312559cf62285b6eb5c4910624a183e2962862ffdbda8da8', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 16:40:10', '2022-09-28 16:40:10', '2023-09-28 16:40:10'),
('43d8237ea6ddd25b2f0bb1c80eb600907454c030ea0c9866cab937263af0085a2060530f06383916', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 17:16:15', '2022-10-06 17:16:15', '2023-10-06 17:16:15'),
('440d06ef13f894f6512c4c0b2a388755425eb53604a2946e9b9c3fd3f03c5939c95070e7c1b48f28', 36, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-01 15:44:03', '2022-10-01 15:44:03', '2023-10-01 15:44:03'),
('44648fd9c41470968564999b91e10f5009605dea2d4310176e65446bbfff8901679cd40a2652621b', 50, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 11:56:08', '2022-10-06 11:56:08', '2023-10-06 11:56:08'),
('44977de19ba2ce3459a3bacf3865e6a8950950ba64f3d9c17ede74236363f7886b33547d34a6f84d', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-22 11:51:33', '2022-09-22 11:51:33', '2023-09-22 11:51:33'),
('449a73b2894a4e7728bed6ca32e902b05efc4388807fc9bb66c654628b84565915db426105e956c9', 22, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-08 01:05:28', '2022-09-08 01:05:28', '2023-09-08 01:05:28'),
('44a334be3a7994ba8eeae87793b0774e7647a8d76f12c8c0a3703a43ddaefcd6893ec329fad1b7d1', 55, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 15:00:16', '2022-10-06 15:00:16', '2023-10-06 15:00:16'),
('461b43ac7e85558c55b1fcb907f083089f602b2ab7a19b770e90dc16b8d6130248594d095d46d9b5', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-01 22:58:57', '2022-09-01 22:58:57', '2023-09-01 22:58:57'),
('4851b7f4e993ac8d7212edc62a35a6d4802a6798e26e6ca49c139269ceac67d871ba4f3333628155', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-29 05:58:28', '2022-08-29 05:58:28', '2023-08-29 05:58:28'),
('48bb0abd7e54ed7377d54e1c76e66b904c9eaaf0eaeedf658466a08a916df72eb3d7aed3b90b7371', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-03 11:27:35', '2022-10-03 11:27:35', '2023-10-03 11:27:35'),
('48eb64ce28eb6c6cd6ab01ca7236ade54fa52c4fb7279d88b96411f5e65cce5ad432ac0862f62879', 41, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 16:29:31', '2022-09-28 16:29:31', '2023-09-28 16:29:31'),
('492d0c39379b829417e7fa46117f6f5ac3949ed06bcbcde71c5fa780931b3617aa341065d45c64f8', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 13:58:18', '2022-10-06 13:58:18', '2023-10-06 13:58:18'),
('4ac185bdf2af541ccce927b50ce129fff90ca32158134e485c054178a4635117937caf4737f3199a', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 17:14:40', '2022-10-06 17:14:40', '2023-10-06 17:14:40'),
('4b09a6e3d01a8947a90b8a63b549313c5d991bc4fcb1da566d077b91607fb6a534b3de658e5c433c', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-14 13:41:09', '2022-10-14 13:41:09', '2023-10-14 13:41:09'),
('4bb7ef240ca221b5365ab96f81b57237016ab86a43b8d2f347562de08ff17296d72a65612592dd90', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-07 13:57:14', '2022-07-07 13:57:14', '2023-07-07 14:57:14'),
('4cfad08796e4a1eecfe8bbdc20e512e0954570168990fa60442ad41b5ecf05e4005cadcae08fbddd', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-19 03:29:52', '2021-06-19 03:29:52', '2022-06-19 09:29:52'),
('4d6855d639307ee1fd6ed4b492c4833952b37798c17be369c1ab25331b57d4056a8fd392d09acf9c', 50, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-03 11:25:20', '2022-10-03 11:25:20', '2023-10-03 11:25:20'),
('4de8713abc37bdb2ac61837adf3f91b7836315e48a90c38d444268f9b36a52b6eefeedeea62064bd', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-29 06:00:42', '2022-08-29 06:00:42', '2023-08-29 06:00:42'),
('4f5c62c9a41b20cd48b9f328272e3dde5e4b5bf6c9ee4961c24737c0c6b22cb62f6c0d3b0716a6e6', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-05 12:35:56', '2022-11-05 12:35:56', '2023-11-05 12:35:56'),
('50df665903aa9a61b754d5be45a4ba6b46232f8993db616556e284e242351bbefd81675b7a147fed', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-09 15:22:03', '2022-07-09 15:22:03', '2023-07-09 16:22:03'),
('50e7c1a504aa52cdce0e739a9803158d5b3834e107b66d1084c32ac0084ffb9f599541e787e308b5', 47, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 15:23:37', '2022-10-06 15:23:37', '2023-10-06 15:23:37'),
('514a347fdd7045c4aec5bf9ca03a9287b56301d08237b507a4b178a5744107f52e5aa5ead00dbc35', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-02 20:47:51', '2022-09-02 20:47:51', '2023-09-02 20:47:51'),
('53afc11b36d08435d8ec82c42305f7aa4397d10b2d296f6e7d819e091d0d7c6d48e14cdc5e66e6c9', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-23 23:08:01', '2021-06-23 23:08:01', '2022-06-24 05:08:01'),
('54b90bb05c06c2ff303b18ecebf08f0736f6f7a99f0c01c78d0a5052ab4554b5b0971248d77dafc2', 38, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-29 12:53:48', '2022-09-29 12:53:48', '2023-09-29 12:53:48'),
('5646d6337aaed0e662c059ed368372e2da241ff97a42df56310667ec321fdbf2252d92771988640a', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-04 07:37:55', '2021-08-04 07:37:55', '2022-08-04 13:37:55'),
('56b1d9bcf0410a39a988c101be73ba6903bf69cc239bf718bc7667ceb5a118220c139d3ec42c922b', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-16 23:14:43', '2022-08-16 23:14:43', '2023-08-16 23:14:43'),
('5770da96404ec1f3d04ccafe2005de82d03964344a19a2f9479c86cf30a012951ec26fd9c50ae753', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-27 01:16:07', '2022-07-27 01:16:07', '2023-07-27 02:16:07'),
('5862087aa91d77fec8c7aa91378087c2a672f978befb1c071936cc5093130b4a70c14ae993ca2dee', 47, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 15:21:20', '2022-10-06 15:21:20', '2023-10-06 15:21:20'),
('593a1bf8f55b001d84646c934ad204ae669f4cfc7ee5dcf0d6308f055c6141196288c0a694ff7aa3', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-14 05:16:46', '2022-09-14 05:16:46', '2023-09-14 05:16:46'),
('595240b5d6d33624770ae53e287feeb2a4960f9fd066bfb13d21e1feca2d2128b4bf5c0c5cdb6824', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-19 15:48:20', '2022-10-19 15:48:20', '2023-10-19 15:48:20'),
('59551e481bc1fb037bee07e1501d81dad38d4ff34fdca68a49c40d0cf423176ca111940acd359aeb', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-08 14:50:59', '2021-08-08 14:50:59', '2022-08-08 20:50:59'),
('59d03447c30bc12bab98891a948826039283878915fd6c67309d8394b7821acbd77f155a083454b6', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-03 17:26:42', '2022-10-03 17:26:42', '2023-10-03 17:26:42'),
('59e7ad66d7567003ad011aa80d8ee71497670545a99403df961e2311c66a641dd55d8bb582e83c27', 45, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-01 15:01:39', '2022-10-01 15:01:39', '2023-10-01 15:01:39'),
('6093bb62fb218cfd90a56af722a357ee48248f483a29ef123cd6d4bba4ae5b5479a6f7fc955c9e3b', 47, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 15:21:37', '2022-10-06 15:21:37', '2023-10-06 15:21:37'),
('634ad699475fe3391b67f646506d590ec4b59873a55e4e5b3a9cdc459d649144f97896b6a543f470', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-04 19:12:16', '2022-10-04 19:12:16', '2023-10-04 19:12:16'),
('648ddbf01ee3d7538d68a2db678ea0e811946799c175768db08ff5cd0cf440cc3add06dab3eff077', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-01 15:40:55', '2022-10-01 15:40:55', '2023-10-01 15:40:55'),
('64a9684147777d105c7d90ad1c3582452fbf47efda05d264d91a5a8b73baa9822370fc59d0578c7c', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-07 12:15:02', '2022-07-07 12:15:02', '2023-07-07 13:15:02'),
('6575518dbd38cc613c3abf3939a9ec25aff82fb3ad96c7b91e2c6895f7fe9d98377524cb21681958', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 16:16:38', '2022-09-28 16:16:38', '2023-09-28 16:16:38'),
('65f1b4aac2d13770f0b190276eb3909cb65ead7060dfffc82aedfe8e63ae2b8796f3b6aebee9cc0f', 33, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-20 15:24:40', '2022-09-20 15:24:40', '2023-09-20 15:24:40'),
('67f57bb18ef5601b5a71124f4dd5e01beb57b22392a1cdd1d19de56f888a6f1479b4e5d7129cef6f', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-07 12:59:28', '2022-07-07 12:59:28', '2023-07-07 13:59:28'),
('68b06321c4bbbea81e7dfcbd8d5fae1a94a2fa0500041ee5774be2d9300c1ff7590d03604b77514a', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-28 02:33:54', '2021-07-28 02:33:54', '2022-07-28 08:33:54'),
('6990f6b4bbfb71714744b335cab2841589ce935fb8a40125e744c8cfe5fe2258a95b536c946d5836', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-30 15:30:18', '2022-09-30 15:30:18', '2023-09-30 15:30:18'),
('69a2e25213ccef8f700d87a6e99574e34d37aa8a995235d7c46c53ff1a251b43080b12ef6b262f7e', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-03 12:37:27', '2022-11-03 12:37:27', '2023-11-03 12:37:27'),
('69ac38c58fe2407a377d3cdb62e07d13735380e740acfdf6256bee8a7e419e529d096180d429b609', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 13:44:38', '2022-10-06 13:44:38', '2023-10-06 13:44:38'),
('6a6e114d04a301a086366dd7ec2b5ae190bc75c81b5db924ae222fc1d81fc3a53521e7bea36898e2', 25, 1, 'RestaurantCustomerAuth', '[]', 0, '2023-01-11 15:53:48', '2023-01-11 15:53:48', '2024-01-11 15:53:48'),
('6b34f7f827ec5320399357418b41893cf962af9cc9e3aacfabb75be5cbef02907d95ce3212bc62d6', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-15 17:03:03', '2022-08-15 17:03:03', '2023-08-15 17:03:03'),
('6bc4ac3bd0330f8ead86d0884dced14d377205c7494786a95bb0deaa066691fba04a4f7f556bc99f', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-01 02:45:20', '2022-09-01 02:45:20', '2023-09-01 02:45:20'),
('6e08a1f12c8665a389f30cee754de6e830369b80d5d4593defc589a593e9cfb9964d25a5b5a36aeb', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-01 12:49:13', '2022-10-01 12:49:13', '2023-10-01 12:49:13'),
('6f26348b202a5da0607613b0621825c83894c9c0523d0b4bac2788a9cdc8c13af23a7f4ee7914d88', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-03 20:12:46', '2022-10-03 20:12:46', '2023-10-03 20:12:46'),
('6f6aea99c770c0d617e5038401fd6a575ac14e7c10f00c5f8eb17cf4762fb80bb0a19ddcaec3faef', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 15:15:19', '2022-10-06 15:15:19', '2023-10-06 15:15:19'),
('70b14e3c6ef083be217af9cf5f3af3bd137c9b4c070066d9268e83735ae191d877e637d404475171', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 16:18:00', '2022-09-28 16:18:00', '2023-09-28 16:18:00'),
('70ca34dba9405e3493917eb05f6db59ab93f6df07e4463fdce69b17b081e340ccc199ea84dbc74ec', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-01 13:25:01', '2022-10-01 13:25:01', '2023-10-01 13:25:01'),
('723ceee668cd1a7fc2e977be48cab3f31aed1ace0883692711b5cc2ddf42c2f23c6d75461172105f', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-01 05:46:27', '2021-07-01 05:46:27', '2022-07-01 11:46:27'),
('73378d1cba21499de72cd74cc2930102c6c7d9f964926ca7c4ddd9f7be54f5392b347de5fa0c5e0a', 10, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-16 23:10:46', '2022-08-16 23:10:46', '2023-08-16 23:10:46'),
('737f43dcd3d10190f2d6675038090db4599221bf6f29fbd6af3121e20ffa0f7b4e462a426c471e0b', 47, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-01 15:05:55', '2022-10-01 15:05:55', '2023-10-01 15:05:55'),
('745c7bb03ad29b8c1298eba4b9833fec0072e9b06946a2c9e8c51ecfd716fb707cf788223c24e2c1', 51, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-03 16:40:44', '2022-10-03 16:40:44', '2023-10-03 16:40:44'),
('74e2dd27429bb92c12e33f891ccff32f48c22463166666705d145cfd8968d96ec992fa2cc3a36e76', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-23 23:08:23', '2021-06-23 23:08:23', '2022-06-24 05:08:23'),
('75c541b036575630489841ba47cc1f5e0ef1a508cf8297c2c39e149a4ffb058724aed43dc637e39c', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 16:39:35', '2022-09-28 16:39:35', '2023-09-28 16:39:35'),
('77c9389b2ab3031e09005a7e7be90d00496ff073dbbefeb57229cee5d0a240376c1f7c3c8a94faff', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-19 03:38:22', '2021-06-19 03:38:22', '2022-06-19 09:38:22'),
('78df35614958f38380f4bc337833a2e33ce2d7a4660e0886b6ecba0ff9353d57ddd8780d671bed17', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-26 17:58:16', '2022-09-26 17:58:16', '2023-09-26 17:58:16'),
('7bf9e4173d4e5a19a601adb57fe247452e41e4c2c6b9b1aa79c7b8475df923d79f9cc3f93291120d', 59, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 15:25:29', '2022-10-06 15:25:29', '2023-10-06 15:25:29'),
('7c97ea933e9c2a950ec565eaba461d4801d69e3d9871fbe4be77ea701dda594d580c4a9d447459d3', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-03 21:24:02', '2022-10-03 21:24:02', '2023-10-03 21:24:02'),
('7cb485f7dbfb92388ae69d7f55d3e35ce3f8288b57760b3c75b1802ab3db4ad50cb1597ea82cc874', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-30 14:59:24', '2022-09-30 14:59:24', '2023-09-30 14:59:24'),
('7d4deab2e1b6659ce228dbfc5a6fba9e2bab56bf54e573727ca9aad89ffdf9c73afd0e71d915f61b', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-26 01:04:40', '2022-08-26 01:04:40', '2023-08-26 01:04:40'),
('7f51462eba1581e942fd0a8e259ecabb63ebd7c1ef805228c5e029b92fb9eb8e178971cd57b06bd4', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-15 17:20:09', '2022-08-15 17:20:09', '2023-08-15 17:20:09'),
('7f554515877b874f57fd46023d52d05e473a4cfc431e000fa4190f86eca18ea48517d5fa9e4a3e3a', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-21 19:05:09', '2022-09-21 19:05:09', '2023-09-21 19:05:09'),
('81661f52f16b5637ad03527e93c4937657329491bb11c036c9df932010a8a61c75ac1bf4deb0c3b9', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-10 10:30:23', '2022-10-10 10:30:23', '2023-10-10 10:30:23'),
('83543b4f33a02dea1f4d121b7b397e7665470887dacf5f54c50a3d7513f69a7f723cf8eb4b2f3c62', 25, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-01-12 13:53:50', '2023-01-12 13:53:50', '2024-01-12 13:53:50'),
('841a2f516bfb9a16922f87a51142899ac9a1b0644fb47037732120a152603aee995e20bb036972d6', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-04 19:13:37', '2022-10-04 19:13:37', '2023-10-04 19:13:37'),
('8422ab10218257f72913e5c9a32efa253edbad227ac36d3087825e0e38d8876c714216a9a3dd873d', 38, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-29 13:04:43', '2022-09-29 13:04:43', '2023-09-29 13:04:43'),
('846aafee3cb711d48d5965614c62948b05e916090d0c8bc219df9f52bf2cd5d8fff244a722570ea1', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-12 02:00:42', '2022-09-12 02:00:42', '2023-09-12 02:00:42'),
('85ba21d03ccdad5816caad05e4d857acb79e86079d8419fa4579ba8881494f9ea74314f35d575b41', 52, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-03 17:42:00', '2022-10-03 17:42:00', '2023-10-03 17:42:00'),
('885c98cb6e1d0e31f7444df7f008408801f83d3e90854b604abe9580458fd0b3831d9ad27295a2e6', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-27 01:17:06', '2022-07-27 01:17:06', '2023-07-27 02:17:06'),
('88c4be51763d32b50b9e610c8a41fe10606273ec82ca9dbe683f05cd48eaa6e1bd85cbafde91e73d', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-04 19:18:44', '2022-10-04 19:18:44', '2023-10-04 19:18:44'),
('8a20c4f8656e404615f9abc15a95f6754dd87e4e894677647dd17236b95d8a5d7cc243c38457b048', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-04 02:36:57', '2021-07-04 02:36:57', '2022-07-04 08:36:57'),
('8a53287ac097b989298c9d868e73c2d268d14375da276f9ae9b33f960e01b4d17099b15e1e1e925d', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-17 06:07:07', '2022-08-17 06:07:07', '2023-08-17 06:07:07'),
('8a838584b08115a120c5c603599eff2c1010307193fa4eed18c90c05fb434d90aea56966bfcc7a78', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-17 06:07:11', '2022-08-17 06:07:11', '2023-08-17 06:07:11'),
('8b045d0cd0c8a90dee4e84b97afb1ed9a9d91c257184afc96f714cb3f80ff0babfb3ac6cf6d551c2', 34, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-20 16:09:24', '2022-09-20 16:09:24', '2023-09-20 16:09:24'),
('8b3988b1bed1cdb0ab836c1ab313e4432a5be42e8eab9bd3e37a7b0f703779ac6de4d47a491cb1ca', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-26 10:44:46', '2022-09-26 10:44:46', '2023-09-26 10:44:46'),
('8dd9aeb862936771277a2efeb68217813f35179ac225a83061b4cfc50268a28f5dbf2f85399e87a4', 5, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-01-11 18:00:25', '2023-01-11 18:00:25', '2024-01-11 18:00:25'),
('8ffc458ddbcbbbec17035dc2153c4baeebb5c54796b3a9008f24c8699197a8a2fc1111c36cc1d7da', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-14 07:27:12', '2021-08-14 07:27:12', '2022-08-14 13:27:12'),
('901a65907c4050e31d27775b342d5502aae641d97df4a03ccee05b9195c957b1a6566c0a1db389d8', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 13:55:46', '2022-10-06 13:55:46', '2023-10-06 13:55:46'),
('90bdef6b7b4dd1d2cc7289bed0a6307723afceb426be465494de2f67fded1851e838c8651fc350e6', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-03 19:43:04', '2022-10-03 19:43:04', '2023-10-03 19:43:04'),
('9167a3a43400c9d5789fd63bea903740ef8db9d9ba5a5ecb417c47b7a4e44d04b2b7e4f7f281a0b2', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-06 20:44:29', '2022-09-06 20:44:29', '2023-09-06 20:44:29'),
('92180482dcf2902001f1630e256cbb323c81afd5e7373937dd7ebf97ff3e39f6ad4ceb5aee2dc871', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-11 18:18:58', '2022-10-11 18:18:58', '2023-10-11 18:18:58'),
('931a5a4c8ec89522d06236e6bd1f0dc9d99ad9ebd8bf7b9b0a7d5fff7d8d3250610dc8b7d473d9c7', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-16 23:02:30', '2022-08-16 23:02:30', '2023-08-16 23:02:30'),
('946f54ecba73f7324a2e9481cf7c68b397663ce3ad3478019b7c44b0d11510ff0b93ce58ad8ca049', 22, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-08 01:04:58', '2022-09-08 01:04:58', '2023-09-08 01:04:58'),
('9484d57e59e15c4f7f829385c6ab454610031f80e37834509cc64f23d39c9a37de320c045ba6054c', 50, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-03 11:26:47', '2022-10-03 11:26:47', '2023-10-03 11:26:47'),
('95f9a4951350941b265182612e15456f0c0419e1aa6e66105fd4d2d29a8725ae9101f768a06ea097', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 15:00:53', '2022-10-06 15:00:53', '2023-10-06 15:00:53'),
('960c0a02241cc70b640b9d856e76244699fde15af752be98db750fd41cfce35ad850a7a01b84223d', 39, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 16:15:32', '2022-09-28 16:15:32', '2023-09-28 16:15:32'),
('9663445c7aaa115169c4896b749ac2d2fdea384b13ca1d8934f81deabff82cde084e6968f81e6c63', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-23 19:03:32', '2022-09-23 19:03:32', '2023-09-23 19:03:32'),
('966d9c13d9e61982d9b05c3273947d6588a81f72724013a097fb833da88a06bcd1c2c9a7aa4cd519', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-07 22:53:04', '2022-10-07 22:53:04', '2023-10-07 22:53:04'),
('97bee1045e44fe8238d823caed77f56ec12161432dd3152cb93e1e01ce0060d4615d6afb69ac37f4', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-08 15:05:23', '2022-10-08 15:05:23', '2023-10-08 15:05:23'),
('984e567785aaef51e5c510bf45276abfe8d67ac9b360acd3d25b2e21b0c52abb9f3506a6d724290b', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-21 19:34:43', '2022-09-21 19:34:43', '2023-09-21 19:34:43'),
('9a7ec8564457d514f3f77c492bedca80719bc65f1cfff833b03427e95561ef21eaf572b81dda7480', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-15 11:11:49', '2022-09-15 11:11:49', '2023-09-15 11:11:49'),
('9b31d1c416bf63f002f55c0f3b44bd10985bdf4a29a96481f497bb78fd1fbe42496c1d95303dfd00', 52, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-03 17:39:40', '2022-10-03 17:39:40', '2023-10-03 17:39:40'),
('9bfc94b7f9e61f740f6b91fb6250ba002372e81f7795f7932b9402308737320c4ed0c8eedd3b6cee', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-15 17:55:54', '2022-08-15 17:55:54', '2023-08-15 17:55:54'),
('9c82505347fe5e02e94203e3dfedc77782d745520d6348f0d1e0857af241bca83a98740af7be4cdd', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-07 11:34:38', '2022-10-07 11:34:38', '2023-10-07 11:34:38'),
('9e5c195222b5d50b0665c4011d08f3d3b6d0ee99f446dc8296b254796e7498d400db883ca486ff90', 49, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-01 17:29:48', '2022-10-01 17:29:48', '2023-10-01 17:29:48'),
('9edc0d030444878a37d2ab1c94ce360d46d8c946d72327c624ccd230bdaaa730e821a80b8573ba2a', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-01 02:49:52', '2022-09-01 02:49:52', '2023-09-01 02:49:52'),
('9ff0f29f843012e7436fa66c43efce8acaa4a204b1f91d58c732ee19069273fc63e6e46e1c974906', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-21 19:07:27', '2022-09-21 19:07:27', '2023-09-21 19:07:27'),
('a092dc4a49ec27a06d8c9c335446de3d90e03363c6059cdf6fbf2113edaab5fe752053a794ac9236', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-08 10:12:49', '2021-08-08 10:12:49', '2022-08-08 16:12:49'),
('a0af82ea6292e62f4c614a4f6325105e835f2d9522d8a6f553672915f0e04970d07f8b38ff8712a7', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-01 02:59:31', '2022-09-01 02:59:31', '2023-09-01 02:59:31'),
('a10568eebd9a4bb0fb471b16e1b52cf85f50dcbbe911e844d2c998aeb793edc83e82587e7fdf972e', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-26 01:06:04', '2022-08-26 01:06:04', '2023-08-26 01:06:04'),
('a30ed5cba3c89d8e3e2ea6500832b2509299ee3c5ce36385e5809911314f9d6ace032691d9e0fa52', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-20 21:11:07', '2022-07-20 21:11:07', '2023-07-20 22:11:07'),
('a351c7577e3dcb1a907bf60e4ced696a7b30faa65bcee0f4007edd60fc9bfd0d331f8100ad3acff5', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-08 06:47:44', '2022-07-08 06:47:44', '2023-07-08 07:47:44'),
('a39d2c145a25cafbda8e42f40e77e58cfb8760cc4b0040de91d5f053986aeeedb146047fd2ec4229', 25, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-01-12 11:06:32', '2023-01-12 11:06:32', '2024-01-12 11:06:32'),
('a3ad71223a1c4ec950a95ea98ec27ea748310cac5c8eb2bbb6ae1d69e1a307b696ecf29700d89dba', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 15:00:40', '2022-10-06 15:00:40', '2023-10-06 15:00:40'),
('a3b88f8244218db1fd5c73776a1ea3f16b99059722991ad15c98ae994956a88d8f32b2c52aefc868', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-06 22:56:21', '2022-09-06 22:56:21', '2023-09-06 22:56:21'),
('a58f2eac5ea1138ea7d086f6a955c2a8768d4d663d9bb3064bf6a1ee949631bc39e621cfcaa213ad', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-07 22:01:28', '2022-10-07 22:01:28', '2023-10-07 22:01:28'),
('a5c4cd4c23cc1addb6d76fcf00482af25c06334af9e332496f04d7334bc7729e3415bc25efc353c4', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-04 00:33:47', '2022-08-04 00:33:47', '2023-08-04 01:33:47'),
('a5d5c20be85bb8fcf65f5332fb9475f84a2d038bef0c5380f8a6fb8f271f87e51a0005126c3168a3', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-10 10:56:00', '2022-10-10 10:56:00', '2023-10-10 10:56:00'),
('a6f573fbd203c9aa5a8e7205ebd250c69e9db5c2afe4ddf15bfd6b9b8001256770b00810738ee515', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-07 12:24:40', '2022-07-07 12:24:40', '2023-07-07 13:24:40'),
('a72c6dd5ed70dca95c2535d8322ac799351cb5345cea277a62c5466bfc80f48b58ed23f918e9e85b', 25, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-01-12 12:33:43', '2023-01-12 12:33:43', '2024-01-12 12:33:43'),
('ab12b90e931c7b656359b6cc2b34562d748ac18314c2cbec108ffcf061623a6d529547056ab32763', 19, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-01 02:55:30', '2022-09-01 02:55:30', '2023-09-01 02:55:30'),
('ab61b61ead58805d95052c96abaad61c663a9632f68b2a3e518c6403765f73e8199a09f298f91e72', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-21 16:18:11', '2022-09-21 16:18:11', '2023-09-21 16:18:11'),
('ab70f83d038ff4aae0a2e6620157313d5ce272fcba94834a29901fe8250ffaefd931c978bbe0bdfd', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-09 16:26:06', '2022-08-09 16:26:06', '2023-08-09 17:26:06'),
('ac5a82fec1437842d52200246165e2bbba217758baf6a68448cdb4d582602eda4bfdc691e40c5603', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-17 03:51:34', '2022-08-17 03:51:34', '2023-08-17 03:51:34'),
('acb5c76c34c475e3c77d57e58dd3c21ecef49f96a42c7f55dc092e089d5236870e469224596c7064', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-26 15:13:18', '2022-09-26 15:13:18', '2023-09-26 15:13:18'),
('adf5232edfc450067970a8a73f26477982a27a509dfeb72d2062c999740e1c8ca027ead6b50c3d55', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 16:18:50', '2022-09-28 16:18:50', '2023-09-28 16:18:50'),
('ae07d36d23ebb1bcc96ad92963768c085a075fb5b55b2d872b044c51f43f54f67fb65f573a3dcf36', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 17:10:36', '2022-09-28 17:10:36', '2023-09-28 17:10:36'),
('ae63234241fff7fbd251485cba5dab800e59cf0bc5584ae459f247d299b764e1e4f4cd50352b2763', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-28 21:48:49', '2022-08-28 21:48:49', '2023-08-28 21:48:49'),
('aee2b8dfb5db80b493e863f431a36de865491249b81a24fccdb36ddd8bd7533f043814fa6c808f6d', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 15:49:49', '2022-09-28 15:49:49', '2023-09-28 15:49:49'),
('b031cb99096120c12db20f890102d939d9222babc1166339c317d6ffa56243bc73d1d894eb1f8d92', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-04 19:07:28', '2022-10-04 19:07:28', '2023-10-04 19:07:28'),
('b0e546b6c188dc9f03050a1f5f118b42c7174b8905d7966751f96797ead6ca9b69f7aa1f38db3e56', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 17:04:31', '2022-09-28 17:04:31', '2023-09-28 17:04:31'),
('b152b11ff4bfef29bf5ae85485d7be679d55d1796a1832ec8d1f6212fced663fc7ece9517e1e88ec', 54, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 14:51:05', '2022-10-06 14:51:05', '2023-10-06 14:51:05'),
('b3befe8198e1046520506cb5d3a43a05b7e410602805739f33b1c83567be60d1bd6faefd0baf01a6', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 16:48:53', '2022-09-28 16:48:53', '2023-09-28 16:48:53'),
('b40d80332ac639220c46efbe134b87a966475c5c80eb36cdcbec0291fbdc69dc4d7537e349b46155', 22, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-08 01:09:20', '2022-09-08 01:09:20', '2023-09-08 01:09:20'),
('b438ff111a6bdb35061fa2fdbce71311ff914f97f4eba421d1aacadf3fdaf88675d1a7fa3e7aa45d', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 17:14:08', '2022-09-28 17:14:08', '2023-09-28 17:14:08'),
('b4651c7e8bbe8a68b4959504c3a7e3705208cbdb79fcc2498b9b3d0efa9c7cadc77699590cf8f2d4', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-20 03:59:46', '2021-06-20 03:59:46', '2022-06-20 09:59:46'),
('b4b713cd957acc74e41232dd74b3caf89f727ac5ffa0dce601244ecae361881683fe38356bfccb18', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-07 12:20:51', '2022-07-07 12:20:51', '2023-07-07 13:20:51'),
('b5185c44d16fd039cfd84bc4b0c23a71f522e1b13728648268d06b440ff69de4c09c724bfe926686', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-03 22:09:58', '2022-10-03 22:09:58', '2023-10-03 22:09:58'),
('b6923a36f51db1f9aacb674935dbd3bc04dcf2a8635afc696e9d8fc559f8be05c127333063116036', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2023-01-11 11:50:57', '2023-01-11 11:50:57', '2024-01-11 11:50:57'),
('b6dd609d3c89344b321cefe87dfb9a9039ebc96b21e370cbd58010f88c41ecec2d8d1a25127fa562', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 15:00:36', '2022-10-06 15:00:36', '2023-10-06 15:00:36'),
('b8f4856eea6f38e8903bb17a0e1cbdd37be90dcf6a244dab24a6dca1cabd69ba80c645ce9f71cfab', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 13:56:59', '2022-10-06 13:56:59', '2023-10-06 13:56:59'),
('b93fd9b4c08c074b3565a6f90caeee002f67a40a34854343397ee19f87c876124021dd46edb86858', 36, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-21 12:28:25', '2022-09-21 12:28:25', '2023-09-21 12:28:25'),
('bb830d333a633b157c6585304460acffcc474698c09aa6d5c253d4c551b21b66ba63301d44a3d431', 57, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-01-11 18:09:50', '2023-01-11 18:09:50', '2024-01-11 18:09:50'),
('bc017b352234bf56e889103faf643f23c9cb86bc7a105c7d123131ed19970fd1200a6645abb37933', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-26 12:16:42', '2022-09-26 12:16:42', '2023-09-26 12:16:42'),
('bf156c6617c02260b89bc36be5f9ab1e9d17cc554092bb029730fffc959934cb7f6957e0d18e429e', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-26 01:05:12', '2022-08-26 01:05:12', '2023-08-26 01:05:12'),
('bf24e16194d82c4e2982724df0fef68f7923d6d01ce8c5e1b64e2716d2412db6e62891f0f8dae8a6', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-31 08:34:19', '2021-07-31 08:34:19', '2022-07-31 14:34:19'),
('bf4c101ffafbf8a370402dc51b8686013986a1053478320c9262b31d9da4562b66efacfbd83dd81d', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-21 15:10:27', '2022-09-21 15:10:27', '2023-09-21 15:10:27'),
('bfd180afe3de35f4664f081020a9c8cff028500ff5a6e809b70fdcf3c8509e88dfa48b46aff348f7', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-19 02:47:20', '2022-08-19 02:47:20', '2023-08-19 02:47:20'),
('c05973e74a68a14af03795d8125015ac9f2a12b2240a15a88b53d28f77b0913d1c91f73cad7bea5c', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-03 16:01:00', '2022-10-03 16:01:00', '2023-10-03 16:01:00'),
('c0d3a47f87be3a4ccb52db5e73d22798e1f5fe8bd75aa3f99c899193ab7bce6e1f879fb5d1601946', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-15 15:48:23', '2022-09-15 15:48:23', '2023-09-15 15:48:23'),
('c1b7df78e7373f5eca5f64083ac9bbc6c9bd582adf6c143f520c8a65420d3ee050044e6f65f0a033', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-24 03:40:43', '2021-06-24 03:40:43', '2022-06-24 09:40:43'),
('c4ba0d6c35751f69b36fdda235e90400ff804d1beb13c67410369a5f9aade64880fe0a107273ed05', 59, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 15:25:10', '2022-10-06 15:25:10', '2023-10-06 15:25:10'),
('c516208647c30b60bd5cf33bc402dbdc482fe8d088f104ea1300acc2e5abdd5f153ab57e61858f4b', 46, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-01 15:03:21', '2022-10-01 15:03:21', '2023-10-01 15:03:21'),
('c725e0388cf803f3824e2990ace0f660499ad930bde627de143a268c3f594b43f4c3b7d49d7d43f5', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-07 02:12:30', '2022-09-07 02:12:30', '2023-09-07 02:12:30'),
('c72f864ba63ac6875cdd7e5481da83835f8bb8274d607bea762b3c47df3ef477d400a03516d62543', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-07 15:35:40', '2022-10-07 15:35:40', '2023-10-07 15:35:40'),
('c78673e8dfbfcc60c9d3eebbd47bb71ce99d4d1316e0813e73b06aa811e55af7cdb840b8de51b0dd', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-01 02:34:18', '2022-09-01 02:34:18', '2023-09-01 02:34:18'),
('c7c4d85a4d883b15b252ffbec4a6a9def1685f62aa605aa506e03272b7e07924be11a0bccd4474a2', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-08 07:09:12', '2022-07-08 07:09:12', '2023-07-08 08:09:12'),
('c826248bb2823b64525a2ac0d78b0be57c3a3d678dd8e728e905b7742130d249857169fd7a7fb554', 48, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-01 15:05:11', '2022-10-01 15:05:11', '2023-10-01 15:05:11'),
('ca1c56973b5d51fbe10b379b4900116128d7ac9d7c007bb5e595dc016e49268c7f2fe606b584b020', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-07 21:31:18', '2022-10-07 21:31:18', '2023-10-07 21:31:18'),
('cbb66eaa08814b4c69db5b82745c5086dc26d8e497673a65084ac99badd14d934df50edc9394f712', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2023-01-10 10:08:46', '2023-01-10 10:08:46', '2024-01-10 10:08:46'),
('cd5261b1eb484e0e31606b145837a60afd8ade31288b6406919a7dbe4e84571b96d59e6a5b57085b', 25, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-03 10:43:58', '2022-11-03 10:43:58', '2023-11-03 10:43:58'),
('ce1f21c7072eb9783b4a0bd545b18e4d8e150229a0496a27cf161b54c55d02818ab0d32bac49f4b7', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-08 13:35:38', '2022-07-08 13:35:38', '2023-07-08 14:35:38'),
('cf1fc25183258e95145205a3be629f48882e64f93fdc4afbd4442647d699e1ff84bac88529d11757', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-21 13:29:35', '2022-09-21 13:29:35', '2023-09-21 13:29:35'),
('d09ecc136386c8e1ba185006768d2f2cee178f69a735c1b25ea4f85d6d332aace5b5b7993cb1a3a4', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2023-01-11 12:11:13', '2023-01-11 12:11:13', '2024-01-11 12:11:13'),
('d1c7b72be2478f261a39eab7c1aa50f09323db1de68aa6f1742696eb1b12b90170a2f45bb6fd7a55', 25, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-01-11 18:04:25', '2023-01-11 18:04:25', '2024-01-11 18:04:25'),
('d1d8a5e728f95c74aa7eac4a8b9518f6fc3a7b61e5cbc365ee11f48c6d63c4fd3f744900ff4ff54c', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-07 12:37:55', '2022-07-07 12:37:55', '2023-07-07 13:37:55'),
('d2ae63decdb87695b1b6af42a7e73c0e1030edd4f7e9e394a9b6473befbc46fa73dcc01e60d1db37', 26, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-14 00:56:02', '2022-09-14 00:56:02', '2023-09-14 00:56:02'),
('d3e03fcedc660f4efb459667509d1d9c5cee2424e0620b48c8c5bff6dbbdebd2340fe75e507f0d88', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-29 06:05:34', '2022-08-29 06:05:34', '2023-08-29 06:05:34'),
('d40a064749dbf4b1c6d65d760945db82a6cb1bcd0c0301558f050baa6d1563e05bd1afcc6bae0f77', 30, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-16 15:06:18', '2022-09-16 15:06:18', '2023-09-16 15:06:18'),
('d4a701c3dc9c3ac9254371adf12365f64fa5a48f3693c3030f52d290b2fc88effc6f1db6c596d2be', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-03 20:37:51', '2022-10-03 20:37:51', '2023-10-03 20:37:51'),
('d4b374e77d4318bc8c9c8f3ca227043978b54cb2e4fd790f6641e00dd6216fd6b7e9d3bc252cf8cb', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 16:36:35', '2022-09-28 16:36:35', '2023-09-28 16:36:35'),
('d54a925613e93785ea84bf35b9a0936774a29f46d0eceeedc8ec54330b1527b23918e2fbfb3b8e16', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-07 12:20:23', '2022-07-07 12:20:23', '2023-07-07 13:20:23'),
('d60590e4f28e4e7b8ea23df60a1b802ee01a42ee8db7824e3b8baa672f9eef146fab9dd3ac4da22a', 24, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-12 08:49:01', '2022-09-12 08:49:01', '2023-09-12 08:49:01'),
('da74766a2ac6e05f4efb6581f7c9af78ea28789ff8a7df7b0e97d7d835d080a71aedb44d357ce625', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-20 16:39:08', '2022-09-20 16:39:08', '2023-09-20 16:39:08'),
('daf6efc92ae4c89f9c5653231ffdd11c8a8b10c19b5239cd710704d2e1093d71a1ef4870fee7530f', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 13:06:56', '2022-10-06 13:06:56', '2023-10-06 13:06:56'),
('dbd0bfc19ed054e1d5d834b8d26ffaa946c92fae3a8f28aa45dcfcb480a8724ef6463f8812ef2142', 60, 1, 'RestaurantCustomerAuth', '[]', 0, '2023-01-11 11:56:28', '2023-01-11 11:56:28', '2024-01-11 11:56:28'),
('dc28cc2d0f7e0069882768411f57b8f7b1df00d23f730e6bc8e82403df50e6f9db9c3883ce09ae3e', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-07 13:56:07', '2022-10-07 13:56:07', '2023-10-07 13:56:07'),
('dd6578c99fc90f666b9433871d28f9913fefc860d9a60427388cfcf727be6f5c10eb8b764b39c557', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-28 10:20:50', '2021-06-28 10:20:50', '2022-06-28 16:20:50'),
('deb7354b13a7fca9f73627c4d1c5eacc480f2ae42788e5a94edba6bffe21387b7e80b985f894fa81', 17, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-26 01:07:26', '2022-08-26 01:07:26', '2023-08-26 01:07:26'),
('deeecbcda36e7d3eaea26f9b8ff1e8ed9987d7a7f1c7205a5081f7837796076a711b931ec96b875e', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-27 15:45:31', '2022-09-27 15:45:31', '2023-09-27 15:45:31'),
('dfceb701c4629a7dfadff7c2b7b31c37c08b027ca6bf57d74bb2c5bfcfe30644f26604a413992d14', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-04 12:06:35', '2022-10-04 12:06:35', '2023-10-04 12:06:35'),
('e114486b34f77246208101fa8d0d665acd9cd319f0a55509d0b1c6e9fa1676640776139e98cde3af', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-06 19:48:20', '2022-09-06 19:48:20', '2023-09-06 19:48:20'),
('e18fc0d3cfd7eca3ecf4fe35a2394620fce2301ad7ffaa28777f68fbbef8c306506a56df891a07d7', 47, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-01 15:03:39', '2022-10-01 15:03:39', '2023-10-01 15:03:39'),
('e355e05ad68447020879aa5472f283c6012a69bf0ac6fe093ac20325daa506f8ce6edb05b6d0af0f', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-11 18:36:36', '2022-10-11 18:36:36', '2023-10-11 18:36:36'),
('e53856c8602176558b6e610ea365d53aaa1bfb8f1145f26547aa9e0381e963ea1d351c77d591718a', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-07 12:33:10', '2022-07-07 12:33:10', '2023-07-07 13:33:10'),
('e5721de5b11c90d9a3db14f0eaf1fb12e7f4b5eb6a0d0d0ab96552fa114d551ec9099bf51fd994ff', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-02 20:52:57', '2022-09-02 20:52:57', '2023-09-02 20:52:57'),
('e6182508ac9577eb9270dd7ddaaa51582ddce5eeba15d30b0091e1bf2fe5d5bbf0f9acec663c1dad', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-26 15:17:15', '2022-09-26 15:17:15', '2023-09-26 15:17:15'),
('e79fd296e2054e90eec4e8da34350ca77bc263ad725a9612b292ee4cc996273163570f6a9cdb7f3b', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-22 11:19:42', '2022-09-22 11:19:42', '2023-09-22 11:19:42'),
('e7cbe7e46b04bfccbb192d0833bfabbe16521f7d8eb202370845cd6ed117f98ceffa1320aada36e8', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-16 23:22:16', '2022-08-16 23:22:16', '2023-08-16 23:22:16'),
('e831294d1ff84094e51a92e222d11af4c20f46868eec57c22a3cb86bc0ad0d834ead78d0d6ea8938', 38, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 16:04:18', '2022-09-28 16:04:18', '2023-09-28 16:04:18');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('e9fe331125ee7a6421405bb042af9b02775614df154cd310d41eff2ec2e41339aee2e9f37bdf3bea', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-11 04:33:08', '2022-07-11 04:33:08', '2023-07-11 05:33:08'),
('ea3ca170bd7935fe3f2a9c80c74d1e8e6eda8cc197ce2066305a286d175ad250475a4657e498779b', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-21 01:24:25', '2021-06-21 01:24:25', '2022-06-21 07:24:25'),
('eac621f6b08067d24a9a76e542654f9f7a7ba727124fa3ff5bfb8826ccf8cffc64428200d45e18b1', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-11 04:34:15', '2022-07-11 04:34:15', '2023-07-11 05:34:15'),
('ec3a86a2195b39d95ea3afa5f5aae70125871a175ea6a03a887d64e88732bcf6338532851627e4ea', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-16 23:12:45', '2022-08-16 23:12:45', '2023-08-16 23:12:45'),
('ec886d519bc3f69dee9ca4d63d30c3d3e6afc239206c0959e5835583e7be5075f071ac4a5e244cb3', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 15:52:27', '2022-09-28 15:52:27', '2023-09-28 15:52:27'),
('eebd6072ef57285abce42c30de691b2410764a2129b261ff4ce7c9b62fcec10b70a72d8fe2f7d7fc', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-07 14:00:36', '2022-10-07 14:00:36', '2023-10-07 14:00:36'),
('eed6eb903da906c37928c83166157fc9c3cdb115c14c774b29e0dfc53a1be4b597134d5c5fe15855', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-30 22:24:09', '2022-09-30 22:24:09', '2023-09-30 22:24:09'),
('eee2b7648b88569d1330fb6bda40fbb8d01225e231ac1ff5d6b0d1bb79c029a3a62965b0e82dbc23', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-08 15:06:01', '2022-10-08 15:06:01', '2023-10-08 15:06:01'),
('ef7f276677aef23797ec506d1de76efde4e9800bdc259d2b57fd94f7fe37e6bcb1aaa17aef72fa79', 58, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 15:20:31', '2022-10-06 15:20:31', '2023-10-06 15:20:31'),
('ef851af3c88d1aa7e4840fff82ee62efdcf39a8b629ba20d7bfb0467b1d748bf5496cf6f7c8fa7da', 13, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-17 00:18:47', '2022-08-17 00:18:47', '2023-08-17 00:18:47'),
('f03b23d923ffcdbfd3ded3e1ba5181f265356b77ee8637db7895f940962904096a0c977c3a670530', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-07 14:10:27', '2022-10-07 14:10:27', '2023-10-07 14:10:27'),
('f0f7add615b4c086f32df235e448a737f67dad7a67942bc082babd6232a9e4ac789433f798bbf34b', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-17 02:25:10', '2022-08-17 02:25:10', '2023-08-17 02:25:10'),
('f39cb08ce3ff0f170a2d18bcea8cd2f24f421421d0c59590e42f55355f4c020bfa9a9365baca44d2', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 17:27:53', '2022-09-28 17:27:53', '2023-09-28 17:27:53'),
('f4711b1ab595749b21023c54850ee04e56bd69c6ee59ba7d0e9b2124236869844182f29140513b01', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-07 01:46:15', '2022-09-07 01:46:15', '2023-09-07 01:46:15'),
('f4cd8fbfcc4b04ae4f76f4c63763456cb393182c054c7bf0726aa39ab5dfb103fe509944e5d486ff', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 16:36:30', '2022-09-28 16:36:30', '2023-09-28 16:36:30'),
('f6ba1ba70c348936696100f6371db33d0d5d4cce31c134e00b5b93911a47aeb8aecdf5dd2b28370f', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-23 23:46:38', '2022-07-23 23:46:38', '2023-07-24 00:46:38'),
('f72bd9073433ea7e93f3db62eb3aacd57d1facf0cd975bcb918e2650868d6ba707ad088fd5d100e8', 25, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-01-11 18:24:44', '2023-01-11 18:24:44', '2024-01-11 18:24:44'),
('f7cc7bca675c5258bc5109fcdea43111cc3919c0fa62e901df7c8f195c49a52b7eb2ee1201c12a9c', 58, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 15:19:51', '2022-10-06 15:19:51', '2023-10-06 15:19:51'),
('f7d9b117745766b7e4a2790a0b2d6cc9a5d95f74f3b6f04f29875e44aaceb738da0e588872da69ad', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-07 12:53:32', '2022-07-07 12:53:32', '2023-07-07 13:53:32'),
('f7ed5bd69ef6c1f8c9c6c94647e0d9d5660fa6ea5ddba511953ec21b875c5f798a96d3dfbbdf57a5', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-28 16:06:32', '2022-09-28 16:06:32', '2023-09-28 16:06:32'),
('f8881862203fd251afae5d9defc0e831133fdb2c93671907f377340fe7b25a4db83b43a01502ee92', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-14 18:26:48', '2022-11-14 18:26:48', '2023-11-14 18:26:48'),
('f94162ca459d03930d8f9bb36f3901449f3a54bb3ca6104a28759098b4ce35b73956c45cf64bf924', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 13:50:43', '2022-10-06 13:50:43', '2023-10-06 13:50:43'),
('f9dfc70b1d63fbc7818626ff0f0ba193e20b0c28b738fa7ab0d3509d3cd6d07c0c93a07c96702b87', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-15 11:18:02', '2022-09-15 11:18:02', '2023-09-15 11:18:02'),
('fa0c3afbbb534faa9a181765e7b4554f0762d8be9664d9ca0d0bea1c47abc4e64c1496b51bf98c07', 47, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 15:05:46', '2022-10-06 15:05:46', '2023-10-06 15:05:46'),
('fbcf3049ca430884e2f7492ed6fcd910526d51a9882e4bc4d7863185657deccf513135626c521074', 25, 1, 'RestaurantCustomerAuth', '[]', 0, '2023-01-11 16:37:37', '2023-01-11 16:37:37', '2024-01-11 16:37:37'),
('fdc52bbf4d43a02898b408cdd90b9a679d4490f3f4ca7d7f7bbfecc84a3e97f2060e001a3d2ab1de', 27, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-01-12 10:50:09', '2023-01-12 10:50:09', '2024-01-12 10:50:09'),
('fe0b9dccda98d796ac909bd25bf1a02b6dfec5405c1d8ff6c580ce35f02876a9d86a6a9b68a38be4', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-01 18:52:49', '2022-10-01 18:52:49', '2023-10-01 18:52:49');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'qFAwGhxq8A6SDmolyxZunXyQ4mxOH0jEezXsgaxP', NULL, 'http://localhost', 1, 0, 0, '2021-06-19 03:27:59', '2021-06-19 03:27:59'),
(2, NULL, 'Laravel Password Grant Client', 'qdV021R3MGGAwRxvvqG0mWgnypwzolzusBq1L5W6', 'users', 'http://localhost', 0, 1, 0, '2021-06-19 03:27:59', '2021-06-19 03:27:59'),
(3, NULL, 'stackfood1662202680 Personal Access Client', 'IUhJ6TGVXSExDqrmRPRGyFnWnlIJNyLcl51kKEu9', NULL, 'http://localhost', 1, 0, 0, '2023-01-11 18:00:14', '2023-01-11 18:00:14'),
(4, NULL, 'stackfood1662202680 Password Grant Client', 'M5zMG0n4YirgiIlFp099nRhYawQWcQAP7Qzr84sK', 'users', 'http://localhost', 0, 1, 0, '2023-01-11 18:00:14', '2023-01-11 18:00:14');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-06-19 03:27:59', '2021-06-19 03:27:59'),
(2, 3, '2023-01-11 18:00:14', '2023-01-11 18:00:14');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `restaurant_id` bigint(20) DEFAULT NULL,
  `order_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `wallet_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `coupon_discount_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `coupon_discount_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total_tax_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_reference` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivery',
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `due_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule_at` timestamp NULL DEFAULT NULL,
  `callback` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pending` timestamp NULL DEFAULT NULL,
  `accepted` timestamp NULL DEFAULT NULL,
  `confirmed` timestamp NULL DEFAULT NULL,
  `processing` timestamp NULL DEFAULT NULL,
  `handover` timestamp NULL DEFAULT NULL,
  `picked_up` timestamp NULL DEFAULT NULL,
  `delivered` timestamp NULL DEFAULT NULL,
  `canceled` timestamp NULL DEFAULT NULL,
  `refund_requested` timestamp NULL DEFAULT NULL,
  `refunded` timestamp NULL DEFAULT NULL,
  `delivery_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduled` tinyint(1) NOT NULL DEFAULT 0,
  `restaurant_discount_amount` decimal(24,2) DEFAULT NULL,
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `failed` timestamp NULL DEFAULT NULL,
  `adjusment` decimal(24,2) NOT NULL DEFAULT 0.00,
  `edited` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `vendor_id`, `restaurant_id`, `order_amount`, `wallet_amount`, `coupon_discount_amount`, `coupon_discount_title`, `payment_status`, `order_status`, `total_tax_amount`, `payment_method`, `transaction_reference`, `delivery_address_id`, `delivery_man_id`, `coupon_code`, `order_note`, `order_type`, `checked`, `created_at`, `updated_at`, `delivery_charge`, `due_amount`, `payment_type`, `schedule_at`, `callback`, `otp`, `pending`, `accepted`, `confirmed`, `processing`, `handover`, `picked_up`, `delivered`, `canceled`, `refund_requested`, `refunded`, `delivery_address`, `scheduled`, `restaurant_discount_amount`, `original_delivery_charge`, `failed`, `adjusment`, `edited`) VALUES
(100001, 5, 1, NULL, '0.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'take_away', 1, '2022-07-20 21:19:08', '2022-10-08 14:15:25', '0.00', '0.00', NULL, '2022-07-20 21:19:07', NULL, '3378', '2022-07-20 21:19:08', NULL, '2022-09-21 19:55:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Test Test\",\"contact_person_number\":\"+919598324808\",\"address_type\":\"Delivery\",\"address\":null,\"longitude\":\"\",\"latitude\":\"\"}', 0, '0.00', '0.00', NULL, '0.00', 0),
(100002, 5, 1, NULL, '0.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'take_away', 1, '2022-07-20 21:32:07', '2022-10-08 14:15:25', '0.00', '0.00', NULL, '2022-07-20 21:32:07', NULL, '9134', '2022-07-20 21:32:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Test Test\",\"contact_person_number\":\"+919598324808\",\"address_type\":\"Delivery\",\"address\":null,\"longitude\":\"\",\"latitude\":\"\"}', 0, '0.00', '0.00', NULL, '0.00', 0),
(100003, 5, 1, NULL, '0.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'take_away', 1, '2022-07-20 21:32:14', '2022-10-08 14:15:25', '0.00', '0.00', NULL, '2022-07-20 21:32:14', NULL, '6593', '2022-07-20 21:32:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Test Test\",\"contact_person_number\":\"+919598324808\",\"address_type\":\"Delivery\",\"address\":null,\"longitude\":\"\",\"latitude\":\"\"}', 0, '0.00', '0.00', NULL, '0.00', 0),
(100004, 5, 1, NULL, '0.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-07-21 02:47:44', '2022-10-08 14:15:25', '0.00', '0.00', NULL, '2022-07-21 02:47:43', NULL, '1736', '2022-07-21 02:47:44', '2022-09-22 17:13:08', NULL, '2022-09-22 17:22:54', NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Test Test\",\"contact_person_number\":\"+919598324808\",\"address_type\":\"Delivery\",\"address\":\"eekejeeekkke\",\"longitude\":\"3.3242989723965\",\"latitude\":\"6.7300001629802\"}', 0, '0.00', '0.00', NULL, '0.00', 0),
(100005, 5, 1, NULL, '0.00', '0.00', '0.00', '', 'unpaid', 'confirmed', '0.00', 'cash_on_delivery', '123', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-07-21 02:48:00', '2022-09-21 19:48:59', '0.00', '0.00', NULL, '2022-07-21 02:48:00', NULL, '8665', '2022-07-21 02:48:00', NULL, '2022-09-21 19:48:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Test Test\",\"contact_person_number\":\"+919598324808\",\"address_type\":\"Delivery\",\"address\":\"eekejeeekkke\",\"longitude\":\"3.3242989723965\",\"latitude\":\"6.7300001629802\"}', 0, '0.00', '0.00', NULL, '0.00', 0),
(100006, 5, 1, NULL, '0.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-09 16:51:04', '2022-08-10 08:59:08', '0.00', '0.00', NULL, NULL, NULL, '9341', '2022-08-09 16:51:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Test Test\",\"contact_person_number\":\"+919598324808\",\"address_type\":\"Delivery\",\"address\":null,\"longitude\":\"\",\"latitude\":\"\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100007, 5, 1, NULL, '100.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-10 01:05:36', '2022-08-10 08:59:08', '0.00', '0.00', NULL, NULL, NULL, '6771', '2022-08-10 01:05:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":null,\"longitude\":\"134\",\"latitude\":\"33\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100008, 5, 1, NULL, '100.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-10 01:06:48', '2022-10-08 14:15:23', '0.00', '0.00', NULL, NULL, NULL, '4082', '2022-08-10 01:06:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":null,\"longitude\":\"134\",\"latitude\":\"33\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100009, 5, 1, NULL, '200.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-10 01:07:34', '2022-10-08 14:15:23', '0.00', '0.00', NULL, NULL, NULL, '7084', '2022-08-10 01:07:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":null,\"longitude\":\"134\",\"latitude\":\"33\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100010, 5, 1, NULL, '200.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-10 01:11:46', '2022-10-08 14:15:23', '0.00', '0.00', NULL, NULL, NULL, '1670', '2022-08-10 01:11:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":null,\"longitude\":\"134\",\"latitude\":\"33\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100011, 5, 1, NULL, '200.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-10 01:16:09', '2022-10-05 20:46:50', '0.00', '0.00', NULL, NULL, NULL, '8360', '2022-08-10 01:16:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":null,\"longitude\":\"134\",\"latitude\":\"33\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100012, 5, 1, NULL, '200.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-10 01:16:40', '2022-10-05 20:27:25', '0.00', '0.00', NULL, NULL, NULL, '5891', '2022-08-10 01:16:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":null,\"longitude\":\"134\",\"latitude\":\"33\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100013, 5, 1, NULL, '100.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-10 01:16:40', '2022-10-05 20:46:50', '0.00', '0.00', NULL, NULL, NULL, '1615', '2022-08-10 01:16:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":null,\"longitude\":\"134\",\"latitude\":\"33\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100014, 5, 7, NULL, '475.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-15 17:21:25', '2022-08-15 17:22:10', '0.00', '0.00', NULL, NULL, NULL, '2380', '2022-08-15 17:21:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Hyderabad, Telangana, India\",\"longitude\":\"78.48667111247778\",\"latitude\":\"17.385044044450193\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100015, 5, 7, NULL, '475.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'ssl_commerz_payment', 'FFOqy3-690', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-15 17:50:20', '2022-08-15 17:54:40', '0.00', '0.00', NULL, NULL, NULL, '5632', '2022-08-15 17:50:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Hyderabad, Telangana, India\",\"longitude\":\"78.48667111247778\",\"latitude\":\"17.385044044450193\"}', 0, NULL, '0.00', '2022-08-15 17:51:55', '0.00', 0),
(100016, 5, 5, NULL, '720.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-15 17:56:30', '2022-08-15 17:58:05', '0.00', '0.00', NULL, NULL, NULL, '1029', '2022-08-15 17:56:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Goa, India\",\"longitude\":\"\",\"latitude\":\"15.2993266502593\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100017, 5, 7, NULL, '475.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-15 18:04:41', '2022-08-15 18:04:51', '0.00', '0.00', NULL, NULL, NULL, '5244', '2022-08-15 18:04:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Hyderabad, Telangana, India\",\"longitude\":\"78.48667111247778\",\"latitude\":\"17.385044044450193\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100018, 5, 7, NULL, '475.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-15 18:22:56', '2022-08-15 18:24:49', '0.00', '0.00', NULL, NULL, NULL, '1158', '2022-08-15 18:22:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Hyderabad, Telangana, India\",\"longitude\":\"78.48667111247778\",\"latitude\":\"17.385044044450193\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100019, 5, 7, NULL, '725.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-15 19:49:43', '2022-08-15 19:50:20', '0.00', '0.00', NULL, NULL, NULL, '3916', '2022-08-15 19:49:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Hyderabad, Telangana, India\",\"longitude\":\"78.48667111247778\",\"latitude\":\"17.385044044450193\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100020, 5, 7, NULL, '725.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'ssl_commerz_payment', 'lDL1DK-715', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-15 19:56:45', '2022-08-15 19:57:04', '0.00', '0.00', NULL, NULL, NULL, '4173', '2022-08-15 19:56:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Hyderabad, Telangana, India\",\"longitude\":\"78.48667111247778\",\"latitude\":\"17.385044044450193\"}', 0, NULL, '0.00', '2022-08-15 19:56:56', '0.00', 0),
(100021, 5, 7, NULL, '250.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'cash_on_delivery', 'qctn4t-782', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-17 03:54:45', '2022-10-05 18:25:31', '0.00', '0.00', NULL, NULL, NULL, '5141', '2022-08-17 03:55:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958518\",\"latitude\":\"22.7286836\"}', 0, NULL, '0.00', '2022-08-17 03:55:12', '0.00', 0),
(100022, 5, 7, NULL, '250.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-17 06:35:31', '2022-08-17 13:21:15', '0.00', '0.00', NULL, NULL, NULL, '3386', '2022-08-17 06:35:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958501\",\"latitude\":\"22.728673\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100023, 5, 7, NULL, '250.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-18 05:12:43', '2022-10-04 18:57:06', '0.00', '0.00', NULL, NULL, NULL, '3117', '2022-08-18 05:12:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958501\",\"latitude\":\"22.728673\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100024, 5, 7, NULL, '250.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-18 22:49:41', '2022-10-04 18:57:06', '0.00', '0.00', NULL, NULL, NULL, '6800', '2022-08-18 22:57:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958501\",\"latitude\":\"22.728673\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100025, 5, 7, NULL, '250.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'cash_on_delivery', 'uk12b4-7', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-21 23:20:34', '2022-10-04 18:56:54', '0.00', '0.00', NULL, NULL, NULL, '5902', '2022-08-21 23:21:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.89584093540907\",\"latitude\":\"22.728673458875132\"}', 0, NULL, '0.00', '2022-08-21 23:21:19', '0.00', 0),
(100026, 5, 7, NULL, '250.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-22 00:05:45', '2022-10-04 18:56:54', '0.00', '0.00', NULL, NULL, NULL, '7381', '2022-08-22 00:07:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958514\",\"latitude\":\"22.7286854\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100027, 5, 7, NULL, '250.00', '0.00', '0.00', '', 'unpaid', 'canceled', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-22 00:31:13', '2022-09-06 20:48:47', '0.00', '0.00', NULL, NULL, NULL, '4176', '2022-08-22 00:32:43', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-06 20:48:47', NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958514\",\"latitude\":\"22.7286854\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100028, 5, 7, NULL, '475.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-22 00:33:25', '2022-08-22 00:33:56', '0.00', '0.00', NULL, NULL, NULL, '7572', '2022-08-22 00:33:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958514\",\"latitude\":\"22.7286854\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100029, 9, 7, NULL, '250.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-08-22 22:30:42', '2022-08-22 22:32:07', '0.00', '0.00', NULL, NULL, NULL, '3304', '2022-08-22 22:32:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958469\",\"latitude\":\"22.7286819\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100030, 5, 7, NULL, '475.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-01 23:29:46', '2022-09-01 23:31:08', '0.00', '0.00', NULL, NULL, NULL, '8766', '2022-09-01 23:29:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.89584093540907\",\"latitude\":\"22.728673458875132\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100031, 5, 7, NULL, '250.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'ssl_commerz_payment', 'WMY5B3-992', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-01 23:55:07', '2022-09-02 00:04:52', '0.00', '0.00', NULL, NULL, NULL, '6648', '2022-09-01 23:55:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.89584093540907\",\"latitude\":\"22.728673458875132\"}', 0, NULL, '0.00', '2022-09-01 23:57:27', '0.00', 0),
(100032, 5, 5, NULL, '720.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-01 23:56:48', '2022-09-02 00:04:52', '0.00', '0.00', NULL, NULL, NULL, '1072', '2022-09-01 23:56:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Goa, India\",\"longitude\":\"\",\"latitude\":\"15.2993266502593\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100033, 5, 7, NULL, '725.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'ssl_commerz_payment', 'OQE5qn-20', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-02 00:05:53', '2022-09-02 00:06:57', '0.00', '0.00', NULL, NULL, NULL, '3670', '2022-09-02 00:05:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.89584093540907\",\"latitude\":\"22.728673458875132\"}', 0, NULL, '0.00', '2022-09-02 00:06:57', '0.00', 0),
(100034, 20, 13, NULL, '90.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'cash_on_delivery', 'EA9KhI-129', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-03 02:42:45', '2022-09-03 02:44:54', '0.00', '0.00', NULL, NULL, NULL, '8511', '2022-09-03 02:44:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958337\",\"latitude\":\"22.7286809\"}', 0, NULL, '0.00', '2022-09-03 02:44:00', '0.00', 0),
(100035, 20, 13, NULL, '90.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-03 02:51:17', '2022-09-03 03:05:33', '0.00', '0.00', NULL, NULL, NULL, '6877', '2022-09-03 03:05:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958337\",\"latitude\":\"22.7286809\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100036, 20, 13, NULL, '90.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-03 03:07:39', '2022-09-03 03:08:01', '0.00', '0.00', NULL, NULL, NULL, '5009', '2022-09-03 03:08:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958337\",\"latitude\":\"22.7286809\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100037, 20, 13, NULL, '90.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-03 03:08:23', '2022-09-03 03:08:32', '0.00', '0.00', NULL, NULL, NULL, '1613', '2022-09-03 03:08:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958337\",\"latitude\":\"22.7286809\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100038, 5, 13, NULL, '90.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-06 17:15:13', '2022-09-06 17:16:29', '0.00', '0.00', NULL, NULL, NULL, '1753', '2022-09-06 17:15:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.89584093540907\",\"latitude\":\"22.728673458875132\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100039, 9, 12, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-07 01:27:18', '2022-09-07 01:28:47', '0.00', '0.00', NULL, NULL, NULL, '4479', '2022-09-07 01:28:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958367\",\"latitude\":\"22.72866\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100040, 9, 12, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-07 01:30:22', '2022-09-07 01:40:57', '0.00', '0.00', NULL, NULL, NULL, '9237', '2022-09-07 01:40:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958367\",\"latitude\":\"22.72866\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100041, 9, 12, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-07 02:38:29', '2022-09-07 02:43:37', '0.00', '0.00', NULL, NULL, NULL, '3528', '2022-09-07 02:39:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958367\",\"latitude\":\"22.72866\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100042, 21, 9, NULL, '1080.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-07 03:04:20', '2022-10-06 16:15:47', '0.00', '0.00', NULL, NULL, NULL, '1621', '2022-09-07 03:05:24', NULL, '2022-09-07 05:54:42', '2022-09-07 05:55:16', '2022-09-07 05:55:24', NULL, NULL, NULL, NULL, NULL, '{\"address\":\"1st Floor, DLF Mall of India, Sector 18, Noida, Uttar Pradesh 201301, India\",\"longitude\":\"77.3210335\",\"latitude\":\"28.5668131\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100043, 9, 9, NULL, '1080.00', '0.00', '0.00', '', 'unpaid', 'handover', '0.00', 'cash_on_delivery', 'iSHBRO-320', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-07 03:04:32', '2022-09-07 05:57:19', '0.00', '0.00', NULL, NULL, NULL, '5892', '2022-09-07 03:06:00', NULL, '2022-09-07 05:57:08', '2022-09-07 05:57:13', '2022-09-07 05:57:19', NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958367\",\"latitude\":\"22.72866\"}', 0, NULL, '0.00', '2022-09-07 03:04:44', '0.00', 0),
(100044, 9, 12, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-07 03:14:42', '2022-09-07 03:16:04', '0.00', '0.00', NULL, NULL, NULL, '9943', '2022-09-07 03:16:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958367\",\"latitude\":\"22.72866\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100045, 9, 9, NULL, '1080.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-07 03:19:57', '2022-09-07 03:20:24', '0.00', '0.00', NULL, NULL, NULL, '1598', '2022-09-07 03:19:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958367\",\"latitude\":\"22.72866\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100046, 9, 9, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-07 04:35:37', '2022-09-07 04:48:25', '0.00', '0.00', NULL, NULL, NULL, '7738', '2022-09-07 04:48:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958367\",\"latitude\":\"22.72866\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100047, 9, 12, NULL, '180.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-07 05:08:54', '2022-09-07 05:10:17', '0.00', '0.00', NULL, NULL, NULL, '9151', '2022-09-07 05:10:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958367\",\"latitude\":\"22.72866\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100048, 9, 10, NULL, '270.00', '0.00', '0.00', '', 'unpaid', 'confirmed', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-07 05:27:47', '2022-09-14 17:59:29', '0.00', '0.00', NULL, NULL, NULL, '4595', '2022-09-07 05:27:59', NULL, '2022-09-14 17:59:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958367\",\"latitude\":\"22.72866\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100049, 9, 9, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'handover', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-07 06:02:50', '2022-09-07 06:04:25', '0.00', '0.00', NULL, NULL, NULL, '9377', '2022-09-07 06:03:48', NULL, '2022-09-07 06:04:13', '2022-09-07 06:04:19', '2022-09-07 06:04:25', NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958367\",\"latitude\":\"22.72866\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100050, 9, 11, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'handover', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-07 22:50:45', '2022-09-07 22:55:13', '0.00', '0.00', NULL, NULL, NULL, '5385', '2022-09-07 22:54:18', NULL, '2022-09-07 22:54:54', '2022-09-07 22:55:06', '2022-09-07 22:55:13', NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958367\",\"latitude\":\"22.72866\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100051, 22, 9, NULL, '9.90', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-08 23:57:21', '2022-09-12 04:11:52', '0.00', '0.00', NULL, NULL, NULL, '5564', '2022-09-12 04:11:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.89583691209555\",\"latitude\":\"22.728666964830605\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100052, 21, 9, NULL, '9.90', '0.00', '0.00', '', 'unpaid', 'canceled', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-08 23:59:22', '2022-09-15 11:23:06', '0.00', '0.00', NULL, NULL, NULL, '4887', '2022-09-15 11:13:09', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-15 11:23:06', NULL, NULL, '{\"address\":\"B-127, Rama Park, Block A, Laxmi Vihar, Nawada, New Delhi, Delhi 110059, India\",\"longitude\":\"77.0387506\",\"latitude\":\"28.623057\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100053, 22, 9, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-08 23:59:54', '2022-09-09 00:04:02', '0.00', '0.00', NULL, NULL, NULL, '8470', '2022-09-08 23:59:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.89583691209555\",\"latitude\":\"22.728666964830605\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100054, 22, 9, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-09 00:05:12', '2022-09-09 00:06:03', '0.00', '0.00', NULL, NULL, NULL, '4295', '2022-09-09 00:06:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.89583691209555\",\"latitude\":\"22.728666964830605\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100055, 23, 14, NULL, '1.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-09 06:09:41', '2022-09-09 06:09:57', '0.00', '0.00', NULL, NULL, NULL, '3769', '2022-09-09 06:09:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772573947906\",\"latitude\":\"22.71956881492173\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100056, 23, 9, NULL, '1080.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-09 06:09:41', '2022-09-09 06:09:57', '0.00', '0.00', NULL, NULL, NULL, '3569', '2022-09-09 06:09:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772573947906\",\"latitude\":\"22.71956881492173\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100057, 23, 14, NULL, '100.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-09 06:16:14', '2022-09-09 06:17:07', '0.00', '0.00', NULL, NULL, NULL, '7478', '2022-09-09 06:16:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772573947906\",\"latitude\":\"22.71956881492173\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100058, 22, 14, NULL, '100.00', '0.00', '0.00', '', 'paid', 'handover', '0.00', 'razor_pay', 'pay_KFod0Y8BbFuFr3', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-09 06:16:14', '2022-09-09 06:22:50', '0.00', '0.00', NULL, NULL, NULL, '9783', '2022-09-09 06:16:14', NULL, '2022-09-09 06:19:19', '2022-09-09 06:22:00', '2022-09-09 06:22:50', NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.89583691209555\",\"latitude\":\"22.728666964830605\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100059, 22, 9, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-11 23:36:48', '2022-09-11 23:44:01', '0.00', '0.00', NULL, NULL, NULL, '8602', '2022-09-11 23:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.89583691209555\",\"latitude\":\"22.728666964830605\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100060, 21, 9, NULL, '9.90', '0.00', '0.00', '', 'unpaid', 'canceled', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-15 11:14:19', '2022-09-23 17:26:34', '0.00', '0.00', NULL, NULL, NULL, '1750', '2022-09-15 13:37:37', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-23 17:26:34', NULL, NULL, '{\"address\":\"S 99, Motilal Nehru Camp, Old JNU Campus, Munirka, New Delhi, Delhi 110067, India\",\"longitude\":\"77.1785316\",\"latitude\":\"28.5524446\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100061, 21, 9, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-15 11:51:54', '2022-09-15 11:58:20', '0.00', '0.00', NULL, NULL, NULL, '1107', '2022-09-15 11:51:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"S 99, Motilal Nehru Camp, Old JNU Campus, Munirka, New Delhi, Delhi 110067, India\",\"longitude\":\"77.1785316\",\"latitude\":\"28.5524446\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100062, 28, 9, NULL, '144.90', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-15 11:51:55', '2022-09-15 11:58:20', '0.00', '0.00', NULL, NULL, NULL, '6845', '2022-09-15 11:51:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.895832\",\"latitude\":\"22.7286936\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100063, 28, 11, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-15 12:00:51', '2022-09-15 12:14:54', '0.00', '0.00', NULL, NULL, NULL, '9949', '2022-09-15 12:01:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.895832\",\"latitude\":\"22.7286936\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100064, 28, 9, NULL, '135.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KI4yeSvvueNfI3', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-15 12:04:59', '2022-09-15 12:14:54', '0.00', '0.00', NULL, NULL, NULL, '7566', '2022-09-15 12:04:59', NULL, '2022-09-15 12:06:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.895832\",\"latitude\":\"22.7286936\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100065, 21, 9, NULL, '9.90', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KI5yGOF5lSswCx', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-15 13:04:07', '2022-09-15 13:08:11', '0.00', '0.00', NULL, NULL, NULL, '1657', '2022-09-15 13:04:07', NULL, '2022-09-15 13:04:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"S 99, Motilal Nehru Camp, Old JNU Campus, Munirka, New Delhi, Delhi 110067, India\",\"longitude\":\"77.1785316\",\"latitude\":\"28.5524446\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100066, 25, 9, NULL, '135.00', '0.00', '0.00', '', 'paid', 'canceled', '0.00', 'razor_pay', 'pay_KI6N8JhI2ddXki', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-15 13:23:10', '2022-11-03 13:53:29', '0.00', '0.00', NULL, NULL, NULL, '4009', '2022-09-15 13:23:10', NULL, '2022-09-15 13:29:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772573947906\",\"latitude\":\"22.71956881492173\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100067, 21, 10, NULL, '150.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KI85u4tiitk6zt', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-15 15:06:28', '2022-09-15 15:09:35', '0.00', '0.00', NULL, NULL, NULL, '9187', '2022-09-15 15:06:28', NULL, '2022-09-15 15:09:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"S 99, Motilal Nehru Camp, Old JNU Campus, Munirka, New Delhi, Delhi 110067, India\",\"longitude\":\"77.1785316\",\"latitude\":\"28.5524446\"}', 0, NULL, '0.00', '2022-09-15 15:06:37', '0.00', 0),
(100068, 21, 9, NULL, '9.90', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KI892FZYw98PkT', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-15 15:10:38', '2022-09-15 15:12:26', '0.00', '0.00', NULL, NULL, NULL, '9484', '2022-09-15 15:10:38', NULL, '2022-09-15 15:12:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"S 99, Motilal Nehru Camp, Old JNU Campus, Munirka, New Delhi, Delhi 110067, India\",\"longitude\":\"77.1785316\",\"latitude\":\"28.5524446\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100069, 29, 9, NULL, '135.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KI8tx4ntYSS8Em', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-15 15:55:42', '2022-09-15 15:58:59', '0.00', '0.00', NULL, NULL, NULL, '2514', '2022-09-15 15:55:42', NULL, '2022-09-15 15:56:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958293\",\"latitude\":\"22.7286872\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100070, 21, 9, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-15 16:10:40', '2022-09-15 16:12:57', '0.00', '0.00', NULL, NULL, NULL, '2961', '2022-09-15 16:10:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Unit No.F-166, Ground Floor, Plot No. M-03, Sector-18 Mall of, Sector 18, Noida, Uttar Pradesh 201301, India\",\"longitude\":\"77.32137\",\"latitude\":\"28.5671764\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100071, 29, 9, NULL, '135.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KI9BrBc6sJyS5D', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-15 16:11:52', '2022-09-15 16:14:36', '0.00', '0.00', NULL, NULL, NULL, '7546', '2022-09-15 16:11:52', NULL, '2022-09-15 16:14:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958293\",\"latitude\":\"22.7286872\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100072, 29, 9, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-15 16:15:43', '2022-09-15 16:16:25', '0.00', '0.00', NULL, NULL, NULL, '2930', '2022-09-15 16:15:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958293\",\"latitude\":\"22.7286872\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100073, 21, 9, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-15 16:16:16', '2022-09-15 16:16:25', '0.00', '0.00', NULL, NULL, NULL, '5602', '2022-09-15 16:16:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Unit No.F-166, Ground Floor, Plot No. M-03, Sector-18 Mall of, Sector 18, Noida, Uttar Pradesh 201301, India\",\"longitude\":\"77.32137\",\"latitude\":\"28.5671764\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100074, 29, 9, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-15 16:46:58', '2022-09-15 16:51:45', '0.00', '0.00', NULL, NULL, NULL, '1215', '2022-09-15 16:46:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958293\",\"latitude\":\"22.7286872\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100075, 25, 9, NULL, '135.00', '0.00', '0.00', '', 'paid', 'canceled', '0.00', 'razor_pay', 'pay_KIAIlA81UdLjc9', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-15 17:15:42', '2022-11-03 13:50:08', '0.00', '0.00', NULL, NULL, NULL, '7324', '2022-09-15 17:15:42', NULL, '2022-09-15 17:19:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772573947906\",\"latitude\":\"22.71956881492173\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100076, 25, 9, NULL, '135.00', '0.00', '0.00', '', 'paid', 'canceled', '0.00', 'razor_pay', 'pay_KIAOdN4QYnmxyi', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-15 17:23:30', '2022-11-03 13:45:46', '0.00', '0.00', NULL, NULL, NULL, '6944', '2022-09-15 17:23:30', NULL, '2022-09-15 17:24:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772573947906\",\"latitude\":\"22.71956881492173\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100077, 25, 9, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-15 17:45:04', '2022-09-16 13:57:04', '0.00', '0.00', NULL, NULL, NULL, '8805', '2022-09-15 17:45:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772573947906\",\"latitude\":\"22.71956881492173\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100078, 25, 9, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-15 17:56:45', '2022-09-16 13:57:04', '0.00', '0.00', NULL, NULL, NULL, '8552', '2022-09-15 17:56:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772573947906\",\"latitude\":\"22.71956881492173\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100079, 25, 9, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-15 18:10:14', '2022-09-16 13:57:04', '0.00', '0.00', NULL, NULL, NULL, '5818', '2022-09-15 18:10:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772573947906\",\"latitude\":\"22.71956881492173\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100080, 29, 9, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-16 11:32:20', '2022-09-16 13:57:04', '0.00', '0.00', NULL, NULL, NULL, '3402', '2022-09-16 11:32:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958293\",\"latitude\":\"22.7286872\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100081, 29, 9, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-16 11:33:53', '2022-09-16 13:57:04', '0.00', '0.00', NULL, NULL, NULL, '4955', '2022-09-16 11:33:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958293\",\"latitude\":\"22.7286872\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100082, 30, 9, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-16 15:19:50', '2022-09-16 15:21:31', '0.00', '0.00', NULL, NULL, NULL, '4817', '2022-09-16 15:19:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958269\",\"latitude\":\"22.7286902\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100083, 30, 9, NULL, '135.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-16 15:23:07', '2022-09-16 15:23:13', '0.00', '0.00', NULL, NULL, NULL, '6052', '2022-09-16 15:23:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958269\",\"latitude\":\"22.7286902\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100084, 30, 10, NULL, '270.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-17 13:17:17', '2022-09-17 13:24:10', '0.00', '0.00', NULL, NULL, NULL, '5365', '2022-09-17 13:17:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958269\",\"latitude\":\"22.7286902\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100085, 30, 13, NULL, '144.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-17 16:44:20', '2022-09-17 16:44:32', '0.00', '0.00', NULL, NULL, NULL, '6557', '2022-09-17 16:44:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958269\",\"latitude\":\"22.7286902\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100086, 34, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-20 16:10:35', '2022-09-20 16:17:38', '0.00', '0.00', NULL, NULL, NULL, '3880', '2022-09-20 16:10:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958288\",\"latitude\":\"22.7286896\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100087, 21, 10, NULL, '290.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KK8PHloQLHuD9S', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-20 16:44:53', '2022-09-20 17:37:32', '0.00', '0.00', NULL, NULL, NULL, '9534', '2022-09-20 16:44:53', NULL, '2022-09-20 16:45:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Parking lot, 852, Saraswatipuram, New Delhi, Delhi 110067, India\",\"longitude\":\"77.163435\",\"latitude\":\"28.5492087\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100088, 21, 10, NULL, '290.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KK8skm2MWUbRlk', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-20 17:13:05', '2022-09-20 17:37:32', '0.00', '0.00', NULL, NULL, NULL, '5213', '2022-09-20 17:13:05', NULL, '2022-09-20 17:13:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Parking lot, 852, Saraswatipuram, New Delhi, Delhi 110067, India\",\"longitude\":\"77.163435\",\"latitude\":\"28.5492087\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100089, 21, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-20 17:24:43', '2022-09-20 17:37:32', '0.00', '0.00', NULL, NULL, NULL, '5986', '2022-09-20 17:24:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Parking lot, 852, Saraswatipuram, New Delhi, Delhi 110067, India\",\"longitude\":\"77.163435\",\"latitude\":\"28.5492087\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100090, 35, 10, NULL, '290.00', '0.00', '0.00', '', 'paid', 'handover', '0.00', 'razor_pay', 'pay_KKA1CSI1r1hVmj', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-20 18:16:29', '2022-09-21 16:05:56', '0.00', '0.00', NULL, NULL, NULL, '9792', '2022-09-20 18:16:29', NULL, '2022-09-20 18:20:25', '2022-09-21 16:05:50', '2022-09-21 16:05:56', NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.89584\",\"latitude\":\"22.7286711\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100091, 35, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-20 18:26:05', '2022-09-20 18:33:51', '0.00', '0.00', NULL, NULL, NULL, '4641', '2022-09-20 18:26:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.89584\",\"latitude\":\"22.7286711\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100092, 35, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-20 18:28:04', '2022-09-20 18:33:51', '0.00', '0.00', NULL, NULL, NULL, '5540', '2022-09-20 18:28:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.89584\",\"latitude\":\"22.7286711\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100093, 36, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, '123', NULL, 'delivery', 1, '2022-09-21 12:35:19', '2022-09-21 13:05:00', '0.00', '0.00', NULL, NULL, NULL, '7706', '2022-09-21 12:35:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100094, 36, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, '123', NULL, 'delivery', 1, '2022-09-21 12:35:23', '2022-09-21 13:05:00', '0.00', '0.00', NULL, NULL, NULL, '1166', '2022-09-21 12:35:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100095, 36, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, '123', NULL, 'delivery', 1, '2022-09-21 12:35:28', '2022-09-21 13:05:00', '0.00', '0.00', NULL, NULL, NULL, '1550', '2022-09-21 12:35:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100096, 36, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, '123', NULL, 'delivery', 1, '2022-09-21 12:35:33', '2022-09-21 13:05:00', '0.00', '0.00', NULL, NULL, NULL, '9223', '2022-09-21 12:35:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0);
INSERT INTO `orders` (`id`, `user_id`, `vendor_id`, `restaurant_id`, `order_amount`, `wallet_amount`, `coupon_discount_amount`, `coupon_discount_title`, `payment_status`, `order_status`, `total_tax_amount`, `payment_method`, `transaction_reference`, `delivery_address_id`, `delivery_man_id`, `coupon_code`, `order_note`, `order_type`, `checked`, `created_at`, `updated_at`, `delivery_charge`, `due_amount`, `payment_type`, `schedule_at`, `callback`, `otp`, `pending`, `accepted`, `confirmed`, `processing`, `handover`, `picked_up`, `delivered`, `canceled`, `refund_requested`, `refunded`, `delivery_address`, `scheduled`, `restaurant_discount_amount`, `original_delivery_charge`, `failed`, `adjusment`, `edited`) VALUES
(100097, 36, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, '123', NULL, 'delivery', 1, '2022-09-21 12:35:48', '2022-09-21 13:05:00', '0.00', '0.00', NULL, NULL, NULL, '4512', '2022-09-21 12:35:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100098, 36, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, '123', NULL, 'delivery', 1, '2022-09-21 12:35:52', '2022-09-21 13:05:00', '0.00', '0.00', NULL, NULL, NULL, '9249', '2022-09-21 12:35:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100099, 36, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, '123', NULL, 'delivery', 1, '2022-09-21 12:37:14', '2022-09-21 13:05:00', '0.00', '0.00', NULL, NULL, NULL, '2999', '2022-09-21 12:37:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100100, 36, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, '123', NULL, 'delivery', 1, '2022-09-21 12:37:18', '2022-09-21 13:05:00', '0.00', '0.00', NULL, NULL, NULL, '6503', '2022-09-21 12:37:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100101, 36, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, '123', NULL, 'delivery', 1, '2022-09-21 12:38:01', '2022-09-21 13:05:00', '0.00', '0.00', NULL, NULL, NULL, '1635', '2022-09-21 12:38:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100102, 36, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, '123', NULL, 'delivery', 1, '2022-09-21 12:51:19', '2022-09-21 13:05:00', '0.00', '0.00', NULL, NULL, NULL, '3048', '2022-09-21 12:51:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100103, 36, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 12:52:34', '2022-09-21 13:05:00', '0.00', '0.00', NULL, NULL, NULL, '6274', '2022-09-21 12:52:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100104, 36, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 12:52:38', '2022-09-21 13:05:00', '0.00', '0.00', NULL, NULL, NULL, '3249', '2022-09-21 12:52:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100105, 36, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 12:52:49', '2022-09-21 13:05:00', '0.00', '0.00', NULL, NULL, NULL, '1899', '2022-09-21 12:52:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100106, 36, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 12:59:33', '2022-09-21 13:05:00', '0.00', '0.00', NULL, NULL, NULL, '5592', '2022-09-21 12:59:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100107, 31, 11, NULL, '180.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 13:09:19', '2022-09-21 13:12:51', '0.00', '0.00', NULL, NULL, NULL, '8803', '2022-09-21 13:09:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287988871336\",\"latitude\":\"20.593685577700327\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100108, 31, 11, NULL, '180.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 13:09:32', '2022-09-21 13:12:51', '0.00', '0.00', NULL, NULL, NULL, '9829', '2022-09-21 13:09:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287988871336\",\"latitude\":\"20.593685577700327\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100109, 31, 11, NULL, '180.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 13:09:38', '2022-09-21 13:12:51', '0.00', '0.00', NULL, NULL, NULL, '9375', '2022-09-21 13:09:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287988871336\",\"latitude\":\"20.593685577700327\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100110, 36, 11, NULL, '140.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 13:12:22', '2022-09-21 13:12:51', '0.00', '0.00', NULL, NULL, NULL, '9069', '2022-09-21 13:12:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100111, 36, 11, NULL, '140.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 13:22:04', '2022-09-21 13:23:21', '0.00', '0.00', NULL, NULL, NULL, '6081', '2022-09-21 13:22:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100112, 5, 10, NULL, '270.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 13:22:10', '2022-09-21 13:23:21', '0.00', '0.00', NULL, NULL, NULL, '3015', '2022-09-21 13:22:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.89584093540907\",\"latitude\":\"22.728673458875132\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100113, 36, 11, NULL, '140.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 13:25:16', '2022-09-21 15:41:12', '0.00', '0.00', NULL, NULL, NULL, '5338', '2022-09-21 13:25:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100114, 36, 11, NULL, '140.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 13:28:09', '2022-09-21 15:41:12', '0.00', '0.00', NULL, NULL, NULL, '9125', '2022-09-21 13:28:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100115, 36, 11, NULL, '140.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 13:42:57', '2022-09-21 15:41:12', '0.00', '0.00', NULL, NULL, NULL, '6281', '2022-09-21 13:42:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100116, 31, 11, NULL, '360.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 13:52:43', '2022-09-21 15:41:12', '0.00', '0.00', NULL, NULL, NULL, '6275', '2022-09-21 13:52:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287988871336\",\"latitude\":\"20.593685577700327\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100117, 31, 11, NULL, '360.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 13:54:26', '2022-09-21 15:41:12', '0.00', '0.00', NULL, NULL, NULL, '8776', '2022-09-21 13:54:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287988871336\",\"latitude\":\"20.593685577700327\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100118, 36, 11, NULL, '140.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 13:58:23', '2022-09-21 15:41:12', '0.00', '0.00', NULL, NULL, NULL, '6909', '2022-09-21 13:58:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100119, 36, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 14:04:36', '2022-09-21 15:41:12', '0.00', '0.00', NULL, NULL, NULL, '5402', '2022-09-21 14:04:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100120, 36, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 14:07:08', '2022-09-21 15:41:12', '0.00', '0.00', NULL, NULL, NULL, '2540', '2022-09-21 14:07:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100121, 31, 11, NULL, '180.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 14:10:00', '2022-09-21 15:41:12', '0.00', '0.00', NULL, NULL, NULL, '9440', '2022-09-21 14:10:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287988871336\",\"latitude\":\"20.593685577700327\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100122, 36, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 14:10:07', '2022-09-21 15:41:12', '0.00', '0.00', NULL, NULL, NULL, '2112', '2022-09-21 14:10:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100123, 36, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 14:15:57', '2022-09-21 15:41:12', '0.00', '0.00', NULL, NULL, NULL, '5950', '2022-09-21 14:15:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100124, 36, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 14:40:58', '2022-09-21 15:41:12', '0.00', '0.00', NULL, NULL, NULL, '4369', '2022-09-21 14:40:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100125, 36, 11, NULL, '140.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 14:41:23', '2022-09-21 15:41:12', '0.00', '0.00', NULL, NULL, NULL, '4726', '2022-09-21 14:41:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100126, 27, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 15:12:48', '2022-09-21 15:41:12', '0.00', '0.00', NULL, NULL, NULL, '2899', '2022-09-21 15:12:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958306\",\"latitude\":\"22.7286953\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100127, 27, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 15:39:17', '2022-09-21 15:41:12', '0.00', '0.00', NULL, NULL, NULL, '8199', '2022-09-21 15:39:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958306\",\"latitude\":\"22.7286953\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100128, 32, 10, NULL, '290.00', '0.00', '0.00', '', 'paid', 'handover', '0.00', 'razor_pay', 'pay_KKVzFCn0Clr1UJ', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 15:48:10', '2022-09-21 16:07:18', '0.00', '0.00', NULL, NULL, NULL, '2777', '2022-09-21 15:48:10', NULL, '2022-09-21 15:49:54', '2022-09-21 16:07:12', '2022-09-21 16:07:18', NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772439837456\",\"latitude\":\"22.71956881492173\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100129, 32, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 15:48:10', '2022-09-21 15:51:10', '0.00', '0.00', NULL, NULL, NULL, '1279', '2022-09-21 15:48:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772439837456\",\"latitude\":\"22.71956881492173\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100130, 32, 10, NULL, '180.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, '123', NULL, 'delivery', 1, '2022-09-21 15:59:50', '2022-09-21 16:05:33', '0.00', '0.00', NULL, NULL, NULL, '1675', '2022-09-21 15:59:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772439837456\",\"latitude\":\"22.71956881492173\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100131, 32, 10, NULL, '180.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KKWFFw8EslwQc8', NULL, NULL, '123', NULL, 'delivery', 1, '2022-09-21 16:02:44', '2022-09-21 16:05:33', '0.00', '0.00', NULL, NULL, NULL, '8101', '2022-09-21 16:02:44', NULL, '2022-09-21 16:05:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772439837456\",\"latitude\":\"22.71956881492173\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100132, 37, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 16:07:49', '2022-09-21 16:16:32', '0.00', '0.00', NULL, NULL, NULL, '5292', '2022-09-21 16:07:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.85772339254618\",\"latitude\":\"22.71956819640014\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100133, 32, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 16:40:31', '2022-09-21 16:43:33', '0.00', '0.00', NULL, NULL, NULL, '8867', '2022-09-21 16:40:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772439837456\",\"latitude\":\"22.71956881492173\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100134, 27, 10, NULL, '180.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KKYMVLUF57lIL7', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 18:07:18', '2022-09-21 18:09:15', '0.00', '0.00', NULL, NULL, NULL, '8886', '2022-09-21 18:07:18', NULL, '2022-09-21 18:09:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958306\",\"latitude\":\"22.7286953\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100135, 31, 11, NULL, '180.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 18:48:54', '2022-09-21 18:50:23', '0.00', '0.00', NULL, NULL, NULL, '6199', '2022-09-21 18:48:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287988871336\",\"latitude\":\"20.593685577700327\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100136, 37, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 19:09:27', '2022-09-21 19:09:56', '0.00', '0.00', NULL, NULL, NULL, '5400', '2022-09-21 19:09:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100137, 37, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 19:11:01', '2022-09-21 19:12:31', '0.00', '0.00', NULL, NULL, NULL, '2169', '2022-09-21 19:11:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100138, 37, 11, NULL, '190.00', '0.00', '0.00', '', 'paid', 'service_ongoing', '0.00', 'razor_pay', 'pay_KKZVFpYwDTp8vB', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 19:14:55', '2022-09-26 16:15:50', '0.00', '0.00', NULL, NULL, NULL, '3328', '2022-09-21 19:14:55', NULL, '2022-09-21 19:16:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100139, 37, 11, NULL, '190.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KKZZq74eIK50m4', NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 19:19:25', '2022-09-21 19:21:12', '0.00', '0.00', NULL, NULL, NULL, '6301', '2022-09-21 19:19:25', NULL, '2022-09-21 19:20:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100140, 5, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 19:35:43', '2022-10-04 18:56:48', '0.00', '0.00', NULL, NULL, NULL, '8876', '2022-09-21 19:35:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100141, 5, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, '2022-09-21 19:37:33', '2022-10-04 18:56:48', '0.00', '0.00', NULL, NULL, NULL, '5948', '2022-09-21 19:37:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100142, 37, 11, NULL, '380.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KKvndKe7G6yqkH', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 17:03:25', '2022-09-22 17:07:41', '0.00', '0.00', NULL, NULL, NULL, '5203', '2022-09-22 17:03:25', NULL, '2022-09-22 17:04:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100143, 37, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 17:03:25', '2022-09-22 17:07:41', '0.00', '0.00', NULL, NULL, NULL, '9097', '2022-09-22 17:03:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100144, 37, 10, NULL, '290.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KKvsaGP12B0w8O', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 17:08:42', '2022-09-22 17:11:10', '0.00', '0.00', NULL, NULL, NULL, '4621', '2022-09-22 17:08:42', NULL, '2022-09-22 17:09:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100145, 37, 13, NULL, '150.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 17:08:42', '2022-09-22 17:11:10', '0.00', '0.00', NULL, NULL, NULL, '5921', '2022-09-22 17:08:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100146, 37, 11, NULL, '190.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KKw94vT99FdyII', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 17:24:33', '2022-09-22 17:25:10', '0.00', '0.00', NULL, NULL, NULL, '9274', '2022-09-22 17:24:33', NULL, '2022-09-22 17:25:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958252\",\"latitude\":\"22.7286888\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100147, 37, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 17:24:33', '2022-09-22 17:24:47', '0.00', '0.00', NULL, NULL, NULL, '5932', '2022-09-22 17:24:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958252\",\"latitude\":\"22.7286888\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100148, 5, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 17:37:01', '2022-10-04 18:56:35', '0.00', '0.00', NULL, NULL, NULL, '6864', '2022-09-22 17:41:09', '2022-09-22 17:43:42', NULL, '2022-09-22 18:32:43', NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100149, 37, 11, NULL, '190.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KKwVFvlJmC9SQD', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 17:42:56', '2022-09-22 17:46:09', '0.00', '0.00', NULL, NULL, NULL, '3931', '2022-09-22 17:42:56', NULL, '2022-09-22 17:46:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100150, 37, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 17:42:56', '2022-09-22 17:44:45', '0.00', '0.00', NULL, NULL, NULL, '2556', '2022-09-22 17:42:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100151, 37, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 17:55:12', '2022-09-22 17:55:32', '0.00', '0.00', NULL, NULL, NULL, '2064', '2022-09-22 17:55:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100152, 37, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 17:55:12', '2022-09-22 17:55:32', '0.00', '0.00', NULL, NULL, NULL, '3169', '2022-09-22 17:55:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100153, 27, 11, NULL, '330.00', '0.00', '0.00', '', 'paid', 'delivered', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 18:24:49', '2022-09-29 18:19:17', '0.00', '0.00', NULL, NULL, NULL, '2785', '2022-09-22 18:24:49', '2022-09-22 18:25:39', NULL, '2022-09-22 18:29:03', NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958281\",\"latitude\":\"22.7286915\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100154, 27, 11, NULL, '330.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KKxIG255QpvfQM', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 18:28:04', '2022-09-22 18:32:33', '0.00', '0.00', NULL, NULL, NULL, '2421', '2022-09-22 18:28:04', NULL, '2022-09-22 18:32:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958281\",\"latitude\":\"22.7286915\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100155, 37, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 18:31:43', '2022-09-22 18:32:11', '0.00', '0.00', NULL, NULL, NULL, '2614', '2022-09-22 18:31:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772439837456\",\"latitude\":\"22.719570051964872\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100156, 37, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 18:31:43', '2022-09-22 18:32:11', '0.00', '0.00', NULL, NULL, NULL, '5404', '2022-09-22 18:31:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772439837456\",\"latitude\":\"22.719570051964872\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100157, 27, 11, NULL, '190.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KKxMMXz88xhJhV', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 18:35:24', '2022-09-22 18:36:31', '0.00', '0.00', NULL, NULL, NULL, '3520', '2022-09-22 18:35:24', NULL, '2022-09-22 18:36:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958281\",\"latitude\":\"22.7286915\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100158, 27, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 18:35:24', '2022-10-06 13:50:59', '0.00', '0.00', NULL, NULL, NULL, '9712', '2022-09-22 18:35:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958281\",\"latitude\":\"22.7286915\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100159, 27, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 19:10:46', '2022-09-26 11:02:25', '0.00', '0.00', NULL, NULL, NULL, '6436', '2022-09-22 19:10:46', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-26 11:02:25', NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958281\",\"latitude\":\"22.7286915\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100160, 27, 10, NULL, '180.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 19:10:46', '2022-10-06 13:50:59', '0.00', '0.00', NULL, NULL, NULL, '5694', '2022-09-22 19:10:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958281\",\"latitude\":\"22.7286915\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100161, 27, 11, NULL, '190.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KKy1IqTWq5X6pd', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 19:13:11', '2022-09-22 19:15:52', '0.00', '0.00', NULL, NULL, NULL, '2546', '2022-09-22 19:13:11', NULL, '2022-09-22 19:15:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958281\",\"latitude\":\"22.7286915\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100162, 27, 10, NULL, '180.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 19:13:11', '2022-10-06 13:50:59', '0.00', '0.00', NULL, NULL, NULL, '6917', '2022-09-22 19:13:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958281\",\"latitude\":\"22.7286915\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100163, 27, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 20:50:31', '2022-10-06 13:50:59', '0.00', '0.00', NULL, NULL, NULL, '9759', '2022-09-22 20:50:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958281\",\"latitude\":\"22.7286915\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100164, 27, 13, NULL, '150.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 20:50:31', '2022-10-06 13:50:59', '0.00', '0.00', NULL, NULL, NULL, '7176', '2022-09-22 20:50:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958281\",\"latitude\":\"22.7286915\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100165, 27, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 20:52:20', '2022-10-06 13:50:59', '0.00', '0.00', NULL, NULL, NULL, '8175', '2022-09-22 20:52:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958281\",\"latitude\":\"22.7286915\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100166, 27, 10, NULL, '180.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 20:52:20', '2022-10-06 13:50:59', '0.00', '0.00', NULL, NULL, NULL, '2747', '2022-09-22 20:52:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958281\",\"latitude\":\"22.7286915\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100167, 27, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 20:53:12', '2022-09-28 17:05:45', '0.00', '0.00', NULL, NULL, NULL, '2468', '2022-09-22 20:53:12', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-28 17:05:45', NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958281\",\"latitude\":\"22.7286915\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100168, 27, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 20:54:23', '2022-10-11 18:37:12', '0.00', '0.00', NULL, NULL, NULL, '2153', '2022-09-22 20:54:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"11, 107shireram Nagar, Palda, Indore, Madhya Pradesh 452001, India\",\"longitude\":\"75.8819124\",\"latitude\":\"22.6859023\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100169, 27, 13, NULL, '150.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 20:54:23', '2022-10-06 13:50:59', '0.00', '0.00', NULL, NULL, NULL, '6399', '2022-09-22 20:54:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"11, 107shireram Nagar, Palda, Indore, Madhya Pradesh 452001, India\",\"longitude\":\"75.8819124\",\"latitude\":\"22.6859023\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100170, 27, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 20:55:49', '2022-09-23 10:37:53', '0.00', '0.00', NULL, NULL, NULL, '9274', '2022-09-22 20:55:49', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-22 20:56:44', NULL, NULL, '{\"address\":\"11, 107shireram Nagar, Palda, Indore, Madhya Pradesh 452001, India\",\"longitude\":\"75.8819124\",\"latitude\":\"22.6859023\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100171, 27, 11, NULL, '140.00', '0.00', '0.00', '', 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-22 21:07:53', '2022-09-28 17:08:20', '0.00', '0.00', NULL, NULL, NULL, '4056', '2022-09-22 21:07:53', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-28 17:08:20', NULL, NULL, '{\"address\":\"11, 107shireram Nagar, Palda, Indore, Madhya Pradesh 452001, India\",\"longitude\":\"75.8819124\",\"latitude\":\"22.6859023\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100172, 27, 13, NULL, '150.00', '0.00', '0.00', '', 'paid', 'delivered', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-23 10:58:12', '2022-09-28 13:59:34', '0.00', '0.00', NULL, NULL, NULL, '6286', '2022-09-23 10:58:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"1003, Sukhnivas Rd, Bank Colony, Sudama Nagar, Indore, Madhya Pradesh 452009, India\",\"longitude\":\"75.82872468978167\",\"latitude\":\"22.69366793857392\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100173, 27, 10, NULL, '150.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-23 10:58:12', '2022-10-06 17:17:31', '0.00', '0.00', NULL, NULL, NULL, '5550', '2022-09-23 10:58:12', '2022-09-23 11:03:29', NULL, '2022-09-23 11:04:13', NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"1003, Sukhnivas Rd, Bank Colony, Sudama Nagar, Indore, Madhya Pradesh 452009, India\",\"longitude\":\"75.82872468978167\",\"latitude\":\"22.69366793857392\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100174, 37, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-23 11:01:17', '2022-09-23 11:01:26', '0.00', '0.00', NULL, NULL, NULL, '6929', '2022-09-23 11:01:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100175, 37, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'accepted', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-23 11:01:17', '2022-09-23 11:02:20', '0.00', '0.00', NULL, NULL, NULL, '8431', '2022-09-23 11:01:17', '2022-09-23 11:02:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100176, 27, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-23 11:05:12', '2022-10-06 13:50:57', '0.00', '0.00', NULL, NULL, NULL, '2952', '2022-09-23 11:05:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"1003, Sukhnivas Rd, Bank Colony, Sudama Nagar, Indore, Madhya Pradesh 452009, India\",\"longitude\":\"75.82872468978167\",\"latitude\":\"22.69366793857392\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100177, 27, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-23 11:05:12', '2022-10-06 13:50:57', '0.00', '0.00', NULL, NULL, NULL, '3927', '2022-09-23 11:05:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"1003, Sukhnivas Rd, Bank Colony, Sudama Nagar, Indore, Madhya Pradesh 452009, India\",\"longitude\":\"75.82872468978167\",\"latitude\":\"22.69366793857392\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100178, 37, 11, NULL, '190.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KLEGD8jjjUqp9P', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-23 11:06:59', '2022-09-23 11:08:28', '0.00', '0.00', NULL, NULL, NULL, '1819', '2022-09-23 11:06:59', NULL, '2022-09-23 11:08:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958252\",\"latitude\":\"22.7286888\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100179, 37, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-23 11:06:59', '2023-01-09 13:57:17', '0.00', '0.00', NULL, NULL, NULL, '3365', '2022-09-23 11:06:59', '2022-09-23 11:09:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958252\",\"latitude\":\"22.7286888\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100180, 37, 11, NULL, '140.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KLELfWgYkQATxC', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-23 11:12:40', '2022-09-23 11:13:57', '0.00', '0.00', NULL, NULL, NULL, '2780', '2022-09-23 11:12:40', NULL, '2022-09-23 11:13:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958252\",\"latitude\":\"22.7286888\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100181, 37, 10, NULL, '180.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-23 11:12:40', '2022-09-23 11:13:57', '0.00', '0.00', NULL, NULL, NULL, '4000', '2022-09-23 11:12:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958252\",\"latitude\":\"22.7286888\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100182, 5, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-23 13:55:30', '2022-10-04 18:56:16', '0.00', '0.00', NULL, NULL, NULL, '2023', '2022-09-23 13:55:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100183, 5, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-23 13:55:30', '2022-10-04 18:56:16', '0.00', '0.00', NULL, NULL, NULL, '3519', '2022-09-23 13:55:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100184, 5, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-23 14:27:42', '2022-10-04 18:55:30', '0.00', '0.00', NULL, NULL, NULL, '3451', '2022-09-23 14:27:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100185, 27, 11, NULL, '190.00', '0.00', '0.00', '', 'paid', 'service_ongoing', '0.00', 'razor_pay', 'pay_KLHwV1JhoSKl30', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-23 14:43:50', '2022-09-23 14:48:48', '0.00', '0.00', NULL, NULL, NULL, '2876', '2022-09-23 14:43:50', NULL, '2022-09-23 14:44:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"1003, Sukhnivas Rd, Bank Colony, Sudama Nagar, Indore, Madhya Pradesh 452009, India\",\"longitude\":\"75.82872468978167\",\"latitude\":\"22.69366793857392\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100186, 27, 11, NULL, '190.00', '0.00', '0.00', '', 'paid', 'service_ongoing', '0.00', 'razor_pay', 'pay_KLIABECxS0Ar9A', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-23 14:56:36', '2022-09-23 15:16:37', '0.00', '0.00', NULL, NULL, NULL, '4077', '2022-09-23 14:56:36', NULL, '2022-09-23 14:58:07', '2022-09-23 15:16:01', NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"1003, Sukhnivas Rd, Bank Colony, Sudama Nagar, Indore, Madhya Pradesh 452009, India\",\"longitude\":\"75.82872468978167\",\"latitude\":\"22.69366793857392\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100187, 37, 11, NULL, '140.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-23 17:55:27', '2022-09-23 17:55:36', '0.00', '0.00', NULL, NULL, NULL, '2699', '2022-09-23 17:55:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100188, 37, 11, NULL, '140.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-23 17:56:12', '2022-09-23 17:56:19', '0.00', '0.00', NULL, NULL, NULL, '5776', '2022-09-23 17:56:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100189, 37, 11, NULL, '140.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-23 17:57:41', '2022-09-23 17:58:12', '0.00', '0.00', NULL, NULL, NULL, '7026', '2022-09-23 17:57:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100190, 37, 11, NULL, '140.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, '1234', NULL, 'service', 1, '2022-09-23 18:00:25', '2022-09-23 18:01:30', '0.00', '0.00', NULL, NULL, NULL, '5938', '2022-09-23 18:00:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100191, 37, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, '1234', NULL, 'service', 1, '2022-09-23 18:09:27', '2022-09-23 18:14:24', '0.00', '0.00', NULL, NULL, NULL, '1874', '2022-09-23 18:09:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100192, 37, 11, NULL, '330.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, '1234', NULL, 'service', 1, '2022-09-23 18:22:54', '2022-09-24 12:56:22', '0.00', '0.00', NULL, NULL, NULL, '7821', '2022-09-23 18:22:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100193, 37, 11, NULL, '330.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, '1234', NULL, 'service', 1, '2022-09-23 18:26:50', '2022-09-24 12:56:22', '0.00', '0.00', NULL, NULL, NULL, '9699', '2022-09-23 18:26:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958252\",\"latitude\":\"22.7286888\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100194, 37, 11, NULL, '330.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-23 18:41:00', '2022-09-24 12:56:22', '0.00', '0.00', NULL, NULL, NULL, '8617', '2022-09-23 18:41:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100195, 5, 11, NULL, '330.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 01:28:54', '2022-10-04 18:55:30', '0.00', '0.00', NULL, NULL, NULL, '6832', '2022-09-26 01:28:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100196, 5, 11, NULL, '330.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 01:31:34', '2022-10-04 18:55:29', '0.00', '0.00', NULL, NULL, NULL, '1750', '2022-09-26 01:31:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0);
INSERT INTO `orders` (`id`, `user_id`, `vendor_id`, `restaurant_id`, `order_amount`, `wallet_amount`, `coupon_discount_amount`, `coupon_discount_title`, `payment_status`, `order_status`, `total_tax_amount`, `payment_method`, `transaction_reference`, `delivery_address_id`, `delivery_man_id`, `coupon_code`, `order_note`, `order_type`, `checked`, `created_at`, `updated_at`, `delivery_charge`, `due_amount`, `payment_type`, `schedule_at`, `callback`, `otp`, `pending`, `accepted`, `confirmed`, `processing`, `handover`, `picked_up`, `delivered`, `canceled`, `refund_requested`, `refunded`, `delivery_address`, `scheduled`, `restaurant_discount_amount`, `original_delivery_charge`, `failed`, `adjusment`, `edited`) VALUES
(100197, 5, 11, NULL, '520.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 01:33:01', '2022-10-04 18:55:29', '0.00', '0.00', NULL, NULL, NULL, '4357', '2022-09-26 01:33:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100198, 5, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 01:37:42', '2022-10-04 18:55:27', '0.00', '0.00', NULL, NULL, NULL, '8115', '2022-09-26 01:37:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100199, 5, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 02:03:54', '2022-10-04 18:55:27', '0.00', '0.00', NULL, NULL, NULL, '5879', '2022-09-26 02:03:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100200, 5, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 02:04:41', '2022-10-04 18:55:26', '0.00', '0.00', NULL, NULL, NULL, '6000', '2022-09-26 02:04:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100201, 5, 10, NULL, '290.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 02:06:29', '2022-10-04 18:55:26', '0.00', '0.00', NULL, NULL, NULL, '2107', '2022-09-26 02:06:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100202, 5, 10, NULL, '290.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KMGhWWklLN4oeV', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 02:08:26', '2022-09-26 02:10:46', '0.00', '0.00', NULL, NULL, NULL, '6458', '2022-09-26 02:08:26', NULL, '2022-09-26 02:10:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100203, 5, 11, NULL, '190.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KMGmpieEDR8B6B', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 02:14:52', '2022-09-26 02:31:43', '0.00', '0.00', NULL, NULL, NULL, '5252', '2022-09-26 02:14:52', NULL, '2022-09-26 02:15:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100204, 5, 10, NULL, '290.00', '29.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 02:33:42', '2022-10-04 18:55:24', '0.00', '0.00', NULL, NULL, NULL, '3805', '2022-09-26 02:33:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100205, 5, 11, NULL, '140.00', '30.17', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 02:39:25', '2022-10-04 18:55:24', '0.00', '0.00', NULL, NULL, NULL, '5675', '2022-09-26 02:39:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100206, 5, 10, NULL, '290.00', '30.17', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 02:43:26', '2022-10-04 18:55:21', '0.00', '0.00', NULL, NULL, NULL, '8996', '2022-09-26 02:43:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100207, 27, 11, NULL, '190.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KMPWKqWOQc33nG', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 10:47:14', '2022-09-26 10:48:18', '0.00', '0.00', NULL, NULL, NULL, '2174', '2022-09-26 10:47:14', NULL, '2022-09-26 10:48:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958224\",\"latitude\":\"22.7286974\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100208, 27, 11, NULL, '190.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KMPZYE8BhmALtF', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 10:50:39', '2022-09-26 10:53:06', '0.00', '0.00', NULL, NULL, NULL, '9630', '2022-09-26 10:50:39', NULL, '2022-09-26 10:51:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958224\",\"latitude\":\"22.7286974\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100209, 37, 11, NULL, '190.00', '160.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KMPeRGIVFeyXqP', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 10:54:54', '2022-09-26 13:46:33', '0.00', '0.00', NULL, NULL, NULL, '1119', '2022-09-26 10:54:54', NULL, '2022-09-26 10:55:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100210, 27, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 10:57:24', '2022-09-26 13:46:33', '0.00', '0.00', NULL, NULL, NULL, '6886', '2022-09-26 10:57:24', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-26 11:03:11', NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958224\",\"latitude\":\"22.7286974\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100211, 37, 11, NULL, '190.00', '160.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KMQjfx41doyvdd', NULL, NULL, '1234', NULL, 'service', 1, '2022-09-26 11:56:21', '2022-09-26 13:46:33', '0.00', '0.00', NULL, NULL, NULL, '9724', '2022-09-26 11:56:21', NULL, '2022-09-26 11:59:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100212, 37, 11, NULL, '190.00', '160.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KMR5AELsuTFjOi', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 12:15:12', '2022-09-26 13:46:33', '0.00', '0.00', NULL, NULL, NULL, '2815', '2022-09-26 12:15:12', NULL, '2022-09-26 12:19:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.7195683\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100213, 5, 11, NULL, '190.00', '30.17', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 13:51:57', '2022-10-04 18:55:21', '0.00', '0.00', NULL, NULL, NULL, '4760', '2022-09-26 13:51:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100214, 5, 10, NULL, '290.00', '30.17', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KMSgROnYkrZ539', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 13:53:10', '2022-09-26 15:11:44', '0.00', '0.00', NULL, NULL, NULL, '2936', '2022-09-26 13:53:10', NULL, '2022-09-26 13:54:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100215, 5, 10, NULL, '290.00', '30.17', '0.00', '', 'paid', 'failed', '0.00', 'razor_pay', 'pay_KMSmK4U5svspzv', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 13:58:33', '2022-09-26 15:11:44', '0.00', '0.00', NULL, NULL, NULL, '3368', '2022-09-26 13:58:33', NULL, '2022-09-26 13:59:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', '2022-09-26 13:59:33', '0.00', 0),
(100216, 5, 10, NULL, '290.00', '30.17', '0.00', '', 'paid', 'failed', '0.00', 'razor_pay', 'pay_KMSpThsLn7zqKg', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 14:01:49', '2022-09-26 15:11:44', '0.00', '0.00', NULL, NULL, NULL, '3786', '2022-09-26 14:01:49', NULL, '2022-09-26 14:02:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', '2022-09-26 14:02:32', '0.00', 0),
(100217, 5, 11, NULL, '190.00', '30.17', '0.00', '', 'paid', 'failed', '0.00', 'razor_pay', 'pay_KMT4D9ScK3FwH4', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 14:15:42', '2022-09-26 15:11:44', '0.00', '0.00', NULL, NULL, NULL, '8980', '2022-09-26 14:15:42', NULL, '2022-09-26 14:16:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', '2022-09-26 14:16:28', '0.00', 0),
(100218, 5, 10, NULL, '290.00', '30.17', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KMT63QAyqOEIZq', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 14:17:33', '2022-09-26 15:11:44', '0.00', '0.00', NULL, NULL, NULL, '7521', '2022-09-26 14:17:33', NULL, '2022-09-26 14:18:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100219, 5, 10, NULL, '290.00', '30.17', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KMTA4B922dV2fW', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 14:21:15', '2022-09-26 15:11:44', '0.00', '0.00', NULL, NULL, NULL, '4421', '2022-09-26 14:21:15', NULL, '2022-09-26 14:22:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100220, 5, 10, NULL, '290.00', '30.17', '0.00', '', 'paid', 'failed', '0.00', 'razor_pay', 'pay_KMTDJUspLDZWW1', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 14:24:27', '2022-09-26 15:11:44', '0.00', '0.00', NULL, NULL, NULL, '9180', '2022-09-26 14:24:27', NULL, '2022-09-26 14:25:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', '2022-09-26 14:25:07', '0.00', 0),
(100221, 5, 10, NULL, '290.00', '30.17', '0.00', '', 'unpaid', 'failed', '0.00', 'razor_pay', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 14:29:43', '2022-09-26 15:11:44', '0.00', '0.00', NULL, NULL, NULL, '7396', '2022-09-26 14:29:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', '2022-09-26 14:30:22', '0.00', 0),
(100222, 5, 10, NULL, '290.00', '30.17', '0.00', '', 'unpaid', 'failed', '0.00', 'razor_pay', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 14:32:14', '2022-09-26 15:11:44', '0.00', '0.00', NULL, NULL, NULL, '6128', '2022-09-26 14:32:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', '2022-09-26 14:32:54', '0.00', 0),
(100223, 5, 10, NULL, '290.00', '30.17', '0.00', '', 'unpaid', 'failed', '0.00', 'razor_pay', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 14:38:03', '2022-09-26 15:11:44', '0.00', '0.00', NULL, NULL, NULL, '8116', '2022-09-26 14:38:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', '2022-09-26 14:38:39', '0.00', 0),
(100224, 5, 10, NULL, '290.00', '30.17', '0.00', '', 'unpaid', 'failed', '0.00', 'razor_pay', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 14:39:31', '2022-09-26 15:11:44', '0.00', '0.00', NULL, NULL, NULL, '6020', '2022-09-26 14:39:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', '2022-09-26 14:40:09', '0.00', 0),
(100225, 5, 10, NULL, '290.00', '30.17', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KMTUWa3Fj1T3nT', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 14:40:47', '2022-09-26 15:11:44', '0.00', '0.00', NULL, NULL, NULL, '3136', '2022-09-26 14:40:47', NULL, '2022-09-26 14:41:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100226, 5, 10, NULL, '290.00', '27.16', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 14:41:54', '2022-10-04 18:55:21', '0.00', '0.00', NULL, NULL, NULL, '6220', '2022-09-26 14:41:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100227, 5, 11, NULL, '140.00', '0.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 14:42:36', '2022-10-04 18:55:21', '0.00', '0.00', NULL, NULL, NULL, '1672', '2022-09-26 14:42:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100228, 5, 11, NULL, '190.00', '27.16', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KMTXY8e91j4KX2', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 14:43:39', '2022-09-26 15:11:44', '0.00', '0.00', NULL, NULL, NULL, '5999', '2022-09-26 14:43:39', NULL, '2022-09-26 14:44:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100229, 37, 11, NULL, '190.00', '160.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KMU9hTqZWUwQys', NULL, NULL, '1234', NULL, 'service', 1, '2022-09-26 15:17:48', '2022-09-26 15:40:52', '0.00', '0.00', NULL, NULL, NULL, '6756', '2022-09-26 15:17:48', NULL, '2022-09-26 15:20:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100230, 37, 11, NULL, '190.00', '144.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KMUE51G9yhfalO', NULL, NULL, '1234', NULL, 'service', 1, '2022-09-26 15:22:27', '2022-09-26 15:40:52', '0.00', '0.00', NULL, NULL, NULL, '2170', '2022-09-26 15:22:27', NULL, '2022-09-26 15:24:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100231, 37, 11, NULL, '190.00', '129.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KMUhxd2HOKOaJW', NULL, NULL, '1234', NULL, 'service', 1, '2022-09-26 15:44:29', '2022-09-26 15:58:00', '0.00', '0.00', NULL, NULL, NULL, '3734', '2022-09-26 15:44:29', NULL, '2022-09-26 15:52:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100232, 37, 11, NULL, '190.00', '116.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KMUjH9azuyL2nS', NULL, NULL, '1234', NULL, 'service', 1, '2022-09-26 15:53:13', '2022-09-26 15:58:00', '0.00', '0.00', NULL, NULL, NULL, '9889', '2022-09-26 15:53:13', NULL, '2022-09-26 15:54:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100233, 37, 11, NULL, '330.00', '105.00', '0.00', '', 'paid', 'service_ongoing', '0.00', 'razor_pay', 'pay_KMUlCCJOjdjdOg', NULL, NULL, '1234', NULL, 'service', 1, '2022-09-26 15:54:47', '2022-09-26 15:59:04', '0.00', '0.00', NULL, NULL, NULL, '5713', '2022-09-26 15:54:47', NULL, '2022-09-26 15:55:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"243, Risi Nagar, Rishi Vihar, Indore, Madhya Pradesh 452013, India\",\"longitude\":\"75.857725\",\"latitude\":\"22.719568333333335\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100234, 27, 11, NULL, '190.00', '0.00', '0.00', '', 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KMWnMzJGJBfzBd', NULL, NULL, '1234', 'Test', 'service', 1, '2022-09-26 17:54:12', '2022-09-26 17:55:21', '0.00', '0.00', NULL, NULL, NULL, '4672', '2022-09-26 17:54:12', NULL, '2022-09-26 17:55:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.8577237278223\",\"latitude\":\"22.71956881492173\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100235, 37, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 18:00:17', '2022-09-28 11:33:54', '0.00', '0.00', NULL, NULL, NULL, '8119', '2022-09-26 18:00:17', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-28 11:33:54', NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958248\",\"latitude\":\"22.7286817\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100236, 37, 11, NULL, '190.00', '94.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 18:04:23', '2022-09-26 18:29:11', '0.00', '0.00', NULL, NULL, NULL, '8164', '2022-09-26 18:04:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958248\",\"latitude\":\"22.7286817\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100237, 37, 11, NULL, '190.00', '94.00', '0.00', '', 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 18:05:49', '2022-09-28 11:28:55', '0.00', '0.00', NULL, NULL, NULL, '2009', '2022-09-26 18:05:49', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-28 11:28:55', NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958248\",\"latitude\":\"22.7286817\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100238, 37, 11, NULL, '190.00', '0.00', '0.00', '', 'unpaid', 'pending', '0.00', 'online_payment', NULL, NULL, NULL, '123456', NULL, 'service', 1, '2022-09-26 18:07:46', '2022-09-26 18:29:11', '0.00', '0.00', NULL, NULL, NULL, '8244', '2022-09-26 18:07:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958248\",\"latitude\":\"22.7286817\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100239, 37, 10, NULL, '150.00', '94.00', '0.00', '', 'unpaid', 'service_ongoing', '0.00', 'online_payment', NULL, NULL, NULL, '123456', NULL, 'service', 1, '2022-09-26 18:11:59', '2022-09-26 18:29:42', '0.00', '0.00', NULL, NULL, NULL, '6898', '2022-09-26 18:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958248\",\"latitude\":\"22.7286817\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100240, 5, 10, NULL, '290.00', '24.00', '0.00', '', 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 19:56:23', '2022-10-04 18:55:20', '0.00', '0.00', NULL, NULL, NULL, '2886', '2022-09-26 19:56:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, NULL, '0.00', NULL, '0.00', 0),
(100241, 5, 10, NULL, '266.00', '24.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 20:35:28', '2022-10-04 18:55:20', '0.00', '0.00', NULL, NULL, NULL, '7324', '2022-09-26 20:35:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100242, 5, 10, NULL, '266.00', '24.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 20:38:48', '2022-10-04 18:55:20', '0.00', '0.00', NULL, NULL, NULL, '3280', '2022-09-26 20:38:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100243, 5, 11, NULL, '166.00', '24.00', '0.00', NULL, 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 20:39:25', '2022-10-01 08:39:06', '0.00', '0.00', NULL, NULL, NULL, '9658', '2022-09-26 20:39:25', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-01 08:39:06', NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100244, 37, 12, NULL, '76.00', '94.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-26 20:43:39', '2022-09-27 14:10:27', '0.00', '0.00', NULL, NULL, NULL, '8567', '2022-09-26 20:43:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958248\",\"latitude\":\"22.7286817\"}', 0, '30.00', '0.00', NULL, '0.00', 0),
(100245, 27, 11, NULL, '9.00', '0.00', '10.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', NULL, NULL, NULL, '123456', NULL, 'service', 1, '2022-09-27 09:19:42', '2022-09-27 13:56:05', '0.00', '0.00', NULL, NULL, NULL, '6221', '2022-09-27 09:19:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958224\",\"latitude\":\"22.7286974\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100246, 5, 11, NULL, '166.00', '24.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-27 13:42:05', '2022-10-04 18:55:20', '0.00', '0.00', NULL, NULL, NULL, '9111', '2022-09-27 13:42:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100247, 37, 11, NULL, '96.00', '94.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-27 16:24:42', '2022-09-27 18:42:05', '0.00', '0.00', NULL, NULL, NULL, '4008', '2022-09-27 16:24:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA\",\"longitude\":\"75.85772439837456\",\"latitude\":\"22.71956881492173\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100248, 27, 10, NULL, '2970.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-27 18:01:38', '2022-10-05 17:42:49', '0.00', '0.00', NULL, NULL, NULL, '7420', '2022-09-27 18:01:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958224\",\"latitude\":\"22.7286974\"}', 0, '30.00', '0.00', NULL, '0.00', 0),
(100249, 37, 11, NULL, '96.00', '94.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KMwGNuSFNhXSft', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-27 18:48:29', '2022-09-27 18:51:29', '0.00', '0.00', NULL, NULL, NULL, '7807', '2022-09-27 18:48:29', NULL, '2022-09-27 18:50:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA\",\"longitude\":\"75.85772439837456\",\"latitude\":\"22.71956881492173\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100250, 37, 10, NULL, '203.00', '94.00', '0.00', NULL, 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-27 18:48:42', '2022-09-28 11:21:09', '0.00', '0.00', NULL, NULL, NULL, '7351', '2022-09-27 18:48:42', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-28 11:21:09', NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772439837456\",\"latitude\":\"22.719570051964872\"}', 0, '30.00', '0.00', NULL, '0.00', 0),
(100251, 27, 9, NULL, '14.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 11:03:52', '2022-10-05 17:42:49', '0.00', '0.00', NULL, NULL, NULL, '2525', '2022-09-28 11:03:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958224\",\"latitude\":\"22.7286974\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100252, 37, 11, NULL, '19.00', '0.00', '0.00', NULL, 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 11:25:48', '2022-09-28 12:20:38', '0.00', '0.00', NULL, NULL, NULL, '8337', '2022-09-28 11:25:48', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-28 11:26:29', NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772439837456\",\"latitude\":\"22.719570051964872\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100253, 37, 11, NULL, '19.00', '0.00', '0.00', NULL, 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 11:38:19', '2022-09-28 16:53:48', '0.00', '0.00', NULL, NULL, NULL, '3398', '2022-09-28 11:38:19', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-28 16:53:48', NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772439837456\",\"latitude\":\"22.719570051964872\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100254, 37, 11, NULL, '95.00', '85.00', '10.00', NULL, 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KNDSKe2DILHbTm', NULL, NULL, '123456', NULL, 'service', 1, '2022-09-28 11:38:36', '2022-09-28 12:20:38', '0.00', '0.00', NULL, NULL, NULL, '1898', '2022-09-28 11:38:36', NULL, '2022-09-28 11:39:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA\",\"longitude\":\"75.85772439837456\",\"latitude\":\"22.71956881492173\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100255, 37, 11, NULL, '19.00', '0.00', '0.00', NULL, 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 11:40:53', '2022-09-28 16:49:54', '0.00', '0.00', NULL, NULL, NULL, '9378', '2022-09-28 11:40:53', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-28 16:49:54', NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772439837456\",\"latitude\":\"22.719570051964872\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100256, 27, 11, NULL, '19.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 12:11:32', '2022-10-05 17:42:49', '0.00', '0.00', NULL, NULL, NULL, '3087', '2022-09-28 12:11:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958224\",\"latitude\":\"22.7286974\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100257, 27, 10, NULL, '18.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 12:11:56', '2022-10-05 17:42:49', '0.00', '0.00', NULL, NULL, NULL, '3377', '2022-09-28 12:11:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958224\",\"latitude\":\"22.7286974\"}', 0, '20.00', '0.00', NULL, '0.00', 0),
(100258, 37, 11, NULL, '0.00', '19.00', '0.00', NULL, 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 12:15:51', '2022-09-28 16:51:49', '0.00', '0.00', NULL, NULL, NULL, '7881', '2022-09-28 12:15:51', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-28 16:51:49', NULL, NULL, '{\"address\":\"1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA\",\"longitude\":\"75.85772439837456\",\"latitude\":\"22.71956881492173\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100259, 37, 11, NULL, '0.00', '19.00', '0.00', NULL, 'unpaid', 'processing', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 12:17:14', '2023-01-09 13:59:04', '0.00', '0.00', NULL, NULL, NULL, '3513', '2022-09-28 12:17:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA\",\"longitude\":\"75.85772439837456\",\"latitude\":\"22.71956881492173\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100260, 37, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KNE7sgmnNyDObo', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 12:17:58', '2022-09-28 12:20:38', '0.00', '0.00', NULL, NULL, NULL, '1098', '2022-09-28 12:17:58', NULL, '2022-09-28 12:18:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA\",\"longitude\":\"75.85772439837456\",\"latitude\":\"22.71956881492173\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100261, 37, 13, NULL, '15.00', '0.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KNEwFwyPS264K0', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 13:05:43', '2022-09-28 13:06:34', '0.00', '0.00', NULL, NULL, NULL, '6613', '2022-09-28 13:05:43', NULL, '2022-09-28 13:06:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA\",\"longitude\":\"75.85772439837456\",\"latitude\":\"22.71956881492173\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100262, 37, 11, NULL, '114.00', '76.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KNFl5V9Y7kbpJA', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 13:53:54', '2022-09-28 14:02:13', '0.00', '0.00', NULL, NULL, NULL, '1552', '2022-09-28 13:53:54', NULL, '2022-09-28 13:54:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA\",\"longitude\":\"75.85772439837456\",\"latitude\":\"22.71956881492173\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100263, 27, 10, NULL, '18.00', '0.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KNFx10jSRsJKKw', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 14:04:28', '2022-09-28 14:05:42', '0.00', '0.00', NULL, NULL, NULL, '7851', '2022-09-28 14:04:28', NULL, '2022-09-28 14:05:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958224\",\"latitude\":\"22.7286974\"}', 0, '20.00', '0.00', NULL, '0.00', 0),
(100264, 27, 13, NULL, '16.50', '0.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 15:34:36', '2022-10-05 17:42:49', '0.00', '0.00', NULL, NULL, NULL, '5026', '2022-09-28 15:34:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958224\",\"latitude\":\"22.7286974\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100265, 21, 11, NULL, '190.00', '0.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KNHoTDR9eD2ibM', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 15:54:18', '2022-09-28 16:12:33', '0.00', '0.00', NULL, NULL, NULL, '4571', '2022-09-28 15:54:18', NULL, '2022-09-28 15:54:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"F- 1\\/4, Munirka Marg, Block F, Vasant Vihar, New Delhi, Delhi 110057, India\",\"longitude\":\"77.16199714690447\",\"latitude\":\"28.5580338430585\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100266, 21, 10, NULL, '29.00', '0.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KNHtDzJ8L8BpCJ', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 15:58:47', '2022-09-28 16:12:33', '0.00', '0.00', NULL, NULL, NULL, '1023', '2022-09-28 15:58:47', NULL, '2022-09-28 15:59:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"F- 1\\/4, Munirka Marg, Block F, Vasant Vihar, New Delhi, Delhi 110057, India\",\"longitude\":\"77.16199714690447\",\"latitude\":\"28.5580338430585\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100267, 21, 10, NULL, '290.00', '0.00', '0.00', NULL, 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 16:09:26', '2022-09-28 16:12:33', '0.00', '0.00', NULL, NULL, NULL, '6782', '2022-09-28 16:09:26', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-28 16:09:54', NULL, NULL, '{\"address\":\"F- 1\\/4, Munirka Marg, Block F, Vasant Vihar, New Delhi, Delhi 110057, India\",\"longitude\":\"77.16199714690447\",\"latitude\":\"28.5580338430585\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100268, 27, 13, NULL, '0.00', '165.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 17:25:13', '2022-10-05 17:42:49', '0.00', '0.00', NULL, NULL, NULL, '3089', '2022-09-28 17:25:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958286\",\"latitude\":\"22.7286928\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100269, 40, 10, NULL, '125.00', '55.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KNJUrvdxEvHLUL', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 17:32:56', '2022-09-28 17:33:45', '0.00', '0.00', NULL, NULL, NULL, '4616', '2022-09-28 17:32:56', NULL, '2022-09-28 17:33:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958299\",\"latitude\":\"22.7286942\"}', 0, '20.00', '0.00', NULL, '0.00', 0),
(100270, 5, 11, NULL, '0.00', '19.00', '0.00', NULL, 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 18:25:32', '2022-10-04 02:26:41', '0.00', '0.00', NULL, NULL, NULL, '3846', '2022-09-28 18:25:32', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-04 02:26:41', NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100271, 5, 11, NULL, '0.00', '19.00', '0.00', NULL, 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 18:37:49', '2022-10-01 08:38:12', '0.00', '0.00', NULL, NULL, NULL, '4170', '2022-09-28 18:37:49', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-01 08:38:12', NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100272, 5, 11, NULL, '0.00', '19.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', 'wallet_BCKDg6WjSnno', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 18:40:01', '2022-09-28 18:43:23', '0.00', '0.00', NULL, NULL, NULL, '7136', '2022-09-28 18:40:01', NULL, '2022-09-28 18:40:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100273, 5, 11, NULL, '168.00', '22.00', '0.00', NULL, 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 18:41:36', '2022-10-04 02:27:21', '0.00', '0.00', NULL, NULL, NULL, '1822', '2022-09-28 18:41:36', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-04 02:27:21', NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100274, 37, 11, NULL, '0.00', '19.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'wallet', 'wallet_x1hJUWFMKJ9s', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 18:45:26', '2022-09-28 18:47:57', '0.00', '0.00', NULL, NULL, NULL, '3931', '2022-09-28 18:45:26', NULL, '2022-09-28 18:45:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100275, 40, 11, NULL, '33.00', '0.00', '0.00', NULL, 'unpaid', 'processing', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-28 18:59:39', '2023-01-07 18:50:44', '0.00', '0.00', NULL, NULL, NULL, '7131', '2022-09-28 18:59:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958299\",\"latitude\":\"22.7286942\"}', 0, '20.00', '0.00', NULL, '0.00', 0),
(100276, 37, 11, NULL, '190.00', '0.00', '0.00', NULL, 'unpaid', 'processing', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-29 11:25:48', '2023-01-07 18:09:25', '0.00', '0.00', NULL, NULL, NULL, '2560', '2022-09-29 11:25:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100277, 37, 11, NULL, '190.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-29 11:29:33', '2022-12-12 13:12:33', '0.00', '0.00', NULL, NULL, NULL, '1035', '2022-09-29 11:29:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100278, 37, 11, NULL, '0.00', '180.00', '10.00', NULL, 'paid', 'confirmed', '0.00', 'wallet', 'wallet_YJWloMuqjHL7', NULL, NULL, '123456', NULL, 'service', 1, '2022-09-29 12:11:58', '2022-09-29 12:14:49', '0.00', '0.00', NULL, NULL, NULL, '2425', '2022-09-29 12:11:58', NULL, '2022-09-29 12:11:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100279, 37, 11, NULL, '0.00', '19.00', '10.00', NULL, 'paid', 'confirmed', '0.00', 'wallet', 'wallet_9JzLnVjv7epy', NULL, NULL, '123456', NULL, 'service', 1, '2022-09-29 12:27:03', '2022-09-29 12:29:53', '0.00', '0.00', NULL, NULL, NULL, '2957', '2022-09-29 12:27:03', NULL, '2022-09-29 12:27:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100280, 37, 11, NULL, '0.00', '19.00', '10.00', NULL, 'paid', 'confirmed', '0.00', 'wallet', 'wallet_Yk8ZccHi2FT0', NULL, NULL, '123456', NULL, 'service', 1, '2022-09-29 12:31:24', '2022-09-29 12:33:01', '0.00', '0.00', NULL, NULL, NULL, '7595', '2022-09-29 12:31:24', NULL, '2022-09-29 12:31:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100281, 37, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-29 12:33:07', '2022-09-29 14:42:33', '0.00', '0.00', NULL, NULL, NULL, '3674', '2022-09-29 12:33:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100282, 37, 11, NULL, '0.00', '19.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'wallet', 'wallet_v2t7YmhHU7HM', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-29 12:34:14', '2022-09-29 12:34:21', '0.00', '0.00', NULL, NULL, NULL, '9593', '2022-09-29 12:34:14', NULL, '2022-09-29 12:34:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100283, 37, 11, NULL, '0.00', '19.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'wallet', 'wallet_mVTPGaNuHnrk', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-29 12:39:46', '2022-09-29 12:39:52', '0.00', '0.00', NULL, NULL, NULL, '1785', '2022-09-29 12:39:46', NULL, '2022-09-29 12:39:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100284, 37, 11, NULL, '0.00', '190.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'wallet', 'wallet_1f05yR1G908v', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-29 12:41:12', '2022-09-29 12:43:05', '0.00', '0.00', NULL, NULL, NULL, '6500', '2022-09-29 12:41:12', NULL, '2022-09-29 12:41:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100285, 38, 11, NULL, '0.00', '19.00', '10.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', 'wallet_YTsBuywnH4o5', NULL, NULL, '123456', NULL, 'service', 1, '2022-09-29 13:06:19', '2022-09-29 14:43:58', '0.00', '0.00', NULL, NULL, NULL, '6423', '2022-09-29 13:06:19', NULL, '2022-09-29 13:06:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958256\",\"latitude\":\"22.728702\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100286, 38, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KNfLQDd2D5t22z', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-29 14:55:25', '2022-09-29 17:53:02', '0.00', '0.00', NULL, NULL, NULL, '2263', '2022-09-29 14:55:25', NULL, '2022-09-29 14:56:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958256\",\"latitude\":\"22.728702\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100287, 38, 10, NULL, '18.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', 'pay_KNiNrEKRYAwesk', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-29 17:53:54', '2022-09-29 18:00:16', '0.00', '0.00', NULL, NULL, NULL, '9105', '2022-09-29 17:53:54', NULL, '2022-09-29 17:54:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958256\",\"latitude\":\"22.728702\"}', 0, '20.00', '0.00', NULL, '0.00', 0),
(100288, 38, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', 'pay_KNid4YT4bEGcAm', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-29 18:08:21', '2022-09-29 18:11:07', '0.00', '0.00', NULL, NULL, NULL, '4099', '2022-09-29 18:08:21', NULL, '2022-09-29 18:08:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958256\",\"latitude\":\"22.728702\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100289, 38, 11, NULL, '140.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', 'pay_KNiiLEvWIhB6OS', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-29 18:13:17', '2022-09-29 18:16:45', '0.00', '0.00', NULL, NULL, NULL, '2590', '2022-09-29 18:13:17', NULL, '2022-09-29 18:13:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958256\",\"latitude\":\"22.728702\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100290, 38, 10, NULL, '18.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'razor_pay', 'pay_KNipNdObhWoRVv', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-29 18:20:00', '2022-09-30 11:20:59', '0.00', '0.00', NULL, NULL, NULL, '2693', '2022-09-29 18:20:00', NULL, '2022-09-29 18:20:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958256\",\"latitude\":\"22.728702\"}', 0, '20.00', '0.00', NULL, '0.00', 0),
(100291, 38, 11, NULL, '190.00', '0.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KNiwvfF6TrHtsN', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-29 18:27:10', '2022-09-29 18:28:11', '0.00', '0.00', NULL, NULL, NULL, '2115', '2022-09-29 18:27:10', NULL, '2022-09-29 18:27:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958256\",\"latitude\":\"22.728702\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100292, 38, 10, NULL, '18.00', '0.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KNj1OcXVDS86HM', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-29 18:31:13', '2022-09-29 18:32:15', '0.00', '0.00', NULL, NULL, NULL, '6379', '2022-09-29 18:31:13', NULL, '2022-09-29 18:31:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958256\",\"latitude\":\"22.728702\"}', 0, '20.00', '0.00', NULL, '0.00', 0),
(100293, 38, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-29 18:33:19', '2022-09-29 18:35:01', '0.00', '0.00', NULL, NULL, NULL, '6513', '2022-09-29 18:33:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958256\",\"latitude\":\"22.728702\"}', 0, '10.00', '0.00', NULL, '0.00', 0),
(100294, 38, 10, NULL, '18.00', '0.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KO03GE60OrPEiz', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-30 11:10:47', '2022-09-30 11:13:19', '0.00', '0.00', NULL, NULL, NULL, '5330', '2022-09-30 11:10:47', NULL, '2022-09-30 11:11:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958256\",\"latitude\":\"22.728702\"}', 0, '20.00', '0.00', NULL, '0.00', 0),
(100295, 38, 10, NULL, '18.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'razor_pay', 'pay_KO0EqNAWS6OyPN', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-30 11:21:51', '2022-09-30 11:33:40', '0.00', '0.00', NULL, NULL, NULL, '5814', '2022-09-30 11:21:51', NULL, '2022-09-30 11:22:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958256\",\"latitude\":\"22.728702\"}', 0, '20.00', '0.00', NULL, '0.00', 0),
(100296, 27, 10, NULL, '180.00', '0.00', '10.00', NULL, 'paid', 'delivered', '0.00', 'razor_pay', 'pay_KO4AFZ5ZfWec8C', NULL, NULL, '123456', NULL, 'service', 1, '2022-09-30 15:12:14', '2022-09-30 15:16:52', '0.00', '0.00', 'full', '2022-10-01 15:11:00', NULL, '3177', '2022-09-30 15:12:14', NULL, '2022-09-30 15:12:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958232\",\"latitude\":\"22.728678\"}', 1, '20.00', '0.00', NULL, '0.00', 0);
INSERT INTO `orders` (`id`, `user_id`, `vendor_id`, `restaurant_id`, `order_amount`, `wallet_amount`, `coupon_discount_amount`, `coupon_discount_title`, `payment_status`, `order_status`, `total_tax_amount`, `payment_method`, `transaction_reference`, `delivery_address_id`, `delivery_man_id`, `coupon_code`, `order_note`, `order_type`, `checked`, `created_at`, `updated_at`, `delivery_charge`, `due_amount`, `payment_type`, `schedule_at`, `callback`, `otp`, `pending`, `accepted`, `confirmed`, `processing`, `handover`, `picked_up`, `delivered`, `canceled`, `refund_requested`, `refunded`, `delivery_address`, `scheduled`, `restaurant_discount_amount`, `original_delivery_charge`, `failed`, `adjusment`, `edited`) VALUES
(100297, 27, 10, NULL, '18.00', '0.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KO4Tn5a6xpCuKh', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-30 15:30:46', '2022-09-30 15:31:19', '0.00', '162.00', 'part', '2022-09-30 18:30:00', NULL, '3403', '2022-09-30 15:30:46', NULL, '2022-09-30 15:31:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958318\",\"latitude\":\"22.7286879\"}', 1, '20.00', '0.00', NULL, '0.00', 0),
(100298, 27, 10, NULL, '15.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'razor_pay', 'pay_KO4UywnBIE1VYF', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-30 15:31:58', '2022-09-30 15:34:37', '0.00', '135.00', 'part', '2022-09-30 18:31:00', NULL, '7604', '2022-09-30 15:31:58', NULL, '2022-09-30 15:32:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958318\",\"latitude\":\"22.7286879\"}', 1, '0.00', '0.00', NULL, '0.00', 0),
(100299, 27, 10, NULL, '18.00', '0.00', '0.00', NULL, 'paid', 'accepted', '0.00', 'razor_pay', 'pay_KO4fv9nlUT1Mu1', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-30 15:42:15', '2022-09-30 15:44:19', '0.00', '162.00', 'part', '2022-09-30 18:42:00', NULL, '2697', '2022-09-30 15:42:15', NULL, '2022-09-30 15:42:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958318\",\"latitude\":\"22.7286879\"}', 1, '20.00', '0.00', NULL, '0.00', 0),
(100300, 5, 11, NULL, '14.00', '5.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-30 15:46:23', '2022-10-04 18:55:19', '0.00', '171.00', 'part', '2022-09-29 19:25:00', NULL, '7154', '2022-09-30 15:46:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100301, 27, 10, NULL, '18.00', '0.00', '0.00', NULL, 'paid', 'accepted', '0.00', 'razor_pay', 'pay_KO4maW88ZdlFE9', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-30 15:48:38', '2022-09-30 16:04:59', '0.00', '162.00', 'part', '2022-09-30 18:48:00', NULL, '2973', '2022-09-30 15:48:38', NULL, '2022-09-30 15:49:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958318\",\"latitude\":\"22.7286879\"}', 1, '20.00', '0.00', NULL, '0.00', 0),
(100302, 27, 10, NULL, '0.00', '18.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'wallet', 'wallet_c3AiAkoRzEDb', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-30 15:53:44', '2022-09-30 16:01:24', '0.00', '162.00', 'part', '2022-09-30 18:53:00', NULL, '3947', '2022-09-30 15:53:44', NULL, '2022-09-30 15:53:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958318\",\"latitude\":\"22.7286879\"}', 1, '20.00', '0.00', NULL, '0.00', 0),
(100303, 5, 10, NULL, '290.00', '0.00', '0.00', NULL, 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-30 15:56:07', '2022-10-01 08:38:49', '0.00', '0.00', 'full', '2022-10-01 09:49:00', NULL, '2761', '2022-09-30 15:56:07', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-01 08:38:49', NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100304, 27, 10, NULL, '18.00', '0.00', '0.00', NULL, 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-30 16:02:31', '2022-09-30 16:19:22', '0.00', '162.00', 'part', '2022-09-30 18:02:00', NULL, '8538', '2022-09-30 16:02:31', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-30 16:19:22', NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958318\",\"latitude\":\"22.7286879\"}', 1, '20.00', '0.00', NULL, '0.00', 0),
(100305, 27, 10, NULL, '0.00', '18.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'wallet', 'wallet_MtjOO44Jvacs', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-30 17:10:41', '2022-09-30 17:24:19', '0.00', '162.00', 'part', '2022-09-30 18:08:00', NULL, '9157', '2022-09-30 17:10:41', NULL, '2022-09-30 17:10:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958318\",\"latitude\":\"22.7286879\"}', 1, '20.00', '0.00', NULL, '0.00', 0),
(100306, 37, 11, NULL, '14.00', '5.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', 'pay_KO6S2xwPtwtw5C', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-30 17:26:27', '2022-10-19 12:51:29', '0.00', '171.00', 'part', '2022-09-29 19:25:00', NULL, '9074', '2022-09-30 17:26:27', NULL, '2022-09-30 17:27:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100307, 27, 11, NULL, '0.00', '19.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'wallet', 'wallet_F3BzebLDXgqG', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-30 17:29:27', '2022-10-01 11:31:53', '0.00', '171.00', 'part', '2022-09-30 18:55:00', NULL, '8749', '2022-09-30 17:29:27', NULL, '2022-09-30 17:29:28', NULL, NULL, NULL, NULL, '2022-09-30 18:09:50', NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958318\",\"latitude\":\"22.7286879\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100308, 27, 10, NULL, '18.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'razor_pay', 'pay_KO72ag2lNCyBLj', NULL, NULL, NULL, NULL, 'service', 1, '2022-09-30 18:01:08', '2022-09-30 18:03:56', '0.00', '162.00', 'part', '2022-09-30 19:01:00', NULL, '6089', '2022-09-30 18:01:08', NULL, '2022-09-30 18:01:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958318\",\"latitude\":\"22.7286879\"}', 1, '20.00', '0.00', NULL, '0.00', 0),
(100309, 37, 11, NULL, '185.00', '5.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-30 18:25:13', '2022-10-01 11:32:49', '0.00', '190.00', 'full', '2022-10-01 18:09:00', NULL, '2054', '2022-09-30 18:25:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100310, 27, 10, NULL, '18.00', '0.00', '0.00', NULL, 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-09-30 18:28:30', '2022-10-03 11:43:14', '0.00', '162.00', 'part', '2022-09-30 19:28:00', NULL, '6385', '2022-09-30 18:28:30', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-03 11:43:14', NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958318\",\"latitude\":\"22.7286879\"}', 1, '20.00', '0.00', NULL, '0.00', 0),
(100311, 37, 11, NULL, '14.00', '5.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'razor_pay', 'pay_KOO9vr5SsVpzhl', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-01 10:45:37', '2022-10-01 11:24:43', '0.00', '171.00', 'part', '2022-10-01 12:45:00', NULL, '2451', '2022-10-01 10:45:37', NULL, '2022-10-01 10:46:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100312, 37, 11, NULL, '185.00', '5.00', '0.00', NULL, 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-01 12:41:52', '2022-10-01 16:13:20', '0.00', '190.00', 'full', '2022-10-02 12:10:00', NULL, '5365', '2022-10-01 12:41:52', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-01 16:13:20', NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100313, 27, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'razor_pay', 'pay_KOQXADkeNLpAwF', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-01 13:05:14', '2022-10-01 13:16:05', '0.00', '190.00', 'part', '2022-10-01 18:04:00', NULL, '9942', '2022-10-01 13:05:14', NULL, '2022-10-01 13:05:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.895824\",\"latitude\":\"22.7287007\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100314, 27, 10, NULL, '18.00', '0.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KOQt2sPyIybNgh', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-01 13:25:56', '2022-10-01 13:48:35', '0.00', '162.00', 'part', '2022-10-01 16:25:00', NULL, '6983', '2022-10-01 13:25:56', NULL, '2022-10-01 13:26:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958211\",\"latitude\":\"22.7286944\"}', 1, '20.00', '0.00', NULL, '0.00', 0),
(100315, 27, 11, NULL, '0.00', '14.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'wallet', 'wallet_RuuV3lxbNzVu', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-01 13:36:05', '2022-10-01 13:44:51', '0.00', '140.00', 'part', '2022-10-01 18:34:00', NULL, '1655', '2022-10-01 13:36:05', NULL, '2022-10-01 13:36:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958211\",\"latitude\":\"22.7286944\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100316, 36, 11, NULL, '209.00', '0.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KOThbsyeXf82wK', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-01 16:10:30', '2022-10-01 16:14:57', '0.00', '0.00', 'full', '2022-10-02 16:09:00', NULL, '2456', '2022-10-01 16:10:30', NULL, '2022-10-01 16:11:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100317, 37, 11, NULL, '190.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'razor_pay', 'pay_KOTmm4gFRWZV3S', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-01 16:15:13', '2022-10-01 16:24:08', '0.00', '0.00', 'full', '2022-10-02 16:14:00', NULL, '4825', '2022-10-01 16:15:13', NULL, '2022-10-01 16:16:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100318, 37, 11, NULL, '209.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'razor_pay', 'pay_KOUFBIuBhI7sUo', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-01 16:41:50', '2022-10-01 16:45:03', '0.00', '0.00', 'full', '2022-10-02 16:41:00', NULL, '1134', '2022-10-01 16:41:50', NULL, '2022-10-01 16:43:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100319, 37, 11, NULL, '209.00', '0.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KOUK3qPInG7kDq', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-01 16:47:32', '2022-10-01 16:49:58', '0.00', '0.00', 'full', '2022-10-02 16:43:00', NULL, '6106', '2022-10-01 16:47:32', NULL, '2022-10-01 16:48:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100320, 37, 11, NULL, '209.00', '0.00', '0.00', NULL, 'paid', 'confirmed', '0.00', 'razor_pay', 'pay_KOULYP2lCMxknQ', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-01 16:48:57', '2022-10-01 16:49:58', '0.00', '0.00', 'full', '2022-10-02 16:48:00', NULL, '8124', '2022-10-01 16:48:57', NULL, '2022-10-01 16:49:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100321, 37, 11, NULL, '0.00', '209.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'wallet', 'wallet_9GXP1WtPCMXH', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-01 17:16:59', '2022-11-07 16:44:14', '0.00', '0.00', 'full', '2022-10-02 17:15:00', NULL, '1337', '2022-10-01 17:16:59', NULL, '2022-10-01 17:17:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100322, 5, 10, NULL, '264.00', '26.00', '0.00', NULL, 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-01 18:20:01', '2022-10-04 02:28:20', '0.00', '0.00', 'full', '2022-10-02 13:49:00', NULL, '2338', '2022-10-01 18:20:01', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-04 02:28:20', NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100323, 5, 11, NULL, '209.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '19.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-01 18:20:54', '2022-10-04 18:55:19', '0.00', '0.00', 'full', '2022-10-02 13:50:00', NULL, '2520', '2022-10-01 18:20:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100324, 5, 11, NULL, '209.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '19.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-01 18:37:40', '2022-10-04 18:55:19', '0.00', '0.00', 'full', '2022-10-02 13:53:00', NULL, '8582', '2022-10-01 18:37:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100325, 5, 11, NULL, '190.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-01 18:44:19', '2022-10-04 18:55:19', '0.00', '0.00', 'full', '2022-10-02 14:14:00', NULL, '4598', '2022-10-01 18:44:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287821233273\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100326, 37, 11, NULL, '209.00', '0.00', '0.00', NULL, 'paid', 'delivered', '19.00', 'cash_on_delivery', 'pay_KOWLefWYRly6NU', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-01 18:46:14', '2022-10-01 18:56:52', '0.00', '0.00', 'full', '2022-10-02 18:45:00', NULL, '3482', '2022-10-01 18:46:14', NULL, '2022-10-01 18:47:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100327, 27, 11, NULL, '19.00', '0.00', '10.00', NULL, 'paid', 'confirmed', '18.00', 'razor_pay', 'pay_KOWXcrdtE7QHsa', NULL, NULL, '123456', NULL, 'service', 1, '2022-10-01 18:57:45', '2022-10-01 18:58:22', '0.00', '179.00', 'part', '2022-10-01 19:57:00', NULL, '1654', '2022-10-01 18:57:45', NULL, '2022-10-01 18:58:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-402, Anmol Spaces, Khajrana Main Rd, Shree Nagar Ext, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958307\",\"latitude\":\"22.7287198\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100328, 37, 11, NULL, '0.00', '19.00', '0.00', NULL, 'paid', 'delivered', '19.00', 'cash_on_delivery', 'wallet_fhVZPstqL3bB', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-01 19:06:27', '2022-10-01 19:07:31', '0.00', '190.00', 'part', '2022-10-01 21:01:00', NULL, '9405', '2022-10-01 19:06:27', NULL, '2022-10-01 19:06:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100329, 27, 11, NULL, '19.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '19.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 11:29:03', '2022-10-05 17:39:51', '0.00', '190.00', 'part', '2022-10-03 20:16:00', NULL, '7477', '2022-10-03 11:29:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"419, AB Rd, near choithram mandi, Amitesh Nagar, Choitram compound, Indore, Madhya Pradesh 452014, India\",\"longitude\":\"75.85355523973703\",\"latitude\":\"22.683116341894877\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100330, 27, 11, NULL, '19.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '19.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 11:30:03', '2022-10-05 17:39:51', '0.00', '190.00', 'part', '2022-10-03 15:29:00', NULL, '7142', '2022-10-03 11:30:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"419, AB Rd, near choithram mandi, Amitesh Nagar, Choitram compound, Indore, Madhya Pradesh 452014, India\",\"longitude\":\"75.85355523973703\",\"latitude\":\"22.683116341894877\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100331, 27, 11, NULL, '0.00', '19.00', '10.00', NULL, 'paid', 'delivered', '18.00', 'wallet', 'wallet_ty8o6qo3CWoq', NULL, NULL, '123456', NULL, 'service', 1, '2022-10-03 11:31:12', '2022-10-03 11:35:16', '0.00', '179.00', 'part', '2022-10-03 15:30:00', NULL, '7009', '2022-10-03 11:31:12', NULL, '2022-10-03 11:31:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"419, AB Rd, near choithram mandi, Amitesh Nagar, Choitram compound, Indore, Madhya Pradesh 452014, India\",\"longitude\":\"75.85355523973703\",\"latitude\":\"22.683116341894877\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100332, 27, 11, NULL, '0.00', '209.00', '0.00', NULL, 'paid', 'delivered', '19.00', 'wallet', 'wallet_xZ4UzRIu0fRu', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 11:38:00', '2022-10-03 11:40:15', '0.00', '0.00', 'full', '2022-10-04 16:37:00', NULL, '9606', '2022-10-03 11:38:00', NULL, '2022-10-03 11:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"419, AB Rd, near choithram mandi, Amitesh Nagar, Choitram compound, Indore, Madhya Pradesh 452014, India\",\"longitude\":\"75.85355523973703\",\"latitude\":\"22.683116341894877\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100333, 27, 11, NULL, '0.00', '19.00', '0.00', NULL, 'paid', 'canceled', '19.00', 'wallet', 'wallet_4zxjXdK16i02', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 11:42:50', '2022-10-03 11:44:22', '0.00', '190.00', 'part', '2022-10-03 16:42:00', NULL, '1907', '2022-10-03 11:42:50', NULL, '2022-10-03 11:42:50', NULL, NULL, NULL, NULL, '2022-10-03 11:44:22', NULL, NULL, '{\"address\":\"419, AB Rd, near choithram mandi, Amitesh Nagar, Choitram compound, Indore, Madhya Pradesh 452014, India\",\"longitude\":\"75.85355523973703\",\"latitude\":\"22.683116341894877\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100334, 37, 11, NULL, '179.00', '19.00', '10.00', NULL, 'paid', 'delivered', '18.00', 'cash_on_delivery', 'pay_KPCe3gqdTRGFqb', NULL, NULL, '123456', NULL, 'service', 1, '2022-10-03 12:08:48', '2022-10-03 12:17:47', '0.00', '0.00', 'full', '2022-10-04 12:08:00', NULL, '4430', '2022-10-03 12:08:48', NULL, '2022-10-03 12:09:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100335, 23, 11, NULL, '209.00', '0.00', '0.00', NULL, 'paid', 'accepted', '19.00', 'razor_pay', 'pay_KPGuNbHoshjLKD', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 16:18:48', '2022-10-03 16:21:03', '0.00', '0.00', 'full', '2022-10-04 16:18:00', NULL, '3361', '2022-10-03 16:18:48', NULL, '2022-10-03 16:19:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958261\",\"latitude\":\"22.7286995\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100336, 51, 11, NULL, '198.00', '0.00', '10.00', NULL, 'paid', 'canceled', '18.00', 'razor_pay', 'pay_KPHJ4rnCYoB71B', NULL, NULL, '123456', NULL, 'service', 1, '2022-10-03 16:42:28', '2023-01-09 13:56:46', '0.00', '0.00', 'full', '2022-10-04 18:29:00', NULL, '7971', '2022-10-03 16:42:28', NULL, '2022-10-03 16:43:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958219\",\"latitude\":\"22.7286974\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100337, 23, 11, NULL, '209.00', '0.00', '0.00', NULL, 'paid', 'confirmed', '19.00', 'razor_pay', 'pay_KPHXfiRfBloYrI', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 16:56:13', '2022-10-03 17:44:39', '0.00', '0.00', 'full', '2022-10-04 16:56:00', NULL, '6906', '2022-10-03 16:56:13', NULL, '2022-10-03 16:57:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958261\",\"latitude\":\"22.7286995\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100338, 5, 11, NULL, '869.00', '0.00', '0.00', NULL, 'paid', 'delivered', '79.00', 'cash_on_delivery', 'pay_KPI4OINr284csF', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 17:27:16', '2022-10-05 20:49:31', '0.00', '0.00', 'full', '2022-10-04 12:57:00', NULL, '6447', '2022-10-03 17:27:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100339, 52, 11, NULL, '790.00', '0.00', '0.00', NULL, 'paid', 'processing', '0.00', 'razor_pay', 'pay_KPILgfy7Nn9oZ6', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 17:43:34', '2023-01-07 18:18:14', '0.00', '0.00', 'full', '2022-10-04 13:13:00', NULL, '4755', '2022-10-03 17:43:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100340, 23, 11, NULL, '209.00', '0.00', '0.00', NULL, 'paid', 'delivered', '19.00', 'cash_on_delivery', 'pay_KPIZraBJT3JrzL', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 17:57:05', '2022-11-07 13:04:00', '0.00', '0.00', 'full', '2022-10-04 19:56:00', NULL, '6251', '2022-10-03 17:57:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958261\",\"latitude\":\"22.7286995\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100341, 51, 10, NULL, '18.00', '0.00', '0.00', NULL, 'paid', 'refunded', '0.00', 'razor_pay', 'pay_KPIzSU3NsJ7Ot8', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 18:21:31', '2022-11-07 12:27:47', '0.00', '162.00', 'part', '2022-10-03 19:21:00', NULL, '8356', '2022-10-03 18:21:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958219\",\"latitude\":\"22.7286974\"}', 1, '20.00', '0.00', NULL, '0.00', 0),
(100342, 23, 11, NULL, '209.00', '0.00', '0.00', NULL, 'paid', 'processing', '19.00', 'razor_pay', 'pay_KPKGEkskZW5zaX', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 19:35:47', '2022-11-16 15:07:01', '0.00', '0.00', 'full', '2022-10-04 19:35:00', NULL, '3467', '2022-10-03 19:35:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958261\",\"latitude\":\"22.7286995\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100343, 52, 11, NULL, '790.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 20:41:13', '2022-11-14 12:15:40', '0.00', '0.00', 'full', '2022-10-04 16:11:00', NULL, '2704', '2022-10-03 20:41:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100344, 52, 11, NULL, '869.00', '0.00', '0.00', NULL, 'paid', 'delivered', '79.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 20:48:34', '2022-11-07 16:38:35', '0.00', '0.00', 'full', '2022-10-04 16:18:00', NULL, '9970', '2022-10-03 20:48:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100345, 37, 11, NULL, '189.00', '20.00', '0.00', NULL, 'paid', 'canceled', '19.00', 'razor_pay', 'pay_KPLXeqgTusbkuC', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 20:50:42', '2022-10-03 21:22:55', '0.00', '0.00', 'full', '2022-10-04 20:50:00', NULL, '2076', '2022-10-03 20:50:42', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-03 20:51:59', NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958248\",\"latitude\":\"22.7286817\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100346, 37, 11, NULL, '189.00', '20.00', '0.00', NULL, 'paid', 'canceled', '19.00', 'razor_pay', 'pay_KPLZtSd0qOCfWA', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 20:53:06', '2022-10-03 21:22:55', '0.00', '0.00', 'full', '2022-10-04 18:37:00', NULL, '2013', '2022-10-03 20:53:06', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-03 20:54:44', NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958248\",\"latitude\":\"22.7286817\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100347, 37, 11, NULL, '209.00', '0.00', '0.00', NULL, 'paid', 'canceled', '19.00', 'razor_pay', 'pay_KPLdPbGdH616PL', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 20:56:29', '2022-10-03 21:22:55', '0.00', '0.00', 'full', '2022-10-04 20:55:00', NULL, '4299', '2022-10-03 20:56:29', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-03 20:58:05', NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958248\",\"latitude\":\"22.7286817\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100348, 52, 10, NULL, '290.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 21:21:16', '2022-11-14 12:06:48', '0.00', '0.00', 'full', '2022-10-11 16:51:00', NULL, '5282', '2022-10-03 21:21:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100349, 5, 10, NULL, '261.00', '29.00', '0.00', NULL, 'paid', 'canceled', '0.00', 'razor_pay', 'pay_KPM8t1RWJmjkP6', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 21:26:09', '2022-10-03 21:27:33', '0.00', '0.00', 'full', '2022-10-04 16:54:00', NULL, '6626', '2022-10-03 21:26:09', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-03 21:27:33', NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100350, 5, 10, NULL, '261.00', '29.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 21:52:39', '2022-10-04 18:55:19', '0.00', '0.00', 'full', '2022-10-04 17:22:00', NULL, '1206', '2022-10-03 21:52:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100351, 5, 10, NULL, '290.00', '0.00', '0.00', NULL, 'paid', 'refunded', '0.00', 'razor_pay', 'pay_KPMbUjTID9KoXu', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 21:53:34', '2022-10-04 07:56:40', '0.00', '0.00', 'full', '2022-10-04 17:22:00', NULL, '8984', '2022-10-03 21:53:34', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-03 21:54:56', NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100352, 51, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'delivered', '19.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 21:59:25', '2022-11-07 11:57:33', '0.00', '190.00', 'part', '2022-10-03 22:59:00', NULL, '3647', '2022-10-03 21:59:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958219\",\"latitude\":\"22.7286974\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100353, 27, 10, NULL, '18.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', 'pay_KPNGd3MfVsbpkl', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 22:32:26', '2022-10-03 22:34:24', '0.00', '162.00', 'part', '2022-10-03 23:32:00', NULL, '4916', '2022-10-03 22:32:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"MVH7+XFJ, Ambikapuri, Indore, Madhya Pradesh 452020, India\",\"longitude\":\"75.8637164\",\"latitude\":\"22.679962\"}', 1, '20.00', '0.00', NULL, '0.00', 0),
(100354, 27, 10, NULL, '14.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', 'pay_KPNMKRkNAC95Os', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 22:37:54', '2022-10-03 22:39:41', '0.00', '126.00', 'part', '2022-10-03 23:36:00', NULL, '3479', '2022-10-03 22:37:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"MVH7+XFJ, Ambikapuri, Indore, Madhya Pradesh 452020, India\",\"longitude\":\"75.8637164\",\"latitude\":\"22.679962\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100355, 27, 9, NULL, '14.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', 'pay_KPNP7t0BDRxKGl', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 22:40:36', '2022-10-03 22:41:58', '0.00', '126.00', 'part', '2022-10-03 23:40:00', NULL, '2202', '2022-10-03 22:40:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"MVH7+XFJ, Ambikapuri, Indore, Madhya Pradesh 452020, India\",\"longitude\":\"75.8637164\",\"latitude\":\"22.679962\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100356, 27, 12, NULL, '17.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', 'pay_KPNTiETa12jWzn', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-03 22:43:33', '2022-10-03 22:46:18', '0.00', '153.00', 'part', '2022-10-03 23:43:00', NULL, '3953', '2022-10-03 22:43:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"MVH7+XFJ, Ambikapuri, Indore, Madhya Pradesh 452020, India\",\"longitude\":\"75.8637164\",\"latitude\":\"22.679962\"}', 1, '30.00', '0.00', NULL, '0.00', 0),
(100357, 5, 10, NULL, '18.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 03:33:32', '2022-10-04 18:55:16', '0.00', '162.00', 'part', '2022-10-03 23:58:00', NULL, '6290', '2022-10-04 03:33:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '20.00', '0.00', NULL, '0.00', 0),
(100358, 37, 11, NULL, '0.00', '19.00', '0.00', NULL, 'paid', 'delivered', '19.00', 'cash_on_delivery', 'wallet_6jDyiYnR6B1j', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 06:33:46', '2022-10-04 10:43:42', '0.00', '190.00', 'part', '2022-10-04 16:17:00', NULL, '9363', '2022-10-04 06:33:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958248\",\"latitude\":\"22.7286817\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100359, 37, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'refunded', '19.00', 'razor_pay', 'pay_KPXqIJKb9Eexf4', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 08:52:42', '2022-10-04 08:55:07', '0.00', '190.00', 'part', '2022-10-04 17:52:00', NULL, '3313', '2022-10-04 08:52:42', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-04 08:54:06', NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958248\",\"latitude\":\"22.7286817\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100360, 37, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'delivered', '19.00', 'cash_on_delivery', 'pay_KPXvGoGFX5t1v9', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 08:57:25', '2022-10-04 09:02:05', '0.00', '190.00', 'part', '2022-10-04 17:16:00', NULL, '6967', '2022-10-04 08:57:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958248\",\"latitude\":\"22.7286817\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100361, 37, 11, NULL, '696.00', '173.00', '0.00', NULL, 'paid', 'delivered', '79.00', 'cash_on_delivery', 'pay_KPZMOwsYp7fF0u', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 10:21:22', '2022-10-04 10:41:51', '0.00', '0.00', 'full', '2022-10-05 10:21:00', NULL, '1437', '2022-10-04 10:21:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100362, 27, 11, NULL, '19.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '19.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 10:27:51', '2022-10-05 17:39:51', '0.00', '190.00', 'part', '2022-10-04 12:27:00', NULL, '8881', '2022-10-04 10:27:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"MVH7+XFJ, Ambikapuri, Indore, Madhya Pradesh 452020, India\",\"longitude\":\"75.8637164\",\"latitude\":\"22.679962\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100363, 27, 10, NULL, '18.00', '0.00', '0.00', NULL, 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 10:29:47', '2022-10-04 10:55:46', '0.00', '162.00', 'part', '2022-10-04 13:29:00', NULL, '4673', '2022-10-04 10:29:47', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-04 10:55:46', NULL, NULL, '{\"address\":\"MVH7+XFJ, Ambikapuri, Indore, Madhya Pradesh 452020, India\",\"longitude\":\"75.8637164\",\"latitude\":\"22.679962\"}', 1, '20.00', '0.00', NULL, '0.00', 0),
(100364, 27, 10, NULL, '14.00', '0.00', '0.00', NULL, 'unpaid', 'canceled', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 10:34:38', '2022-10-04 10:47:12', '0.00', '126.00', 'part', '2022-10-04 22:34:00', NULL, '2359', '2022-10-04 10:34:38', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-04 10:47:12', NULL, NULL, '{\"address\":\"MVH7+XFJ, Ambikapuri, Indore, Madhya Pradesh 452020, India\",\"longitude\":\"75.8637164\",\"latitude\":\"22.679962\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100365, 27, 11, NULL, '209.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '19.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 10:59:53', '2022-10-05 17:39:51', '0.00', '0.00', 'full', '2022-10-05 00:59:00', NULL, '4914', '2022-10-04 10:59:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"MVH7+XFJ, Ambikapuri, Indore, Madhya Pradesh 452020, India\",\"longitude\":\"75.8637164\",\"latitude\":\"22.679962\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100366, 27, 11, NULL, '209.00', '0.00', '0.00', NULL, 'paid', 'refunded', '19.00', 'razor_pay', 'pay_KPa0vrK3ReMsBF', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 11:00:41', '2022-10-04 11:02:15', '0.00', '0.00', 'full', '2022-10-05 00:00:00', NULL, '3006', '2022-10-04 11:00:41', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-04 11:01:28', NULL, NULL, '{\"address\":\"MVH7+XFJ, Ambikapuri, Indore, Madhya Pradesh 452020, India\",\"longitude\":\"75.8637164\",\"latitude\":\"22.679962\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100367, 27, 11, NULL, '209.00', '0.00', '0.00', NULL, 'unpaid', 'canceled', '19.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 11:05:38', '2022-10-04 11:19:46', '0.00', '0.00', 'full', '2022-10-05 17:05:00', NULL, '3596', '2022-10-04 11:05:38', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-04 11:19:46', NULL, NULL, '{\"address\":\"MVH7+XFJ, Ambikapuri, Indore, Madhya Pradesh 452020, India\",\"longitude\":\"75.8637164\",\"latitude\":\"22.679962\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100368, 27, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'refunded', '19.00', 'razor_pay', 'pay_KPa9JdsxiCXCwc', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 11:08:25', '2022-10-04 11:10:40', '0.00', '190.00', 'part', '2022-10-04 16:08:00', NULL, '8781', '2022-10-04 11:08:25', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-04 11:09:32', NULL, NULL, '{\"address\":\"MVH7+XFJ, Ambikapuri, Indore, Madhya Pradesh 452020, India\",\"longitude\":\"75.8637164\",\"latitude\":\"22.679962\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100369, 27, 11, NULL, '189.00', '20.00', '0.00', NULL, 'paid', 'refunded', '19.00', 'razor_pay', 'pay_KPaBoSiJMBhSsh', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 11:10:57', '2022-10-04 11:13:21', '0.00', '0.00', 'full', '2022-10-05 15:10:00', NULL, '1373', '2022-10-04 11:10:57', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-04 11:12:05', NULL, NULL, '{\"address\":\"MVH7+XFJ, Ambikapuri, Indore, Madhya Pradesh 452020, India\",\"longitude\":\"75.8637164\",\"latitude\":\"22.679962\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100370, 27, 11, NULL, '159.00', '0.00', '0.00', NULL, 'paid', 'refunded', '159.00', 'razor_pay', 'pay_KPaMZLi0vjEvmt', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 11:21:07', '2022-10-04 11:22:30', '0.00', '1590.00', 'part', '2022-10-04 17:20:00', NULL, '9372', '2022-10-04 11:21:07', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-04 11:21:51', NULL, NULL, '{\"address\":\"MVH7+XFJ, Ambikapuri, Indore, Madhya Pradesh 452020, India\",\"longitude\":\"75.8637164\",\"latitude\":\"22.679962\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100371, 37, 11, NULL, '696.00', '173.00', '0.00', NULL, 'paid', 'delivered', '79.00', 'cash_on_delivery', 'pay_KPabsVlo5PArCk', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 11:34:37', '2022-10-20 17:43:53', '0.00', '0.00', 'full', '2022-10-05 11:34:00', NULL, '7509', '2022-10-04 11:34:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100372, 37, 11, NULL, '0.00', '79.00', '0.00', NULL, 'paid', 'delivered', '79.00', 'cash_on_delivery', 'wallet_HJF4rgkbFJSX', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 11:38:59', '2022-10-20 11:13:29', '0.00', '790.00', 'part', '2022-10-04 14:37:00', NULL, '4996', '2022-10-04 11:38:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.71956881492173\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100373, 27, 11, NULL, '0.00', '19.00', '10.00', NULL, 'paid', 'delivered', '18.00', 'cash_on_delivery', 'wallet_pM0Czc1Ov9rn', NULL, NULL, '123456', NULL, 'service', 1, '2022-10-04 12:13:33', '2022-10-17 15:54:57', '0.00', '179.00', 'part', '2022-10-04 13:12:00', NULL, '1009', '2022-10-04 12:13:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-402, Anmol Spaces, Khajrana Main Rd, Shree Nagar Ext, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958342\",\"latitude\":\"22.728711\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100374, 27, 11, NULL, '0.00', '159.00', '0.00', NULL, 'paid', 'delivered', '159.00', 'cash_on_delivery', 'wallet_hnnuP1n0aWo5', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 12:25:36', '2022-10-17 11:36:23', '0.00', '1590.00', 'part', '2022-10-04 13:16:00', NULL, '7422', '2022-10-04 12:25:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-402, Anmol Spaces, Khajrana Main Rd, Shree Nagar Ext, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958342\",\"latitude\":\"22.728711\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100375, 5, 10, NULL, '290.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 13:53:23', '2022-10-04 18:55:16', '0.00', '0.00', 'full', '2022-10-04 23:01:00', NULL, '2210', '2022-10-04 13:53:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100376, 5, 10, NULL, '290.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 13:54:50', '2022-10-04 18:55:16', '0.00', '0.00', 'full', '2022-10-05 10:24:00', NULL, '8124', '2022-10-04 13:54:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100377, 5, 10, NULL, '290.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 13:55:28', '2022-10-04 18:55:16', '0.00', '0.00', 'full', '2022-10-05 09:25:00', NULL, '2816', '2022-10-04 13:55:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100378, 23, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'services_ongoing', '19.00', 'razor_pay', 'pay_KPd4WcePSkZrDY', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 13:59:52', '2022-10-04 14:08:18', '0.00', '190.00', 'part', '2022-10-04 17:59:00', NULL, '2044', '2022-10-04 13:59:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958261\",\"latitude\":\"22.7286995\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100379, 5, 10, NULL, '180.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 14:20:38', '2022-10-04 18:55:16', '0.00', '0.00', 'full', '2022-10-05 09:50:00', NULL, '1279', '2022-10-04 14:20:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '20.00', '0.00', NULL, '0.00', 0),
(100380, 5, 11, NULL, '209.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '19.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 14:22:45', '2022-10-04 18:55:16', '0.00', '0.00', 'full', '2022-10-05 09:52:00', NULL, '7584', '2022-10-04 14:22:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100381, 5, 10, NULL, '290.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 15:27:46', '2022-10-04 18:55:16', '0.00', '0.00', 'full', '2022-10-05 10:57:00', NULL, '4803', '2022-10-04 15:27:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100382, 5, 10, NULL, '290.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 16:48:51', '2022-10-05 17:43:47', '0.00', '0.00', 'full', '2022-10-05 12:18:00', NULL, '2736', '2022-10-04 16:48:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100383, 5, 11, NULL, '209.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '19.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 17:33:38', '2022-10-05 17:43:47', '0.00', '0.00', 'full', '2022-10-05 13:03:00', NULL, '9892', '2022-10-04 17:33:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100384, 5, 11, NULL, '209.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '19.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 17:34:51', '2022-10-05 17:43:47', '0.00', '0.00', 'full', '2022-10-05 13:04:00', NULL, '2567', '2022-10-04 17:34:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100385, 5, 10, NULL, '290.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 18:56:23', '2022-10-05 17:43:47', '0.00', '0.00', 'full', '2022-10-05 13:09:00', NULL, '7558', '2022-10-04 18:56:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100386, 23, 11, NULL, '209.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '19.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-04 19:01:11', '2022-10-05 17:43:47', '0.00', '0.00', 'full', '2022-10-05 17:00:00', NULL, '5389', '2022-10-04 19:01:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958261\",\"latitude\":\"22.7286995\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100387, 27, 11, NULL, '0.00', '79.00', '10.00', NULL, 'paid', 'delivered', '78.00', 'wallet', 'wallet_HrOWXZDfUhhB', NULL, NULL, '123456', NULL, 'service', 1, '2022-10-05 17:41:35', '2022-10-15 19:14:16', '0.00', '779.00', 'part', '2022-10-05 18:40:00', NULL, '7453', '2022-10-05 17:41:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958269\",\"latitude\":\"22.7287024\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100388, 27, 10, NULL, '0.00', '18.00', '0.00', NULL, 'paid', 'refunded', '0.00', 'wallet', 'wallet_MSvYzw8jiHI5', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-05 17:48:12', '2022-10-18 12:13:37', '0.00', '162.00', 'part', '2022-10-05 18:47:00', NULL, '4662', '2022-10-05 17:48:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958269\",\"latitude\":\"22.7287024\"}', 1, '20.00', '0.00', NULL, '0.00', 0),
(100389, 37, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'delivered', '19.00', 'cash_on_delivery', 'pay_KQ5XgpQy3C7si3', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-05 17:50:46', '2022-10-17 10:53:48', '0.00', '190.00', 'part', '2022-10-05 23:50:00', NULL, '6772', '2022-10-05 17:50:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"354, 354, A.B. Road, Vikas Nagar, Mishrilal Nagar, Ganga Nagar, Dewas, Madhya Pradesh 455001, India\",\"longitude\":\"76.0341493\",\"latitude\":\"22.9538243\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100390, 27, 11, NULL, '79.00', '0.00', '0.00', NULL, 'paid', 'failed', '79.00', 'razor_pay', 'pay_KQ5YLUtSQWfEHt', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-05 17:51:35', '2022-10-05 17:53:05', '0.00', '790.00', 'part', '2022-10-05 18:51:00', NULL, '2741', '2022-10-05 17:51:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958269\",\"latitude\":\"22.7287024\"}', 1, '10.00', '0.00', '2022-10-05 17:53:05', '0.00', 0);
INSERT INTO `orders` (`id`, `user_id`, `vendor_id`, `restaurant_id`, `order_amount`, `wallet_amount`, `coupon_discount_amount`, `coupon_discount_title`, `payment_status`, `order_status`, `total_tax_amount`, `payment_method`, `transaction_reference`, `delivery_address_id`, `delivery_man_id`, `coupon_code`, `order_note`, `order_type`, `checked`, `created_at`, `updated_at`, `delivery_charge`, `due_amount`, `payment_type`, `schedule_at`, `callback`, `otp`, `pending`, `accepted`, `confirmed`, `processing`, `handover`, `picked_up`, `delivered`, `canceled`, `refund_requested`, `refunded`, `delivery_address`, `scheduled`, `restaurant_discount_amount`, `original_delivery_charge`, `failed`, `adjusment`, `edited`) VALUES
(100391, 37, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'failed', '19.00', 'razor_pay', 'pay_KQ5YwBHncl4iUv', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-05 17:52:24', '2022-10-05 17:54:23', '0.00', '190.00', 'part', '2022-10-05 21:52:00', NULL, '5867', '2022-10-05 17:52:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"354, 354, A.B. Road, Vikas Nagar, Mishrilal Nagar, Ganga Nagar, Dewas, Madhya Pradesh 455001, India\",\"longitude\":\"76.0341493\",\"latitude\":\"22.9538243\"}', 1, '10.00', '0.00', '2022-10-05 17:54:23', '0.00', 0),
(100392, 27, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'failed', '19.00', 'razor_pay', 'pay_KQ5aTWVoVFc72c', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-05 17:53:48', '2022-10-05 17:55:27', '0.00', '190.00', 'part', '2022-10-05 18:53:00', NULL, '3516', '2022-10-05 17:53:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958269\",\"latitude\":\"22.7287024\"}', 1, '10.00', '0.00', '2022-10-05 17:55:27', '0.00', 0),
(100393, 37, 11, NULL, '189.00', '20.00', '0.00', NULL, 'paid', 'delivered', '19.00', 'cash_on_delivery', 'pay_KQ5f5gaS7kyY8T', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-05 17:57:57', '2022-10-05 20:44:39', '0.00', '0.00', 'full', '2022-10-06 17:57:00', NULL, '4028', '2022-10-05 17:57:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958248\",\"latitude\":\"22.7286817\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100394, 5, 11, NULL, '209.00', '0.00', '0.00', NULL, 'paid', 'failed', '19.00', 'razor_pay', 'pay_KQ5vYYflai5hli', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-05 18:13:20', '2022-10-05 18:24:12', '0.00', '0.00', 'full', '2022-10-06 13:43:00', NULL, '8895', '2022-10-05 18:13:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', '2022-10-05 18:24:12', '0.00', 0),
(100395, 5, 10, NULL, '290.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', 'pay_KQ67BNYP4gowNA', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-05 18:24:29', '2022-10-05 20:31:53', '0.00', '0.00', 'full', '2022-10-06 13:54:00', NULL, '9124', '2022-10-05 18:24:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100396, 50, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'failed', '19.00', 'razor_pay', 'pay_KQO4Hl1eMwrmQ1', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-06 11:57:26', '2022-10-06 12:10:27', '0.00', '190.00', 'part', '2022-10-06 15:57:00', NULL, '5307', '2022-10-06 11:57:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-402, Anmol Spaces, Khajrana Main Rd, Shree Nagar Ext, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958382\",\"latitude\":\"22.7287108\"}', 1, '10.00', '0.00', '2022-10-06 12:10:27', '0.00', 0),
(100397, 37, 11, NULL, '209.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '19.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-06 12:08:20', '2022-10-07 13:56:14', '0.00', '0.00', 'full', '2022-10-07 15:08:00', NULL, '5192', '2022-10-06 12:08:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958248\",\"latitude\":\"22.7286817\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100398, 27, 11, NULL, '79.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '79.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-06 12:08:33', '2022-10-06 12:10:55', '0.00', '790.00', 'part', '2022-10-06 14:08:00', NULL, '3439', '2022-10-06 12:08:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958269\",\"latitude\":\"22.7287024\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100399, 27, 11, NULL, '0.00', '79.00', '0.00', NULL, 'paid', 'canceled', '79.00', 'wallet', 'wallet_QQUmkVxU0Y7S', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-06 12:09:23', '2022-10-06 13:25:42', '0.00', '790.00', 'part', '2022-10-06 17:09:00', NULL, '9734', '2022-10-06 12:09:23', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-06 13:25:42', NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958269\",\"latitude\":\"22.7287024\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100400, 50, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'refunded', '19.00', 'razor_pay', 'pay_KQOIDut7CpFNeC', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-06 12:11:36', '2023-01-09 10:43:52', '0.00', '190.00', 'part', '2022-10-06 12:30:00', NULL, '3989', '2022-10-06 12:11:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-402, Anmol Spaces, Khajrana Main Rd, Shree Nagar Ext, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958382\",\"latitude\":\"22.7287108\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100401, 27, 11, NULL, '0.00', '19.00', '0.00', NULL, 'paid', 'delivered', '19.00', 'wallet', 'wallet_hiHzUgbObpga', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-06 13:13:42', '2022-10-06 13:19:49', '0.00', '190.00', 'part', '2022-10-06 17:11:00', NULL, '2663', '2022-10-06 13:13:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958229\",\"latitude\":\"22.7287008\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100402, 27, 11, NULL, '1225.00', '524.00', '0.00', NULL, 'paid', 'refunded', '159.00', 'razor_pay', 'pay_KQPWQjEAQR954z', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-06 13:23:12', '2022-10-06 13:27:31', '0.00', '0.00', 'full', '2022-10-07 16:22:00', NULL, '8941', '2022-10-06 13:23:12', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-06 13:25:11', NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958229\",\"latitude\":\"22.7287008\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100403, 27, 11, NULL, '696.00', '173.00', '0.00', NULL, 'unpaid', 'failed', '79.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-06 13:30:29', '2022-10-06 13:35:37', '0.00', '0.00', 'full', '2022-10-07 17:29:00', NULL, '8687', '2022-10-06 13:30:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958229\",\"latitude\":\"22.7287008\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100404, 27, 11, NULL, '869.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '79.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-06 13:31:39', '2022-10-06 13:35:37', '0.00', '0.00', 'full', '2022-10-07 13:31:00', NULL, '2603', '2022-10-06 13:31:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"PVHW+F88, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958229\",\"latitude\":\"22.7287008\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100405, 27, 11, NULL, '0.00', '19.00', '0.00', NULL, 'paid', 'services_ongoing', '19.00', 'wallet', 'wallet_V4xsGEmc9cDW', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-06 13:52:32', '2022-10-14 16:29:13', '0.00', '190.00', 'part', '2022-10-06 18:51:00', NULL, '5363', '2022-10-06 13:52:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-402, Anmol Spaces, Khajrana Main Rd, Shree Nagar Ext, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958371\",\"latitude\":\"22.7287269\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100406, 27, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'failed', '19.00', 'razor_pay', 'pay_KQQ9hxlPgsRot8', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-06 14:00:37', '2022-10-06 17:17:21', '0.00', '190.00', 'part', '2022-10-06 17:00:00', NULL, '8970', '2022-10-06 14:00:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"22, Khajrana Main Rd, Shree Nagar Ext, Ganeshpuri, Baikunth Dham, Indore, Madhya Pradesh 452001, India\",\"longitude\":\"75.8959298\",\"latitude\":\"22.7289407\"}', 1, '10.00', '0.00', '2022-10-06 17:17:21', '0.00', 0),
(100407, 21, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'delivered', '19.00', 'razor_pay', 'pay_KQoMo30GKLyvef', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-07 13:42:05', '2022-11-04 17:22:03', '0.00', '190.00', 'part', '2022-10-07 14:25:00', NULL, '4147', '2022-10-07 13:42:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"SHOP NO G 1, Sector 18, Noida, Uttar Pradesh 201301, India\",\"longitude\":\"77.3218529\",\"latitude\":\"28.5682136\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100408, 21, 10, NULL, '18.00', '0.00', '0.00', NULL, 'paid', 'canceled', '0.00', 'razor_pay', 'pay_KQoYaJerinpubi', NULL, NULL, NULL, NULL, 'service', 1, '2022-10-07 13:52:47', '2022-10-11 18:00:38', '0.00', '162.00', 'part', '2022-10-07 17:25:00', NULL, '3027', '2022-10-07 13:52:47', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-07 13:55:31', NULL, NULL, '{\"address\":\"SHOP NO G 1, Sector 18, Noida, Uttar Pradesh 201301, India\",\"longitude\":\"77.3218529\",\"latitude\":\"28.5682136\"}', 1, '20.00', '0.00', NULL, '0.00', 0),
(100409, 27, 12, NULL, '600.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-19 12:50:17', '2022-10-20 11:11:36', '0.00', '0.00', 'full', '2022-10-20 17:50:00', NULL, '8796', '2022-10-19 12:50:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958493\",\"latitude\":\"22.7286675\"}', 1, '100.00', '0.00', NULL, '0.00', 0),
(100410, 27, 9, NULL, '24.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-10-20 17:45:50', '2022-11-01 14:05:18', '0.00', '216.00', 'part', '2022-10-19 18:43:00', NULL, '3832', '2022-10-20 17:45:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"A-302, 452018, Anmol Spaces, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958515\",\"latitude\":\"22.7287032\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100411, 21, 9, NULL, '0.00', '14.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', 'wallet_8m6W0n826sVJ', NULL, NULL, NULL, NULL, 'service', 1, '2022-11-01 18:25:22', '2022-11-05 17:53:41', '0.00', '126.00', 'part', '2022-11-01 19:25:00', NULL, '4072', '2022-11-01 18:25:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Unknown Location Found\",\"longitude\":\"77.0388039\",\"latitude\":\"28.6230507\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100412, 21, 10, NULL, '140.00', '0.00', '0.00', NULL, 'paid', 'refunded', '0.00', 'razor_pay', 'pay_KamfyCsN5T58ua', NULL, NULL, NULL, 'Come fast', 'service', 1, '2022-11-01 18:32:24', '2022-11-16 10:54:02', '0.00', '0.00', 'full', '2022-11-02 17:15:00', NULL, '6560', '2022-11-01 18:32:24', NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-01 18:34:49', NULL, NULL, '{\"address\":\"Unknown Location Found\",\"longitude\":\"77.0388039\",\"latitude\":\"28.6230507\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100413, 21, 10, NULL, '180.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', 'pay_KamlsnrneySXqe', NULL, NULL, NULL, NULL, 'service', 1, '2022-11-01 18:38:29', '2022-11-07 10:33:32', '0.00', '0.00', 'full', '2022-11-02 15:30:00', NULL, '3822', '2022-11-01 18:38:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Unknown Location Found\",\"longitude\":\"77.0388039\",\"latitude\":\"28.6230507\"}', 1, '20.00', '0.00', NULL, '0.00', 0),
(100414, 5, 11, NULL, '869.00', '0.00', '0.00', NULL, 'paid', 'delivered', '79.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-02 14:50:22', '2022-11-05 13:49:54', '0.00', '0.00', 'full', '2022-11-08 10:20:00', NULL, '9176', '2022-11-02 14:50:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"India\",\"longitude\":\"78.96287620067596\",\"latitude\":\"20.593684008443244\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100415, 27, 11, NULL, '19.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '19.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-03 10:25:19', '2022-11-03 10:33:33', '0.00', '190.00', 'part', '2022-11-03 17:25:00', NULL, '1101', '2022-11-03 10:25:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"21, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452001, India\",\"longitude\":\"75.8958512\",\"latitude\":\"22.7287488\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100416, 27, 11, NULL, '869.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '79.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-03 10:27:00', '2022-11-03 10:33:33', '0.00', '0.00', 'full', '2022-11-04 12:26:00', NULL, '9159', '2022-11-03 10:27:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"21, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452001, India\",\"longitude\":\"75.8958512\",\"latitude\":\"22.7287488\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100417, 27, 11, NULL, '189.00', '20.00', '0.00', NULL, 'unpaid', 'failed', '19.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-03 10:31:25', '2022-11-03 10:33:33', '0.00', '0.00', 'full', '2022-11-04 22:30:00', NULL, '7129', '2022-11-03 10:31:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"21, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452001, India\",\"longitude\":\"75.8958512\",\"latitude\":\"22.7287488\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100418, 27, 11, NULL, '0.00', '79.00', '0.00', NULL, 'paid', 'delivered', '79.00', 'cash_on_delivery', 'wallet_PwuZV9SrOom7', NULL, NULL, NULL, NULL, 'service', 1, '2022-11-03 10:33:21', '2022-11-05 13:39:25', '0.00', '790.00', 'part', '2022-11-03 22:32:00', NULL, '4016', '2022-11-03 10:33:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"21, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452001, India\",\"longitude\":\"75.8958512\",\"latitude\":\"22.7287488\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100419, 27, 11, NULL, '79.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '79.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-03 10:36:10', '2022-11-03 11:13:34', '0.00', '790.00', 'part', '2022-11-03 22:35:00', NULL, '6319', '2022-11-03 10:36:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"21, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452001, India\",\"longitude\":\"75.8958512\",\"latitude\":\"22.7287488\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100420, 25, 11, NULL, '209.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '19.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-03 11:02:49', '2022-11-03 11:13:34', '0.00', '0.00', 'full', '2022-11-04 11:02:00', NULL, '4970', '2022-11-03 11:02:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.719571598268807\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100421, 25, 11, NULL, '209.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '19.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-03 11:56:11', '2022-11-03 13:44:35', '0.00', '0.00', 'full', '2022-11-04 11:55:00', NULL, '4846', '2022-11-03 11:56:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.719571598268807\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100422, 25, 12, NULL, '600.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-03 12:07:03', '2022-11-03 13:44:35', '0.00', '0.00', 'full', '2022-11-04 12:06:00', NULL, '6678', '2022-11-03 12:07:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.719571598268807\"}', 1, '100.00', '0.00', NULL, '0.00', 0),
(100423, 27, 12, NULL, '0.00', '80.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', 'wallet_VANj9bKIJ0bw', NULL, NULL, NULL, NULL, 'service', 1, '2022-11-03 12:40:19', '2022-11-05 17:52:17', '0.00', '720.00', 'part', '2022-11-03 14:40:00', NULL, '3833', '2022-11-03 12:40:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"21, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452001, India\",\"longitude\":\"75.895842\",\"latitude\":\"22.7287633\"}', 1, '100.00', '0.00', NULL, '0.00', 0),
(100424, 27, 12, NULL, '99.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-03 12:45:02', '2022-11-03 13:44:35', '0.00', '891.00', 'part', '2022-11-03 13:44:00', NULL, '5459', '2022-11-03 12:45:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"21, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452001, India\",\"longitude\":\"75.895842\",\"latitude\":\"22.7287633\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100425, 25, 12, NULL, '800.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-03 13:06:54', '2022-11-03 13:44:35', '0.00', '0.00', 'full', '2022-11-04 14:06:00', NULL, '7195', '2022-11-03 13:06:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.719571598268807\"}', 1, '100.00', '0.00', NULL, '0.00', 0),
(100426, 25, 12, NULL, '600.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', 'pay_KbV0QyzxCOybcU', NULL, NULL, NULL, NULL, 'service', 1, '2022-11-03 13:54:13', '2022-11-05 13:30:42', '0.00', '0.00', 'full', '2022-11-04 13:54:00', NULL, '7061', '2022-11-03 13:54:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.719571598268807\"}', 1, '100.00', '0.00', NULL, '0.00', 0),
(100427, 25, 11, NULL, '209.00', '0.00', '0.00', NULL, 'paid', 'delivered', '19.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-03 18:29:15', '2022-11-05 18:25:50', '0.00', '0.00', 'full', '2022-11-04 18:29:00', NULL, '2516', '2022-11-03 18:29:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.719571598268807\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100428, 25, 10, NULL, '180.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-03 18:47:40', '2022-11-04 11:37:58', '0.00', '0.00', 'full', '2022-11-04 18:47:00', NULL, '7500', '2022-11-03 18:47:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.719571598268807\"}', 1, '20.00', '0.00', NULL, '0.00', 0),
(100429, 21, 11, NULL, '209.00', '0.00', '0.00', NULL, 'paid', 'delivered', '19.00', 'cash_on_delivery', 'pay_KbwpzGQaU9x2wj', NULL, NULL, NULL, NULL, 'service', 1, '2022-11-04 17:08:11', '2022-11-05 13:25:39', '0.00', '0.00', 'full', '2022-11-05 14:20:00', NULL, '9830', '2022-11-04 17:08:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"B-38, Shivam, Block G, Janakpuri, Delhi, 110018\",\"longitude\":\"77.03885961323977\",\"latitude\":\"28.62309943430196\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100430, 21, 11, NULL, '1749.00', '0.00', '0.00', NULL, 'paid', 'delivered', '159.00', 'razor_pay', 'pay_Kbwz4IJqxOiqi0', NULL, NULL, NULL, NULL, 'service', 1, '2022-11-04 17:12:11', '2022-11-04 17:24:53', '0.00', '0.00', 'full', '2022-11-05 13:10:00', NULL, '4136', '2022-11-04 17:12:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"F- 1\\/4, Munirka Marg, Block F, Vasant Vihar, New Delhi, Delhi 110057, India\",\"longitude\":\"77.16199714690447\",\"latitude\":\"28.5580338430585\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100431, 21, 11, NULL, '869.00', '0.00', '0.00', NULL, 'paid', 'delivered', '79.00', 'cash_on_delivery', 'pay_KbxHgCFaGaHY0J', NULL, NULL, NULL, NULL, 'service', 1, '2022-11-04 17:34:32', '2022-11-05 13:22:50', '0.00', '0.00', 'full', '2022-11-05 12:05:00', NULL, '2128', '2022-11-04 17:34:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"F- 1\\/4, Munirka Marg, Block F, Vasant Vihar, New Delhi, Delhi 110057, India\",\"longitude\":\"77.16199714690447\",\"latitude\":\"28.5580338430585\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100432, 21, 11, NULL, '209.00', '0.00', '0.00', NULL, 'paid', 'delivered', '19.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-05 12:24:33', '2022-11-07 12:02:25', '0.00', '0.00', 'full', '2022-11-06 14:10:00', NULL, '7781', '2022-11-05 12:24:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"F- 1\\/4, Munirka Marg, Block F, Vasant Vihar, New Delhi, Delhi 110057, India\",\"longitude\":\"77.16199714690447\",\"latitude\":\"28.5580338430585\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100433, 27, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'delivered', '19.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-09 15:22:45', '2022-11-14 11:26:36', '0.00', '190.00', 'part', '2022-11-09 16:22:00', NULL, '8084', '2022-11-09 15:22:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"21, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452001, India\",\"longitude\":\"75.895842\",\"latitude\":\"22.7287633\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100434, 27, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'delivered', '19.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-11 11:48:05', '2022-11-11 11:49:03', '0.00', '190.00', 'part', '2022-11-11 15:47:00', NULL, '6213', '2022-11-11 11:48:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"21, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452001, India\",\"longitude\":\"75.895842\",\"latitude\":\"22.7287633\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100435, 27, 11, NULL, '19.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '19.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-15 11:31:22', '2022-11-18 11:30:29', '0.00', '190.00', 'part', '2022-11-15 13:30:00', NULL, '1626', '2022-11-15 11:31:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"21, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452001, India\",\"longitude\":\"75.8958469\",\"latitude\":\"22.7287518\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100436, 27, 11, NULL, '79.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '79.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-15 11:33:21', '2022-11-18 11:30:29', '0.00', '790.00', 'part', '2022-11-15 23:33:00', NULL, '3263', '2022-11-15 11:33:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"21, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452001, India\",\"longitude\":\"75.895848\",\"latitude\":\"22.7287749\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100437, 27, 11, NULL, '19.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '19.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-15 11:34:59', '2022-11-18 11:30:29', '0.00', '190.00', 'part', '2022-11-15 23:34:00', NULL, '7491', '2022-11-15 11:34:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"21, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452001, India\",\"longitude\":\"75.895848\",\"latitude\":\"22.7287749\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100438, 27, 11, NULL, '19.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '19.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-15 11:42:19', '2022-11-18 11:30:29', '0.00', '190.00', 'part', '2022-11-15 23:42:00', NULL, '7796', '2022-11-15 11:42:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"21, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452001, India\",\"longitude\":\"75.8958476409316\",\"latitude\":\"22.728773652665996\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100439, 27, 11, NULL, '19.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '19.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-15 11:46:28', '2022-11-18 11:30:29', '0.00', '190.00', 'part', '2022-11-15 23:46:00', NULL, '3344', '2022-11-15 11:46:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"21, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452001, India\",\"longitude\":\"75.8958476409316\",\"latitude\":\"22.728773652665996\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100440, 27, 11, NULL, '19.00', '0.00', '0.00', NULL, 'paid', 'delivered', '19.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2022-11-15 11:50:03', '2022-11-15 11:52:21', '0.00', '190.00', 'part', '2022-11-15 12:49:00', NULL, '4576', '2022-11-15 11:50:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"21, Khajrana Main Rd, Baikunth Dham, Indore, Madhya Pradesh 452001, India\",\"longitude\":\"75.8958476409316\",\"latitude\":\"22.728773652665996\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100441, 27, 9, NULL, '0.00', '14.00', '0.00', NULL, 'paid', 'pending', '0.00', 'wallet', 'wallet_d1a0SBy9VaKd', NULL, NULL, NULL, NULL, 'service', 1, '2023-01-10 10:31:34', '2023-01-10 10:31:41', '0.00', '126.00', 'part', '2023-01-10 22:30:00', NULL, '8736', '2023-01-10 10:31:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Anmol Spaces, Khajrana Main Rd, Shree Nagar Ext, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958522\",\"latitude\":\"22.7288062\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100442, 57, 23, NULL, '9.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', 'pay_L38ovKZUz1nZlK', NULL, NULL, NULL, NULL, 'service', 1, '2023-01-12 10:24:17', '2023-01-12 10:26:39', '0.00', '81.00', 'part', '2023-01-12 12:24:00', NULL, '9300', '2023-01-12 10:24:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Anmol Spaces, Khajrana Main Rd, Shree Nagar Ext, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958569\",\"latitude\":\"22.7288144\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100443, 57, 23, NULL, '9.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'razor_pay', 'pay_L38s5mEyAyyLHa', NULL, NULL, NULL, NULL, 'service', 1, '2023-01-12 10:27:36', '2023-01-12 10:31:38', '0.00', '81.00', 'part', '2023-01-12 12:27:00', NULL, '6721', '2023-01-12 10:27:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Anmol Spaces, Khajrana Main Rd, Shree Nagar Ext, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958569\",\"latitude\":\"22.7288144\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100444, 57, 23, NULL, '90.00', '0.00', '0.00', NULL, 'paid', 'processing', '0.00', 'razor_pay', 'pay_L38yMqxUHdCKWg', NULL, NULL, NULL, NULL, 'service', 1, '2023-01-12 10:33:36', '2023-01-12 10:34:28', '0.00', '0.00', 'full', '2023-01-13 00:33:00', NULL, '6279', '2023-01-12 10:33:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Anmol Spaces, Khajrana Main Rd, Shree Nagar Ext, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958569\",\"latitude\":\"22.7288144\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100445, 27, 23, NULL, '90.00', '0.00', '0.00', NULL, 'paid', 'processing', '0.00', 'razor_pay', 'pay_L39HGdu7fXz5sj', NULL, NULL, NULL, NULL, 'service', 1, '2023-01-12 10:51:25', '2023-01-12 11:36:12', '0.00', '0.00', 'full', '2023-01-13 10:51:00', NULL, '6226', '2023-01-12 10:51:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Anmol Spaces, Khajrana Main Rd, Shree Nagar Ext, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958543\",\"latitude\":\"22.7288211\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100446, 25, 23, NULL, '90.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', 'pay_L39eIlY8Aj1z5j', NULL, NULL, NULL, NULL, 'service', 1, '2023-01-12 11:08:02', '2023-01-12 13:49:50', '0.00', '0.00', 'full', '2023-01-13 11:07:00', NULL, '6197', '2023-01-12 11:08:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.719571598268807\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100447, 27, 23, NULL, '90.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', 'pay_L39ZVHv4D3g1N3', NULL, NULL, NULL, NULL, 'service', 1, '2023-01-12 11:08:44', '2023-01-12 11:10:59', '0.00', '0.00', 'full', '2023-01-13 23:08:00', NULL, '1782', '2023-01-12 11:08:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Anmol Spaces, Khajrana Main Rd, Shree Nagar Ext, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958543\",\"latitude\":\"22.7288211\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100448, 27, 23, NULL, '90.00', '0.00', '0.00', NULL, 'paid', 'processing', '0.00', 'razor_pay', 'pay_L39dFDkq7glYVb', NULL, NULL, NULL, NULL, 'service', 1, '2023-01-12 11:12:20', '2023-01-12 11:15:16', '0.00', '0.00', 'full', '2023-01-13 11:11:00', NULL, '8714', '2023-01-12 11:12:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Anmol Spaces, Khajrana Main Rd, Shree Nagar Ext, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958543\",\"latitude\":\"22.7288211\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100449, 25, 20, NULL, '90.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', 'pay_L39tKX7Souoyfv', NULL, NULL, NULL, NULL, 'service', 1, '2023-01-12 11:26:41', '2023-01-12 12:00:49', '0.00', '0.00', 'full', '2023-01-13 14:25:00', NULL, '4123', '2023-01-12 11:26:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.719571598268807\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100450, 27, 20, NULL, '90.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'cash_on_delivery', 'pay_L3A9x4SoGJ9fjI', NULL, NULL, NULL, NULL, 'service', 1, '2023-01-12 11:43:18', '2023-01-12 11:52:56', '0.00', '0.00', 'full', '2023-01-13 23:43:00', NULL, '3402', '2023-01-12 11:43:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Anmol Spaces, Khajrana Main Rd, Shree Nagar Ext, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958543\",\"latitude\":\"22.7288211\"}', 1, '10.00', '0.00', NULL, '0.00', 0),
(100451, 25, 20, NULL, '90.00', '0.00', '0.00', NULL, 'paid', 'failed', '0.00', 'razor_pay', 'pay_L3AX7mnuskc6ap', NULL, NULL, NULL, NULL, 'service', 1, '2023-01-12 12:04:14', '2023-01-12 12:11:30', '0.00', '810.00', 'part', '2023-01-12 13:03:00', NULL, '9782', '2023-01-12 12:04:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Indore, Madhya Pradesh, India\",\"longitude\":\"75.85772272199392\",\"latitude\":\"22.719571598268807\"}', 1, '100.00', '0.00', '2023-01-12 12:11:30', '0.00', 0),
(100452, 25, 20, NULL, '900.00', '0.00', '0.00', NULL, 'unpaid', 'failed', '0.00', 'online_payment', NULL, NULL, NULL, NULL, NULL, 'service', 1, '2023-01-12 13:48:43', '2023-01-12 13:50:06', '0.00', '0.00', 'full', '2023-01-13 13:48:00', NULL, '2831', '2023-01-12 13:48:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Anmol Spaces, Khajrana Main Rd, Shree Nagar Ext, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958547\",\"latitude\":\"22.7288189\"}', 1, '100.00', '0.00', NULL, '0.00', 0),
(100453, 25, 20, NULL, '900.00', '0.00', '0.00', NULL, 'paid', 'delivered', '0.00', 'razor_pay', 'pay_L3CKKW6BIfpseV', NULL, NULL, NULL, NULL, 'service', 1, '2023-01-12 13:50:26', '2023-01-12 13:51:57', '0.00', '0.00', 'full', '2023-01-13 13:50:00', NULL, '4315', '2023-01-12 13:50:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Anmol Spaces, Khajrana Main Rd, Shree Nagar Ext, Baikunth Dham, Indore, Madhya Pradesh 452018, India\",\"longitude\":\"75.8958547\",\"latitude\":\"22.7288189\"}', 1, '100.00', '0.00', NULL, '0.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_delivery_histories`
--

CREATE TABLE `order_delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `start_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `food_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_ons` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_on_food` decimal(24,2) DEFAULT NULL,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `quantity` int(11) NOT NULL DEFAULT 1,
  `tax_amount` decimal(24,2) NOT NULL DEFAULT 1.00,
  `variant` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_add_on_price` decimal(24,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `service_id`, `vendor_id`, `order_id`, `price`, `food_details`, `variation`, `add_ons`, `discount_on_food`, `discount_type`, `quantity`, `tax_amount`, `variant`, `created_at`, `updated_at`, `item_campaign_id`, `total_add_on_price`) VALUES
(1, 1, NULL, 100007, '100.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', '[]', '2022-08-10 01:05:36', '2022-08-10 01:05:36', NULL, '0.00'),
(2, 1, NULL, 100008, '100.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', '[]', '2022-08-10 01:06:48', '2022-08-10 01:06:48', NULL, '0.00'),
(3, 1, NULL, 100009, '100.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', '[]', '2022-08-10 01:07:34', '2022-08-10 01:07:34', NULL, '0.00'),
(4, 1, NULL, 100009, '100.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', '[]', '2022-08-10 01:07:34', '2022-08-10 01:07:34', NULL, '0.00'),
(5, 1, NULL, 100010, '100.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', '[]', '2022-08-10 01:11:46', '2022-08-10 01:11:46', NULL, '0.00'),
(6, 1, NULL, 100010, '100.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', '[]', '2022-08-10 01:11:46', '2022-08-10 01:11:46', NULL, '0.00'),
(7, 1, NULL, 100011, '100.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', '[]', '2022-08-10 01:16:09', '2022-08-10 01:16:09', NULL, '0.00'),
(8, 1, NULL, 100011, '100.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', '[]', '2022-08-10 01:16:09', '2022-08-10 01:16:09', NULL, '0.00'),
(9, 1, NULL, 100012, '100.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', '[]', '2022-08-10 01:16:40', '2022-08-10 01:16:40', NULL, '0.00'),
(10, 1, NULL, 100012, '100.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', '[]', '2022-08-10 01:16:40', '2022-08-10 01:16:40', NULL, '0.00'),
(11, 1, NULL, 100013, '100.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', '[]', '2022-08-10 01:16:40', '2022-08-10 01:16:40', NULL, '0.00'),
(12, 12, NULL, 100014, '475.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-08-15 17:21:25', '2022-08-15 17:21:25', NULL, '0.00'),
(13, 12, NULL, 100015, '475.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-08-15 17:50:20', '2022-08-15 17:50:20', NULL, '0.00'),
(14, 12, NULL, 100016, '720.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-08-15 17:56:30', '2022-08-15 17:56:30', NULL, '0.00'),
(15, 12, NULL, 100017, '475.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-08-15 18:04:41', '2022-08-15 18:04:41', NULL, '0.00'),
(16, 12, NULL, 100018, '475.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-08-15 18:22:56', '2022-08-15 18:22:56', NULL, '0.00'),
(17, 12, NULL, 100019, '475.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-08-15 19:49:43', '2022-08-15 19:49:43', NULL, '0.00'),
(18, 13, NULL, 100019, '250.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-08-15 19:49:43', '2022-08-15 19:49:43', NULL, '0.00'),
(19, 12, NULL, 100020, '475.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-08-15 19:56:45', '2022-08-15 19:56:45', NULL, '0.00'),
(20, 13, NULL, 100020, '250.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-08-15 19:56:45', '2022-08-15 19:56:45', NULL, '0.00'),
(21, 13, NULL, 100021, '250.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-08-17 03:54:45', '2022-08-17 03:54:45', NULL, '0.00'),
(22, 13, NULL, 100022, '250.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-08-17 06:35:31', '2022-08-17 06:35:31', NULL, '0.00'),
(23, 13, NULL, 100023, '250.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-08-18 05:12:43', '2022-08-18 05:12:43', NULL, '0.00'),
(24, 13, NULL, 100024, '250.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-08-18 22:49:41', '2022-08-18 22:49:41', NULL, '0.00'),
(25, 13, NULL, 100025, '250.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-08-21 23:20:34', '2022-08-21 23:20:34', NULL, '0.00'),
(26, 13, NULL, 100026, '250.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-08-22 00:05:45', '2022-08-22 00:05:45', NULL, '0.00'),
(27, 13, NULL, 100027, '250.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-08-22 00:31:13', '2022-08-22 00:31:13', NULL, '0.00'),
(28, 12, NULL, 100028, '475.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-08-22 00:33:25', '2022-08-22 00:33:25', NULL, '0.00'),
(29, 13, NULL, 100029, '250.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-08-22 22:30:42', '2022-08-22 22:30:42', NULL, '0.00'),
(30, 12, NULL, 100030, '475.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-01 23:29:46', '2022-09-01 23:29:46', NULL, '0.00'),
(31, 13, NULL, 100031, '250.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-01 23:55:07', '2022-09-01 23:55:07', NULL, '0.00'),
(32, 12, NULL, 100032, '720.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-01 23:56:48', '2022-09-01 23:56:48', NULL, '0.00'),
(33, 13, NULL, 100033, '250.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-02 00:05:53', '2022-09-02 00:05:53', NULL, '0.00'),
(34, 12, NULL, 100033, '475.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-02 00:05:53', '2022-09-02 00:05:53', NULL, '0.00'),
(35, 29, NULL, 100034, '90.00', NULL, '[{\"type\":\"21\",\"price\":100}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-03 02:42:45', '2022-09-03 02:42:45', NULL, '0.00'),
(36, 29, NULL, 100035, '90.00', NULL, '[{\"type\":\"21\",\"price\":100}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-03 02:51:17', '2022-09-03 02:51:17', NULL, '0.00'),
(37, 29, NULL, 100036, '90.00', NULL, '[{\"type\":\"21\",\"price\":100}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-03 03:07:39', '2022-09-03 03:07:39', NULL, '0.00'),
(38, 29, NULL, 100037, '90.00', NULL, '[{\"type\":\"21\",\"price\":100}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-03 03:08:23', '2022-09-03 03:08:23', NULL, '0.00'),
(39, 29, NULL, 100038, '90.00', NULL, '[{\"type\":\"21\",\"price\":100}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-06 17:15:13', '2022-09-06 17:15:13', NULL, '0.00'),
(40, 31, NULL, 100039, '135.00', NULL, '[{\"type\":\"BestService\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-07 01:27:18', '2022-09-07 01:27:18', NULL, '0.00'),
(41, 31, NULL, 100040, '135.00', NULL, '[{\"type\":\"BestService\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-07 01:30:22', '2022-09-07 01:30:22', NULL, '0.00'),
(42, 31, NULL, 100041, '135.00', NULL, '[{\"type\":\"BestService\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-07 02:38:29', '2022-09-07 02:38:29', NULL, '0.00'),
(43, 21, NULL, 100042, '1080.00', NULL, '[{\"type\":\"bestservicing\",\"price\":1200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-07 03:04:20', '2022-09-07 03:04:20', NULL, '0.00'),
(44, 21, NULL, 100043, '1080.00', NULL, '[{\"type\":\"bestservicing\",\"price\":1200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-07 03:04:32', '2022-09-07 03:04:32', NULL, '0.00'),
(45, 31, NULL, 100044, '135.00', NULL, '[{\"type\":\"BestService\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-07 03:14:42', '2022-09-07 03:14:42', NULL, '0.00'),
(46, 21, NULL, 100045, '1080.00', NULL, '[{\"type\":\"bestservicing\",\"price\":1200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-07 03:19:57', '2022-09-07 03:19:57', NULL, '0.00'),
(47, 32, NULL, 100046, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-07 04:35:37', '2022-09-07 04:35:37', NULL, '0.00'),
(48, 26, NULL, 100047, '180.00', NULL, '[{\"type\":\"20\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-07 05:08:54', '2022-09-07 05:08:54', NULL, '0.00'),
(49, 28, NULL, 100048, '270.00', NULL, '[{\"type\":\"20\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-07 05:27:47', '2022-09-07 05:27:47', NULL, '0.00'),
(50, 32, NULL, 100049, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-07 06:02:50', '2022-09-07 06:02:50', NULL, '0.00'),
(51, 35, NULL, 100050, '135.00', NULL, '[{\"type\":\"Bestservice\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-07 22:50:45', '2022-09-07 22:50:45', NULL, '0.00'),
(52, 33, NULL, 100051, '9.90', NULL, '[{\"type\":\"service\",\"price\":10}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-08 23:57:21', '2022-09-08 23:57:21', NULL, '0.00'),
(53, 33, NULL, 100052, '9.90', NULL, '[{\"type\":\"service\",\"price\":10}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-08 23:59:22', '2022-09-08 23:59:22', NULL, '0.00'),
(54, 32, NULL, 100053, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-08 23:59:54', '2022-09-08 23:59:54', NULL, '0.00'),
(55, 32, NULL, 100054, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-09 00:05:12', '2022-09-09 00:05:12', NULL, '0.00'),
(56, 36, NULL, 100055, '1.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-09 06:09:41', '2022-09-09 06:09:41', NULL, '0.00'),
(57, 21, NULL, 100056, '1080.00', NULL, '[{\"type\":\"bestservicing\",\"price\":1200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-09 06:09:41', '2022-09-09 06:09:41', NULL, '0.00'),
(58, 36, NULL, 100057, '100.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-09 06:16:14', '2022-09-09 06:16:14', NULL, '0.00'),
(59, 36, NULL, 100058, '100.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-09 06:16:14', '2022-09-09 06:16:14', NULL, '0.00'),
(60, 32, NULL, 100059, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-11 23:36:48', '2022-09-11 23:36:48', NULL, '0.00'),
(61, 33, NULL, 100060, '9.90', NULL, '[{\"type\":\"service\",\"price\":10}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 11:14:19', '2022-09-15 11:14:19', NULL, '0.00'),
(62, 32, NULL, 100061, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 11:51:54', '2022-09-15 11:51:54', NULL, '0.00'),
(63, 33, NULL, 100062, '9.90', NULL, '[{\"type\":\"service\",\"price\":10}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 11:51:55', '2022-09-15 11:51:55', NULL, '0.00'),
(64, 32, NULL, 100062, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 11:51:55', '2022-09-15 11:51:55', NULL, '0.00'),
(65, 35, NULL, 100063, '135.00', NULL, '[{\"type\":\"Bestservice\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 12:00:51', '2022-09-15 12:00:51', NULL, '0.00'),
(66, 32, NULL, 100064, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 12:04:59', '2022-09-15 12:04:59', NULL, '0.00'),
(67, 33, NULL, 100065, '9.90', NULL, '[{\"type\":\"service\",\"price\":10}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 13:04:07', '2022-09-15 13:04:07', NULL, '0.00'),
(68, 32, NULL, 100066, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 13:23:10', '2022-09-15 13:23:10', NULL, '0.00'),
(69, 39, NULL, 100067, '150.00', NULL, '[{\"type\":\"Repairing\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 15:06:28', '2022-09-15 15:06:28', NULL, '0.00'),
(70, 33, NULL, 100068, '9.90', NULL, '[{\"type\":\"service\",\"price\":10}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 15:10:38', '2022-09-15 15:10:38', NULL, '0.00'),
(71, 32, NULL, 100069, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 15:55:42', '2022-09-15 15:55:42', NULL, '0.00'),
(72, 32, NULL, 100070, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 16:10:40', '2022-09-15 16:10:40', NULL, '0.00'),
(73, 32, NULL, 100071, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 16:11:52', '2022-09-15 16:11:52', NULL, '0.00'),
(74, 32, NULL, 100072, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 16:15:43', '2022-09-15 16:15:43', NULL, '0.00'),
(75, 32, NULL, 100073, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 16:16:16', '2022-09-15 16:16:16', NULL, '0.00'),
(76, 32, NULL, 100074, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 16:46:58', '2022-09-15 16:46:58', NULL, '0.00'),
(77, 32, NULL, 100075, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 17:15:42', '2022-09-15 17:15:42', NULL, '0.00'),
(78, 32, NULL, 100076, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 17:23:30', '2022-09-15 17:23:30', NULL, '0.00'),
(79, 32, NULL, 100077, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 17:45:04', '2022-09-15 17:45:04', NULL, '0.00'),
(80, 32, NULL, 100078, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 17:56:45', '2022-09-15 17:56:45', NULL, '0.00'),
(81, 32, NULL, 100079, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-15 18:10:14', '2022-09-15 18:10:14', NULL, '0.00'),
(82, 32, NULL, 100080, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-16 11:32:20', '2022-09-16 11:32:20', NULL, '0.00'),
(83, 32, NULL, 100081, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-16 11:33:53', '2022-09-16 11:33:53', NULL, '0.00'),
(84, 32, NULL, 100082, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-16 15:19:50', '2022-09-16 15:19:50', NULL, '0.00'),
(85, 32, NULL, 100083, '135.00', NULL, '[{\"type\":\"best\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-16 15:23:07', '2022-09-16 15:23:07', NULL, '0.00'),
(86, 28, NULL, 100084, '270.00', NULL, '[{\"type\":\"20\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-17 13:17:17', '2022-09-17 13:17:17', NULL, '0.00'),
(87, 40, NULL, 100085, '144.00', NULL, '[{\"type\":\"Plumbering\",\"price\":160}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-17 16:44:20', '2022-09-17 16:44:20', NULL, '0.00'),
(88, 24, NULL, 100086, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-20 16:10:35', '2022-09-20 16:10:35', NULL, '0.00'),
(89, 28, NULL, 100087, '290.00', NULL, '[{\"type\":\"20\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-20 16:44:53', '2022-09-20 16:44:53', NULL, '0.00'),
(90, 28, NULL, 100088, '290.00', NULL, '[{\"type\":\"20\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-20 17:13:05', '2022-09-20 17:13:05', NULL, '0.00'),
(91, 28, NULL, 100089, '290.00', NULL, '[{\"type\":\"20\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-20 17:24:43', '2022-09-20 17:24:43', NULL, '0.00'),
(92, 28, NULL, 100090, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-20 18:16:29', '2022-09-20 18:16:29', NULL, '0.00'),
(93, 28, NULL, 100091, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-20 18:26:05', '2022-09-20 18:26:05', NULL, '0.00'),
(94, 28, NULL, 100092, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-20 18:28:04', '2022-09-20 18:28:04', NULL, '0.00'),
(95, 24, NULL, 100093, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 12:35:19', '2022-09-21 12:35:19', NULL, '0.00'),
(96, 24, NULL, 100094, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 12:35:23', '2022-09-21 12:35:23', NULL, '0.00'),
(97, 24, NULL, 100095, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 12:35:28', '2022-09-21 12:35:28', NULL, '0.00'),
(98, 24, NULL, 100096, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 12:35:33', '2022-09-21 12:35:33', NULL, '0.00'),
(99, 24, NULL, 100097, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 12:35:48', '2022-09-21 12:35:48', NULL, '0.00'),
(100, 24, NULL, 100098, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 12:35:52', '2022-09-21 12:35:52', NULL, '0.00'),
(101, 24, NULL, 100099, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 12:37:14', '2022-09-21 12:37:14', NULL, '0.00'),
(102, 24, NULL, 100100, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 12:37:18', '2022-09-21 12:37:18', NULL, '0.00'),
(103, 24, NULL, 100101, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 12:38:01', '2022-09-21 12:38:01', NULL, '0.00'),
(104, 24, NULL, 100102, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 12:51:19', '2022-09-21 12:51:19', NULL, '0.00'),
(105, 24, NULL, 100103, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 12:52:34', '2022-09-21 12:52:34', NULL, '0.00'),
(106, 24, NULL, 100104, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 12:52:38', '2022-09-21 12:52:38', NULL, '0.00'),
(107, 24, NULL, 100105, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 12:52:49', '2022-09-21 12:52:49', NULL, '0.00'),
(108, 24, NULL, 100106, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 12:59:33', '2022-09-21 12:59:33', NULL, '0.00'),
(109, 24, NULL, 100107, '180.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 13:09:19', '2022-09-21 13:09:19', NULL, '0.00'),
(110, 24, NULL, 100108, '180.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 13:09:32', '2022-09-21 13:09:32', NULL, '0.00'),
(111, 24, NULL, 100109, '180.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 13:09:38', '2022-09-21 13:09:38', NULL, '0.00'),
(112, 35, NULL, 100110, '140.00', NULL, '[{\"type\":\"Bestservice\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 13:12:22', '2022-09-21 13:12:22', NULL, '0.00'),
(113, 35, NULL, 100111, '140.00', NULL, '[{\"type\":\"Bestservice\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 13:22:04', '2022-09-21 13:22:04', NULL, '0.00'),
(114, 28, NULL, 100112, '270.00', NULL, '[{\"type\":\"20\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 13:22:10', '2022-09-21 13:22:10', NULL, '0.00'),
(115, 35, NULL, 100113, '140.00', NULL, '[{\"type\":\"Bestservice\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 13:25:16', '2022-09-21 13:25:16', NULL, '0.00'),
(116, 35, NULL, 100114, '140.00', NULL, '[{\"type\":\"Bestservice\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 13:28:09', '2022-09-21 13:28:09', NULL, '0.00'),
(117, 35, NULL, 100115, '140.00', NULL, '[{\"type\":\"Bestservice\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 13:42:57', '2022-09-21 13:42:57', NULL, '0.00'),
(118, 24, NULL, 100116, '180.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 13:52:43', '2022-09-21 13:52:43', NULL, '0.00'),
(119, 24, NULL, 100116, '180.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 13:52:43', '2022-09-21 13:52:43', NULL, '0.00'),
(120, 24, NULL, 100117, '180.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 13:54:26', '2022-09-21 13:54:26', NULL, '0.00'),
(121, 24, NULL, 100117, '180.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 13:54:26', '2022-09-21 13:54:26', NULL, '0.00'),
(122, 35, NULL, 100118, '140.00', NULL, '[{\"type\":\"Bestservice\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 13:58:23', '2022-09-21 13:58:23', NULL, '0.00'),
(123, 28, NULL, 100119, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 14:04:36', '2022-09-21 14:04:36', NULL, '0.00'),
(124, 28, NULL, 100120, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 14:07:08', '2022-09-21 14:07:08', NULL, '0.00'),
(125, 24, NULL, 100121, '180.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 14:10:00', '2022-09-21 14:10:00', NULL, '0.00'),
(126, 28, NULL, 100122, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 14:10:07', '2022-09-21 14:10:07', NULL, '0.00'),
(127, 28, NULL, 100123, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 14:15:57', '2022-09-21 14:15:57', NULL, '0.00'),
(128, 28, NULL, 100124, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 14:40:58', '2022-09-21 14:40:58', NULL, '0.00'),
(129, 35, NULL, 100125, '140.00', NULL, '[{\"type\":\"Bestservice\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 14:41:23', '2022-09-21 14:41:23', NULL, '0.00'),
(130, 24, NULL, 100126, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 15:12:48', '2022-09-21 15:12:48', NULL, '0.00'),
(131, 24, NULL, 100127, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 15:39:17', '2022-09-21 15:39:17', NULL, '0.00'),
(132, 28, NULL, 100128, '290.00', NULL, '[{\"type\":\"20\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 15:48:10', '2022-09-21 15:48:10', NULL, '0.00'),
(133, 24, NULL, 100129, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 15:48:10', '2022-09-21 15:48:10', NULL, '0.00'),
(134, 41, NULL, 100130, '180.00', NULL, '[{\"type\":\"Bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 15:59:50', '2022-09-21 15:59:50', NULL, '0.00'),
(135, 41, NULL, 100131, '180.00', NULL, '[{\"type\":\"Bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 16:02:44', '2022-09-21 16:02:44', NULL, '0.00'),
(136, 24, NULL, 100132, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 16:07:49', '2022-09-21 16:07:49', NULL, '0.00'),
(137, 24, NULL, 100133, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 16:40:31', '2022-09-21 16:40:31', NULL, '0.00'),
(138, 41, NULL, 100134, '180.00', NULL, '[{\"type\":\"Bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 18:07:18', '2022-09-21 18:07:18', NULL, '0.00'),
(139, 24, NULL, 100135, '180.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 18:48:54', '2022-09-21 18:48:54', NULL, '0.00'),
(140, 24, NULL, 100136, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 19:09:27', '2022-09-21 19:09:27', NULL, '0.00'),
(141, 24, NULL, 100137, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 19:11:01', '2022-09-21 19:11:01', NULL, '0.00'),
(142, 24, NULL, 100138, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 19:14:55', '2022-09-21 19:14:55', NULL, '0.00'),
(143, 24, NULL, 100139, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 19:19:25', '2022-09-21 19:19:25', NULL, '0.00'),
(144, 24, NULL, 100140, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 19:35:43', '2022-09-21 19:35:43', NULL, '0.00'),
(145, 24, NULL, 100141, '190.00', NULL, '[{\"type\":\"bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-21 19:37:33', '2022-09-21 19:37:33', NULL, '0.00'),
(146, 24, NULL, 100142, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 17:03:25', '2022-09-22 17:03:25', NULL, '0.00'),
(147, 24, NULL, 100142, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 17:03:25', '2022-09-22 17:03:25', NULL, '0.00'),
(148, 28, NULL, 100143, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 17:03:25', '2022-09-22 17:03:25', NULL, '0.00'),
(149, 28, NULL, 100144, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 17:08:42', '2022-09-22 17:08:42', NULL, '0.00'),
(150, 40, NULL, 100145, '150.00', NULL, '[{\"type\":\"Plumbering\",\"price\":160}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 17:08:42', '2022-09-22 17:08:42', NULL, '0.00'),
(151, 24, NULL, 100146, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 17:24:33', '2022-09-22 17:24:33', NULL, '0.00'),
(152, 28, NULL, 100147, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 17:24:33', '2022-09-22 17:24:33', NULL, '0.00'),
(153, 24, NULL, 100148, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 17:37:01', '2022-09-22 17:37:01', NULL, '0.00'),
(154, 24, NULL, 100149, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 17:42:56', '2022-09-22 17:42:56', NULL, '0.00'),
(155, 28, NULL, 100150, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 17:42:56', '2022-09-22 17:42:56', NULL, '0.00'),
(156, 24, NULL, 100151, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 17:55:12', '2022-09-22 17:55:12', NULL, '0.00'),
(157, 28, NULL, 100152, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 17:55:12', '2022-09-22 17:55:12', NULL, '0.00'),
(158, 24, NULL, 100153, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 18:24:49', '2022-09-22 18:24:49', NULL, '0.00'),
(159, 35, NULL, 100153, '140.00', NULL, '[{\"type\":\"Bestservice\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 18:24:49', '2022-09-22 18:24:49', NULL, '0.00'),
(160, 43, NULL, 100154, '190.00', NULL, '[{\"type\":\"Gardening..\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 18:28:04', '2022-09-22 18:28:04', NULL, '0.00'),
(161, 35, NULL, 100154, '140.00', NULL, '[{\"type\":\"Bestservice\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 18:28:04', '2022-09-22 18:28:04', NULL, '0.00'),
(162, 24, NULL, 100155, '190.00', NULL, '[{\"type\":\"Fast\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 18:31:43', '2022-09-22 18:31:43', NULL, '0.00'),
(163, 28, NULL, 100156, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 18:31:43', '2022-09-22 18:31:43', NULL, '0.00'),
(164, 24, NULL, 100157, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 18:35:24', '2022-09-22 18:35:24', NULL, '0.00'),
(165, 28, NULL, 100158, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 18:35:24', '2022-09-22 18:35:24', NULL, '0.00'),
(166, 24, NULL, 100159, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 19:10:46', '2022-09-22 19:10:46', NULL, '0.00'),
(167, 41, NULL, 100160, '180.00', NULL, '[{\"type\":\"Bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 19:10:46', '2022-09-22 19:10:46', NULL, '0.00'),
(168, 24, NULL, 100161, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 19:13:11', '2022-09-22 19:13:11', NULL, '0.00'),
(169, 41, NULL, 100162, '180.00', NULL, '[{\"type\":\"Bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 19:13:11', '2022-09-22 19:13:11', NULL, '0.00'),
(170, 28, NULL, 100163, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 20:50:31', '2022-09-22 20:50:31', NULL, '0.00'),
(171, 40, NULL, 100164, '150.00', NULL, '[{\"type\":\"Plumbering\",\"price\":160}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 20:50:31', '2022-09-22 20:50:31', NULL, '0.00'),
(172, 24, NULL, 100165, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 20:52:20', '2022-09-22 20:52:20', NULL, '0.00'),
(173, 41, NULL, 100166, '180.00', NULL, '[{\"type\":\"Bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 20:52:20', '2022-09-22 20:52:20', NULL, '0.00'),
(174, 24, NULL, 100167, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 20:53:12', '2022-09-22 20:53:12', NULL, '0.00'),
(175, 24, NULL, 100168, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 20:54:23', '2022-09-22 20:54:23', NULL, '0.00'),
(176, 40, NULL, 100169, '150.00', NULL, '[{\"type\":\"Plumbering\",\"price\":160}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 20:54:23', '2022-09-22 20:54:23', NULL, '0.00'),
(177, 24, NULL, 100170, '190.00', NULL, '[{\"type\":\"Fast\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 20:55:49', '2022-09-22 20:55:49', NULL, '0.00'),
(178, 35, NULL, 100171, '140.00', NULL, '[{\"type\":\"Bestservice\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-22 21:07:53', '2022-09-22 21:07:53', NULL, '0.00'),
(179, 40, NULL, 100172, '150.00', NULL, '[{\"type\":\"Plumbering\",\"price\":160}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 10:58:12', '2022-09-23 10:58:12', NULL, '0.00'),
(180, 39, NULL, 100173, '150.00', NULL, '[{\"type\":\"Repairing\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 10:58:12', '2022-09-23 10:58:12', NULL, '0.00'),
(181, 24, NULL, 100174, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 11:01:17', '2022-09-23 11:01:17', NULL, '0.00'),
(182, 28, NULL, 100175, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 11:01:17', '2022-09-23 11:01:17', NULL, '0.00'),
(183, 24, NULL, 100176, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 11:05:12', '2022-09-23 11:05:12', NULL, '0.00'),
(184, 28, NULL, 100177, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 11:05:12', '2022-09-23 11:05:12', NULL, '0.00'),
(185, 24, NULL, 100178, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 11:06:59', '2022-09-23 11:06:59', NULL, '0.00'),
(186, 28, NULL, 100179, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 11:06:59', '2022-09-23 11:06:59', NULL, '0.00'),
(187, 35, NULL, 100180, '140.00', NULL, '[{\"type\":\"Bestservice\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 11:12:40', '2022-09-23 11:12:40', NULL, '0.00'),
(188, 41, NULL, 100181, '180.00', NULL, '[{\"type\":\"Bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 11:12:40', '2022-09-23 11:12:40', NULL, '0.00'),
(189, 24, NULL, 100182, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 13:55:30', '2022-09-23 13:55:30', NULL, '0.00'),
(190, 28, NULL, 100183, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 13:55:30', '2022-09-23 13:55:30', NULL, '0.00'),
(191, 24, NULL, 100184, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 14:27:42', '2022-09-23 14:27:42', NULL, '0.00'),
(192, 24, NULL, 100185, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 14:43:50', '2022-09-23 14:43:50', NULL, '0.00'),
(193, 24, NULL, 100186, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 14:56:36', '2022-09-23 14:56:36', NULL, '0.00'),
(194, 35, NULL, 100187, '140.00', NULL, '[{\"type\":\"Bestservice\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 17:55:27', '2022-09-23 17:55:27', NULL, '0.00'),
(195, 35, NULL, 100188, '140.00', NULL, '[{\"type\":\"Bestservice\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 17:56:12', '2022-09-23 17:56:12', NULL, '0.00'),
(196, 35, NULL, 100189, '140.00', NULL, '[{\"type\":\"Bestservice\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 17:57:41', '2022-09-23 17:57:41', NULL, '0.00'),
(197, 35, NULL, 100190, '140.00', NULL, '[{\"type\":\"Bestservice\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 18:00:25', '2022-09-23 18:00:25', NULL, '0.00'),
(198, 28, NULL, 100191, '290.00', NULL, '[{\"type\":\"Electricalservice\",\"price\":300}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 18:09:27', '2022-09-23 18:09:27', NULL, '0.00'),
(199, 24, NULL, 100192, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 18:22:54', '2022-09-23 18:22:54', NULL, '0.00'),
(200, 35, NULL, 100192, '140.00', NULL, '[{\"type\":\"Bestservice\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 18:22:54', '2022-09-23 18:22:54', NULL, '0.00'),
(201, 24, NULL, 100193, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 18:26:50', '2022-09-23 18:26:50', NULL, '0.00'),
(202, 35, NULL, 100193, '140.00', NULL, '[{\"type\":\"Bestservice\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 18:26:50', '2022-09-23 18:26:50', NULL, '0.00'),
(203, 24, NULL, 100194, '190.00', NULL, '[{\"type\":\"Clean\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 18:41:00', '2022-09-23 18:41:00', NULL, '0.00'),
(204, 35, NULL, 100194, '140.00', NULL, '[{\"type\":\"Bestservice\",\"price\":150}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-23 18:41:00', '2022-09-23 18:41:00', NULL, '0.00'),
(205, 24, NULL, 100195, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 01:28:54', '2022-09-26 01:28:54', NULL, '0.00'),
(206, 35, NULL, 100195, '140.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 01:28:54', '2022-09-26 01:28:54', NULL, '0.00'),
(207, 24, NULL, 100196, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 01:31:34', '2022-09-26 01:31:34', NULL, '0.00'),
(208, 35, NULL, 100196, '140.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 01:31:34', '2022-09-26 01:31:34', NULL, '0.00'),
(209, 24, NULL, 100197, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 01:33:01', '2022-09-26 01:33:01', NULL, '0.00'),
(210, 35, NULL, 100197, '140.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 01:33:01', '2022-09-26 01:33:01', NULL, '0.00'),
(211, 43, NULL, 100197, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 01:33:01', '2022-09-26 01:33:01', NULL, '0.00'),
(212, 24, NULL, 100198, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 01:37:42', '2022-09-26 01:37:42', NULL, '0.00'),
(213, 24, NULL, 100199, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 02:03:54', '2022-09-26 02:03:54', NULL, '0.00'),
(214, 24, NULL, 100200, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 02:04:41', '2022-09-26 02:04:41', NULL, '0.00'),
(215, 28, NULL, 100201, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 02:06:29', '2022-09-26 02:06:29', NULL, '0.00'),
(216, 28, NULL, 100202, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 02:08:26', '2022-09-26 02:08:26', NULL, '0.00'),
(217, 24, NULL, 100203, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 02:14:52', '2022-09-26 02:14:52', NULL, '0.00'),
(218, 28, NULL, 100204, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 02:33:43', '2022-09-26 02:33:43', NULL, '0.00'),
(219, 35, NULL, 100205, '140.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 02:39:25', '2022-09-26 02:39:25', NULL, '0.00'),
(220, 28, NULL, 100206, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 02:43:26', '2022-09-26 02:43:26', NULL, '0.00'),
(221, 24, NULL, 100207, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 10:47:14', '2022-09-26 10:47:14', NULL, '0.00'),
(222, 24, NULL, 100208, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 10:50:39', '2022-09-26 10:50:39', NULL, '0.00'),
(223, 24, NULL, 100209, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 10:54:54', '2022-09-26 10:54:54', NULL, '0.00'),
(224, 24, NULL, 100210, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 10:57:24', '2022-09-26 10:57:24', NULL, '0.00'),
(225, 24, NULL, 100211, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 11:56:21', '2022-09-26 11:56:21', NULL, '0.00'),
(226, 24, NULL, 100212, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 12:15:12', '2022-09-26 12:15:12', NULL, '0.00'),
(227, 24, NULL, 100213, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 13:51:57', '2022-09-26 13:51:57', NULL, '0.00'),
(228, 28, NULL, 100214, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 13:53:10', '2022-09-26 13:53:10', NULL, '0.00'),
(229, 28, NULL, 100215, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 13:58:33', '2022-09-26 13:58:33', NULL, '0.00'),
(230, 28, NULL, 100216, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 14:01:49', '2022-09-26 14:01:49', NULL, '0.00'),
(231, 24, NULL, 100217, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 14:15:42', '2022-09-26 14:15:42', NULL, '0.00'),
(232, 28, NULL, 100218, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 14:17:33', '2022-09-26 14:17:33', NULL, '0.00'),
(233, 28, NULL, 100219, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 14:21:15', '2022-09-26 14:21:15', NULL, '0.00'),
(234, 28, NULL, 100220, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 14:24:27', '2022-09-26 14:24:27', NULL, '0.00'),
(235, 28, NULL, 100221, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 14:29:43', '2022-09-26 14:29:43', NULL, '0.00'),
(236, 28, NULL, 100222, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 14:32:14', '2022-09-26 14:32:14', NULL, '0.00'),
(237, 28, NULL, 100223, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 14:38:03', '2022-09-26 14:38:03', NULL, '0.00'),
(238, 28, NULL, 100224, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 14:39:31', '2022-09-26 14:39:31', NULL, '0.00'),
(239, 28, NULL, 100225, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 14:40:47', '2022-09-26 14:40:47', NULL, '0.00'),
(240, 28, NULL, 100226, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 14:41:54', '2022-09-26 14:41:54', NULL, '0.00'),
(241, 35, NULL, 100227, '140.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 14:42:36', '2022-09-26 14:42:36', NULL, '0.00'),
(242, 24, NULL, 100228, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 14:43:39', '2022-09-26 14:43:39', NULL, '0.00'),
(243, 24, NULL, 100229, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 15:17:48', '2022-09-26 15:17:48', NULL, '0.00'),
(244, 24, NULL, 100230, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 15:22:27', '2022-09-26 15:22:27', NULL, '0.00'),
(245, 24, NULL, 100231, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 15:44:29', '2022-09-26 15:44:29', NULL, '0.00'),
(246, 24, NULL, 100232, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 15:53:13', '2022-09-26 15:53:13', NULL, '0.00'),
(247, 24, NULL, 100233, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 15:54:47', '2022-09-26 15:54:47', NULL, '0.00'),
(248, 35, NULL, 100233, '140.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 15:54:47', '2022-09-26 15:54:47', NULL, '0.00'),
(249, 24, NULL, 100234, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 17:54:12', '2022-09-26 17:54:12', NULL, '0.00'),
(250, 24, NULL, 100235, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 18:00:17', '2022-09-26 18:00:17', NULL, '0.00'),
(251, 24, NULL, 100236, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 18:04:23', '2022-09-26 18:04:23', NULL, '0.00'),
(252, 24, NULL, 100237, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 18:05:49', '2022-09-26 18:05:49', NULL, '0.00'),
(253, 24, NULL, 100238, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 18:07:46', '2022-09-26 18:07:46', NULL, '0.00'),
(254, 39, NULL, 100239, '150.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 18:11:59', '2022-09-26 18:11:59', NULL, '0.00'),
(255, 28, NULL, 100240, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 19:56:23', '2022-09-26 19:56:23', NULL, '0.00'),
(256, 28, NULL, 100241, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 20:35:28', '2022-09-26 20:35:28', NULL, '0.00'),
(257, 28, NULL, 100242, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 20:38:48', '2022-09-26 20:38:48', NULL, '0.00'),
(258, 24, NULL, 100243, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 20:39:25', '2022-09-26 20:39:25', NULL, '0.00'),
(259, 42, NULL, 100244, '170.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-26 20:43:39', '2022-09-26 20:43:39', NULL, '0.00'),
(260, 24, NULL, 100245, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-27 09:19:42', '2022-09-27 09:19:42', NULL, '0.00'),
(261, 24, NULL, 100246, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-27 13:42:05', '2022-09-27 13:42:05', NULL, '0.00'),
(262, 24, NULL, 100247, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-27 16:24:42', '2022-09-27 16:24:42', NULL, '0.00'),
(263, NULL, NULL, 100248, '2970.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-27 18:01:38', '2022-09-27 18:01:38', NULL, '0.00'),
(264, 24, NULL, 100249, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-27 18:48:29', '2022-09-27 18:48:29', NULL, '0.00'),
(265, NULL, NULL, 100250, '2970.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-27 18:48:42', '2022-09-27 18:48:42', NULL, '0.00'),
(266, 44, NULL, 100251, '140.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 11:03:52', '2022-09-28 11:03:52', NULL, '0.00'),
(267, 24, NULL, 100252, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 11:25:48', '2022-09-28 11:25:48', NULL, '0.00'),
(268, 24, NULL, 100253, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 11:38:19', '2022-09-28 11:38:19', NULL, '0.00'),
(269, 24, NULL, 100254, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 11:38:36', '2022-09-28 11:38:36', NULL, '0.00'),
(270, 24, NULL, 100255, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 11:40:53', '2022-09-28 11:40:53', NULL, '0.00'),
(271, 24, NULL, 100256, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 12:11:32', '2022-09-28 12:11:32', NULL, '0.00'),
(272, NULL, NULL, 100257, '180.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 12:11:56', '2022-09-28 12:11:56', NULL, '0.00'),
(273, 24, NULL, 100258, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 12:15:51', '2022-09-28 12:15:51', NULL, '0.00');
INSERT INTO `order_details` (`id`, `service_id`, `vendor_id`, `order_id`, `price`, `food_details`, `variation`, `add_ons`, `discount_on_food`, `discount_type`, `quantity`, `tax_amount`, `variant`, `created_at`, `updated_at`, `item_campaign_id`, `total_add_on_price`) VALUES
(274, 24, NULL, 100259, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 12:17:14', '2022-09-28 12:17:14', NULL, '0.00'),
(275, 24, NULL, 100260, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 12:17:58', '2022-09-28 12:17:58', NULL, '0.00'),
(276, 40, NULL, 100261, '150.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 13:05:43', '2022-09-28 13:05:43', NULL, '0.00'),
(277, 24, NULL, 100262, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 13:53:54', '2022-09-28 13:53:54', NULL, '0.00'),
(278, NULL, NULL, 100263, '180.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 14:04:28', '2022-09-28 14:04:28', NULL, '0.00'),
(279, 40, NULL, 100264, '150.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 15:34:36', '2022-09-28 15:34:36', NULL, '0.00'),
(280, 24, NULL, 100265, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 15:54:18', '2022-09-28 15:54:18', NULL, '0.00'),
(281, 28, NULL, 100266, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 15:58:47', '2022-09-28 15:58:47', NULL, '0.00'),
(282, 28, NULL, 100267, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 16:09:26', '2022-09-28 16:09:26', NULL, '0.00'),
(283, 40, NULL, 100268, '150.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 17:25:13', '2022-09-28 17:25:13', NULL, '0.00'),
(284, NULL, NULL, 100269, '180.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 17:32:56', '2022-09-28 17:32:56', NULL, '0.00'),
(285, 24, NULL, 100270, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 18:25:32', '2022-09-28 18:25:32', NULL, '0.00'),
(286, 24, NULL, 100271, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 18:37:49', '2022-09-28 18:37:49', NULL, '0.00'),
(287, 24, NULL, 100272, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 18:40:01', '2022-09-28 18:40:01', NULL, '0.00'),
(288, 24, NULL, 100273, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 18:41:36', '2022-09-28 18:41:36', NULL, '0.00'),
(289, 24, NULL, 100274, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 18:45:26', '2022-09-28 18:45:26', NULL, '0.00'),
(290, 24, NULL, 100275, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 18:59:39', '2022-09-28 18:59:39', NULL, '0.00'),
(291, 35, NULL, 100275, '140.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-28 18:59:39', '2022-09-28 18:59:39', NULL, '0.00'),
(292, 24, NULL, 100276, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-29 11:25:48', '2022-09-29 11:25:48', NULL, '0.00'),
(293, 24, NULL, 100277, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-29 11:29:33', '2022-09-29 11:29:33', NULL, '0.00'),
(294, 24, NULL, 100278, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-29 12:11:58', '2022-09-29 12:11:58', NULL, '0.00'),
(295, 24, NULL, 100279, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-29 12:27:03', '2022-09-29 12:27:03', NULL, '0.00'),
(296, 24, NULL, 100280, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-29 12:31:24', '2022-09-29 12:31:24', NULL, '0.00'),
(297, 24, NULL, 100281, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-29 12:33:07', '2022-09-29 12:33:07', NULL, '0.00'),
(298, 24, NULL, 100282, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-29 12:34:14', '2022-09-29 12:34:14', NULL, '0.00'),
(299, 24, NULL, 100283, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-29 12:39:46', '2022-09-29 12:39:46', NULL, '0.00'),
(300, 24, NULL, 100284, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-29 12:41:12', '2022-09-29 12:41:12', NULL, '0.00'),
(301, 43, NULL, 100285, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-29 13:06:19', '2022-09-29 13:06:19', NULL, '0.00'),
(302, 43, NULL, 100286, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-29 14:55:25', '2022-09-29 14:55:25', NULL, '0.00'),
(303, NULL, NULL, 100287, '180.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-29 17:53:54', '2022-09-29 17:53:54', NULL, '0.00'),
(304, 24, NULL, 100288, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-29 18:08:21', '2022-09-29 18:08:21', NULL, '0.00'),
(305, 35, NULL, 100289, '140.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-29 18:13:17', '2022-09-29 18:13:17', NULL, '0.00'),
(306, NULL, NULL, 100290, '180.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-29 18:20:00', '2022-09-29 18:20:00', NULL, '0.00'),
(307, 24, NULL, 100291, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-29 18:27:10', '2022-09-29 18:27:10', NULL, '0.00'),
(308, NULL, NULL, 100292, '180.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-29 18:31:13', '2022-09-29 18:31:13', NULL, '0.00'),
(309, 24, NULL, 100293, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-29 18:33:19', '2022-09-29 18:33:19', NULL, '0.00'),
(310, NULL, NULL, 100294, '180.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-30 11:10:47', '2022-09-30 11:10:47', NULL, '0.00'),
(311, 41, NULL, 100295, '180.00', NULL, '[{\"type\":\"Bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-30 11:21:51', '2022-09-30 11:21:51', NULL, '0.00'),
(312, 41, NULL, 100296, '180.00', NULL, '[{\"type\":\"Bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-30 15:12:14', '2022-09-30 15:12:14', NULL, '0.00'),
(313, 41, NULL, 100297, '180.00', NULL, '[{\"type\":\"Bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-30 15:30:46', '2022-09-30 15:30:46', NULL, '0.00'),
(314, 39, NULL, 100298, '150.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-30 15:31:58', '2022-09-30 15:31:58', NULL, '0.00'),
(315, NULL, NULL, 100299, '180.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-30 15:42:15', '2022-09-30 15:42:15', NULL, '0.00'),
(316, 24, NULL, 100300, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-30 15:46:23', '2022-09-30 15:46:23', NULL, '0.00'),
(317, NULL, NULL, 100301, '180.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-30 15:48:38', '2022-09-30 15:48:38', NULL, '0.00'),
(318, NULL, NULL, 100302, '180.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-30 15:53:44', '2022-09-30 15:53:44', NULL, '0.00'),
(319, 28, NULL, 100303, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-30 15:56:07', '2022-09-30 15:56:07', NULL, '0.00'),
(320, NULL, NULL, 100304, '180.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-30 16:02:31', '2022-09-30 16:02:31', NULL, '0.00'),
(321, NULL, NULL, 100305, '180.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-30 17:10:41', '2022-09-30 17:10:41', NULL, '0.00'),
(322, 24, NULL, 100306, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-30 17:26:27', '2022-09-30 17:26:27', NULL, '0.00'),
(323, 24, NULL, 100307, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-30 17:29:27', '2022-09-30 17:29:27', NULL, '0.00'),
(324, NULL, NULL, 100308, '180.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-30 18:01:08', '2022-09-30 18:01:08', NULL, '0.00'),
(325, 24, NULL, 100309, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-30 18:25:13', '2022-09-30 18:25:13', NULL, '0.00'),
(326, NULL, NULL, 100310, '180.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-09-30 18:28:30', '2022-09-30 18:28:30', NULL, '0.00'),
(327, 24, NULL, 100311, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-01 10:45:37', '2022-10-01 10:45:37', NULL, '0.00'),
(328, 24, NULL, 100312, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-01 12:41:52', '2022-10-01 12:41:52', NULL, '0.00'),
(329, 43, NULL, 100313, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-01 13:05:14', '2022-10-01 13:05:14', NULL, '0.00'),
(330, NULL, NULL, 100314, '180.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-01 13:25:56', '2022-10-01 13:25:56', NULL, '0.00'),
(331, 35, NULL, 100315, '140.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-01 13:36:05', '2022-10-01 13:36:05', NULL, '0.00'),
(332, 24, NULL, 100316, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-01 16:10:30', '2022-10-01 16:10:30', NULL, '0.00'),
(333, 24, NULL, 100317, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-01 16:15:13', '2022-10-01 16:15:13', NULL, '0.00'),
(334, 24, NULL, 100318, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-01 16:41:50', '2022-10-01 16:41:50', NULL, '0.00'),
(335, 24, NULL, 100319, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-01 16:47:32', '2022-10-01 16:47:32', NULL, '0.00'),
(336, 24, NULL, 100320, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-01 16:48:57', '2022-10-01 16:48:57', NULL, '0.00'),
(337, 24, NULL, 100321, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-01 17:16:59', '2022-10-01 17:16:59', NULL, '0.00'),
(338, 28, NULL, 100322, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-01 18:20:01', '2022-10-01 18:20:01', NULL, '0.00'),
(339, 24, NULL, 100323, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-01 18:20:54', '2022-10-01 18:20:54', NULL, '0.00'),
(340, 24, NULL, 100324, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-01 18:37:40', '2022-10-01 18:37:40', NULL, '0.00'),
(341, 24, NULL, 100325, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-01 18:44:19', '2022-10-01 18:44:19', NULL, '0.00'),
(342, 24, NULL, 100326, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-01 18:46:14', '2022-10-01 18:46:14', NULL, '0.00'),
(343, 43, NULL, 100327, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-01 18:57:45', '2022-10-01 18:57:45', NULL, '0.00'),
(344, 24, NULL, 100328, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-01 19:06:27', '2022-10-01 19:06:27', NULL, '0.00'),
(345, 43, NULL, 100329, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 11:29:03', '2022-10-03 11:29:03', NULL, '0.00'),
(346, 43, NULL, 100330, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 11:30:03', '2022-10-03 11:30:03', NULL, '0.00'),
(347, 43, NULL, 100331, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 11:31:12', '2022-10-03 11:31:12', NULL, '0.00'),
(348, 43, NULL, 100332, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 11:38:00', '2022-10-03 11:38:00', NULL, '0.00'),
(349, 43, NULL, 100333, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 11:42:50', '2022-10-03 11:42:50', NULL, '0.00'),
(350, 43, NULL, 100334, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 12:08:48', '2022-10-03 12:08:48', NULL, '0.00'),
(351, 43, NULL, 100335, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 16:18:48', '2022-10-03 16:18:48', NULL, '0.00'),
(352, 43, NULL, 100336, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 16:42:28', '2022-10-03 16:42:28', NULL, '0.00'),
(353, 43, NULL, 100337, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 16:56:13', '2022-10-03 16:56:13', NULL, '0.00'),
(354, 24, NULL, 100338, '790.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 17:27:16', '2022-10-03 17:27:16', NULL, '0.00'),
(355, 24, NULL, 100339, '790.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 17:43:34', '2022-10-03 17:43:34', NULL, '0.00'),
(356, 43, NULL, 100340, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 17:57:05', '2022-10-03 17:57:05', NULL, '0.00'),
(357, 41, NULL, 100341, '180.00', NULL, '[{\"type\":\"Bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 18:21:31', '2022-10-03 18:21:31', NULL, '0.00'),
(358, 43, NULL, 100342, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 19:35:47', '2022-10-03 19:35:47', NULL, '0.00'),
(359, 24, NULL, 100343, '790.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 20:41:13', '2022-10-03 20:41:13', NULL, '0.00'),
(360, 24, NULL, 100344, '790.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 20:48:34', '2022-10-03 20:48:34', NULL, '0.00'),
(361, 43, NULL, 100345, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 20:50:42', '2022-10-03 20:50:42', NULL, '0.00'),
(362, 43, NULL, 100346, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 20:53:06', '2022-10-03 20:53:06', NULL, '0.00'),
(363, 43, NULL, 100347, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 20:56:29', '2022-10-03 20:56:29', NULL, '0.00'),
(364, 28, NULL, 100348, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 21:21:16', '2022-10-03 21:21:16', NULL, '0.00'),
(365, 28, NULL, 100349, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 21:26:09', '2022-10-03 21:26:09', NULL, '0.00'),
(366, 28, NULL, 100350, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 21:52:39', '2022-10-03 21:52:39', NULL, '0.00'),
(367, 28, NULL, 100351, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 21:53:34', '2022-10-03 21:53:34', NULL, '0.00'),
(368, 43, NULL, 100352, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 21:59:25', '2022-10-03 21:59:25', NULL, '0.00'),
(369, 41, NULL, 100353, '180.00', NULL, '[{\"type\":\"Bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 22:32:26', '2022-10-03 22:32:26', NULL, '0.00'),
(370, 38, NULL, 100354, '140.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 22:37:54', '2022-10-03 22:37:54', NULL, '0.00'),
(371, 44, NULL, 100355, '140.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 22:40:36', '2022-10-03 22:40:36', NULL, '0.00'),
(372, 42, NULL, 100356, '170.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-03 22:43:33', '2022-10-03 22:43:33', NULL, '0.00'),
(373, NULL, NULL, 100357, '180.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 03:33:32', '2022-10-04 03:33:32', NULL, '0.00'),
(374, 43, NULL, 100358, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 06:33:46', '2022-10-04 06:33:46', NULL, '0.00'),
(375, 43, NULL, 100359, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 08:52:42', '2022-10-04 08:52:42', NULL, '0.00'),
(376, 43, NULL, 100360, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 08:57:25', '2022-10-04 08:57:25', NULL, '0.00'),
(377, 24, NULL, 100361, '790.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 10:21:22', '2022-10-04 10:21:22', NULL, '0.00'),
(378, 43, NULL, 100362, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 10:27:51', '2022-10-04 10:27:51', NULL, '0.00'),
(379, 41, NULL, 100363, '180.00', NULL, '[{\"type\":\"Bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 10:29:47', '2022-10-04 10:29:47', NULL, '0.00'),
(380, 38, NULL, 100364, '140.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 10:34:38', '2022-10-04 10:34:38', NULL, '0.00'),
(381, 43, NULL, 100365, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 10:59:53', '2022-10-04 10:59:53', NULL, '0.00'),
(382, 43, NULL, 100366, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 11:00:41', '2022-10-04 11:00:41', NULL, '0.00'),
(383, 43, NULL, 100367, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 11:05:38', '2022-10-04 11:05:38', NULL, '0.00'),
(384, 43, NULL, 100368, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 11:08:25', '2022-10-04 11:08:25', NULL, '0.00'),
(385, 43, NULL, 100369, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 11:10:57', '2022-10-04 11:10:57', NULL, '0.00'),
(386, 35, NULL, 100370, '1590.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 11:21:07', '2022-10-04 11:21:07', NULL, '0.00'),
(387, 24, NULL, 100371, '790.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 11:34:37', '2022-10-04 11:34:37', NULL, '0.00'),
(388, 24, NULL, 100372, '790.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 11:38:59', '2022-10-04 11:38:59', NULL, '0.00'),
(389, 43, NULL, 100373, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 12:13:33', '2022-10-04 12:13:33', NULL, '0.00'),
(390, 35, NULL, 100374, '1590.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 12:25:36', '2022-10-04 12:25:36', NULL, '0.00'),
(391, 28, NULL, 100375, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 13:53:23', '2022-10-04 13:53:23', NULL, '0.00'),
(392, 28, NULL, 100376, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 13:54:50', '2022-10-04 13:54:50', NULL, '0.00'),
(393, 28, NULL, 100377, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 13:55:28', '2022-10-04 13:55:28', NULL, '0.00'),
(394, 43, NULL, 100378, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 13:59:52', '2022-10-04 13:59:52', NULL, '0.00'),
(395, 41, NULL, 100379, '180.00', NULL, '[{\"type\":\"Bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 14:20:38', '2022-10-04 14:20:38', NULL, '0.00'),
(396, 43, NULL, 100380, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 14:22:45', '2022-10-04 14:22:45', NULL, '0.00'),
(397, 28, NULL, 100381, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 15:27:46', '2022-10-04 15:27:46', NULL, '0.00'),
(398, 28, NULL, 100382, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 16:48:51', '2022-10-04 16:48:51', NULL, '0.00'),
(399, 43, NULL, 100383, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 17:33:38', '2022-10-04 17:33:38', NULL, '0.00'),
(400, 43, NULL, 100384, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 17:34:51', '2022-10-04 17:34:51', NULL, '0.00'),
(401, 28, NULL, 100385, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 18:56:23', '2022-10-04 18:56:23', NULL, '0.00'),
(402, 43, NULL, 100386, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-04 19:01:11', '2022-10-04 19:01:11', NULL, '0.00'),
(403, 24, NULL, 100387, '790.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-05 17:41:35', '2022-10-05 17:41:35', NULL, '0.00'),
(404, 41, NULL, 100388, '180.00', NULL, '[{\"type\":\"Bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-05 17:48:12', '2022-10-05 17:48:12', NULL, '0.00'),
(405, 43, NULL, 100389, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-05 17:50:46', '2022-10-05 17:50:46', NULL, '0.00'),
(406, 24, NULL, 100390, '790.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-05 17:51:35', '2022-10-05 17:51:35', NULL, '0.00'),
(407, 43, NULL, 100391, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-05 17:52:24', '2022-10-05 17:52:24', NULL, '0.00'),
(408, 43, NULL, 100392, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-05 17:53:48', '2022-10-05 17:53:48', NULL, '0.00'),
(409, 43, NULL, 100393, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-05 17:57:57', '2022-10-05 17:57:57', NULL, '0.00'),
(410, 43, NULL, 100394, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-05 18:13:20', '2022-10-05 18:13:20', NULL, '0.00'),
(411, 28, NULL, 100395, '290.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-05 18:24:29', '2022-10-05 18:24:29', NULL, '0.00'),
(412, 43, NULL, 100396, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-06 11:57:26', '2022-10-06 11:57:26', NULL, '0.00'),
(413, 43, NULL, 100397, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-06 12:08:20', '2022-10-06 12:08:20', NULL, '0.00'),
(414, 24, NULL, 100398, '790.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-06 12:08:33', '2022-10-06 12:08:33', NULL, '0.00'),
(415, 24, NULL, 100399, '790.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-06 12:09:23', '2022-10-06 12:09:23', NULL, '0.00'),
(416, 43, NULL, 100400, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-06 12:11:36', '2022-10-06 12:11:36', NULL, '0.00'),
(417, 43, NULL, 100401, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-06 13:13:42', '2022-10-06 13:13:42', NULL, '0.00'),
(418, 35, NULL, 100402, '1590.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-06 13:23:12', '2022-10-06 13:23:12', NULL, '0.00'),
(419, 24, NULL, 100403, '790.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-06 13:30:29', '2022-10-06 13:30:29', NULL, '0.00'),
(420, 24, NULL, 100404, '790.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-06 13:31:39', '2022-10-06 13:31:39', NULL, '0.00'),
(421, 43, NULL, 100405, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-06 13:52:32', '2022-10-06 13:52:32', NULL, '0.00'),
(422, 43, NULL, 100406, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-06 14:00:37', '2022-10-06 14:00:37', NULL, '0.00'),
(423, 43, NULL, 100407, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-07 13:42:05', '2022-10-07 13:42:05', NULL, '0.00'),
(424, NULL, NULL, 100408, '180.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-07 13:52:47', '2022-10-07 13:52:47', NULL, '0.00'),
(425, 50, NULL, 100409, '600.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-19 12:50:17', '2022-10-19 12:50:17', NULL, '0.00'),
(426, 55, NULL, 100410, '240.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-10-20 17:45:50', '2022-10-20 17:45:50', NULL, '0.00'),
(427, 44, NULL, 100411, '140.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-01 18:25:22', '2022-11-01 18:25:22', NULL, '0.00'),
(428, 54, NULL, 100412, '140.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-01 18:32:24', '2022-11-01 18:32:24', NULL, '0.00'),
(429, 41, NULL, 100413, '180.00', NULL, '[{\"type\":\"Bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-01 18:38:29', '2022-11-01 18:38:29', NULL, '0.00'),
(430, 24, NULL, 100414, '790.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-02 14:50:22', '2022-11-02 14:50:22', NULL, '0.00'),
(431, 43, NULL, 100415, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-03 10:25:19', '2022-11-03 10:25:19', NULL, '0.00'),
(432, 24, NULL, 100416, '790.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-03 10:27:00', '2022-11-03 10:27:00', NULL, '0.00'),
(433, 43, NULL, 100417, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-03 10:31:25', '2022-11-03 10:31:25', NULL, '0.00'),
(434, 24, NULL, 100418, '790.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-03 10:33:21', '2022-11-03 10:33:21', NULL, '0.00'),
(435, 24, NULL, 100419, '790.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-03 10:36:10', '2022-11-03 10:36:10', NULL, '0.00'),
(436, 43, NULL, 100420, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-03 11:02:49', '2022-11-03 11:02:49', NULL, '0.00'),
(437, 43, NULL, 100421, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-03 11:56:11', '2022-11-03 11:56:11', NULL, '0.00'),
(438, 50, NULL, 100422, '600.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-03 12:07:03', '2022-11-03 12:07:03', NULL, '0.00'),
(439, 49, NULL, 100423, '800.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-03 12:40:19', '2022-11-03 12:40:19', NULL, '0.00'),
(440, 48, NULL, 100424, '990.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-03 12:45:02', '2022-11-03 12:45:02', NULL, '0.00'),
(441, 49, NULL, 100425, '800.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-03 13:06:54', '2022-11-03 13:06:54', NULL, '0.00'),
(442, 50, NULL, 100426, '600.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-03 13:54:13', '2022-11-03 13:54:13', NULL, '0.00'),
(443, 43, NULL, 100427, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-03 18:29:15', '2022-11-03 18:29:15', NULL, '0.00'),
(444, 41, NULL, 100428, '180.00', NULL, '[{\"type\":\"Bestservice\",\"price\":200}]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-03 18:47:40', '2022-11-03 18:47:40', NULL, '0.00'),
(445, 43, NULL, 100429, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-04 17:08:11', '2022-11-04 17:08:11', NULL, '0.00'),
(446, 35, NULL, 100430, '1590.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-04 17:12:11', '2022-11-04 17:12:11', NULL, '0.00'),
(447, 24, NULL, 100431, '790.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-04 17:34:32', '2022-11-04 17:34:32', NULL, '0.00'),
(448, 43, NULL, 100432, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-05 12:24:33', '2022-11-05 12:24:33', NULL, '0.00'),
(449, 43, NULL, 100433, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-09 15:22:45', '2022-11-09 15:22:45', NULL, '0.00'),
(450, 43, NULL, 100434, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-11 11:48:05', '2022-11-11 11:48:05', NULL, '0.00'),
(451, 43, NULL, 100435, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-15 11:31:22', '2022-11-15 11:31:22', NULL, '0.00'),
(452, 24, NULL, 100436, '790.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-15 11:33:21', '2022-11-15 11:33:21', NULL, '0.00'),
(453, 43, NULL, 100437, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-15 11:34:59', '2022-11-15 11:34:59', NULL, '0.00'),
(454, 43, NULL, 100438, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-15 11:42:19', '2022-11-15 11:42:19', NULL, '0.00'),
(455, 43, NULL, 100439, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-15 11:46:28', '2022-11-15 11:46:28', NULL, '0.00'),
(456, 43, NULL, 100440, '190.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2022-11-15 11:50:03', '2022-11-15 11:50:03', NULL, '0.00'),
(457, 44, NULL, 100441, '140.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2023-01-10 10:31:34', '2023-01-10 10:31:34', NULL, '0.00'),
(458, 62, NULL, 100442, '90.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2023-01-12 10:24:17', '2023-01-12 10:24:17', NULL, '0.00'),
(459, 62, NULL, 100443, '90.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2023-01-12 10:27:36', '2023-01-12 10:27:36', NULL, '0.00'),
(460, 62, NULL, 100444, '90.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2023-01-12 10:33:36', '2023-01-12 10:33:36', NULL, '0.00'),
(461, 62, NULL, 100445, '90.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2023-01-12 10:51:25', '2023-01-12 10:51:25', NULL, '0.00'),
(462, 62, NULL, 100446, '90.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2023-01-12 11:08:02', '2023-01-12 11:08:02', NULL, '0.00'),
(463, 62, NULL, 100447, '90.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2023-01-12 11:08:44', '2023-01-12 11:08:44', NULL, '0.00'),
(464, 62, NULL, 100448, '90.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2023-01-12 11:12:20', '2023-01-12 11:12:20', NULL, '0.00'),
(465, 61, NULL, 100449, '90.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2023-01-12 11:26:41', '2023-01-12 11:26:41', NULL, '0.00'),
(466, 61, NULL, 100450, '90.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2023-01-12 11:43:18', '2023-01-12 11:43:18', NULL, '0.00'),
(467, 63, NULL, 100451, '900.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2023-01-12 12:04:14', '2023-01-12 12:04:14', NULL, '0.00'),
(468, 63, NULL, 100452, '900.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2023-01-12 13:48:43', '2023-01-12 13:48:43', NULL, '0.00'),
(469, 63, NULL, 100453, '900.00', NULL, '[]', '[]', NULL, 'discount_on_product', 1, '1.00', 'null', '2023-01-12 13:50:26', '2023-01-12 13:50:26', NULL, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `order_amount` decimal(24,2) NOT NULL,
  `restaurant_amount` decimal(24,2) NOT NULL,
  `admin_commission` decimal(24,2) NOT NULL,
  `received_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_transactions`
--

INSERT INTO `order_transactions` (`id`, `vendor_id`, `delivery_man_id`, `order_id`, `order_amount`, `restaurant_amount`, `admin_commission`, `received_by`, `status`, `created_at`, `updated_at`, `delivery_charge`, `original_delivery_charge`, `tax`) VALUES
(1, 11, NULL, 100245, '9.00', '9.00', '0.00', 'admin', NULL, '2022-09-27 13:56:05', '2022-09-27 13:56:05', '0.00', '0.00', '0.00'),
(2, 12, NULL, 100244, '76.00', '76.00', '0.00', 'admin', NULL, '2022-09-27 14:10:27', '2022-09-27 14:10:27', '0.00', '0.00', '0.00'),
(3, 11, NULL, 100247, '96.00', '96.00', '0.00', 'admin', NULL, '2022-09-27 18:42:05', '2022-09-27 18:42:05', '0.00', '0.00', '0.00'),
(4, 13, NULL, 100172, '150.00', '150.00', '0.00', 'vendor', NULL, '2022-09-28 13:59:34', '2022-09-28 13:59:34', '0.00', '0.00', '0.00'),
(5, 11, NULL, 100272, '0.00', '0.00', '0.00', 'admin', NULL, '2022-09-28 18:43:23', '2022-09-28 18:43:23', '0.00', '0.00', '0.00'),
(6, 11, NULL, 100281, '19.00', '0.00', '19.00', 'admin', NULL, '2022-09-29 14:42:33', '2022-09-29 14:42:33', '0.00', '0.00', '0.00'),
(7, 11, NULL, 100285, '0.00', '0.00', '0.00', 'admin', NULL, '2022-09-29 14:43:58', '2022-09-29 14:43:58', '0.00', '0.00', '0.00'),
(8, 10, NULL, 100287, '18.00', '0.00', '18.00', 'admin', NULL, '2022-09-29 18:00:16', '2022-09-29 18:00:16', '0.00', '0.00', '0.00'),
(9, 11, NULL, 100288, '19.00', '0.00', '19.00', 'admin', NULL, '2022-09-29 18:11:07', '2022-09-29 18:11:07', '0.00', '0.00', '0.00'),
(10, 11, NULL, 100289, '140.00', '0.00', '140.00', 'admin', NULL, '2022-09-29 18:16:45', '2022-09-29 18:16:45', '0.00', '0.00', '0.00'),
(11, 11, NULL, 100153, '330.00', '0.00', '330.00', 'vendor', NULL, '2022-09-29 18:19:17', '2022-09-29 18:19:17', '0.00', '0.00', '0.00'),
(12, 11, NULL, 100293, '19.00', '0.00', '19.00', 'vendor', NULL, '2022-09-29 18:35:01', '2022-09-29 18:35:01', '0.00', '0.00', '0.00'),
(13, 10, NULL, 100290, '18.00', '0.00', '18.00', 'vendor', NULL, '2022-09-30 11:20:59', '2022-09-30 11:20:59', '0.00', '0.00', '0.00'),
(14, 10, NULL, 100295, '18.00', '0.00', '18.00', 'vendor', NULL, '2022-09-30 11:33:40', '2022-09-30 11:33:40', '0.00', '0.00', '0.00'),
(15, 10, NULL, 100296, '180.00', '0.00', '180.00', 'vendor', NULL, '2022-09-30 15:16:52', '2022-09-30 15:16:52', '0.00', '0.00', '0.00'),
(16, 10, NULL, 100298, '15.00', '0.00', '15.00', 'vendor', NULL, '2022-09-30 15:34:37', '2022-09-30 15:34:37', '0.00', '0.00', '0.00'),
(17, 10, NULL, 100301, '18.00', '0.00', '18.00', 'vendor', NULL, '2022-09-30 15:50:41', '2022-09-30 15:50:41', '0.00', '0.00', '0.00'),
(18, 10, NULL, 100308, '18.00', '0.00', '18.00', 'vendor', NULL, '2022-09-30 18:03:56', '2022-09-30 18:03:56', '0.00', '0.00', '0.00'),
(19, 11, NULL, 100311, '14.00', '0.00', '14.00', 'vendor', NULL, '2022-10-01 11:24:43', '2022-10-01 11:24:43', '0.00', '0.00', '0.00'),
(20, 11, NULL, 100307, '0.00', '0.00', '0.00', 'vendor', NULL, '2022-10-01 11:31:53', '2022-10-01 11:31:53', '0.00', '0.00', '0.00'),
(21, 11, NULL, 100309, '185.00', '0.00', '185.00', 'vendor', NULL, '2022-10-01 11:32:48', '2022-10-01 11:32:48', '0.00', '0.00', '0.00'),
(22, 11, NULL, 100313, '19.00', '17.10', '1.90', 'vendor', NULL, '2022-10-01 13:16:05', '2022-10-01 13:16:05', '0.00', '0.00', '0.00'),
(23, 11, NULL, 100317, '190.00', '171.00', '19.00', 'vendor', NULL, '2022-10-01 16:24:08', '2022-10-01 16:24:08', '0.00', '0.00', '0.00'),
(24, 11, NULL, 100318, '209.00', '188.10', '20.90', 'vendor', NULL, '2022-10-01 16:45:03', '2022-10-01 16:45:03', '0.00', '0.00', '0.00'),
(25, 11, NULL, 100326, '209.00', '190.00', '19.00', 'admin', NULL, '2022-10-01 18:50:27', '2022-10-01 18:50:27', '0.00', '0.00', '19.00'),
(26, 11, NULL, 100328, '0.00', '1.90', '-1.90', 'admin', NULL, '2022-10-01 19:07:31', '2022-10-01 19:07:31', '0.00', '0.00', '19.00'),
(27, 11, NULL, 100331, '0.00', '1.80', '-1.80', 'vendor', NULL, '2022-10-03 11:35:16', '2022-10-03 11:35:16', '0.00', '0.00', '18.00'),
(28, 11, NULL, 100332, '0.00', '1.90', '-1.90', 'vendor', NULL, '2022-10-03 11:40:15', '2022-10-03 11:40:15', '0.00', '0.00', '19.00'),
(29, 11, NULL, 100334, '179.00', '162.90', '16.10', 'admin', NULL, '2022-10-03 12:17:47', '2022-10-03 12:17:47', '0.00', '0.00', '18.00'),
(30, 10, NULL, 100353, '18.00', '0.00', '18.00', 'admin', NULL, '2022-10-03 22:34:24', '2022-10-03 22:34:24', '0.00', '0.00', '0.00'),
(31, 10, NULL, 100354, '14.00', '0.00', '14.00', 'admin', NULL, '2022-10-03 22:39:41', '2022-10-03 22:39:41', '0.00', '0.00', '0.00'),
(32, 9, NULL, 100355, '14.00', '0.00', '14.00', 'admin', NULL, '2022-10-03 22:41:58', '2022-10-03 22:41:58', '0.00', '0.00', '0.00'),
(33, 12, NULL, 100356, '17.00', '0.00', '17.00', 'admin', NULL, '2022-10-03 22:46:18', '2022-10-03 22:46:18', '0.00', '0.00', '0.00'),
(34, 11, NULL, 100360, '19.00', '19.00', '0.00', 'admin', NULL, '2022-10-04 09:02:05', '2022-10-04 09:02:05', '0.00', '0.00', '19.00'),
(35, 11, NULL, 100361, '696.00', '634.30', '61.70', 'admin', NULL, '2022-10-04 10:41:51', '2022-10-04 10:41:51', '0.00', '0.00', '79.00'),
(36, 11, NULL, 100358, '0.00', '1.90', '-1.90', 'admin', NULL, '2022-10-04 10:43:42', '2022-10-04 10:43:42', '0.00', '0.00', '19.00'),
(37, 10, NULL, 100395, '290.00', '0.00', '290.00', 'admin', NULL, '2022-10-05 20:31:53', '2022-10-05 20:31:53', '0.00', '0.00', '0.00'),
(38, 11, NULL, 100393, '189.00', '172.00', '17.00', 'admin', NULL, '2022-10-05 20:44:39', '2022-10-05 20:44:39', '0.00', '0.00', '19.00'),
(39, 11, NULL, 100338, '869.00', '790.00', '79.00', 'admin', NULL, '2022-10-05 20:49:31', '2022-10-05 20:49:31', '0.00', '0.00', '79.00'),
(40, 11, NULL, 100401, '0.00', '1.90', '-1.90', 'vendor', NULL, '2022-10-06 13:19:48', '2022-10-06 13:19:48', '0.00', '0.00', '19.00'),
(41, 11, NULL, 100407, '19.00', '19.00', '0.00', 'vendor', NULL, '2022-10-15 18:56:52', '2022-10-15 18:56:52', '0.00', '0.00', '19.00'),
(42, 11, NULL, 100400, '19.00', '19.00', '0.00', 'vendor', 'refunded_without_delivery_charge', '2022-10-15 19:12:27', '2023-01-09 10:43:52', '0.00', '0.00', '19.00'),
(43, 11, NULL, 100387, '0.00', '7.80', '-7.80', 'vendor', NULL, '2022-10-15 19:14:16', '2022-10-15 19:14:16', '0.00', '0.00', '78.00'),
(44, 11, NULL, 100389, '19.00', '19.00', '0.00', 'admin', NULL, '2022-10-17 10:53:48', '2022-10-17 10:53:48', '0.00', '0.00', '19.00'),
(45, 11, NULL, 100374, '0.00', '15.90', '-15.90', 'admin', NULL, '2022-10-17 11:36:23', '2022-10-17 11:36:23', '0.00', '0.00', '159.00'),
(46, 11, NULL, 100373, '0.00', '1.80', '-1.80', 'admin', NULL, '2022-10-17 15:54:57', '2022-10-17 15:54:57', '0.00', '0.00', '18.00'),
(47, 11, NULL, 100306, '14.00', '12.60', '1.40', 'admin', NULL, '2022-10-19 12:51:29', '2022-10-19 12:51:29', '0.00', '0.00', '0.00'),
(48, 12, NULL, 100409, '600.00', '0.00', '600.00', 'admin', NULL, '2022-10-20 11:11:36', '2022-10-20 11:11:36', '0.00', '0.00', '0.00'),
(49, 11, NULL, 100372, '0.00', '7.90', '-7.90', 'admin', NULL, '2022-10-20 11:13:29', '2022-10-20 11:13:29', '0.00', '0.00', '79.00'),
(50, 11, NULL, 100371, '696.00', '634.30', '61.70', 'admin', NULL, '2022-10-20 17:43:53', '2022-10-20 17:43:53', '0.00', '0.00', '79.00'),
(51, 11, NULL, 100430, '1749.00', '1590.00', '159.00', 'vendor', NULL, '2022-11-04 17:24:52', '2022-11-04 17:24:52', '0.00', '0.00', '159.00'),
(52, 11, NULL, 100431, '869.00', '790.00', '79.00', 'admin', NULL, '2022-11-05 13:22:50', '2022-11-05 13:22:50', '0.00', '0.00', '79.00'),
(53, 11, NULL, 100429, '209.00', '190.00', '19.00', 'admin', NULL, '2022-11-05 13:25:39', '2022-11-05 13:25:39', '0.00', '0.00', '19.00'),
(54, 12, NULL, 100426, '600.00', '0.00', '600.00', 'admin', NULL, '2022-11-05 13:30:42', '2022-11-05 13:30:42', '0.00', '0.00', '0.00'),
(55, 11, NULL, 100418, '0.00', '7.90', '-7.90', 'admin', NULL, '2022-11-05 13:39:25', '2022-11-05 13:39:25', '0.00', '0.00', '79.00'),
(56, 11, NULL, 100414, '869.00', '790.00', '79.00', 'vendor', NULL, '2022-11-05 13:49:54', '2022-11-05 13:49:54', '0.00', '0.00', '79.00'),
(57, 12, NULL, 100423, '0.00', '0.00', '0.00', 'admin', NULL, '2022-11-05 17:52:17', '2022-11-05 17:52:17', '0.00', '0.00', '0.00'),
(58, 9, NULL, 100411, '0.00', '0.00', '0.00', 'admin', NULL, '2022-11-05 17:53:41', '2022-11-05 17:53:41', '0.00', '0.00', '0.00'),
(59, 11, NULL, 100427, '209.00', '190.00', '19.00', 'admin', NULL, '2022-11-05 18:25:50', '2022-11-05 18:25:50', '0.00', '0.00', '19.00'),
(60, 10, NULL, 100413, '180.00', '0.00', '180.00', 'admin', NULL, '2022-11-07 10:33:32', '2022-11-07 10:33:32', '0.00', '0.00', '0.00'),
(61, 11, NULL, 100352, '19.00', '19.00', '0.00', 'admin', NULL, '2022-11-07 11:57:33', '2022-11-07 11:57:33', '0.00', '0.00', '19.00'),
(62, 11, NULL, 100432, '209.00', '190.00', '19.00', 'admin', NULL, '2022-11-07 12:02:25', '2022-11-07 12:02:25', '0.00', '0.00', '19.00'),
(63, 11, NULL, 100340, '209.00', '190.00', '19.00', 'admin', NULL, '2022-11-07 13:04:00', '2022-11-07 13:04:00', '0.00', '0.00', '19.00'),
(64, 11, NULL, 100344, '869.00', '790.00', '79.00', 'vendor', NULL, '2022-11-07 16:38:35', '2022-11-07 16:38:35', '0.00', '0.00', '79.00'),
(65, 11, NULL, 100321, '0.00', '0.00', '0.00', 'vendor', NULL, '2022-11-07 16:44:14', '2022-11-07 16:44:14', '0.00', '0.00', '0.00'),
(66, 11, NULL, 100434, '19.00', '19.00', '0.00', 'admin', NULL, '2022-11-11 11:49:03', '2022-11-11 11:49:03', '0.00', '0.00', '19.00'),
(67, 11, NULL, 100433, '19.00', '19.00', '0.00', 'admin', NULL, '2022-11-14 11:26:36', '2022-11-14 11:26:36', '0.00', '0.00', '19.00'),
(68, 10, NULL, 100348, '290.00', '0.00', '290.00', 'admin', NULL, '2022-11-14 12:06:48', '2022-11-14 12:06:48', '0.00', '0.00', '0.00'),
(69, 11, NULL, 100343, '790.00', '711.00', '79.00', 'admin', NULL, '2022-11-14 12:15:40', '2022-11-14 12:15:40', '0.00', '0.00', '0.00'),
(70, 11, NULL, 100440, '19.00', '19.00', '0.00', 'admin', NULL, '2022-11-15 11:52:21', '2022-11-15 11:52:21', '0.00', '0.00', '19.00'),
(71, 11, NULL, 100439, '19.00', '19.00', '0.00', 'admin', NULL, '2022-11-16 10:22:44', '2022-11-16 10:22:44', '0.00', '0.00', '19.00'),
(72, 11, NULL, 100438, '19.00', '19.00', '0.00', 'admin', NULL, '2022-11-16 15:06:06', '2022-11-16 15:06:06', '0.00', '0.00', '19.00'),
(73, 11, NULL, 100342, '209.00', '190.00', '19.00', 'admin', NULL, '2022-11-16 15:06:54', '2022-11-16 15:06:54', '0.00', '0.00', '19.00'),
(74, 11, NULL, 100277, '190.00', '171.00', '19.00', 'admin', NULL, '2022-12-02 10:42:03', '2022-12-02 10:42:03', '0.00', '0.00', '0.00'),
(75, 11, NULL, 100276, '190.00', '171.00', '19.00', 'admin', NULL, '2022-12-12 13:40:42', '2022-12-12 13:40:42', '0.00', '0.00', '0.00'),
(76, 11, NULL, 100275, '33.00', '29.70', '3.30', 'admin', NULL, '2023-01-07 18:17:24', '2023-01-07 18:17:24', '0.00', '0.00', '0.00'),
(77, 11, NULL, 100339, '790.00', '711.00', '79.00', 'admin', NULL, '2023-01-07 18:18:02', '2023-01-07 18:18:02', '0.00', '0.00', '0.00'),
(78, 23, NULL, 100442, '9.00', '0.00', '9.00', 'admin', NULL, '2023-01-12 10:26:39', '2023-01-12 10:26:39', '0.00', '0.00', '0.00'),
(79, 23, NULL, 100443, '9.00', '0.00', '9.00', 'vendor', NULL, '2023-01-12 10:31:38', '2023-01-12 10:31:38', '0.00', '0.00', '0.00'),
(80, 23, NULL, 100447, '90.00', '0.00', '90.00', 'admin', NULL, '2023-01-12 11:10:59', '2023-01-12 11:10:59', '0.00', '0.00', '0.00'),
(81, 20, NULL, 100450, '90.00', '0.00', '90.00', 'admin', NULL, '2023-01-12 11:52:56', '2023-01-12 11:52:56', '0.00', '0.00', '0.00'),
(82, 20, NULL, 100449, '90.00', '0.00', '90.00', 'admin', NULL, '2023-01-12 12:00:49', '2023-01-12 12:00:49', '0.00', '0.00', '0.00'),
(83, 23, NULL, 100446, '90.00', '0.00', '90.00', 'admin', NULL, '2023-01-12 13:49:50', '2023-01-12 13:49:50', '0.00', '0.00', '0.00'),
(84, 20, NULL, 100453, '900.00', '0.00', '900.00', 'admin', NULL, '2023-01-12 13:51:18', '2023-01-12 13:51:18', '0.00', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('vish456@gmail.com', '9890', '2022-08-17 00:28:51'),
('vish456@gmail.com', '8973', '2022-08-17 00:28:57'),
('vish456@gmail.com', '5636', '2022-08-17 00:31:04'),
('vish456@gmail.com', '6445', '2022-08-17 00:31:57'),
('vish456@gmail.com', '8966', '2022-08-17 00:32:02'),
('vish456@gmail.com', '8043', '2022-08-17 00:33:15'),
('vish456@gmail.com', '3055', '2022-08-26 01:04:52'),
('vish456@gmail.com', '5276', '2022-08-26 01:04:58'),
('vish456@gmail.com', '5592', '2022-08-26 01:05:33'),
('vish456@gmail.com', '5571', '2022-08-29 05:56:13'),
('jay22@gmail.com', '4439', '2022-08-29 06:01:39'),
('jay22@gmail.com', '5922', '2022-08-29 06:05:24'),
('vish456@gmail.com', '8921', '2022-09-01 02:57:22'),
('vish456@gmail.com', '2379', '2022-09-01 02:57:30'),
('anc@gmail.com', '6863', '2022-09-08 01:07:05'),
('anc@gmail.com', '8734', '2022-09-08 01:07:11'),
('anc@gmail.com', '5164', '2022-09-08 01:08:58'),
('vish456@gmail.com', '5356', '2022-09-12 08:46:28'),
('vish456@gmail.com', '7630', '2022-09-12 08:46:59'),
('vish456@gmail.com', '8271', '2022-09-15 11:15:58'),
('vish456@gmail.com', '1085', '2022-09-16 15:05:08'),
('puja@gmail.com', '1023', '2022-10-01 15:18:41'),
('puja@gmail.com', '7275', '2022-10-01 15:26:24'),
('puja@gmail.com', '9286', '2022-10-01 15:26:31'),
('puja@gmail.com', '2583', '2022-10-01 15:26:43'),
('vish456@gmail.com', '5238', '2022-10-01 15:32:53'),
('vish456@gmail.com', '4281', '2022-10-01 15:32:59'),
('vish456@gmail.com', '3551', '2022-10-01 15:40:33'),
('puja@gmail.com', '6503', '2022-10-01 18:52:40'),
('vish456@gmail.com', '9729', '2022-10-03 16:37:22'),
('vish456@gmail.com', '4199', '2022-10-04 12:06:03'),
('vish456@gmail.com', '6552', '2022-10-04 12:06:18'),
('raginibellway@gmail.com', '8350', '2022-10-04 12:42:16'),
('aaryanjhaofficial@gmail.com', '7111', '2022-10-06 13:08:01'),
('puja@gmail.com', '7621', '2022-10-06 13:08:53'),
('johnn@test.com', '8851', '2022-10-06 13:10:02'),
('johnn@test.com', '1637', '2022-10-06 13:43:20'),
('puja@gmail.com', '7753', '2022-10-06 13:57:45'),
('testing2000@test.com', '5522', '2022-10-06 14:59:40'),
('magan@gmail.com', '6292', '2022-10-06 15:01:34'),
('magan@gmail.com', '8785', '2022-10-06 15:02:56'),
('aaa@sfda.aasa', '7733', '2022-10-06 15:06:07'),
('aaa@sfda.aasa', '2021', '2022-10-06 15:13:27'),
('aaa@sfda.aasa', '7013', '2022-10-06 15:14:53'),
('aaa@sfda.aasa', '2827', '2022-10-06 15:16:02'),
('aaa@sfda.aasa', '8079', '2022-10-06 15:16:36'),
('johnn@test.com', '5902', '2022-10-06 15:20:44'),
('magan@gmail.com', '4522', '2022-10-06 15:22:02'),
('aaa@sfda.aasa', '4964', '2022-10-06 15:24:15'),
('johnn@test.com', '9832', '2022-10-06 15:40:10'),
('magan@gmail.com', '5439', '2022-10-06 15:43:11'),
('johnn@test.com', '7463', '2022-10-06 15:44:16'),
('esioabraham120@gmail.com', '1362', '2022-10-06 15:45:13'),
('vish456@gmail.com', '8986', '2022-10-06 15:47:51'),
('aaa@sfda.aasa', '8977', '2022-10-06 16:03:49'),
('aaa@sfda.aasa', '6067', '2022-10-06 16:04:42'),
('aaa@sfda.aasa', '1151', '2022-10-06 16:07:39'),
('magan@gmail.com', '4972', '2022-10-06 16:24:40'),
('aaa@sfda.aasa', '8490', '2022-10-06 16:25:22'),
('magan@gmail.com', '9472', '2022-10-06 16:25:28'),
('magan@gmail.com', '7277', '2022-10-06 16:25:36'),
('shivacharan123@gmail.com', '9625', '2022-10-06 16:26:41'),
('aaa@sfda.aasa', '9738', '2022-10-06 16:28:24'),
('magan@gmail.com', '1265', '2022-10-06 16:29:02'),
('magan@gmail.com', '8659', '2022-10-06 16:29:44'),
('aaa@sfda.aasa', '6223', '2022-10-06 16:31:42'),
('aaa@sfda.aasa', '6185', '2022-10-06 16:35:02'),
('magan@gmail.com', '7281', '2022-10-06 17:14:06'),
('magan@gmail.com', '6854', '2022-10-10 10:54:05');

-- --------------------------------------------------------

--
-- Table structure for table `phone_verifications`
--

CREATE TABLE `phone_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phone_verifications`
--

INSERT INTO `phone_verifications` (`id`, `phone`, `token`, `created_at`, `updated_at`) VALUES
(5, '123456789', '9247', '2022-08-03 19:31:54', '2022-08-03 19:31:54'),
(6, '+2349036342948', '3813', '2022-08-03 19:33:29', '2022-08-03 19:33:29'),
(8, '+918305137336', '4944', '2022-08-17 02:25:10', '2022-08-17 02:25:10'),
(9, '+918989454261', '7510', '2022-08-16 23:10:46', '2022-08-16 23:10:46'),
(10, '+919981255927', '5869', '2022-08-16 23:12:45', '2022-08-16 23:12:45'),
(11, '+916263001874', '8370', '2022-08-16 23:14:43', '2022-08-16 23:14:43'),
(12, '+919691237935', '6767', '2022-08-17 00:18:47', '2022-08-17 00:18:47'),
(14, '+919598324808', '4700', '2022-10-08 15:05:23', '2022-10-08 15:05:23'),
(16, '+919098466409', '5496', '2022-10-03 17:42:00', '2022-10-03 17:42:00'),
(17, '+917223805597', '4905', '2022-10-04 19:18:44', '2022-10-04 19:18:44'),
(19, '+919424825205', '9125', '2022-10-06 11:56:08', '2022-10-06 11:56:08'),
(21, '+919999999999', '9346', '2022-10-04 19:13:37', '2022-10-04 19:13:37'),
(22, '+919695969596', '2853', '2022-10-06 14:51:05', '2022-10-06 14:51:05'),
(23, '+918547553376', '7607', '2022-10-06 15:00:16', '2022-10-06 15:00:16'),
(24, '+918485878485', '4138', '2022-10-06 15:00:53', '2022-10-06 15:00:53'),
(26, '+915252525253', '4767', '2022-10-06 15:20:31', '2022-10-06 15:20:31'),
(27, '+918484848484', '5919', '2022-10-06 15:25:29', '2022-10-06 15:25:29'),
(28, '+919898989898', '3036', '2022-10-06 15:26:48', '2022-10-06 15:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `provide_d_m_earnings`
--

CREATE TABLE `provide_d_m_earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `referrer_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `referrals`
--

INSERT INTO `referrals` (`id`, `user_id`, `referrer_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 23, 5, '10.00', '2022-09-09 05:59:23', '2022-09-09 05:59:23'),
(2, 27, 26, '10.00', '2022-09-14 05:16:46', '2022-09-14 05:16:46'),
(3, 31, 5, '10.00', '2022-09-19 19:44:39', '2022-09-19 19:44:39'),
(4, 37, 36, '10.00', '2022-09-21 16:00:32', '2022-09-21 16:00:32'),
(5, 38, 27, '100.00', '2022-09-28 16:04:18', '2022-09-28 16:04:18'),
(6, 39, 38, '500.00', '2022-09-28 16:15:32', '2022-09-28 16:15:32'),
(7, 40, 27, '500.00', '2022-09-28 16:18:00', '2022-09-28 16:18:00'),
(8, 41, 37, '3000.00', '2022-09-28 16:29:31', '2022-09-28 16:29:31'),
(9, 42, 37, '3000.00', '2022-09-28 16:39:35', '2022-09-28 16:39:35'),
(10, 44, 40, '500.00', '2022-09-28 17:12:56', '2022-09-28 17:12:56'),
(11, 51, 23, '500.00', '2022-10-03 16:40:44', '2022-10-03 16:40:44'),
(12, 53, 50, '500.00', '2022-10-04 12:33:34', '2022-10-04 12:33:34'),
(13, 60, 57, '10.00', '2023-01-11 11:56:28', '2023-01-11 11:56:28');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimum_order` decimal(24,2) NOT NULL DEFAULT 0.00,
  `comission` decimal(24,2) DEFAULT NULL,
  `schedule_order` tinyint(1) NOT NULL DEFAULT 0,
  `opening_time` time DEFAULT '10:00:00',
  `closeing_time` time DEFAULT '23:00:00',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `free_delivery` tinyint(1) NOT NULL DEFAULT 0,
  `rating` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery` tinyint(1) NOT NULL DEFAULT 1,
  `take_away` tinyint(1) NOT NULL DEFAULT 1,
  `food_section` tinyint(1) NOT NULL DEFAULT 1,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reviews_section` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `off_day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  `gst` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `self_delivery_system` tinyint(1) NOT NULL DEFAULT 0,
  `pos_system` tinyint(1) NOT NULL DEFAULT 0,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `delivery_time` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '30-40',
  `veg` tinyint(1) NOT NULL DEFAULT 1,
  `non_veg` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `phone`, `email`, `logo`, `latitude`, `longitude`, `address`, `footer_text`, `minimum_order`, `comission`, `schedule_order`, `opening_time`, `closeing_time`, `status`, `vendor_id`, `created_at`, `updated_at`, `free_delivery`, `rating`, `cover_photo`, `delivery`, `take_away`, `food_section`, `tax`, `zone_id`, `reviews_section`, `active`, `off_day`, `gst`, `self_delivery_system`, `pos_system`, `delivery_charge`, `delivery_time`, `veg`, `non_veg`) VALUES
(1, 'Virat', '8788866634', 'virat@gmail.com', '2023-01-11-63be6e30d2347.png', '21.168399963682177', '77.12011839296247', 'Indore', NULL, '0.00', NULL, 0, '10:00:00', '23:00:00', 0, 21, '2023-01-11 13:37:12', '2023-01-11 13:37:12', 0, NULL, '2023-01-11-63be6e30d5e67.png', 1, 1, 1, '10.00', 4, 1, 1, ' ', NULL, 0, 0, '0.00', '30-40', 1, 1),
(2, 'Virat', '8788866622', 'virat2@gmail.com', '2023-01-11-63be72eb7586d.png', '22.596837300356338', '76.05534389511772', 'Indore', NULL, '0.00', NULL, 0, '10:00:00', '23:00:00', 0, 22, '2023-01-11 13:57:23', '2023-01-11 13:57:23', 0, NULL, '2023-01-11-63be72eb775c8.png', 1, 1, 1, '10.00', 4, 1, 1, ' ', NULL, 0, 0, '0.00', '30-40', 1, 1),
(3, 'Jiten', '7024067897', 'jiten@gmail.com', '2023-01-12-63bf970d0bce0.png', '21.587206569611087', '75.98879280607692', 'Indore', NULL, '0.00', NULL, 0, '10:00:00', '23:00:00', 0, 26, '2023-01-12 10:43:49', '2023-01-12 10:43:49', 0, NULL, '2023-01-12-63bf970d0fa0d.png', 1, 1, 1, '10.00', 4, 1, 1, ' ', NULL, 0, 0, '0.00', '30-40', 1, 1),
(4, 'Vijay', '8877665544', 'vijay@gmail.com', '2023-01-12-63bfa5fd14fe0.png', '22.910239763747743', '76.09266895787471', 'Indore', NULL, '0.00', NULL, 0, '10:00:00', '23:00:00', 0, 27, '2023-01-12 11:47:33', '2023-01-12 11:47:33', 0, NULL, '2023-01-12-63bfa5fd1b52f.png', 1, 1, 1, '10.00', 4, 1, 1, ' ', NULL, 0, 0, '0.00', '30-40', 1, 1),
(5, 'Rekha', '6263778866', 'rekha@gmail.com', '2023-01-12-63bfa7930b2cb.png', '24.29167377206436', '75.02961229799594', 'Indore', NULL, '0.00', NULL, 0, '10:00:00', '23:00:00', 0, 28, '2023-01-12 11:54:19', '2023-01-12 11:54:19', 0, NULL, '2023-01-12-63bfa7930bf78.png', 1, 1, 1, '10.00', 4, 1, 1, ' ', NULL, 0, 0, '0.00', '30-40', 1, 1),
(6, 'Arpita', '7766855443', 'arpita@gmail.com', '2023-01-12-63bfb1663a151.png', '22.052387719147077', '75.42614818086594', 'Indore', NULL, '0.00', NULL, 0, '10:00:00', '23:00:00', 0, 29, '2023-01-12 12:36:14', '2023-01-12 12:36:14', 0, NULL, '2023-01-12-63bfb1663e3d5.png', 1, 1, 1, '10.00', 4, 1, 1, ' ', NULL, 0, 0, '0.00', '30-40', 1, 1),
(7, 'Devin', '9900886655', 'devin@gmail.com', '2023-01-12-63bfb3dfabc44.png', '22.249472067848842', '76.9747497648504', 'Indore', NULL, '0.00', NULL, 0, '10:00:00', '23:00:00', 0, 30, '2023-01-12 12:46:47', '2023-01-12 12:46:47', 0, NULL, '2023-01-12-63bfb3dfadb13.png', 1, 1, 1, '10.00', 4, 1, 1, ' ', NULL, 0, 0, '0.00', '30-40', 1, 1),
(8, 'Gopal', '8305137333', 'vishnucharan1@gmail.com', '2023-01-12-63bfbbe40e2d8.png', '22.83755012510245', '75.87004762712264', 'Indore', NULL, '0.00', NULL, 0, '10:00:00', '23:00:00', 0, 31, '2023-01-12 13:21:00', '2023-01-12 13:21:00', 0, NULL, '2023-01-12-63bfbbe4117e1.png', 1, 1, 1, '10.00', 4, 1, 1, ' ', NULL, 0, 0, '0.00', '30-40', 1, 1),
(9, 'Pappu', '7766554438', 'pappu@gmail.com', '2023-01-12-63c00d11c5c6e.png', '22.146186865240658', '75.5557513087438', 'Indore', NULL, '0.00', NULL, 0, '10:00:00', '23:00:00', 0, 32, '2023-01-12 19:07:21', '2023-01-12 19:07:21', 0, NULL, '2023-01-12-63c00d11c67b6.png', 1, 1, 1, '10.00', 4, 1, 1, ' ', NULL, 0, 0, '0.00', '30-40', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_wallets`
--

CREATE TABLE `restaurant_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT 0.00,
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT 0.00,
  `collected_cash` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_wallets`
--

INSERT INTO `restaurant_wallets` (`id`, `vendor_id`, `total_earning`, `total_withdrawn`, `pending_withdraw`, `collected_cash`, `created_at`, `updated_at`) VALUES
(1, 1, '0.00', '0.00', '0.00', '0.00', '2022-07-25 01:38:14', '2022-07-25 01:38:14'),
(2, 2, '0.00', '0.00', '0.00', '0.00', '2022-07-25 07:42:57', '2022-07-25 07:42:57'),
(3, 3, '0.00', '0.00', '0.00', '0.00', '2022-07-25 21:34:43', '2022-07-25 21:34:43'),
(4, 8, '0.00', '0.00', '0.00', '0.00', '2022-08-22 00:13:51', '2022-08-22 00:13:51'),
(5, 9, '0.00', '0.00', '0.00', '0.00', '2022-08-22 01:24:19', '2022-11-05 17:53:41'),
(6, 10, '0.00', '0.00', '0.00', '267.00', '2022-08-22 06:02:47', '2022-11-14 12:06:48'),
(7, 7, '0.00', '0.00', '0.00', '0.00', '2022-09-02 22:31:36', '2022-09-02 22:31:36'),
(8, 12, '76.00', '0.00', '0.00', '0.00', '2022-09-03 01:28:25', '2022-11-05 17:52:17'),
(9, 13, '150.00', '0.00', '0.00', '150.00', '2022-09-05 02:48:02', '2022-09-28 13:59:34'),
(10, 11, '10002.70', '1535.50', '0.00', '4472.00', '2022-09-17 14:47:36', '2023-01-09 10:43:52'),
(11, 15, '0.00', '0.00', '0.00', '0.00', '2022-09-23 17:35:24', '2022-09-23 17:35:24'),
(12, 16, '0.00', '0.00', '0.00', '0.00', '2022-10-15 18:38:34', '2022-10-15 18:38:34'),
(13, 19, '0.00', '0.00', '0.00', '0.00', '2022-11-16 10:26:49', '2022-11-16 10:26:49'),
(14, 20, '0.00', '0.00', '0.00', '0.00', '2023-01-09 11:51:34', '2023-01-12 13:51:18'),
(15, 21, '0.00', '0.00', '0.00', '0.00', '2023-01-11 13:37:52', '2023-01-11 13:37:52'),
(16, 22, '0.00', '0.00', '0.00', '0.00', '2023-01-11 14:03:01', '2023-01-11 14:03:01'),
(17, 23, '0.00', '0.00', '0.00', '9.00', '2023-01-12 10:22:07', '2023-01-12 13:49:50'),
(18, 26, '0.00', '0.00', '0.00', '0.00', '2023-01-12 10:52:11', '2023-01-12 10:52:11'),
(19, 27, '0.00', '0.00', '0.00', '0.00', '2023-01-12 11:54:05', '2023-01-12 11:54:05'),
(20, 28, '0.00', '0.00', '0.00', '0.00', '2023-01-12 11:56:43', '2023-01-12 11:56:43'),
(21, 29, '0.00', '0.00', '0.00', '0.00', '2023-01-12 12:39:57', '2023-01-12 12:39:57'),
(22, 30, '0.00', '0.00', '0.00', '0.00', '2023-01-12 13:17:40', '2023-01-12 13:17:40'),
(23, 31, '0.00', '0.00', '0.00', '0.00', '2023-01-12 13:21:49', '2023-01-12 13:21:49');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_zone`
--

CREATE TABLE `restaurant_zone` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `service_id`, `user_id`, `comment`, `attachment`, `rating`, `order_id`, `created_at`, `updated_at`, `item_campaign_id`, `status`) VALUES
(1, 3, 5, 'nice!', NULL, 5, 1, NULL, NULL, NULL, 1),
(2, 3, 5, 'nice!', NULL, 4, 1, NULL, NULL, NULL, 1),
(3, 5, 5, 'beautiful', '[]', 5, 1, '2022-07-23 23:53:51', '2022-07-23 23:53:51', NULL, 1),
(4, 24, 37, 'io7t', '[]', 4, 100317, '2022-10-01 16:26:12', '2022-10-01 16:26:12', NULL, 1),
(5, 24, 37, 'aasdasdasdasdas', '[]', 5, 100318, '2022-10-01 17:02:07', '2022-10-01 17:02:07', NULL, 1),
(6, 24, 37, 'iuhihiuhoiuh', '[]', 5, 100326, '2022-10-01 18:50:48', '2022-10-01 18:50:48', NULL, 1),
(7, 24, 37, 'aaaaaa', '[]', 4, 100328, '2022-10-01 19:12:01', '2022-10-01 19:12:01', NULL, 1),
(8, 43, 27, 'Good service', '[]', 5, 100313, '2022-10-03 10:22:55', '2022-10-03 10:22:55', NULL, 1),
(9, 24, 27, 'Good service', '[]', 5, 100307, '2022-10-03 10:58:02', '2022-10-03 10:58:02', NULL, 1),
(10, 43, 27, 'Good service', '[]', 5, 100331, '2022-10-03 11:36:34', '2022-10-03 11:36:34', NULL, 1),
(11, 39, 27, 'Best', '[]', 5, 100298, '2022-10-03 22:12:58', '2022-10-03 22:12:58', NULL, 1),
(12, 40, 27, 'Best service', '[]', 5, 100172, '2022-10-03 22:13:52', '2022-10-03 22:13:52', NULL, 1),
(13, 35, 27, 'Best service', '[]', 5, 100153, '2022-10-03 22:14:25', '2022-10-03 22:14:25', NULL, 1),
(14, 24, 27, 'Best service', '[]', 5, 100153, '2022-10-03 22:14:26', '2022-10-03 22:14:26', NULL, 1),
(15, 41, 27, 'Best Service', '[]', 5, 100353, '2022-10-03 22:35:23', '2022-10-03 22:35:23', NULL, 1),
(16, 44, 27, 'Best service', '[]', 5, 100355, '2022-10-03 22:42:43', '2022-10-03 22:42:43', NULL, 1),
(17, 42, 27, 'Best service', '[]', 5, 100356, '2022-10-04 10:20:45', '2022-10-04 10:20:45', NULL, 1),
(18, 24, 37, 'baaad experience', '[]', 1, 100361, '2022-10-04 10:42:13', '2022-10-04 10:42:13', NULL, 1),
(19, 43, 37, 'very bad', '[]', 1, 100358, '2022-10-04 10:44:20', '2022-10-04 10:44:20', NULL, 1),
(20, 43, 37, 'im frustuated', '[]', 1, 100360, '2022-10-04 10:44:41', '2022-10-04 10:44:41', NULL, 1),
(21, 35, 21, 'Nice work by Rahul Deshmukh', '[]', 5, 100430, '2022-11-04 17:26:11', '2022-11-04 17:26:11', NULL, 1),
(22, 63, 25, 'Hii', '[]', 5, 100453, '2023-01-12 13:54:17', '2023-01-12 13:54:17', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_ons` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule_order` tinyint(1) NOT NULL DEFAULT 0,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `available_time_starts` time DEFAULT NULL,
  `available_time_ends` time DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `veg` tinyint(1) NOT NULL DEFAULT 1,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `order_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `image`, `category_id`, `category_ids`, `variations`, `add_ons`, `attributes`, `choice_options`, `schedule_order`, `price`, `tax`, `tax_type`, `discount`, `discount_type`, `available_time_starts`, `available_time_ends`, `status`, `veg`, `vendor_id`, `order_count`, `created_at`, `updated_at`) VALUES
(61, 'Electrical Service', 'Electrical Service', '2023-01-11-63bea4e01cb4c.png', 60, '[{\"id\":\"60\",\"position\":1}]', '[]', '[]', '[]', '[]', 0, '100.00', '0.00', 'percent', '10.00', 'amount', '00:00:00', '23:00:00', 1, 1, 20, 2, '2023-01-11 17:30:32', '2023-01-12 12:00:49'),
(62, 'Plumber Service', 'Plumbering Service', '2023-01-11-63bea5672a15f.png', 63, '[{\"id\":\"63\",\"position\":1}]', '[]', '[]', '[]', '[]', 0, '100.00', '0.00', 'percent', '10.00', 'amount', '00:00:00', '23:00:00', 1, 1, 23, 4, '2023-01-11 17:32:47', '2023-01-12 11:10:59'),
(63, 'Car Washing', 'Car Washing Service.', '2023-01-11-63bea5cbc71f6.png', 61, '[{\"id\":\"61\",\"position\":1}]', '[]', '[]', '[]', '[]', 0, '1000.00', '0.00', 'percent', '10.00', 'percent', '00:00:00', '23:00:00', 1, 1, 20, 0, '2023-01-11 17:34:27', '2023-01-11 17:34:27');

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` bigint(20) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `track_deliverymen`
--

CREATE TABLE `track_deliverymen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `longitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `translationable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `interest` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `order_count` int(11) NOT NULL DEFAULT 0,
  `login_medium` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_balance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `coin_balance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `is_phone_verified`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `interest`, `cm_firebase_token`, `status`, `order_count`, `login_medium`, `social_id`, `referral_code`, `wallet_balance`, `coin_balance`) VALUES
(5, 'Test', 'Acc', '+919598324808', 'testing2000@test.com', '2022-08-17-62fcc89100f2b.png', 1, NULL, '$2y$10$kpNWZzt2THOoQRwY2l6xnOeZmQ8dkj6lcePuuazFw/ohigKqBRnry', NULL, '2022-07-08 07:29:55', '2022-11-05 13:49:54', NULL, 'eIrwAUOfSOOuTyrvb8vb6B:APA91bF0izrbN7OhqqHXoy8SIaX5dcb7pG8vdQSFQpZsvSg935VRHjpwEiQcq6qXIAXVghYljvGPp7WIA0mSLTtBLeR-Y4PEWvhsNP4gxlXyQ7O6_nG7fCoicpmLQCoKxyDUxEybMe4A', 1, 4, NULL, NULL, 'hsdjksde', '1057.4031', '20'),
(6, 'djjjjdj', 'jskskskks', '123456789', 'test@email.com', NULL, 0, NULL, '$2y$10$iwsa9zx0qPrfE/tMAgabRefp8IK5/IXEggAv5nMO5QSEHYobpxS8S', NULL, '2022-08-03 19:31:47', '2022-08-03 19:33:29', NULL, NULL, 1, 0, NULL, NULL, 'yKv2Q4lQ', '60', '0'),
(7, 'djjjjdj', 'jskskskks', '+2349036342948', 'tests@email.com', NULL, 0, NULL, '$2y$10$HR6SFx3DOOBd2zqExG6gueOZdlfqx1OJMNNey2EutNNEpa524qsbW', NULL, '2022-08-03 19:33:29', '2022-08-03 19:33:29', NULL, NULL, 1, 0, NULL, NULL, 'BLGnuu9k', '50', '0'),
(8, 'vishnu', 'charan', '+919479963720', 'vish123@gmail.com', NULL, 0, NULL, '$2y$10$FGWqcSxH5PJOlzggMNBH/O/9exEFQwomqvzpGSBjD.y5KF8TiptH2', NULL, '2022-08-16 23:01:42', '2022-08-16 23:01:42', NULL, NULL, 1, 0, NULL, NULL, '93ST4zFw', '0', '0'),
(9, 'vishnu', 'charan', '+918305137336', 'vish456@gmail.com', '2022-08-22-630465ad03bb1.png', 0, NULL, '$2y$10$xj9wlHrNhHc1Q2J/rGMXB.8w2ZoIf/26KZJCVlpY54sqfg1YAF3pC', NULL, '2022-08-16 23:02:30', '2022-09-07 04:43:25', NULL, '@', 1, 0, NULL, NULL, '7xM9Rk58', '0', '0'),
(10, 'Abhishek', 'Charan', '+918989454261', 'abhishek155@gmail.com', NULL, 0, NULL, '$2y$10$ufi8xG7Cl.ZT8QqW2ZkXjejnXwHvJuxecpYNPwrD59iOoLeKADHw2', NULL, '2022-08-16 23:10:46', '2022-08-16 23:10:46', NULL, NULL, 1, 0, NULL, NULL, 'CZ3cpVuC', '0', '0'),
(11, 'Abhishek', 'Maheshwari', '+919981255927', 'agshsjru@gmail.com', NULL, 0, NULL, '$2y$10$k8MlOfCNHwTPO0lgdwqtied9inD3pXccKxPcnYFvmHIRUPJgrIozO', NULL, '2022-08-16 23:12:45', '2022-08-16 23:12:45', NULL, NULL, 1, 0, NULL, NULL, 'HiNLsmuq', '0', '0'),
(12, 'Shiva', 'Charan', '+916263001874', 'shivacharan123@gmail.com', NULL, 0, NULL, '$2y$10$254WyxOIl2oysZlLOBiGd.hbD.7CNFUgsyIXC2lPV5iES15SvBmA6', NULL, '2022-08-16 23:14:43', '2022-08-16 23:14:43', NULL, NULL, 1, 0, NULL, NULL, 'uHVS3nxZ', '0', '0'),
(13, 'Shyam', 'Abs', '+919691237935', 'shyam333@gmail.com', NULL, 0, NULL, '$2y$10$4opHLOlNtq0lHK8315sQdODxpcQmA91Br15wN/pwDrX7s/lhxV4au', NULL, '2022-08-17 00:18:47', '2022-08-17 00:18:47', NULL, NULL, 1, 0, NULL, NULL, '9Mi2PCmy', '0', '0'),
(14, 'John', 'Doe', '+916389824709', 'testing4000@test.com', NULL, 0, NULL, '$2y$10$LU98qypM3wxLI9hP0zmL..uJ76r5gj7Oa0r6aamFTWRBS11.ocMwG', NULL, '2022-08-19 03:00:58', '2022-08-19 03:01:35', '[3,4]', 'f_Q9eViPQMyraPJ9q9_EMi:APA91bH9rMdypA1SWR4x7pg5hnjmu0sZnaTt55LAEzVtGscKZFC0GQrWjSSlkvbtWt3Rqn3ITao9e9buCsw1ncqq2VJAK-9WmEkiT5kSzWhx-FaP-p0VKLhlmO7KhdD2H-cDiw29ss3r', 1, 0, NULL, NULL, '8LfUJRDf', '0', '0'),
(15, 'Ram', 'Verma', '+911234567898', 'ramverma@gmail.com', NULL, 0, NULL, '$2y$10$B0KSx9rWPDkmr1VDMfs4Eew3FvMc/dRsnUP25CxfbJICwXHCz6lXu', NULL, '2022-08-26 01:03:14', '2022-08-26 01:03:14', NULL, 'e8EhXbrTS8GSXlvWmO8koL:APA91bGrENIK66maT_B3xs0q6eulx3pv0TwuoOd_FbPDUKXDZ2eC7ZT_K1wupzn7LeZJhdy4u5dGQIm6LbaUi8xZ_Pk_qmq80qs3ryEXrmBY3d4ilaH9bMy9NgNrOcs1XEWYigSioiar', 1, 0, NULL, NULL, 'zExQB4wF', '0', '0'),
(16, 'Ram', 'Verma', '+916264702495', 'mangal@gmail.com', NULL, 0, NULL, '$2y$10$nr39dT5xT2S6Scmna626COvqchHKCplLa0GJnPo0i7c9WxHwFwGHq', NULL, '2022-08-26 01:03:59', '2022-08-26 01:03:59', NULL, 'e8EhXbrTS8GSXlvWmO8koL:APA91bGrENIK66maT_B3xs0q6eulx3pv0TwuoOd_FbPDUKXDZ2eC7ZT_K1wupzn7LeZJhdy4u5dGQIm6LbaUi8xZ_Pk_qmq80qs3ryEXrmBY3d4ilaH9bMy9NgNrOcs1XEWYigSioiar', 1, 0, NULL, NULL, 'F9Vuxv9r', '0', '0'),
(17, 'Kamal', 'Yadav', '+916262625445', 'kamalyadav@gmail.com', NULL, 0, NULL, '$2y$10$6RYTMEMQonLHV9hYnFBvEeC1J59RPoiUI33cnN1Too4Mgzq7lolIa', NULL, '2022-08-26 01:07:26', '2022-08-26 01:07:52', '[10,1,2,3,4,5,6,7,8,9]', '@', 1, 0, NULL, NULL, 'B8Bzow4W', '0', '0'),
(18, 'Jay', 'Ravi', '+918696562332', 'jay22@gmail.com', NULL, 0, NULL, '$2y$10$y88QLtAe5FV79liRRVzGSuXyAHb0yzOyX9kRC0qhr1lqLjE67JU0u', NULL, '2022-08-29 05:58:28', '2022-08-29 06:08:26', '[10,1,2,3,4,5,6,7,8,9,16]', '@', 1, 0, NULL, NULL, 'JcIvQJ4s', '0', '0'),
(19, 'Rahul', 'Charan', '+916262566569', 'rahul@gmail.com', NULL, 0, NULL, '$2y$10$U5KeBNb1bo0WlAEty9VJwej6Sfkz8qdKe1aqYOmaXFj2M3GR15GAa', NULL, '2022-09-01 02:55:30', '2022-09-01 02:55:46', '[1,2,3,4,5,6,7,8,9,16,22]', '@', 1, 0, NULL, NULL, '3UpvgWwr', '0', '0'),
(20, 'Prabhu', 'Charan', '+918989454221', 'prabhu@gmail.com', NULL, 0, NULL, '$2y$10$bP9Nu76pTeGmDZnWNmuRIuRq7ob/JKgyuui9/qnGU8uGS2jn/7O6q', NULL, '2022-09-02 20:52:57', '2022-09-02 20:53:14', '[1,2,3,4,5,6,7,8,9,16,22]', 'eneEfJy_SBiDrX6jUNGd0w:APA91bHGz6onz54UP6UxShAHbgiaIkEQz3C71NFZtQBV0vJyUVbK1f11qF3TGt-SNDVNwqtGU1nVKgLa9ptQxIQMINsNe0I2WdYTsdtM0O3Epdg8E6Iid8lrtIaFOxM8Afd5AUS04g4x', 1, 0, NULL, NULL, 'dLN8zQ7B', '0', '0'),
(21, 'Aaryan', 'Jha', '+919667202227', 'aaryanjhaofficial@gmail.com', '2022-09-07-63185c354bdfc.png', 1, NULL, '$2y$10$uDjOYhmdBz9e8i0UgVectegW28zCr3.EKdeO8wH3TRs6Ubl3Y2pH2', NULL, '2022-09-07 01:46:15', '2022-11-16 10:54:02', '[9]', 'dxsNEfbbT5qiVich71Spj5:APA91bGQGtj_JjZFUtClidsNjOl8a6Asv3FwvADbYfVr1N7xyJ-H_DoAesleA3op0RXBj2Y6WsMxPqLYt4_YoGd4DlxWupfKLri1X6uHxPASmLlg_acMTXl9E_d4h0O8V_z2yvReW_vI', 1, 10, NULL, NULL, 'yfiocTPU', '284', '0'),
(22, 'Abc', 'Xyz', '+916266702495', 'anc@gmail.com', NULL, 0, NULL, '$2y$10$I9Y0tjo.nM3H.5wv6we2tOJM5I5.De5PXKE57LkIkNitb4c9FavVu', NULL, '2022-09-08 01:04:58', '2022-09-08 01:04:58', NULL, 'eSmw4qM0TleMOPp99Tlikd:APA91bFyBAaDhumDmrYFA_Qsi3qJTiR_6xQK0xRTDr2Mr1qmDnokGhsD6viaff_VLZZQARmhTgz_WSwgNcA1s5fNahumsbGlS_n4WkRr5Pm1_1h7YsX5GAYql-8UOdnsmAIEyCJIKLBn', 1, 0, NULL, NULL, 'HuBgBwzD', '0', '0'),
(23, 'John', 'Doe', '+917223805597', 'johnn@test.com', NULL, 0, NULL, '$2y$10$kIUx70vgLtK0e12WplcK.OxaHBHhT6zkUJ6.pYAQ2TVHboMNq2vRq', NULL, '2022-09-09 05:59:23', '2022-11-16 15:06:54', '[1,2]', 'czIj4Mo6QMmeuLSCK6xlGR:APA91bFhxk_noYuy8ivJ328x1DerU6haEhifihUcZ712LUrfOgNp7AtB0fbmWcn6FZisO-WhZOmcb1j41VYC_KSrA8T4_Z0tOh5QLLQ1SkjqNIB3VWXvWKdR2e30K-A_ISRJWnvw3LCS', 1, 2, NULL, NULL, 'eWEdnAQO', '0', '500'),
(24, 'Vishvas', 'Verma', '+918815125485', 'vishvas123@gmail.com', NULL, 0, NULL, '$2y$10$2n/2ZseIwrDCmBuoIXizQuhP5rPljS87bRJ0g4eL9gl6htOFxhDwS', NULL, '2022-09-12 08:49:01', '2022-09-12 08:49:50', '[1,2,3,4,5,6,7,8,9,16]', 'eM-cXo1WQ1217Gt4tw8cuO:APA91bHT3REhZBwhFcoMydcShJr7Vf1aLIdA6chopOnVRCzdpIp3n9iqOEncauwT_xgSJ-5txNCTVe9_1J94INOOsi_9FxhImX6YFZ2604LxPKIv3Ch1ffVJS6t0iMy6RjuYHpqDeEBw', 1, 0, NULL, NULL, 'I4W1R0Ic', '0', '0'),
(25, 'zxczx', 'xc', '+919691905003', 'xvcv@sds.com', NULL, 1, NULL, '$2y$10$37oGBaNvTytguE7hL3YcXunET9XMzL9EcFTfadaKvU/UwRcoTLYzq', NULL, '2022-09-14 00:55:23', '2023-01-12 13:51:57', '[1]', 'eiXm2A9hRgmHNeZ4aLkWDP:APA91bESVJz5Ck4tEVICGLdsseNDQcjtZEVNWbUUDcZyBfPlVSIkEScTeZn3oYTVPzOi594eyzESxJL9Fpb8CLprgOQJOUJkbbMpVBH-dX3gdQzqr8NwdYlJS75KT5bnMBiYnHTK7nIy', 1, 7, NULL, NULL, 'zGccNTkR', '0', '0'),
(26, 'Rina', 'Verma', '+917845123659', 'rina@gmail.com', NULL, 0, NULL, '$2y$10$zv4qL4e4gSYsGcuFEaIey.J46/8kBTYcyKOGHxyMp/vRoTWPdZ6Ce', NULL, '2022-09-14 00:56:02', '2022-09-14 05:16:46', '[1,2,3,4,5,6,7,8,9,16]', 'dj3TRjbcTjmlPjwci6VwjJ:APA91bGECcFEqmkFnNqePxcvi4e-cVVi1G55qCv7ViIifziGZzRnjjatml0vA0w_I5mhgmViJU0w5dbi4_c9kYT6AqJ-KTRTKdQHaknlKSLuNQIgXZyJi4ulK0_8EnQzQdiOg72P4pW4', 1, 0, NULL, NULL, '4mijWf5n', '0', '10'),
(27, 'Puja', 'Sharma', '+918602514661', 'puja@gmail.com', '2022-11-18-63771fcc84ac7.png', 1, NULL, '$2y$10$paM1c7/Okn8gRa2GzRU5IeRwtommDJ9FXztuYhOgIHUCwHRGZ7S7.', NULL, '2022-09-14 05:16:46', '2023-01-12 11:52:56', '[1,2,3,4,5,6,7,8,9,16]', '@', 1, 32, NULL, NULL, 'hI7971oB', '5906', '-1800'),
(28, 'Devin', 'Bhagvat', '+917845236589', 'devinch@gmail.com', NULL, 0, NULL, '$2y$10$YuOB2cDjDRw9VvwtE.AvMeUbecSJWERl151mLAm1MU0Qk2lKdV.GS', NULL, '2022-09-15 11:18:02', '2022-09-15 11:18:15', '[1,2,3,4,5,6,7,8,9,16]', 'c6Xl-ZnWRAax3eawgwl9kz:APA91bGNpTJg8mCVscV6SkHn99HXmxihqww7zbs-KhryQZRZ_x81i5d9_HzICaQXv7sfkDk5zTurI_VuqWiyJfMdAKUYRlIKN0YpwuVZxuwpWr3mBjucYiq28B-Lo_4woEi7v9fDawiB', 1, 0, NULL, NULL, 'DgA0Imsu', '0', '0'),
(29, 'Swati', 'Dixit', '+915661659169', 'vishnucharan7489@gmail.com', NULL, 0, NULL, '$2y$10$zYNuQJ31whhG26fHkXKI1uSiiJ3UGhfpxwT9HOK1nOA8rymT8WXqy', NULL, '2022-09-15 15:48:23', '2022-09-15 15:48:38', '[1,2,3,4,5,6,7,8,9,16]', 'eoK2yhkGSfCVFQ4TaYXiTF:APA91bEV2997fyM-b8EbQfCeilqDN-kiOfD9_wlS8ZFFOQMCwxDpotnIJMWk4VV2X_xAzRgbtZTnxnSubkjZsL3Q7KOsubdlHGMXsGXhAHylg6NISbfKUweMkYRI4WcMMgCOsZRzQiCj', 1, 0, NULL, NULL, 'luHzhMbh', '0', '0'),
(30, 'Vishnu', 'Charan', '+918989562378', 'vishnu777@gmail.com', NULL, 0, NULL, '$2y$10$IR9.3ZxfdAdqKLuNeXZ5POdoLC0wXmPNlxGt9fQmy9fQSnOLXpAJa', NULL, '2022-09-16 15:06:18', '2022-09-16 15:06:33', '[1,2,3,4,5,6,7,8,9,16]', 'drvItH2sTP-2JJHJe9e_ck:APA91bGVvfKCwhJoVMG7bzhIvLkcamLAhfJmA4SL5dJY2hOrLPhi30ew9S2a3G7Z_OwYRk-tDl-rmqOowrsF0h9KvpbZvUq7i00sGAHZEzRnYM5AzTwLJazshhuhI2SCCImp1zQ_Udwh', 1, 0, NULL, NULL, 'WjzdXtoq', '0', '0'),
(31, 'Bhhj', 'Hhjjj', '+919992955535', 'mfonabasiisaac@gmail.com', NULL, 0, NULL, '$2y$10$OoLTouRWganr1xkMz8pKWeQUSyT3U0Q52E2bFV3VK9VNlF8ebDpkq', NULL, '2022-09-19 19:44:39', '2022-09-19 19:44:52', '[1]', 'd1Vus9MgStq_C1EToS8Stf:APA91bGL8d_r9Z4bjOqhHfPSdMXKP07NuXVHXcxkv2Yb_HDKk1IhDhctHZXPzDaOrZKoNErcg1bgSZ3ivOYM48MxnQht1P6_QpE6aeIO0QTZsC1iWhv6q_-5WI3Ud45JwFtY0flyHxVq', 1, 0, NULL, NULL, 'FyNP8RMV', '0', '50'),
(32, 'sdad', 'dddd', '+919981255929', 'dsfdsf@hfghhf.com', NULL, 0, NULL, '$2y$10$b9piSowuyJeCb4MbjOnAm./zRXvi9DhHeWUYjaWnM.Ty7kEfT.wJa', NULL, '2022-09-20 13:38:57', '2022-09-20 13:39:09', '[1]', '@', 1, 0, NULL, NULL, 'a2u0yNtG', '0', '50'),
(33, 'Puja', 'Sharma', '+914562365895', 'pujasharma@gmail.com', NULL, 0, NULL, '$2y$10$.lWjwkKehNvkjBaaDI2lP..Mhmy7OggA5kzysxTpND531EOrIyIQu', NULL, '2022-09-20 15:24:40', '2022-09-20 15:24:55', '[1,2,3,4,5,6,7,8,9]', 'd6ZekHC9QlKOd1O6s_BMHr:APA91bEY1h-C0FvcUhe6Y7aBLqQfCsHIc7StIZi_SEQa7a-eIsjB8vNWeCGrKCXuLYAyRuG0V0gulkaoXiXcYVaG0Hxox5_AMUSL0cUKZOazGywv9UevuPjOuvbYpd7sGwdgctwxlAg0', 1, 0, NULL, NULL, 'MGYHJ0fN', '0', '50'),
(34, 'Ravi', 'Charan', '+918855663399', 'ravi@gmail.com', NULL, 0, NULL, '$2y$10$CSG9OMrFAMddzxgg/GhnY.oJWHyNP8jDf.FkS0GsdMDNEGNpm36DW', NULL, '2022-09-20 16:09:24', '2022-09-20 16:09:43', '[1,2,3,4,5,6,7,8,9]', 'cI2XT0k8Q0qTPXWkVH9X23:APA91bEzfO7yPi7grMEthPtWquvlVoZ4HM-TPNHCg8BLxP4QltyL4dXG1iwZ6p6NupQSA30Pwe7HaPGQQdO4WjThOFVfcE56PMsOKsUKXIFqqg5a1RfQ4Ce_2k8oC3d-3DmI9xdKWsZY', 1, 0, NULL, NULL, '4Ol4iduP', '0', '50'),
(35, 'Raghu', 'Verma', '+917845231232', 'raghu@gmail.com', NULL, 0, NULL, '$2y$10$9CtB2Bq580ZfSmcXLgpgteYfk62eATMs7I79DagInXnxKouzy6cT.', NULL, '2022-09-20 17:34:43', '2022-09-20 17:34:58', '[1,2,3,4,5,6,7,8,9]', 'ei-BMyBZQLmvJnFQf5VR-2:APA91bFSoHvegS9nBzaWu7k_z0L9eagVj7Gkq6rAXaf-3dV3AbzLp0fZT7m_ltFRT-3j2YFMkxFGmDBhK_tYuQKOyH-1eAsIcRsgOqQd11KEZ_X4NOU8oN6hU5xJug32A15JYBWnsliI', 1, 0, NULL, NULL, 'htenD0YR', '0', '50'),
(36, 'Abhi', 'Abhi', '+919898989898', 'abhi@abhi.abhi', NULL, 0, NULL, '$2y$10$Atdn655QOLXB.Eam/1BuG.mYbOz7L8/HTKH.3IJYv96Yc7maCp/iG', NULL, '2022-09-21 12:28:25', '2022-10-01 16:11:45', '[1,2,3,4]', '@', 1, 0, NULL, NULL, 'eSj2YFQ4', '600', '60'),
(37, 'test', 'test', '+919999999999', 'test@test.test', NULL, 0, NULL, '$2y$10$wzjyUB.KDf.an3LwImCMlOO1BFDwYC3bJhUbvT1M6xOK7DCf6vVyK', NULL, '2022-09-21 16:00:32', '2023-01-07 18:09:46', NULL, 'f3I4Eww8SUSf_ag3AX4ipZ:APA91bFL869ewOmNPATFgXTUA7uZt05sMMdHLAVDLfg3noOUeKvxaql-fPZiIy5pM6jRRYQRVRoe9nAH3KI2P0O-A4Lr83VZuFjebf-PzY24yAEJ8RzNoU1Qy_GI7XfTdV-ZVfl3ZCQd', 1, 26, NULL, NULL, 'bt5zqFWa', '3362', '0'),
(38, 'Ritesh', 'Charan', '+918855663322', 'ritesh@gmail.com', NULL, 0, NULL, '$2y$10$vV2ePjxyLBnl7d3giOqPiO38KUvGi3IRt6e9ZThnspITMcol.dXH.', NULL, '2022-09-28 16:04:17', '2022-09-30 11:33:40', '[1,2,3,4,5,6,7,8,9]', '@', 1, 7, NULL, NULL, 'mbtFbkLn', '531', '0'),
(39, 'Santosh', 'Charan', '+918855223366', 'santosh@gmail.com', NULL, 0, NULL, '$2y$10$3u0J10Eh33UOzocaMdqSNew8BXnjmQAzqUh.Z04qAlo5jca3bo/ja', NULL, '2022-09-28 16:15:32', '2022-09-28 16:15:45', '[1,2,3,4,5,6,7,8,9]', '@', 1, 0, NULL, NULL, 'pFXgHjdE', '0', '50'),
(40, 'Ramu', 'Charan', '+918899665533', 'ramu@gmail.com', NULL, 0, NULL, '$2y$10$/odEk31JYXVAiK9Dyz1sJ.hIVh07kDFKuDe8Duz0ECVQMpZvLV9m6', NULL, '2022-09-28 16:18:00', '2023-01-07 18:52:09', '[1,2,3,4,5,6,7,8,9]', 'd7X0jw-2RfKhJEKDepxUEQ:APA91bEOLdOy1sSANz-AQ9L48BtmvjxhslIxoscWy6EIhZtE0429sX1DlgKaeoHA7QIr743hg9f1rhc0W1I5FnnVMUPI92N8_pMNYRwe-yMQgIIDhwQBTcVYSVZkVdtLzq2Ch4BVOf0X', 1, 3, NULL, NULL, 'h0caW2wp', '495', '0'),
(41, 'aaaaaa', 'aaa', '+919595959595', 'aa@aa.aaa', NULL, 0, NULL, '$2y$10$4MeiIgYskxBzt6oKm.QBG.Cdx/zIp7Q02ftX1xi/pA596QhUEpsVO', NULL, '2022-09-28 16:29:31', '2022-09-28 16:29:31', NULL, '@', 1, 0, NULL, NULL, 'FT1uWm3B', '0', '50'),
(42, 'aaaaa', 'sssas', '+919797979797', 'aas@as.asa', NULL, 0, NULL, '$2y$10$.UZhHPEoklPjS35HvzFnReeqNPOm0NfytAzz6jvjTFy5ZR7QlXjLC', NULL, '2022-09-28 16:39:35', '2022-09-28 16:39:54', '[1,2]', '@', 1, 0, NULL, NULL, 'Hvg2c7Eu', '0', '50'),
(43, 'Aj', 'Aj', '+918882462133', 'aaryanjhaofficial2021@gmail.com', NULL, 0, NULL, '$2y$10$UA/oa5Q5a.MH9blMpfs6G.70kwc.ikIhzSJtTTiIKqdAP1uwBKaj2', NULL, '2022-09-28 16:46:49', '2022-09-28 16:47:49', '[2,9]', '@', 1, 0, NULL, NULL, 'usKd0S64', '0', '50'),
(44, 'Tester', 'Tester', '+917788552233', 'tester@gmail.com', NULL, 0, NULL, '$2y$10$EjXlT1yFKPt7J1mLX1Nx..Jkwk9vw8zDvYrEuBZgOJ/NT1TUxJ5MS', NULL, '2022-09-28 17:12:56', '2022-09-28 17:13:08', '[1,2,3,4,5,6,7,8,9]', '@', 1, 0, NULL, NULL, 'Bxk23VKQ', '0', '50'),
(45, 'asd', 'asasa', '+919696969696', 'asd@as.sdf', NULL, 0, NULL, '$2y$10$sDN5NDH38k9ZjYnxjZqbFuyVrWfKYSt3gtmTrVKlrkFPK24zGmJhO', NULL, '2022-10-01 15:01:39', '2022-10-01 15:01:39', NULL, '@', 1, 0, NULL, NULL, 'uZQ6oHct', '0', '50'),
(46, 'aaa', 'aaa', '+919292929292', 'aaa@sfda.aas', NULL, 0, NULL, '$2y$10$tWsUxzTHZ.P9qjSSiCRcpO1g/GYMfyXlyvaKJ7J6RkVV80ADOowZq', NULL, '2022-10-01 15:03:21', '2022-10-01 15:03:21', NULL, 'f3I4Eww8SUSf_ag3AX4ipZ:APA91bFL869ewOmNPATFgXTUA7uZt05sMMdHLAVDLfg3noOUeKvxaql-fPZiIy5pM6jRRYQRVRoe9nAH3KI2P0O-A4Lr83VZuFjebf-PzY24yAEJ8RzNoU1Qy_GI7XfTdV-ZVfl3ZCQd', 1, 0, NULL, NULL, 'IjOmRBiA', '0', '50'),
(47, 'aaa', 'aaa', '+919526203376', 'aaa@sfda.aasa', NULL, 1, NULL, '$2y$10$M9PUzC1T6B/5Ssn21Bo.beg7p2benS3l1553Ca/jm/d9xe2c7RF9i', NULL, '2022-10-01 15:03:39', '2022-10-06 15:22:09', NULL, '@', 1, 0, NULL, NULL, 'kThM0kms', '0', '50'),
(48, 'Vijay', 'Charan', '+918889517081', 'vijay@gmail.com', NULL, 0, NULL, '$2y$10$/bLLaApE4DJFMa4dceOC5uvHaPOStRW3fFCtdlLxNNPyLmvRFVfIO', NULL, '2022-10-01 15:05:11', '2022-10-01 15:05:11', NULL, '@', 1, 0, NULL, NULL, 'C5vUEdIS', '0', '50'),
(49, 'fddfgsdfg', 'gfddfggfdsgdfg', '+915252525252', 'sdfg@dsf.dfg', NULL, 0, NULL, '$2y$10$PTG80YiKaf6WI5b2/P6HUuOxdVixsfvOUfagazdJ8qM3eYrB5Jmue', NULL, '2022-10-01 17:29:48', '2022-10-01 17:29:48', NULL, 'f3I4Eww8SUSf_ag3AX4ipZ:APA91bFL869ewOmNPATFgXTUA7uZt05sMMdHLAVDLfg3noOUeKvxaql-fPZiIy5pM6jRRYQRVRoe9nAH3KI2P0O-A4Lr83VZuFjebf-PzY24yAEJ8RzNoU1Qy_GI7XfTdV-ZVfl3ZCQd', 1, 0, NULL, NULL, 'vqmNjB5o', '0', '50'),
(50, 'Priya', 'Verma', '+919424825205', 'priyabellway@gmail.com', NULL, 0, NULL, '$2y$10$5wS5BQQ.W.oAAS.y1IlDMuQF42Ib8Lbfh6MiytUUA6SbcyCEI2jxO', NULL, '2022-10-03 11:25:20', '2023-01-09 10:43:52', NULL, '@', 1, 1, NULL, NULL, 'SQHAqKD3', '19', '550'),
(51, 'vishu', 'Verma', '+919131445972', 'test@gmail.com', NULL, 1, NULL, '$2y$10$OLPT1gb0v.Wqh62eAX3tyekq/aCy52BIoiXaixiGxLh8VdQCk/5Da', NULL, '2022-10-03 16:40:44', '2022-11-07 12:27:47', NULL, '@', 1, 1, NULL, NULL, 'YTmA0dMy', '18', '50'),
(52, 'Ankrit', 'Boss', '+919098466409', 'esioabraham120@gmail.com', NULL, 1, NULL, '$2y$10$EyHh2mPltwdtIJUsGGroO.z85o5JG/gbG7Ql0u5kO8RZYvfI9dM2S', NULL, '2022-10-03 17:39:40', '2023-01-07 18:18:24', NULL, '@', 1, 5, NULL, NULL, 'NWQDP6yo', '0', '50'),
(53, 'Ragini', 'Verma', '+918817333074', 'raginibellway@gmail.com', NULL, 1, NULL, '$2y$10$H4TVEIfsC9J8c.WSdplh6uhQYiNDB7Y7Of5Lv0S8vNOm5Vf22L/x2', NULL, '2022-10-04 12:33:34', '2022-10-04 12:34:42', NULL, '@', 1, 0, NULL, NULL, '94tuxEa7', '0', '50'),
(54, 'test', 'user', '+919695969596', 'testuser@test.com', NULL, 0, NULL, '$2y$10$2q3/wRDGxAsS6o.Of2pw4OAWWxLIxH/7gIDCkrbV.4MBGwh3rQRQ2', NULL, '2022-10-06 14:51:05', '2022-10-06 14:51:38', '[1]', '@', 1, 0, NULL, NULL, 'LbX9bsqY', '0', '50'),
(55, 'kuyfh', 'kghv', '+918547553376', 'kghv@upog.kuf', NULL, 0, NULL, '$2y$10$FvHBceoqt.2kJCGTKDK80eG8GiN85r7gMaQ8IUlymepNgGFurGPZK', NULL, '2022-10-06 15:00:16', '2022-10-06 15:00:16', NULL, 'f3I4Eww8SUSf_ag3AX4ipZ:APA91bFL869ewOmNPATFgXTUA7uZt05sMMdHLAVDLfg3noOUeKvxaql-fPZiIy5pM6jRRYQRVRoe9nAH3KI2P0O-A4Lr83VZuFjebf-PzY24yAEJ8RzNoU1Qy_GI7XfTdV-ZVfl3ZCQd', 1, 0, NULL, NULL, 'ssLyyZOf', '0', '50'),
(56, 'kuyfh', 'kghv', '+918485878485', 'kghsv@upog.kuf', NULL, 0, NULL, '$2y$10$9OlkdGxbOFYDfTIl6UwzUe9wJvBX6irOW6YlSfQhZ2K8cXpHVVjum', NULL, '2022-10-06 15:00:36', '2022-10-06 15:00:36', NULL, '@', 1, 0, NULL, NULL, 'nqdH7b5L', '0', '50'),
(57, 'Magan', 'Magan Charan', '+919479962720', 'magan@gmail.com', NULL, 1, NULL, '$2y$10$8aKz6teeYz.xcn1jLNWA6.suioYVqa2pZ4YJ.xSkcNgGOOU4rW/Lm', NULL, '2022-10-06 15:00:40', '2023-01-12 10:34:05', NULL, '@', 1, 3, NULL, NULL, 'Rm9ctmbg', '0', '60'),
(58, 'asdsa', 'sadasd', '+915252525253', 'asdasd@saf.asfd', NULL, 0, NULL, '$2y$10$toFrd5UZCEw.eX9oR8f1ZegEBhtSVl2RrQl3Ie54zGwUWgYMeJCAK', NULL, '2022-10-06 15:19:51', '2022-10-06 15:19:51', NULL, NULL, 1, 0, NULL, NULL, 'KHW1FlKz', '0', '50'),
(59, 'ouf', 'jhgd', '+918484848484', 'yjr@kf.khf', NULL, 0, NULL, '$2y$10$fbWJNbWaagNeRjjAUQbD1Oevc5MC/s9yfBfTjJP/3kTV5w3u8w/CC', NULL, '2022-10-06 15:25:10', '2022-10-06 15:25:10', NULL, NULL, 1, 0, NULL, NULL, 'zYZ2xEZA', '0', '50'),
(60, 'Devendra', 'Charan', '+919399819186', 'deven1@gmail.com', NULL, 1, NULL, '$2y$10$mV.yd8sTNiJcdAWzRZlu9uQ5aHhuCbqqts0YgzjQ255Yjv/9.8T9K', NULL, '2023-01-11 11:56:28', '2023-01-11 11:56:57', NULL, 'eV23xj-YQr-9anP1lXDgvf:APA91bH3m4yJJMeJscKygZkphVlrhFwWJJOtBL-BZ8v0sML54YHETv2TfoBGHIFqzDYy2mv0CjOTZjd2Nr-kA1PA6ZuhQcDozDeXsTqckQ3S5LirlvsEnUuqfBm-EntDg14uQ8mBG_pZ', 1, 0, NULL, NULL, 'A3cEOWMZ', '0', '50');

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `data`, `status`, `user_id`, `vendor_id`, `delivery_man_id`, `created_at`, `updated_at`) VALUES
(1, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100294,\"image\":\"\",\"type\":\"order_status\"}', 1, 38, NULL, NULL, '2022-09-30 11:10:47', '2022-09-30 11:10:47'),
(2, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100294,\"image\":\"\",\"type\":\"order_status\"}', 1, 38, NULL, NULL, '2022-09-30 11:11:26', '2022-09-30 11:11:26'),
(3, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100295,\"image\":\"\",\"type\":\"order_status\"}', 1, 38, NULL, NULL, '2022-09-30 11:21:51', '2022-09-30 11:21:51'),
(4, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100295,\"image\":\"\",\"type\":\"order_status\"}', 1, 38, NULL, NULL, '2022-09-30 11:22:24', '2022-09-30 11:22:24'),
(5, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100296,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-09-30 15:12:14', '2022-09-30 15:12:14'),
(6, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100296,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-09-30 15:12:49', '2022-09-30 15:12:49'),
(7, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100297,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-09-30 15:30:47', '2022-09-30 15:30:47'),
(8, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100297,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-09-30 15:31:19', '2022-09-30 15:31:19'),
(9, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100298,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-09-30 15:31:59', '2022-09-30 15:31:59'),
(10, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100298,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-09-30 15:32:27', '2022-09-30 15:32:27'),
(11, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100299,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-09-30 15:42:15', '2022-09-30 15:42:15'),
(12, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100299,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-09-30 15:42:48', '2022-09-30 15:42:48'),
(13, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100300,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-09-30 15:46:23', '2022-09-30 15:46:23'),
(14, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100301,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-09-30 15:48:38', '2022-09-30 15:48:38'),
(15, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100301,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-09-30 15:49:07', '2022-09-30 15:49:07'),
(16, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100302,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-09-30 15:53:45', '2022-09-30 15:53:45'),
(17, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100303,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-09-30 15:56:07', '2022-09-30 15:56:07'),
(18, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100304,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-09-30 16:02:31', '2022-09-30 16:02:31'),
(19, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100305,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-09-30 17:10:41', '2022-09-30 17:10:41'),
(20, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100306,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-09-30 17:26:27', '2022-09-30 17:26:27'),
(21, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100306,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-09-30 17:27:03', '2022-09-30 17:27:03'),
(22, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100307,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-09-30 17:29:27', '2022-09-30 17:29:27'),
(23, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100306,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-09-30 17:37:08', '2022-09-30 17:37:08'),
(24, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100307,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-09-30 17:37:48', '2022-09-30 17:37:48'),
(25, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100308,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-09-30 18:01:09', '2022-09-30 18:01:09'),
(26, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100308,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-09-30 18:01:40', '2022-09-30 18:01:40'),
(27, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100309,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-09-30 18:25:14', '2022-09-30 18:25:14'),
(28, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100310,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-09-30 18:28:30', '2022-09-30 18:28:30'),
(29, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100311,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-01 10:45:37', '2022-10-01 10:45:37'),
(30, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100311,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-01 10:46:24', '2022-10-01 10:46:24'),
(31, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100312,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-01 12:41:53', '2022-10-01 12:41:53'),
(32, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100313,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-01 13:05:15', '2022-10-01 13:05:15'),
(33, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100313,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-01 13:05:47', '2022-10-01 13:05:47'),
(34, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100314,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-01 13:25:56', '2022-10-01 13:25:56'),
(35, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100314,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-01 13:26:29', '2022-10-01 13:26:29'),
(36, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100315,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-01 13:36:05', '2022-10-01 13:36:05'),
(37, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100316,\"image\":\"\",\"type\":\"order_status\"}', 1, 36, NULL, NULL, '2022-10-01 16:10:30', '2022-10-01 16:10:30'),
(38, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100316,\"image\":\"\",\"type\":\"order_status\"}', 1, 36, NULL, NULL, '2022-10-01 16:11:45', '2022-10-01 16:11:45'),
(39, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100317,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-01 16:15:13', '2022-10-01 16:15:13'),
(40, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100317,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-01 16:16:37', '2022-10-01 16:16:37'),
(41, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100318,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-01 16:41:50', '2022-10-01 16:41:50'),
(42, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100318,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-01 16:43:31', '2022-10-01 16:43:31'),
(43, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100319,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-01 16:47:32', '2022-10-01 16:47:32'),
(44, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100319,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-01 16:48:08', '2022-10-01 16:48:08'),
(45, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100320,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-01 16:48:57', '2022-10-01 16:48:57'),
(46, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100320,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-01 16:49:34', '2022-10-01 16:49:34'),
(47, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100321,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-01 17:16:59', '2022-10-01 17:16:59'),
(48, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100322,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-01 18:20:01', '2022-10-01 18:20:01'),
(49, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100323,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-01 18:20:54', '2022-10-01 18:20:54'),
(50, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100324,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-01 18:37:40', '2022-10-01 18:37:40'),
(51, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100325,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-01 18:44:19', '2022-10-01 18:44:19'),
(52, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100326,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-01 18:46:15', '2022-10-01 18:46:15'),
(53, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100326,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-01 18:47:02', '2022-10-01 18:47:02'),
(54, '{\"title\":\"Order\",\"description\":\"Booking in processing\",\"order_id\":100326,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-01 18:50:10', '2022-10-01 18:50:10'),
(55, '{\"title\":\"Order\",\"description\":\"booking completed\",\"order_id\":100326,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-01 18:50:27', '2022-10-01 18:50:27'),
(56, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100327,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-01 18:57:46', '2022-10-01 18:57:46'),
(57, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100327,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-01 18:58:22', '2022-10-01 18:58:22'),
(58, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100328,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-01 19:06:28', '2022-10-01 19:06:28'),
(59, '{\"title\":\"Order\",\"description\":\"Booking in processing\",\"order_id\":100328,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-01 19:07:13', '2022-10-01 19:07:13'),
(60, '{\"title\":\"Order\",\"description\":\"booking completed\",\"order_id\":100328,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-01 19:07:31', '2022-10-01 19:07:31'),
(61, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100329,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 11:29:04', '2022-10-03 11:29:04'),
(62, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100330,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 11:30:03', '2022-10-03 11:30:03'),
(63, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100331,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 11:31:12', '2022-10-03 11:31:12'),
(64, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100332,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 11:38:07', '2022-10-03 11:38:07'),
(65, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100333,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 11:42:50', '2022-10-03 11:42:50'),
(66, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100334,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-03 12:08:49', '2022-10-03 12:08:49'),
(67, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100334,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-03 12:09:36', '2022-10-03 12:09:36'),
(68, '{\"title\":\"Order\",\"description\":\"Booking in processing\",\"order_id\":100334,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-03 12:15:38', '2022-10-03 12:15:38'),
(69, '{\"title\":\"Order\",\"description\":\"booking completed\",\"order_id\":100334,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-03 12:17:48', '2022-10-03 12:17:48'),
(70, '{\"title\":\"Order\",\"description\":\"Booking in processing\",\"order_id\":100321,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-03 12:41:15', '2022-10-03 12:41:15'),
(71, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100335,\"image\":\"\",\"type\":\"order_status\"}', 1, 23, NULL, NULL, '2022-10-03 16:18:49', '2022-10-03 16:18:49'),
(72, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100335,\"image\":\"\",\"type\":\"order_status\"}', 1, 23, NULL, NULL, '2022-10-03 16:19:49', '2022-10-03 16:19:49'),
(73, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100336,\"image\":\"\",\"type\":\"order_status\"}', 1, 51, NULL, NULL, '2022-10-03 16:42:28', '2022-10-03 16:42:28'),
(74, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100336,\"image\":\"\",\"type\":\"order_status\"}', 1, 51, NULL, NULL, '2022-10-03 16:43:12', '2022-10-03 16:43:12'),
(75, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100336,\"image\":\"\",\"type\":\"order_status\"}', 1, 51, NULL, NULL, '2022-10-03 16:51:03', '2022-10-03 16:51:03'),
(76, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100337,\"image\":\"\",\"type\":\"order_status\"}', 1, 23, NULL, NULL, '2022-10-03 16:56:13', '2022-10-03 16:56:13'),
(77, '{\"title\":\"Order\",\"description\":\"Booking confirm successfully\",\"order_id\":100337,\"image\":\"\",\"type\":\"order_status\"}', 1, 23, NULL, NULL, '2022-10-03 16:57:01', '2022-10-03 16:57:01'),
(78, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100338,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-03 17:27:16', '2022-10-03 17:27:16'),
(79, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100338,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-03 17:28:02', '2022-10-03 17:28:02'),
(80, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100339,\"image\":\"\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2022-10-03 17:43:34', '2022-10-03 17:43:34'),
(81, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100339,\"image\":\"\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2022-10-03 17:44:30', '2022-10-03 17:44:30'),
(82, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100339,\"image\":\"\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2022-10-03 17:48:50', '2022-10-03 17:48:50'),
(83, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100339,\"image\":\"\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2022-10-03 17:54:36', '2022-10-03 17:54:36'),
(84, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100340,\"image\":\"\",\"type\":\"order_status\"}', 1, 23, NULL, NULL, '2022-10-03 17:57:06', '2022-10-03 17:57:06'),
(85, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100340,\"image\":\"\",\"type\":\"order_status\"}', 1, 23, NULL, NULL, '2022-10-03 17:57:46', '2022-10-03 17:57:46'),
(86, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100341,\"image\":\"\",\"type\":\"order_status\"}', 1, 51, NULL, NULL, '2022-10-03 18:21:31', '2022-10-03 18:21:31'),
(87, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100341,\"image\":\"\",\"type\":\"order_status\"}', 1, 51, NULL, NULL, '2022-10-03 18:22:01', '2022-10-03 18:22:01'),
(88, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100339,\"image\":\"\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2022-10-03 19:33:02', '2022-10-03 19:33:02'),
(89, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100342,\"image\":\"\",\"type\":\"order_status\"}', 1, 23, NULL, NULL, '2022-10-03 19:35:55', '2022-10-03 19:35:55'),
(90, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100342,\"image\":\"\",\"type\":\"order_status\"}', 1, 23, NULL, NULL, '2022-10-03 19:36:35', '2022-10-03 19:36:35'),
(91, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100343,\"image\":\"\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2022-10-03 20:41:14', '2022-10-03 20:41:14'),
(92, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100344,\"image\":\"\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2022-10-03 20:48:35', '2022-10-03 20:48:35'),
(93, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100345,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-03 20:50:43', '2022-10-03 20:50:43'),
(94, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100345,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-03 20:51:47', '2022-10-03 20:51:47'),
(95, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100346,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-03 20:53:06', '2022-10-03 20:53:06'),
(96, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100346,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-03 20:53:54', '2022-10-03 20:53:54'),
(97, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100347,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-03 20:56:29', '2022-10-03 20:56:29'),
(98, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100347,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-03 20:57:25', '2022-10-03 20:57:25'),
(99, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100348,\"image\":\"\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2022-10-03 21:21:16', '2022-10-03 21:21:16'),
(100, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100349,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-03 21:26:09', '2022-10-03 21:26:09'),
(101, '{\"title\":\"Order\",\"description\":\"Booking canceled\",\"order_id\":100349,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-03 21:27:01', '2022-10-03 21:27:01'),
(102, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100349,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-03 21:27:02', '2022-10-03 21:27:02'),
(103, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100350,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-03 21:52:39', '2022-10-03 21:52:39'),
(104, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100351,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-03 21:53:34', '2022-10-03 21:53:34'),
(105, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100351,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-03 21:54:07', '2022-10-03 21:54:07'),
(106, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100352,\"image\":\"\",\"type\":\"order_status\"}', 1, 51, NULL, NULL, '2022-10-03 21:59:25', '2022-10-03 21:59:25'),
(107, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100353,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 22:32:26', '2022-10-03 22:32:26'),
(108, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100353,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 22:33:03', '2022-10-03 22:33:03'),
(109, '{\"title\":\"Order\",\"description\":\"Booking in processing\",\"order_id\":100353,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 22:34:05', '2022-10-03 22:34:05'),
(110, '{\"title\":\"Order\",\"description\":\"booking completed\",\"order_id\":100353,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 22:34:24', '2022-10-03 22:34:24'),
(111, '{\"title\":\"Order\",\"description\":\"booking completed\",\"order_id\":100353,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 22:34:54', '2022-10-03 22:34:54'),
(112, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100354,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 22:37:54', '2022-10-03 22:37:54'),
(113, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100354,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 22:38:27', '2022-10-03 22:38:27'),
(114, '{\"title\":\"Order\",\"description\":\"Booking in processing\",\"order_id\":100354,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 22:39:23', '2022-10-03 22:39:23'),
(115, '{\"title\":\"Order\",\"description\":\"booking completed\",\"order_id\":100354,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 22:39:43', '2022-10-03 22:39:43'),
(116, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100355,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 22:40:36', '2022-10-03 22:40:36'),
(117, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100355,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 22:41:06', '2022-10-03 22:41:06'),
(118, '{\"title\":\"Order\",\"description\":\"Booking in processing\",\"order_id\":100355,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 22:41:38', '2022-10-03 22:41:38'),
(119, '{\"title\":\"Order\",\"description\":\"booking completed\",\"order_id\":100355,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 22:41:58', '2022-10-03 22:41:58'),
(120, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100356,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 22:43:33', '2022-10-03 22:43:33'),
(121, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100356,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 22:45:26', '2022-10-03 22:45:26'),
(122, '{\"title\":\"Order\",\"description\":\"Booking in processing\",\"order_id\":100356,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 22:45:58', '2022-10-03 22:45:58'),
(123, '{\"title\":\"Order\",\"description\":\"booking completed\",\"order_id\":100356,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-03 22:46:18', '2022-10-03 22:46:18'),
(124, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100357,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-04 03:33:32', '2022-10-04 03:33:32'),
(125, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100358,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-04 06:33:57', '2022-10-04 06:33:57'),
(126, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100359,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-04 08:52:42', '2022-10-04 08:52:42'),
(127, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100359,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-04 08:53:45', '2022-10-04 08:53:45'),
(128, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100360,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-04 08:57:25', '2022-10-04 08:57:25'),
(129, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100360,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-04 08:58:30', '2022-10-04 08:58:30'),
(130, '{\"title\":\"Booking\",\"description\":\"Booking in processing\",\"order_id\":100360,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-04 08:59:26', '2022-10-04 08:59:26'),
(131, '{\"title\":\"Booking\",\"description\":\"booking completed\",\"order_id\":100360,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-04 09:02:05', '2022-10-04 09:02:05'),
(132, '{\"title\":\"Booking\",\"description\":\"booking completed\",\"order_id\":100360,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-04 09:02:25', '2022-10-04 09:02:25'),
(133, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100361,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-04 10:21:22', '2022-10-04 10:21:22'),
(134, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100361,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-04 10:22:52', '2022-10-04 10:22:52'),
(135, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100362,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-04 10:27:51', '2022-10-04 10:27:51'),
(136, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100363,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-04 10:29:47', '2022-10-04 10:29:47'),
(137, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100364,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-04 10:34:38', '2022-10-04 10:34:38'),
(138, '{\"title\":\"Booking\",\"description\":\"Booking in processing\",\"order_id\":100361,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-04 10:41:28', '2022-10-04 10:41:28'),
(139, '{\"title\":\"Booking\",\"description\":\"booking completed\",\"order_id\":100361,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-04 10:41:51', '2022-10-04 10:41:51'),
(140, '{\"title\":\"Booking\",\"description\":\"Booking in processing\",\"order_id\":100358,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-04 10:43:22', '2022-10-04 10:43:22'),
(141, '{\"title\":\"Booking\",\"description\":\"booking completed\",\"order_id\":100358,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-04 10:43:44', '2022-10-04 10:43:44'),
(142, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100365,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-04 10:59:54', '2022-10-04 10:59:54'),
(143, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100366,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-04 11:00:41', '2022-10-04 11:00:41'),
(144, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100366,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-04 11:01:12', '2022-10-04 11:01:12'),
(145, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100367,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-04 11:05:38', '2022-10-04 11:05:38'),
(146, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100368,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-04 11:08:25', '2022-10-04 11:08:25'),
(147, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100368,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-04 11:09:08', '2022-10-04 11:09:08'),
(148, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100369,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-04 11:10:57', '2022-10-04 11:10:57'),
(149, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100369,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-04 11:11:30', '2022-10-04 11:11:30'),
(150, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100370,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-04 11:21:08', '2022-10-04 11:21:08'),
(151, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100370,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-04 11:21:42', '2022-10-04 11:21:42'),
(152, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100371,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-04 11:34:38', '2022-10-04 11:34:38'),
(153, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100371,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-04 11:36:13', '2022-10-04 11:36:13'),
(154, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100372,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-04 11:38:59', '2022-10-04 11:38:59'),
(155, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100373,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-04 12:13:34', '2022-10-04 12:13:34'),
(156, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100374,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-04 12:25:36', '2022-10-04 12:25:36'),
(157, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100375,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-04 13:53:24', '2022-10-04 13:53:24'),
(158, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100376,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-04 13:54:51', '2022-10-04 13:54:51'),
(159, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100377,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-04 13:55:28', '2022-10-04 13:55:28'),
(160, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100378,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 23, NULL, NULL, '2022-10-04 13:59:53', '2022-10-04 13:59:53'),
(161, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100378,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 23, NULL, NULL, '2022-10-04 14:00:41', '2022-10-04 14:00:41'),
(162, '{\"title\":\"Booking\",\"description\":\"Booking in processing\",\"order_id\":100378,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 23, NULL, NULL, '2022-10-04 14:08:06', '2022-10-04 14:08:06'),
(163, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100379,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-04 14:20:38', '2022-10-04 14:20:38'),
(164, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100380,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-04 14:22:45', '2022-10-04 14:22:45'),
(165, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100381,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-04 15:27:46', '2022-10-04 15:27:46'),
(166, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100382,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-04 16:48:51', '2022-10-04 16:48:51'),
(167, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100383,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-04 17:33:38', '2022-10-04 17:33:38'),
(168, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100384,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-04 17:34:51', '2022-10-04 17:34:51'),
(169, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100385,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-04 18:56:23', '2022-10-04 18:56:23'),
(170, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100386,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 23, NULL, NULL, '2022-10-04 19:01:12', '2022-10-04 19:01:12'),
(171, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100387,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-05 17:41:35', '2022-10-05 17:41:35'),
(172, '{\"title\":\"Booking\",\"description\":\"Booking in processing\",\"order_id\":100387,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-05 17:44:15', '2022-10-05 17:44:15'),
(173, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100388,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-05 17:48:12', '2022-10-05 17:48:12'),
(174, '{\"title\":\"Booking\",\"description\":\"Booking in processing\",\"order_id\":100388,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-05 17:49:10', '2022-10-05 17:49:10'),
(175, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100389,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-05 17:50:46', '2022-10-05 17:50:46'),
(176, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100390,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-05 17:51:35', '2022-10-05 17:51:35'),
(177, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100389,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-05 17:51:44', '2022-10-05 17:51:44'),
(178, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100390,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-05 17:52:20', '2022-10-05 17:52:20'),
(179, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100391,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-05 17:52:25', '2022-10-05 17:52:25'),
(180, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100391,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-05 17:52:54', '2022-10-05 17:52:54'),
(181, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100392,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-05 17:53:50', '2022-10-05 17:53:50'),
(182, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100392,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-05 17:54:22', '2022-10-05 17:54:22'),
(183, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100393,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-05 17:57:58', '2022-10-05 17:57:58'),
(184, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100393,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-05 17:58:42', '2022-10-05 17:58:42'),
(185, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100394,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-05 18:13:20', '2022-10-05 18:13:20'),
(186, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100394,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-05 18:14:20', '2022-10-05 18:14:20'),
(187, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100395,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-05 18:24:29', '2022-10-05 18:24:29'),
(188, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100395,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-05 18:25:20', '2022-10-05 18:25:20'),
(189, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100393,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-05 20:11:16', '2022-10-05 20:11:16'),
(190, '{\"title\":\"Booking\",\"description\":\"Booking has been accepted\",\"order_id\":100393,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-05 20:11:48', '2022-10-05 20:11:48'),
(191, '{\"title\":\"Booking\",\"description\":\"Booking has been accepted\",\"order_id\":100395,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-05 20:31:25', '2022-10-05 20:31:25'),
(192, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100395,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-05 20:31:39', '2022-10-05 20:31:39'),
(193, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100393,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-05 20:34:14', '2022-10-05 20:34:14'),
(194, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100393,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-05 20:44:40', '2022-10-05 20:44:40'),
(195, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100338,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-10-05 20:49:31', '2022-10-05 20:49:31'),
(196, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100396,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 50, NULL, NULL, '2022-10-06 11:57:27', '2022-10-06 11:57:27'),
(197, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100396,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 50, NULL, NULL, '2022-10-06 11:59:04', '2022-10-06 11:59:04'),
(198, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100397,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-06 12:08:21', '2022-10-06 12:08:21'),
(199, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100398,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-06 12:08:33', '2022-10-06 12:08:33'),
(200, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100399,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-06 12:09:23', '2022-10-06 12:09:23'),
(201, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100400,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 50, NULL, NULL, '2022-10-06 12:11:37', '2022-10-06 12:11:37'),
(202, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100400,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 50, NULL, NULL, '2022-10-06 12:12:15', '2022-10-06 12:12:15'),
(203, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100401,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-06 13:13:42', '2022-10-06 13:13:42'),
(204, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100402,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-06 13:23:13', '2022-10-06 13:23:13'),
(205, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100402,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-06 13:24:23', '2022-10-06 13:24:23'),
(206, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100403,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-06 13:30:31', '2022-10-06 13:30:31'),
(207, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100404,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-06 13:31:39', '2022-10-06 13:31:39'),
(208, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100405,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-06 13:52:32', '2022-10-06 13:52:32'),
(209, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100406,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-06 14:00:38', '2022-10-06 14:00:38'),
(210, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100406,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-06 14:01:34', '2022-10-06 14:01:34'),
(211, '{\"title\":\"Booking\",\"description\":\"Booking has been accepted\",\"order_id\":100406,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-06 14:01:56', '2022-10-06 14:01:56'),
(212, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100406,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-06 14:02:04', '2022-10-06 14:02:04'),
(213, '{\"title\":\"Booking\",\"description\":\"Booking is currently ongoing\",\"order_id\":100406,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-06 14:02:35', '2022-10-06 14:02:35'),
(214, '{\"title\":\"Booking\",\"description\":\"Booking has been accepted\",\"order_id\":100405,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-06 14:05:25', '2022-10-06 14:05:25'),
(215, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100407,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-10-07 13:42:05', '2022-10-07 13:42:05'),
(216, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100407,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-10-07 13:42:37', '2022-10-07 13:42:37'),
(217, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100408,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-10-07 13:52:47', '2022-10-07 13:52:47'),
(218, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100408,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-10-07 13:53:46', '2022-10-07 13:53:46'),
(219, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100405,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-14 16:28:26', '2022-10-14 16:28:26'),
(220, '{\"title\":\"Booking\",\"description\":\"Booking is currently ongoing\",\"order_id\":100405,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-14 16:29:14', '2022-10-14 16:29:14'),
(221, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100389,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-17 10:53:49', '2022-10-17 10:53:49'),
(222, '{\"title\":\"Booking\",\"description\":\"Booking has been accepted\",\"order_id\":100388,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-17 10:56:27', '2022-10-17 10:56:27'),
(223, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100388,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-17 10:56:50', '2022-10-17 10:56:50'),
(224, '{\"title\":\"Booking\",\"description\":\"Booking has been accepted\",\"order_id\":100374,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-17 11:35:24', '2022-10-17 11:35:24'),
(225, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100374,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-17 11:35:45', '2022-10-17 11:35:45'),
(226, '{\"title\":\"Booking\",\"description\":\"Booking is currently ongoing\",\"order_id\":100374,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-17 11:36:14', '2022-10-17 11:36:14'),
(227, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100374,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-17 11:36:24', '2022-10-17 11:36:24'),
(228, '{\"title\":\"Booking\",\"description\":\"Booking has been accepted\",\"order_id\":100373,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-17 15:53:32', '2022-10-17 15:53:32'),
(229, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100373,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-17 15:53:39', '2022-10-17 15:53:39'),
(230, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100373,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-17 15:54:58', '2022-10-17 15:54:58'),
(231, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100409,\"image\":\"2022-09-06-63183f3fb4e14.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-19 12:50:17', '2022-10-19 12:50:17'),
(232, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100306,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-19 12:51:29', '2022-10-19 12:51:29'),
(233, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100409,\"image\":\"2022-09-06-63183f3fb4e14.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-20 11:11:36', '2022-10-20 11:11:36'),
(234, '{\"title\":\"Booking\",\"description\":\"Booking has been cancelled\",\"order_id\":100372,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-20 11:12:44', '2022-10-20 11:12:44'),
(235, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100372,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-20 11:13:29', '2022-10-20 11:13:29'),
(236, '{\"title\":\"Booking\",\"description\":\"Booking has been accepted\",\"order_id\":100371,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-20 17:42:28', '2022-10-20 17:42:28'),
(237, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100371,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-20 17:42:42', '2022-10-20 17:42:42'),
(238, '{\"title\":\"Booking\",\"description\":\"Booking is currently ongoing\",\"order_id\":100371,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-20 17:43:36', '2022-10-20 17:43:36'),
(239, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100371,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-10-20 17:43:56', '2022-10-20 17:43:56');
INSERT INTO `user_notifications` (`id`, `data`, `status`, `user_id`, `vendor_id`, `delivery_man_id`, `created_at`, `updated_at`) VALUES
(240, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100410,\"image\":\"2022-09-07-63184244dadcf.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-10-20 17:45:50', '2022-10-20 17:45:50'),
(241, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100411,\"image\":\"2022-09-07-63184244dadcf.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-11-01 18:25:22', '2022-11-01 18:25:22'),
(242, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100412,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-11-01 18:32:24', '2022-11-01 18:32:24'),
(243, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100412,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-11-01 18:33:28', '2022-11-01 18:33:28'),
(244, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100413,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-11-01 18:38:29', '2022-11-01 18:38:29'),
(245, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100413,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-11-01 18:38:59', '2022-11-01 18:38:59'),
(246, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100414,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-11-02 14:50:22', '2022-11-02 14:50:22'),
(247, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100415,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-03 10:25:19', '2022-11-03 10:25:19'),
(248, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100416,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-03 10:27:00', '2022-11-03 10:27:00'),
(249, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100417,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-03 10:31:25', '2022-11-03 10:31:25'),
(250, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100418,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-03 10:33:21', '2022-11-03 10:33:21'),
(251, '{\"title\":\"Booking\",\"description\":\"Booking has been accepted\",\"order_id\":100418,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-03 10:34:17', '2022-11-03 10:34:17'),
(252, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100418,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-03 10:35:27', '2022-11-03 10:35:27'),
(253, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100419,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-03 10:36:10', '2022-11-03 10:36:10'),
(254, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100420,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2022-11-03 11:02:49', '2022-11-03 11:02:49'),
(255, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100421,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2022-11-03 11:56:12', '2022-11-03 11:56:12'),
(256, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100422,\"image\":\"2022-09-06-63183f3fb4e14.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2022-11-03 12:07:03', '2022-11-03 12:07:03'),
(257, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100423,\"image\":\"2022-09-06-63183f3fb4e14.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-03 12:40:19', '2022-11-03 12:40:19'),
(258, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100424,\"image\":\"2022-09-06-63183f3fb4e14.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-03 12:45:03', '2022-11-03 12:45:03'),
(259, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100425,\"image\":\"2022-09-06-63183f3fb4e14.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2022-11-03 13:06:55', '2022-11-03 13:06:55'),
(260, '{\"title\":\"Booking\",\"description\":\"Booking has been cancelled\",\"order_id\":100076,\"image\":\"2022-09-07-63184244dadcf.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2022-11-03 13:45:46', '2022-11-03 13:45:46'),
(261, '{\"title\":\"Booking\",\"description\":\"Booking has been cancelled\",\"order_id\":100075,\"image\":\"2022-09-07-63184244dadcf.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2022-11-03 13:50:08', '2022-11-03 13:50:08'),
(262, '{\"title\":\"Booking\",\"description\":\"Booking has been cancelled\",\"order_id\":100066,\"image\":\"2022-09-07-63184244dadcf.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2022-11-03 13:53:30', '2022-11-03 13:53:30'),
(263, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100426,\"image\":\"2022-09-06-63183f3fb4e14.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2022-11-03 13:54:22', '2022-11-03 13:54:22'),
(264, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100426,\"image\":\"2022-09-06-63183f3fb4e14.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2022-11-03 13:55:18', '2022-11-03 13:55:18'),
(265, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100427,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2022-11-03 18:29:16', '2022-11-03 18:29:16'),
(266, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100428,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2022-11-03 18:47:40', '2022-11-03 18:47:40'),
(267, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100429,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-11-04 17:08:11', '2022-11-04 17:08:11'),
(268, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100429,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-11-04 17:08:48', '2022-11-04 17:08:48'),
(269, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100430,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-11-04 17:12:11', '2022-11-04 17:12:11'),
(270, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100430,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-11-04 17:17:23', '2022-11-04 17:17:23'),
(271, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100431,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-11-04 17:34:36', '2022-11-04 17:34:36'),
(272, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100431,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-11-04 17:35:02', '2022-11-04 17:35:02'),
(273, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100432,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-11-05 12:24:33', '2022-11-05 12:24:33'),
(274, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100431,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-11-05 13:22:51', '2022-11-05 13:22:51'),
(275, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100429,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-11-05 13:25:39', '2022-11-05 13:25:39'),
(276, '{\"title\":\"Booking\",\"description\":\"Booking has been accepted\",\"order_id\":100426,\"image\":\"2022-09-06-63183f3fb4e14.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2022-11-05 13:29:59', '2022-11-05 13:29:59'),
(277, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100426,\"image\":\"2022-09-06-63183f3fb4e14.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2022-11-05 13:30:25', '2022-11-05 13:30:25'),
(278, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100426,\"image\":\"2022-09-06-63183f3fb4e14.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2022-11-05 13:30:43', '2022-11-05 13:30:43'),
(279, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100418,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-05 13:38:51', '2022-11-05 13:38:51'),
(280, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100418,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-05 13:39:25', '2022-11-05 13:39:25'),
(281, '{\"title\":\"Order\",\"description\":\"Booking in processing\",\"order_id\":100423,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-05 17:51:54', '2022-11-05 17:51:54'),
(282, '{\"title\":\"Order\",\"description\":\"booking completed\",\"order_id\":100423,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-05 17:52:17', '2022-11-05 17:52:17'),
(283, '{\"title\":\"Order\",\"description\":\"Booking in processing\",\"order_id\":100411,\"image\":\"\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-11-05 17:53:29', '2022-11-05 17:53:29'),
(284, '{\"title\":\"Order\",\"description\":\"booking completed\",\"order_id\":100411,\"image\":\"\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-11-05 17:53:41', '2022-11-05 17:53:41'),
(285, '{\"title\":\"Order\",\"description\":\"booking completed\",\"order_id\":100427,\"image\":\"\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2022-11-05 18:25:50', '2022-11-05 18:25:50'),
(286, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100413,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-11-07 10:33:10', '2022-11-07 10:33:10'),
(287, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100413,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-11-07 10:33:32', '2022-11-07 10:33:32'),
(288, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100352,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 51, NULL, NULL, '2022-11-07 11:57:33', '2022-11-07 11:57:33'),
(289, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100432,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-11-07 12:02:25', '2022-11-07 12:02:25'),
(290, '{\"title\":\"Booking\",\"description\":\"Booking has been accepted\",\"order_id\":100340,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 23, NULL, NULL, '2022-11-07 13:03:15', '2022-11-07 13:03:15'),
(291, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100340,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 23, NULL, NULL, '2022-11-07 13:03:30', '2022-11-07 13:03:30'),
(292, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100340,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 23, NULL, NULL, '2022-11-07 13:04:00', '2022-11-07 13:04:00'),
(293, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100433,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-09 15:22:45', '2022-11-09 15:22:45'),
(294, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100434,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-11 11:48:06', '2022-11-11 11:48:06'),
(295, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100434,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-11 11:49:04', '2022-11-11 11:49:04'),
(296, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100433,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-14 11:26:36', '2022-11-14 11:26:36'),
(297, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100348,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2022-11-14 12:06:48', '2022-11-14 12:06:48'),
(298, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100343,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2022-11-14 12:15:41', '2022-11-14 12:15:41'),
(299, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100435,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-15 11:31:22', '2022-11-15 11:31:22'),
(300, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100436,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-15 11:33:21', '2022-11-15 11:33:21'),
(301, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100437,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-15 11:35:05', '2022-11-15 11:35:05'),
(302, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100438,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-15 11:42:19', '2022-11-15 11:42:19'),
(303, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100439,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-15 11:46:28', '2022-11-15 11:46:28'),
(304, '{\"title\":\"Order\",\"description\":\"Booking Pending\",\"order_id\":100440,\"image\":\"\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-15 11:50:03', '2022-11-15 11:50:03'),
(305, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100440,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-15 11:52:21', '2022-11-15 11:52:21'),
(306, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100427,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2022-11-15 12:35:11', '2022-11-15 12:35:11'),
(307, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100439,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-16 10:22:59', '2022-11-16 10:22:59'),
(308, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100342,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 23, NULL, NULL, '2022-11-16 15:07:01', '2022-11-16 15:07:01'),
(309, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100438,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2022-11-17 15:04:21', '2022-11-17 15:04:21'),
(310, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100277,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-12-12 13:12:33', '2022-12-12 13:12:33'),
(311, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100276,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2023-01-07 18:09:25', '2023-01-07 18:09:25'),
(312, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100339,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2023-01-07 18:18:15', '2023-01-07 18:18:15'),
(313, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100275,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 40, NULL, NULL, '2023-01-07 18:50:44', '2023-01-07 18:50:44'),
(314, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100336,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 51, NULL, NULL, '2023-01-09 13:56:28', '2023-01-09 13:56:28'),
(315, '{\"title\":\"Booking\",\"description\":\"Booking has been cancelled\",\"order_id\":100336,\"image\":\"2022-09-07-631842cf15c47.png\",\"type\":\"order_status\"}', 1, 51, NULL, NULL, '2023-01-09 13:56:46', '2023-01-09 13:56:46'),
(316, '{\"title\":\"Booking\",\"description\":\"Booking has been cancelled\",\"order_id\":100179,\"image\":\"2022-09-07-631841ac07300.png\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2023-01-09 13:57:17', '2023-01-09 13:57:17'),
(317, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100441,\"image\":\"2022-09-07-63184244dadcf.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2023-01-10 10:31:34', '2023-01-10 10:31:34'),
(318, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100442,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 57, NULL, NULL, '2023-01-12 10:24:17', '2023-01-12 10:24:17'),
(319, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100442,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 57, NULL, NULL, '2023-01-12 10:25:09', '2023-01-12 10:25:09'),
(320, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100442,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 57, NULL, NULL, '2023-01-12 10:25:46', '2023-01-12 10:25:46'),
(321, '{\"title\":\"Booking\",\"description\":\"Booking is currently ongoing\",\"order_id\":100442,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 57, NULL, NULL, '2023-01-12 10:26:15', '2023-01-12 10:26:15'),
(322, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100442,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 57, NULL, NULL, '2023-01-12 10:26:39', '2023-01-12 10:26:39'),
(323, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100443,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 57, NULL, NULL, '2023-01-12 10:27:36', '2023-01-12 10:27:36'),
(324, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100443,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 57, NULL, NULL, '2023-01-12 10:28:09', '2023-01-12 10:28:09'),
(325, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100443,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 57, NULL, NULL, '2023-01-12 10:28:27', '2023-01-12 10:28:27'),
(326, '{\"title\":\"Booking\",\"description\":\"Booking is currently ongoing\",\"order_id\":100443,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 57, NULL, NULL, '2023-01-12 10:28:47', '2023-01-12 10:28:47'),
(327, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100444,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 57, NULL, NULL, '2023-01-12 10:33:37', '2023-01-12 10:33:37'),
(328, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100444,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 57, NULL, NULL, '2023-01-12 10:34:05', '2023-01-12 10:34:05'),
(329, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100445,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2023-01-12 10:51:25', '2023-01-12 10:51:25'),
(330, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100445,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2023-01-12 10:51:59', '2023-01-12 10:51:59'),
(331, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100446,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2023-01-12 11:08:03', '2023-01-12 11:08:03'),
(332, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100447,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2023-01-12 11:08:44', '2023-01-12 11:08:44'),
(333, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100447,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2023-01-12 11:09:15', '2023-01-12 11:09:15'),
(334, '{\"title\":\"Booking\",\"description\":\"Booking has been accepted\",\"order_id\":100447,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2023-01-12 11:09:34', '2023-01-12 11:09:34'),
(335, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100447,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2023-01-12 11:09:50', '2023-01-12 11:09:50'),
(336, '{\"title\":\"Booking\",\"description\":\"Booking is currently ongoing\",\"order_id\":100447,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2023-01-12 11:10:13', '2023-01-12 11:10:13'),
(337, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100447,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2023-01-12 11:10:59', '2023-01-12 11:10:59'),
(338, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100448,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2023-01-12 11:12:20', '2023-01-12 11:12:20'),
(339, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100448,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2023-01-12 11:12:47', '2023-01-12 11:12:47'),
(340, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100446,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2023-01-12 11:13:48', '2023-01-12 11:13:48'),
(341, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100448,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2023-01-12 11:15:16', '2023-01-12 11:15:16'),
(342, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100446,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2023-01-12 11:16:45', '2023-01-12 11:16:45'),
(343, '{\"title\":\"Booking\",\"description\":\"Booking is currently ongoing\",\"order_id\":100446,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2023-01-12 11:16:54', '2023-01-12 11:16:54'),
(344, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100449,\"image\":\"2023-01-11-63be9fde5bb52.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2023-01-12 11:26:41', '2023-01-12 11:26:41'),
(345, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100449,\"image\":\"2023-01-11-63be9fde5bb52.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2023-01-12 11:28:07', '2023-01-12 11:28:07'),
(346, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100449,\"image\":\"2023-01-11-63be9fde5bb52.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2023-01-12 11:31:46', '2023-01-12 11:31:46'),
(347, '{\"title\":\"Booking\",\"description\":\"Booking is currently ongoing\",\"order_id\":100449,\"image\":\"2023-01-11-63be9fde5bb52.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2023-01-12 11:32:08', '2023-01-12 11:32:08'),
(348, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100450,\"image\":\"2023-01-11-63be9fde5bb52.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2023-01-12 11:43:19', '2023-01-12 11:43:19'),
(349, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100450,\"image\":\"2023-01-11-63be9fde5bb52.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2023-01-12 11:43:46', '2023-01-12 11:43:46'),
(350, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100450,\"image\":\"2023-01-11-63be9fde5bb52.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2023-01-12 11:44:09', '2023-01-12 11:44:09'),
(351, '{\"title\":\"Booking\",\"description\":\"Booking is currently ongoing\",\"order_id\":100450,\"image\":\"2023-01-11-63be9fde5bb52.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2023-01-12 11:44:23', '2023-01-12 11:44:23'),
(352, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100450,\"image\":\"2023-01-11-63be9fde5bb52.png\",\"type\":\"order_status\"}', 1, 27, NULL, NULL, '2023-01-12 11:52:56', '2023-01-12 11:52:56'),
(353, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100449,\"image\":\"2023-01-11-63be9fde5bb52.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2023-01-12 12:00:50', '2023-01-12 12:00:50'),
(354, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100451,\"image\":\"2023-01-11-63be9fde5bb52.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2023-01-12 12:04:14', '2023-01-12 12:04:14'),
(355, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100451,\"image\":\"2023-01-11-63be9fde5bb52.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2023-01-12 12:05:43', '2023-01-12 12:05:43'),
(356, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100452,\"image\":\"2023-01-11-63be9fde5bb52.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2023-01-12 13:48:43', '2023-01-12 13:48:43'),
(357, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100446,\"image\":\"2023-01-11-63bea13aba2fd.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2023-01-12 13:49:50', '2023-01-12 13:49:50'),
(358, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100453,\"image\":\"2023-01-11-63be9fde5bb52.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2023-01-12 13:50:26', '2023-01-12 13:50:26'),
(359, '{\"title\":\"Booking\",\"description\":\"Booking Pending\",\"order_id\":100453,\"image\":\"2023-01-11-63be9fde5bb52.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2023-01-12 13:50:58', '2023-01-12 13:50:58'),
(360, '{\"title\":\"Booking\",\"description\":\"Booking processing\",\"order_id\":100453,\"image\":\"2023-01-11-63be9fde5bb52.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2023-01-12 13:51:32', '2023-01-12 13:51:32'),
(361, '{\"title\":\"Booking\",\"description\":\"Booking is currently ongoing\",\"order_id\":100453,\"image\":\"2023-01-11-63be9fde5bb52.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2023-01-12 13:51:51', '2023-01-12 13:51:51'),
(362, '{\"title\":\"Booking\",\"description\":\"Booking Completed\",\"order_id\":100453,\"image\":\"2023-01-11-63be9fde5bb52.png\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2023-01-12 13:51:57', '2023-01-12 13:51:57');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_time` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '30-40',
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '{"1":0,"2":0,"3":0,"4":0,"5":0}',
  `self_delivery_system` tinyint(1) NOT NULL DEFAULT 0,
  `pos_system` tinyint(1) NOT NULL DEFAULT 0,
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT 0.00,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `opening_time` time NOT NULL DEFAULT current_timestamp(),
  `closeing_time` time NOT NULL DEFAULT current_timestamp(),
  `comission` decimal(16,2) DEFAULT NULL,
  `minimum_order` decimal(16,2) NOT NULL DEFAULT 0.00,
  `service_section` tinyint(1) NOT NULL DEFAULT 0,
  `reviews_section` tinyint(1) NOT NULL DEFAULT 0,
  `schedule_order` tinyint(1) NOT NULL DEFAULT 0,
  `zone_id` bigint(20) DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `off_day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `ifsc_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhaar_card_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_card_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhaar_front_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhaar_back_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_card_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `f_name`, `l_name`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `bank_name`, `address`, `branch`, `holder_name`, `account_no`, `image`, `cover_photo`, `status`, `firebase_token`, `auth_token`, `delivery_time`, `rating`, `self_delivery_system`, `pos_system`, `delivery_charge`, `active`, `opening_time`, `closeing_time`, `comission`, `minimum_order`, `service_section`, `reviews_section`, `schedule_order`, `zone_id`, `latitude`, `longitude`, `off_day`, `tax`, `ifsc_code`, `aadhaar_card_number`, `pan_card_number`, `aadhaar_front_image`, `aadhaar_back_image`, `pan_card_image`) VALUES
(1, 'Mfon', 'Udobia', '0903634948', 'mfonabasiisaac@gmail.com', '2022-07-20 19:31:58', '$2y$10$gD4OWUTghXNzxtboVNoQEOR56BH1FXcmhgEivBXBGwcZ7MrUcHhme', 'CTonxsxNRFOMPiaKSAV7i66OaX9ONkhlsksUsoG4gAwI4VIbBqh57hy36Fwr', NULL, '2022-09-09 05:18:56', 'jejejej', 'dmdmdmd', 'ssss', 'ssss', '3454444', '2022-08-11-62f4ad1874ba4.png', NULL, 0, NULL, '7LvE8J3hTY3q7Bedcmv6rqRWwV3gjVHNXa5wT86kpyJib82dqRb7ROnbmFmmi9AlxkH3hvClBBWn739Pgx2x9mGe84hdHd1zcqUCfln4ldXthtP8MGy6dWXS', '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":1}', 0, 0, '0.00', 1, '08:15:56', '08:15:56', NULL, '0.00', 0, 0, 0, 1, NULL, NULL, NULL, '0', 'wjwjwjwbbb', '123456789120', '1234567800', '2022-08-13-62f7713c9fa96.png', '2022-08-11-62f4a9407acd3.png', NULL),
(2, 'Sunday', 'Victory', '1234567892892', 'test@test.com', NULL, '$2y$10$/eEvlmlGFBANoHLVoCi71uIyapMxWNOdu4TGSH4e7ET9/N546Pm6S', NULL, '2022-07-25 07:38:53', '2022-09-06 23:34:26', NULL, NULL, NULL, NULL, NULL, '2022-07-25-62deb90dbd15c.png', '2022-07-25-62deb90dc64da.png', 0, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":1}', 0, 0, '0.00', 1, '08:15:56', '08:15:56', NULL, '0.00', 0, 0, 0, 1, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Victory', 'Sunday', '1234567892', 'info@studyhub.ng', NULL, '$2y$10$OJj8rdo1.kwYEXIEeQdGN.okA0DbIk8xWM/PoEmuR/eM1yzT74t4O', NULL, '2022-07-25 21:30:21', '2022-09-06 23:34:02', NULL, 'ppppppppo', NULL, NULL, NULL, '2022-07-25-62df7bebd8b88.png', '2022-07-25-62df7bed9c2e6.png', 0, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '08:15:56', '08:15:56', NULL, '0.00', 0, 0, 0, 1, NULL, NULL, NULL, '0', 'sjsjsjjsjj', '33333', '44444', '2022-08-01-62e8640806f25.png', '2022-08-01-62e864080af11.png', '2022-08-01-62e864080c073.png'),
(4, 'testtt', 'smsmsmsm', '1234567894', 'bassey@gmail.com', NULL, '$2y$10$GfS03lmLkyGHcWby98ys1.qbdQeYaKtV1V7e6nuZIsIPzKJcT0v7K', NULL, '2022-08-01 16:00:47', '2022-09-06 23:33:52', 'jfjfjjf', 'ssskskskskssksk', 'jfjfjjf', 'jfjfjffjjf', '1234566', '2022-08-01-62e8692f91408.png', '2022-08-01-62e8692f9c458.png', 0, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '08:15:56', '08:15:56', NULL, '0.00', 0, 0, 0, 1, NULL, NULL, NULL, '0', '1234567894', '1234567894', '1234567894', '2022-08-01-62e8692f9d8c5.png', 'def.png', 'def.png'),
(6, 'rhrhrhrrh', 'ehehehe', '12334568923', 'test3@gmail.com', NULL, '$2y$10$GvocfjTtgOLH7p.u7Q7IA.6Yzyq4gIvgkiFIWbW1uVktj7E4YKZce', NULL, '2022-08-11 06:07:38', '2022-09-06 23:33:43', 'hhhwhwwhwh', 'hheheheehheeh', 'hhhwhwhwhw', 'hhhhhshshs', '222222', '2022-08-11-62f50d2a84138.png', '2022-08-11-62f50d2aba87d.png', 0, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '08:15:56', '08:15:56', NULL, '0.00', 0, 0, 0, 1, NULL, NULL, NULL, '0', 'wggwgw2', '12334568923', '12334568923', 'def.png', 'def.png', 'def.png'),
(7, 'Darth', 'Vader', '+2349038084524', 'test400@test.com', NULL, '$2y$10$ltMdeN9070bBwQJrrt.XNe3HmOrg2N4pgoZJMuiotHurVZXVoIAdW', NULL, '2022-08-15 17:09:31', '2022-09-14 00:33:12', 'Test Bank', 'test address', 'Test Branch', 'Holder', '0000000000', '2022-08-15-62fae03b0b1c7.png', '2022-08-15-62fae03b0e340.png', 0, NULL, NULL, '30-60', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '08:15:56', '08:15:56', NULL, '0.00', 0, 0, 0, 4, NULL, NULL, NULL, '0', '4444', '234903808452', '2349038084', 'def.png', 'def.png', 'def.png'),
(8, 'ram', 'charan', '9479962720', 'ramcharan123@gmail.com', NULL, '$2y$10$p3otTQ9yS6FYAX1IactbHeVmN01ABEUU46LX2OXzmyVEidCJsBm/C', NULL, '2022-08-21 23:58:03', '2022-09-14 00:33:05', 'bank of india', 'asir', 'shanvara', 'vishnu', '234567898765', '2022-08-21-630328faf15ba.png', '2022-08-21-630328faf2b5f.png', 0, NULL, NULL, '20-31', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '08:15:56', '08:15:56', NULL, '0.00', 0, 0, 0, 4, NULL, NULL, NULL, '0', '5436565', '9479962720', '9479962720', '2022-08-21-630328faf3b42.png', '2022-08-21-630328fb00065.png', '2022-08-21-630328fb005d8.png'),
(9, 'kavita', 'verma', '8305137336', 'kavita123@gmail.com', NULL, '$2y$10$L.uYb/BAuo3zlCm6OfQ5EeW/86QjiW5dsXcd9GJVh1TNBIH6P6qOu', NULL, '2022-08-22 00:27:28', '2023-01-11 17:12:01', 'bank of india', 'Indore', 'shanvara', 'kavita', '43435465433', '2022-09-07-63184244dadcf.png', '2022-09-07-63184244daa4a.png', 0, NULL, NULL, '20-31', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":1}', 0, 0, '0.00', 1, '08:15:56', '08:15:56', NULL, '0.00', 0, 0, 0, 4, NULL, NULL, NULL, '0', '5436565', '8305137336', '8305137336', '2022-08-22-63032fe082b00.png', '2022-08-22-63033dec662e0.png', '2022-08-22-63033dec666c0.png'),
(10, 'shyam', 'charan', '9691237935', 'shyam@123gmail.com', NULL, '$2y$10$HUp7iS48z7BleB3yRrY1HuJTfL9ruXcxOn33msbnToVyXLl5rgX5i', NULL, '2022-08-22 05:44:08', '2023-01-11 17:11:57', 'bank of india', 'indore', 'shanvara', 'shyam', '1233333313133154', '2022-09-07-631841ac07300.png', '2022-09-07-631841ac06eef.png', 0, NULL, NULL, '20-31', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":2}', 0, 0, '0.00', 1, '08:15:56', '08:15:56', NULL, '0.00', 0, 0, 1, 4, NULL, NULL, NULL, '0', '5436565', '9691237935', '9691237935', '2022-08-22-63046fa65b9c2.png', '2022-08-22-63046fa65bc91.png', '2022-08-22-63046fa65bf16.png'),
(11, 'Rahul', 'deshmukh', '1234567893', 'rahul444@gmail.com', NULL, '$2y$10$dDq4TK0Rwzew01cO55jWOes3lutltKS1kfUnHQyYyXXOnMCERKMwi', 'YrCvfkEL46kfP9CothoQg3t3CnL5cIlZ5fQzUXqZOb1jp7gqOWh5q4UJwkEE', '2022-08-24 22:25:56', '2023-01-11 17:11:52', 'HDFC', 'khajrana', 'Burhanpur', 'Rahul', '4567876543333', '2022-09-07-631842cf15c47.png', '2022-09-07-631842cf1598b.png', 0, NULL, NULL, '20-31', '{\"1\":3,\"2\":0,\"3\":0,\"4\":0,\"5\":6}', 0, 0, '0.00', 1, '10:05:56', '20:15:56', '10.00', '99.00', 0, 1, 1, 4, NULL, NULL, '7', '10', '5436565', '123456789679', '1234567893', '2022-08-24-630707e43fbf3.png', '2022-08-24-630707e43feb4.png', '2022-08-24-630707e440067.png'),
(12, 'jiva', 'charan', '9098676543', 'Jiva@gmail.com', NULL, '$2y$10$vKHNwuGZ0EpUH0utOm/tzeVdU81j2L/.zepGVPydYUZQOTAE0eGya', NULL, '2022-09-03 00:47:12', '2023-01-11 17:11:48', 'bank of india', 'indore', 'Burhanpur', 'golu', '12345678998', '2022-09-06-63183f3fb4e14.png', '2022-09-06-63183f3fb4af5.png', 0, NULL, NULL, '20-60', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":1}', 0, 0, '0.00', 1, '08:15:56', '08:15:56', NULL, '0.00', 0, 0, 0, 4, NULL, NULL, NULL, '0', '5436565', '9098676543', '9098676543', '2022-09-03-6313068015460.png', '2022-09-03-63130680157d4.png', '2022-09-03-6313068015999.png'),
(13, 'vishnu', 'charan', '6277886543', 'Vishnu123@gmail.com', NULL, '$2y$10$ihFfhA42xFBt5h0RG/VqwebscDA7NqAnwXETm6lyFvtdPCp4TQXGO', NULL, '2022-09-03 02:30:25', '2023-01-11 17:11:43', 'HDFC', 'indore', 'shanvara', 'vishnu', '123445666775566', '2022-09-03-63131eb1b896b.png', '2022-09-03-63131eb1b903e.png', 0, NULL, NULL, '20-60', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":1}', 0, 0, '0.00', 1, '08:15:56', '08:15:56', NULL, '0.00', 0, 0, 0, 4, NULL, NULL, NULL, '10', 'HDFC123', '6277886543', '6277886543', '2022-09-03-63131eb1b92cb.png', '2022-09-03-63131eb1b9511.png', '2022-09-03-63131eb1b9732.png'),
(14, 'test name', 'test name', '1234567890', 'test5@gmail.com', NULL, '$2y$10$5xvmN9dCMhNaS9PwvF4vkuXPdQCJ.VdZs0iQOceut6aDnExIxfzp6', NULL, '2022-09-09 05:24:46', '2022-09-23 10:52:29', 'hhhhh', 'nddndndndnndd', 'nnndnnd', 'ndndndn', '2345432', '2022-09-09-631b308e3195d.png', '2022-09-09-631b308e34df4.png', 0, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '08:15:56', '08:15:56', NULL, '0.00', 0, 0, 0, 4, NULL, NULL, NULL, '0', 'wggwgw2', '1234567890', '1234567890', '2022-09-09-631b308e3513c.png', '2022-09-09-631b308e3543c.png', '2022-09-09-631b308e3572c.png'),
(15, 'Neha', 'verma', '9691237987', 'neha@gmail.com', NULL, '$2y$10$hFwlRZUEtJ1rQHG784qPZOZFT4jC5ww4gsyV2SrmHmOHQsqbgtXty', NULL, '2022-09-21 16:33:27', '2022-09-28 15:52:21', 'HDFC', 'indore', 'shanvara', 'neha', '1234567788', '2022-09-21-632aef7f6f0b1.png', 'def.png', 0, NULL, NULL, '20-60', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '08:15:56', '08:15:56', NULL, '0.00', 0, 0, 0, 4, NULL, NULL, NULL, '0', 'HDFC123', '9691237987', '9691237987', 'def.png', 'def.png', 'def.png'),
(16, 'a', 's', '9876543210', 'test', NULL, '$2y$10$nmsJkvsaQzqDwAFzHb9RZepIsqniNZNGrJzqk5EGm4Mkievf0Zoju', NULL, '2022-09-23 17:38:28', '2023-01-11 17:11:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '08:15:56', '08:15:56', NULL, '0.00', 0, 0, 0, 234567, 'test', 'test', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'MfonAbasi', 'Udobia', '1234567892022', 'djdjjd@gmail.com', NULL, '$2y$10$1/cgOggPz22ieLcviCZUNeb5cTAoLpESDialalJJ.IY40YgdRJzE2', NULL, '2022-11-16 09:16:33', '2023-01-11 17:09:38', 'jdjdjdjd', 'hdhdjwiiwsn', 'dndjdd', 'jfdndnd djdjd', '2222222222', '2022-11-16-63745d19288fe.png', '2022-11-16-63745d192c9ec.png', 0, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '03:46:33', '03:46:33', NULL, '0.00', 0, 0, 0, 4, NULL, NULL, NULL, '0', 'wggwgw', '1234567892022', '1234567892022', '2022-11-16-63745d192cd2a.png', '2022-11-16-63745d192d00c.png', '2022-11-16-63745d192d28b.png'),
(18, 'hdhdh', 'shssh', '99383992923', 'hxddi@gmail.com', NULL, '$2y$10$jbOgXAjcX/lFh7mKNTTXneEXoww/4n2u6eNi7/3QZfrVf8beOVSvS', NULL, '2022-11-16 09:21:47', '2023-01-11 17:10:10', 'bddbdbb', 'hddhdhdhd', 'jdddiii', 'jjddddi', '92994393939', '2022-11-16-63745e53cc0ed.png', '2022-11-16-63745e53cc927.png', 0, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '03:51:47', '03:51:47', NULL, '0.00', 0, 0, 0, 4, NULL, NULL, NULL, '0', 'dhddhddhhd', '99383992923', '99383992923', '2022-11-16-63745e53ccfdf.png', '2022-11-16-63745e53cd34a.png', '2022-11-16-63745e53cd67c.png'),
(19, 'jjcjvj', 'dhdhdh', '29992929222', 'test5sh@gmail.com', NULL, '$2y$10$.y7SDpqrkBXE0LK12oApZ.ftMCMEIwS.Vy3IivB3VAVz307scaTAa', NULL, '2022-11-16 09:30:26', '2023-01-11 17:10:22', 'hdhfhdhdh', 'hdhdhdhdh', 'kissisi', 'iisissi', '3229933030303', '2022-11-16-6374605a61584.png', '2022-11-16-6374605a62b4e.png', 0, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '04:00:26', '04:00:26', NULL, '0.00', 0, 0, 0, 4, '22.195890796005386', '79.20934426648392', NULL, '0', 'dhdddhddhhdh', '29992929222', '29992929222', '2022-11-16-6374605a63842.png', '2022-11-16-6374605a63c3e.png', '2022-11-16-6374605a63f9f.png'),
(20, 'kamlesh', 'charan', '8989434261', 'Kamlesh1@gmail.com', NULL, '$2y$10$426mqViruCrdnIsqhpDtNeuGs6PxkMJ0h4b98APUHfK6/ZWfFZQfC', NULL, '2023-01-07 18:15:09', '2023-01-12 13:54:17', 'ABC', 'Indore', 'abc1', 'Kamlesh', '2536554766474', '2023-01-11-63be9fde5bb52.png', '2023-01-11-63be9fde5a967.png', 1, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":1}', 0, 0, '0.00', 1, '12:45:09', '12:45:09', NULL, '0.00', 0, 0, 0, 4, '22.67316648498672', '75.92031228406205', NULL, '0', 'abc12', '8989434261', '8989434261', '2023-01-11-63be9fde5af80.png', '2023-01-11-63be9fde5b443.png', '2023-01-11-63be9fde5b863.png'),
(21, 'Virat', 'Charan', '8788866634', 'virat@gmail.com', NULL, '$2y$10$rtHz0JDNFkQWbzRneEh/zeGeG6aVBA6/sEX8NFv2MWscblp3nAjoa', NULL, '2023-01-11 13:37:12', '2023-01-11 17:07:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '08:07:12', '08:07:12', NULL, '0.00', 0, 0, 0, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'Virat', 'Charan', '8788866622', 'virat2@gmail.com', NULL, '$2y$10$urgNruUZtxS10Jh7L9CQaOBpaniaBPCOUHPbgWkl2iHkmrTzb3Ns.', NULL, '2023-01-11 13:57:23', '2023-01-11 13:57:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '08:27:23', '08:27:23', NULL, '0.00', 0, 0, 0, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'Kavita', 'Verma', '8989454261', 'kavita@gmail.com', NULL, '$2y$10$2HnP9ZRMaqWENTsAUbqbVex3hKs8C9A/Buy15yHI92p7ev7DWo32y', NULL, '2023-01-11 17:14:58', '2023-01-11 17:14:58', 'ABC', 'Indore', 'abc1', 'kavita verma', '12334567', '2023-01-11-63bea13aba2fd.png', '2023-01-11-63bea13abba42.png', 1, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '11:44:58', '11:44:58', NULL, '0.00', 0, 0, 0, 4, '22.650355684929178', '75.73171007497086', NULL, '0', 'abc12', '8989454261', '8989454261', '2023-01-11-63bea13abbfa4.png', '2023-01-11-63bea13abc182.png', '2023-01-11-63bea13abc31c.png'),
(24, 'Shiva', 'Charan', '7689005566', 'service@gmail.com', NULL, '$2y$10$Ad9fp1jAKCNeMkIn/zCcc.q360qcH3rq73WVuVDMzEFPenwM/8zyG', NULL, '2023-01-11 18:02:49', '2023-01-11 18:02:49', 'ABC', 'Indore', 'abc1', 'shyam verma', '1234567890', '2023-01-11-63beac71b4593.png', '2023-01-11-63beac71b6ad6.png', 1, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '12:32:49', '12:32:49', NULL, '0.00', 0, 0, 0, 4, '22.3860262506198', '75.02094077927842', NULL, '0', 'abc12', '7689005566', '7689005566', 'def.png', 'def.png', 'def.png'),
(25, 'Kishan', 'Charan', '7045954851', 'Service1@gmail.com', NULL, '$2y$10$wts7tQutcPQ6TOA4omYeHOO4Y7FW7KkALSph5KULRMzlz/aqs7atO', NULL, '2023-01-11 18:06:26', '2023-01-11 18:06:26', 'ABC', 'Indore', 'abc1', 'kishan charan', '123456789', '2023-01-11-63bead4aa0a5a.png', '2023-01-11-63bead4aa1751.png', 1, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '12:36:26', '12:36:26', NULL, '0.00', 0, 0, 0, 4, '21.55205716797592', '76.09170007569566', NULL, '0', 'abc12', '7045954851', '7045954851', 'def.png', 'def.png', 'def.png'),
(26, 'Jiten', 'Sir', '7024067897', 'jiten@gmail.com', NULL, '$2y$10$jwXtt/MEd.UFMFOFtmuOHu2KblZFmVjwF6kGXr9Sr0X9mGEg.vc7y', NULL, '2023-01-12 10:43:49', '2023-01-12 11:31:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '05:13:49', '05:13:49', NULL, '0.00', 0, 0, 0, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'Vijay', 'Charan', '8877665544', 'vijay@gmail.com', NULL, '$2y$10$TQBFOd3KS1M8Jltr33jqSu6CoZnI2zjxBoem460jr2itXnlx1e0bO', NULL, '2023-01-12 11:47:33', '2023-01-12 11:47:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '06:17:33', '06:17:33', NULL, '0.00', 0, 0, 0, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'Rekha', 'Charan', '6263778866', 'rekha@gmail.com', NULL, '$2y$10$OON2o6HlOrHLKpolCTD7u.5qM955LKnPU0vZBERASG0r2zXnvWQxS', NULL, '2023-01-12 11:54:19', '2023-01-12 11:56:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '06:24:19', '06:24:19', NULL, '0.00', 0, 0, 0, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'Arpita', 'Charan', '7766855443', 'arpita@gmail.com', NULL, '$2y$10$gQPg9dTKexntgeBzcC.Bo.wkml7cZlNnsNtc8/JyIGjP9tzNGVR1a', NULL, '2023-01-12 12:36:14', '2023-01-12 12:40:05', NULL, NULL, NULL, NULL, NULL, '2023-01-12-63bfb1662eb60.png', '2023-01-12-63bfb1663327e.png', 1, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '07:06:14', '07:06:14', NULL, '0.00', 0, 0, 0, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'Devin@gmail.com', 'Charan', '9900886655', 'devin@gmail.com', NULL, '$2y$10$to739cDr89TH/AxVsqi/IuS5oCVGbean3pjdg3/qB./OQdgeBZWL6', NULL, '2023-01-12 12:46:47', '2023-01-12 12:46:47', NULL, NULL, NULL, NULL, NULL, '2023-01-12-63bfb3df9cbe7.png', '2023-01-12-63bfb3df9eeb7.png', NULL, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '07:16:47', '07:16:47', NULL, '0.00', 0, 0, 0, 4, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'Gopal', 'Charan', '8305137333', 'vishnucharan1@gmail.com', NULL, '$2y$10$l8n9/FoXHEFKcoAHZR80UOYuSu4a64R/ua1ndLYbN7Hek3pB0qbLu', NULL, '2023-01-12 13:21:00', '2023-01-12 18:11:28', NULL, NULL, NULL, NULL, NULL, '2023-01-12-63bfbbe406cc0.png', '2023-01-12-63bfbbe40a8a5.png', 0, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '07:51:00', '07:51:00', NULL, '0.00', 0, 0, 0, 4, '22.83755012510245', '75.87004762712264', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'Pappu', 'Charan', '7766554438', 'pappu@gmail.com', NULL, '$2y$10$WJuGf3yGnD9nFjeXMblSqe8PW.D65SHgvvI1myhX4movHfkrwjomS', NULL, '2023-01-12 19:07:21', '2023-01-12 19:07:21', NULL, NULL, NULL, NULL, NULL, '2023-01-12-63c00d11c1613.png', '2023-01-12-63c00d11c489d.png', NULL, NULL, NULL, '30-40', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}', 0, 0, '0.00', 1, '13:37:21', '13:37:21', NULL, '0.00', 0, 0, 0, 4, '22.146186865240658', '75.5557513087438', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_employees`
--

CREATE TABLE `vendor_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_role_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_notifications`
--

CREATE TABLE `vendor_notifications` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `vendor_id` bigint(20) NOT NULL,
  `is_seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor_notifications`
--

INSERT INTO `vendor_notifications` (`id`, `title`, `message`, `vendor_id`, `is_seen`, `created_at`, `updated_at`) VALUES
(5, 'An order has been placed 100117', 'This is to notify you that an order has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-21 13:54:26', '2022-09-21 13:54:26'),
(6, 'An order has been placed 100118', 'This is to notify you that an order has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-21 13:58:23', '2022-09-21 13:58:23'),
(7, 'An order has been placed 100119', 'This is to notify you that an order has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-21 14:04:36', '2022-09-21 14:04:36'),
(8, 'An order has been placed 100120', 'This is to notify you that an order has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-21 14:07:08', '2022-09-21 14:07:08'),
(9, 'An order has been placed 100121', 'This is to notify you that an order has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-21 14:10:00', '2022-09-21 14:10:00'),
(10, 'An order has been placed 100122', 'This is to notify you that an order has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-21 14:10:07', '2022-09-21 14:10:07'),
(11, 'An order has been placed 100123', 'This is to notify you that an order has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-21 14:15:57', '2022-09-21 14:15:57'),
(12, 'An order has been placed 100124', 'This is to notify you that an order has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-21 14:40:58', '2022-09-21 14:40:58'),
(13, 'An order has been placed 100125', 'This is to notify you that an order has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-21 14:41:23', '2022-09-21 14:41:23'),
(14, 'An order has been placed 100126', 'This is to notify you that an order has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-21 15:12:48', '2022-09-21 15:12:48'),
(15, 'An order has been placed 100127', 'This is to notify you that an order has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-21 15:39:17', '2022-09-21 15:39:17'),
(16, 'An order has been placed 100128', 'This is to notify you that an order has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-21 15:48:10', '2022-09-21 15:48:10'),
(17, 'An order has been placed 100129', 'This is to notify you that an order has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-21 15:48:10', '2022-09-21 15:48:10'),
(18, 'An order has been placed 100130', 'This is to notify you that an order has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-21 15:59:50', '2022-09-21 15:59:50'),
(19, 'An order has been placed 100131', 'This is to notify you that an order has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-21 16:02:44', '2022-09-21 16:02:44'),
(20, 'An order has been placed 100132', 'This is to notify you that an order has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-21 16:07:49', '2022-09-21 16:07:49'),
(21, 'An order has been placed 100133', 'This is to notify you that an order has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-21 16:40:31', '2022-09-21 16:40:31'),
(22, 'An order has been placed 100134', 'This is to notify you that an order has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-21 18:07:18', '2022-09-21 18:07:18'),
(23, 'An order has been placed 100135', 'This is to notify you that an order has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-21 18:48:54', '2022-09-21 18:48:54'),
(24, 'A booking has been placed 100136', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-21 19:09:28', '2022-09-21 19:09:28'),
(25, 'A booking has been placed 100137', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-21 19:11:01', '2022-09-21 19:11:01'),
(26, 'A booking has been placed 100138', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-21 19:14:55', '2022-09-21 19:14:55'),
(27, 'A booking has been placed 100139', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-21 19:19:25', '2022-09-21 19:19:25'),
(28, 'A booking has been placed 100140', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-21 19:35:43', '2022-09-21 19:35:43'),
(29, 'A booking has been placed 100141', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-21 19:37:33', '2022-09-21 19:37:33'),
(30, 'A booking has been placed 100142', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-22 17:03:25', '2022-09-22 17:03:25'),
(31, 'A booking has been placed 100143', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-22 17:03:25', '2022-09-22 17:03:25'),
(32, 'A booking has been placed 100144', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-22 17:08:42', '2022-09-22 17:08:42'),
(33, 'A booking has been placed 100145', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 13, 0, '2022-09-22 17:08:42', '2022-09-22 17:08:42'),
(34, 'A booking has been placed 100146', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-22 17:24:33', '2022-09-22 17:24:33'),
(35, 'A booking has been placed 100147', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-22 17:24:33', '2022-09-22 17:24:33'),
(36, 'A booking has been placed 100148', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-22 17:37:01', '2022-09-22 17:37:01'),
(37, 'A booking has been placed 100149', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-22 17:42:56', '2022-09-22 17:42:56'),
(38, 'A booking has been placed 100150', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-22 17:42:56', '2022-09-22 17:42:56'),
(39, 'A booking has been placed 100151', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-22 17:55:12', '2022-09-22 17:55:12'),
(40, 'A booking has been placed 100152', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-22 17:55:12', '2022-09-22 17:55:12'),
(41, 'A booking has been placed 100153', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-22 18:24:49', '2022-09-22 18:24:49'),
(42, 'A booking has been placed 100154', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-22 18:28:04', '2022-09-22 18:28:04'),
(43, 'A booking has been placed 100155', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-22 18:31:43', '2022-09-22 18:31:43'),
(44, 'A booking has been placed 100156', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-22 18:31:43', '2022-09-22 18:31:43'),
(45, 'A booking has been placed 100157', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-22 18:35:24', '2022-09-22 18:35:24'),
(46, 'A booking has been placed 100158', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-22 18:35:24', '2022-09-22 18:35:24'),
(47, 'A booking has been placed 100159', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-22 19:10:46', '2022-09-22 19:10:46'),
(48, 'A booking has been placed 100160', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-22 19:10:46', '2022-09-22 19:10:46'),
(49, 'A booking has been placed 100161', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-22 19:13:11', '2022-09-22 19:13:11'),
(50, 'A booking has been placed 100162', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-22 19:13:11', '2022-09-22 19:13:11'),
(51, 'A booking has been placed 100163', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-22 20:50:31', '2022-09-22 20:50:31'),
(52, 'A booking has been placed 100164', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 13, 0, '2022-09-22 20:50:31', '2022-09-22 20:50:31'),
(53, 'A booking has been placed 100165', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-22 20:52:20', '2022-09-22 20:52:20'),
(54, 'A booking has been placed 100166', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-22 20:52:20', '2022-09-22 20:52:20'),
(55, 'A booking has been placed 100167', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-22 20:53:12', '2022-09-22 20:53:12'),
(56, 'A booking has been placed 100168', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-22 20:54:23', '2022-09-22 20:54:23'),
(57, 'A booking has been placed 100169', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 13, 0, '2022-09-22 20:54:23', '2022-09-22 20:54:23'),
(58, 'A booking has been placed 100170', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-22 20:55:49', '2022-09-22 20:55:49'),
(59, 'A booking has been placed 100171', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-22 21:07:53', '2022-09-22 21:07:53'),
(60, 'A booking has been placed 100172', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 13, 0, '2022-09-23 10:58:12', '2022-09-23 10:58:12'),
(61, 'A booking has been placed 100173', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-23 10:58:12', '2022-09-23 10:58:12'),
(62, 'A booking has been placed 100174', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-23 11:01:17', '2022-09-23 11:01:17'),
(63, 'A booking has been placed 100175', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-23 11:01:17', '2022-09-23 11:01:17'),
(64, 'A booking has been placed 100176', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-23 11:05:12', '2022-09-23 11:05:12'),
(65, 'A booking has been placed 100177', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-23 11:05:12', '2022-09-23 11:05:12'),
(66, 'A booking has been placed 100178', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-23 11:06:59', '2022-09-23 11:06:59'),
(67, 'A booking has been placed 100179', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-23 11:06:59', '2022-09-23 11:06:59'),
(68, 'A booking has been placed 100180', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-23 11:12:40', '2022-09-23 11:12:40'),
(69, 'A booking has been placed 100181', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-23 11:12:40', '2022-09-23 11:12:40'),
(70, 'A booking has been placed 100182', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-23 13:55:30', '2022-09-23 13:55:30'),
(71, 'A booking has been placed 100183', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-23 13:55:30', '2022-09-23 13:55:30'),
(72, 'A booking has been placed 100184', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-23 14:27:42', '2022-09-23 14:27:42'),
(73, 'A booking has been placed 100185', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-23 14:43:50', '2022-09-23 14:43:50'),
(74, 'A booking has been placed 100186', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-23 14:56:36', '2022-09-23 14:56:36'),
(75, 'A booking has been placed 100187', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-23 17:55:27', '2022-09-23 17:55:27'),
(76, 'A booking has been placed 100188', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-23 17:56:12', '2022-09-23 17:56:12'),
(77, 'A booking has been placed 100189', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-23 17:57:41', '2022-09-23 17:57:41'),
(78, 'A booking has been placed 100190', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-23 18:00:25', '2022-09-23 18:00:25'),
(79, 'A booking has been placed 100191', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-23 18:09:27', '2022-09-23 18:09:27'),
(80, 'A booking has been placed 100192', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-23 18:22:54', '2022-09-23 18:22:54'),
(81, 'A booking has been placed 100193', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-23 18:26:50', '2022-09-23 18:26:50'),
(82, 'A booking has been placed 100194', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-23 18:41:00', '2022-09-23 18:41:00'),
(83, 'A booking has been placed 100195', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 01:28:54', '2022-09-26 01:28:54'),
(84, 'A booking has been placed 100196', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 01:31:34', '2022-09-26 01:31:34'),
(85, 'A booking has been placed 100197', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 01:33:01', '2022-09-26 01:33:01'),
(86, 'A booking has been placed 100198', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 01:37:42', '2022-09-26 01:37:42'),
(87, 'A booking has been placed 100199', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 02:03:54', '2022-09-26 02:03:54'),
(88, 'A booking has been placed 100200', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 02:04:41', '2022-09-26 02:04:41'),
(89, 'A booking has been placed 100201', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-26 02:06:29', '2022-09-26 02:06:29'),
(90, 'A booking has been placed 100202', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-26 02:08:26', '2022-09-26 02:08:26'),
(91, 'A booking has been placed 100203', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 02:14:52', '2022-09-26 02:14:52'),
(92, 'A booking has been placed 100204', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-26 02:33:43', '2022-09-26 02:33:43'),
(93, 'A booking has been placed 100205', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 02:39:25', '2022-09-26 02:39:25'),
(94, 'A booking has been placed 100206', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-26 02:43:26', '2022-09-26 02:43:26'),
(95, 'A booking has been placed 100207', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 10:47:14', '2022-09-26 10:47:14'),
(96, 'A booking has been placed 100208', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 10:50:39', '2022-09-26 10:50:39'),
(97, 'A booking has been placed 100209', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 10:54:54', '2022-09-26 10:54:54'),
(98, 'A booking has been placed 100210', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 10:57:24', '2022-09-26 10:57:24'),
(99, 'A booking has been placed 100211', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 11:56:21', '2022-09-26 11:56:21'),
(100, 'A booking has been placed 100212', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 12:15:12', '2022-09-26 12:15:12'),
(101, 'A booking has been placed 100213', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 13:51:57', '2022-09-26 13:51:57'),
(102, 'A booking has been placed 100214', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-26 13:53:10', '2022-09-26 13:53:10'),
(103, 'A booking has been placed 100215', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-26 13:58:33', '2022-09-26 13:58:33'),
(104, 'A booking has been placed 100216', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-26 14:01:49', '2022-09-26 14:01:49'),
(105, 'A booking has been placed 100217', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 14:15:42', '2022-09-26 14:15:42'),
(106, 'A booking has been placed 100218', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-26 14:17:33', '2022-09-26 14:17:33'),
(107, 'A booking has been placed 100219', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-26 14:21:15', '2022-09-26 14:21:15'),
(108, 'A booking has been placed 100220', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-26 14:24:27', '2022-09-26 14:24:27'),
(109, 'A booking has been placed 100221', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-26 14:29:43', '2022-09-26 14:29:43'),
(110, 'A booking has been placed 100222', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-26 14:32:14', '2022-09-26 14:32:14'),
(111, 'A booking has been placed 100223', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-26 14:38:03', '2022-09-26 14:38:03'),
(112, 'A booking has been placed 100224', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-26 14:39:31', '2022-09-26 14:39:31'),
(113, 'A booking has been placed 100225', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-26 14:40:47', '2022-09-26 14:40:47'),
(114, 'A booking has been placed 100226', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-26 14:41:54', '2022-09-26 14:41:54'),
(115, 'A booking has been placed 100227', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 14:42:36', '2022-09-26 14:42:36'),
(116, 'A booking has been placed 100228', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 14:43:39', '2022-09-26 14:43:39'),
(117, 'A booking has been placed 100229', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 15:17:48', '2022-09-26 15:17:48'),
(118, 'A booking has been placed 100230', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 15:22:27', '2022-09-26 15:22:27'),
(119, 'A booking has been placed 100231', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 15:44:29', '2022-09-26 15:44:29'),
(120, 'A booking has been placed 100232', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 15:53:13', '2022-09-26 15:53:13'),
(121, 'A booking has been placed 100233', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 15:54:48', '2022-09-26 15:54:48'),
(122, 'A booking has been placed 100234', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 17:54:12', '2022-09-26 17:54:12'),
(123, 'A booking has been placed 100235', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 18:00:17', '2022-09-26 18:00:17'),
(124, 'A booking has been placed 100236', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 18:04:23', '2022-09-26 18:04:23'),
(125, 'A booking has been placed 100237', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 18:05:49', '2022-09-26 18:05:49'),
(126, 'A booking has been placed 100238', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 18:07:46', '2022-09-26 18:07:46'),
(127, 'A booking has been placed 100239', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-26 18:11:59', '2022-09-26 18:11:59'),
(128, 'A booking has been placed 100240', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-26 19:56:23', '2022-09-26 19:56:23'),
(129, 'A booking has been placed 100241', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-26 20:35:28', '2022-09-26 20:35:28'),
(130, 'A booking has been placed 100242', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-26 20:38:48', '2022-09-26 20:38:48'),
(131, 'A booking has been placed 100243', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-26 20:39:25', '2022-09-26 20:39:25'),
(132, 'A booking has been placed 100244', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 12, 0, '2022-09-26 20:43:39', '2022-09-26 20:43:39'),
(133, 'A booking has been placed 100245', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-27 09:19:42', '2022-09-27 09:19:42'),
(134, 'A booking has been placed 100246', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-27 13:42:05', '2022-09-27 13:42:05'),
(135, 'A booking has been placed 100247', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-27 16:24:42', '2022-09-27 16:24:42'),
(136, 'A booking has been placed 100248', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-27 18:01:38', '2022-09-27 18:01:38'),
(137, 'A booking has been placed 100249', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-27 18:48:29', '2022-09-27 18:48:29'),
(138, 'A booking has been placed 100250', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-27 18:48:42', '2022-09-27 18:48:42'),
(139, 'A booking has been placed 100251', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 9, 0, '2022-09-28 11:03:52', '2022-09-28 11:03:52'),
(140, 'A booking has been placed 100252', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-28 11:25:48', '2022-09-28 11:25:48'),
(141, 'A booking has been placed 100253', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-28 11:38:19', '2022-09-28 11:38:19'),
(142, 'A booking has been placed 100254', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-28 11:38:36', '2022-09-28 11:38:36'),
(143, 'A booking has been placed 100255', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-28 11:40:53', '2022-09-28 11:40:53'),
(144, 'A booking has been placed 100256', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-28 12:11:32', '2022-09-28 12:11:32'),
(145, 'A booking has been placed 100257', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-28 12:11:56', '2022-09-28 12:11:56'),
(146, 'A booking has been placed 100258', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-28 12:15:51', '2022-09-28 12:15:51'),
(147, 'A booking has been placed 100259', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-28 12:17:14', '2022-09-28 12:17:14'),
(148, 'A booking has been placed 100260', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-28 12:17:58', '2022-09-28 12:17:58'),
(149, 'A booking has been placed 100261', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 13, 0, '2022-09-28 13:05:43', '2022-09-28 13:05:43'),
(150, 'A booking has been placed 100262', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-28 13:53:54', '2022-09-28 13:53:54'),
(151, 'A booking has been placed 100263', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-28 14:04:29', '2022-09-28 14:04:29'),
(152, 'A booking has been placed 100264', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 13, 0, '2022-09-28 15:34:36', '2022-09-28 15:34:36'),
(153, 'A booking has been placed 100265', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-28 15:54:18', '2022-09-28 15:54:18'),
(154, 'A booking has been placed 100266', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-28 15:58:47', '2022-09-28 15:58:47'),
(155, 'A booking has been placed 100267', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 1, '2022-09-28 16:09:26', '2022-09-30 15:47:33'),
(156, 'A booking has been placed 100268', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 13, 0, '2022-09-28 17:25:13', '2022-09-28 17:25:13'),
(157, 'A booking has been placed 100269', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-28 17:32:56', '2022-09-28 17:32:56'),
(158, 'A booking has been placed 100270', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-28 18:25:32', '2022-09-28 18:25:32'),
(159, 'A booking has been placed 100271', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-28 18:37:49', '2022-09-28 18:37:49'),
(160, 'A booking has been placed 100272', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-28 18:40:02', '2022-09-28 18:40:02'),
(161, 'A booking has been placed 100273', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-28 18:41:36', '2022-09-28 18:41:36'),
(162, 'A booking has been placed 100274', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-28 18:45:26', '2022-09-28 18:45:26'),
(163, 'A booking has been placed 100275', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-28 18:59:39', '2022-09-28 18:59:39'),
(164, 'A booking has been placed 100276', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-29 11:25:48', '2022-09-29 11:25:48'),
(165, 'A booking has been placed 100277', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-29 11:29:33', '2022-09-29 11:29:33'),
(166, 'A booking has been placed 100278', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-29 12:11:58', '2022-09-29 12:11:58'),
(167, 'A booking has been placed 100279', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-29 12:27:03', '2022-09-29 12:27:03'),
(168, 'A booking has been placed 100280', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-29 12:31:24', '2022-09-29 12:31:24'),
(169, 'A booking has been placed 100281', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-29 12:33:07', '2022-09-29 12:33:07'),
(170, 'A booking has been placed 100282', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-29 12:34:14', '2022-09-29 12:34:14'),
(171, 'A booking has been placed 100283', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-29 12:39:46', '2022-09-29 12:39:46'),
(172, 'A booking has been placed 100284', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-29 12:41:12', '2022-09-29 12:41:12'),
(173, 'A booking has been placed 100285', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-29 13:06:19', '2022-09-29 13:06:19'),
(174, 'A booking has been placed 100286', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-29 14:55:25', '2022-09-29 14:55:25'),
(175, 'A booking has been placed 100287', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-29 17:53:54', '2022-09-29 17:53:54'),
(176, 'A booking has been placed 100288', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-29 18:08:21', '2022-09-29 18:08:21'),
(177, 'A booking has been placed 100289', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-29 18:13:17', '2022-09-29 18:13:17'),
(178, 'A booking has been placed 100290', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-29 18:20:00', '2022-09-29 18:20:00'),
(179, 'A booking has been placed 100291', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-29 18:27:10', '2022-09-29 18:27:10'),
(180, 'A booking has been placed 100292', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-29 18:31:13', '2022-09-29 18:31:13'),
(181, 'A booking has been placed 100293', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-29 18:33:19', '2022-09-29 18:33:19'),
(182, 'A booking has been placed 100294', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-30 11:10:48', '2022-09-30 11:10:48'),
(183, 'A booking has been placed 100295', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-30 11:21:52', '2022-09-30 11:21:52'),
(184, 'A booking has been placed 100296', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-30 15:12:14', '2022-09-30 15:12:14'),
(185, 'A booking has been placed 100297', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-30 15:30:47', '2022-09-30 15:30:47'),
(186, 'A booking has been placed 100298', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-30 15:31:59', '2022-09-30 15:31:59'),
(187, 'A booking has been placed 100299', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-30 15:42:15', '2022-09-30 15:42:15'),
(188, 'A booking has been placed 100300', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-30 15:46:23', '2022-09-30 15:46:23'),
(189, 'A booking has been placed 100301', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-30 15:48:38', '2022-09-30 15:48:38'),
(190, 'A booking has been placed 100302', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-30 15:53:45', '2022-09-30 15:53:45'),
(191, 'A booking has been placed 100303', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-30 15:56:07', '2022-09-30 15:56:07'),
(192, 'A booking has been placed 100304', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-30 16:02:31', '2022-09-30 16:02:31'),
(193, 'A booking has been placed 100305', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-30 17:10:41', '2022-09-30 17:10:41'),
(194, 'A booking has been placed 100306', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-30 17:26:27', '2022-09-30 17:26:27'),
(195, 'A booking has been placed 100307', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-30 17:29:27', '2022-09-30 17:29:27'),
(196, 'A booking has been placed 100308', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-09-30 18:01:09', '2022-09-30 18:01:09'),
(197, 'A booking has been placed 100309', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-09-30 18:25:14', '2022-09-30 18:25:14'),
(198, 'A booking has been placed 100310', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 1, '2022-09-30 18:28:30', '2022-09-30 18:38:45'),
(199, 'A booking has been placed 100311', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-01 10:45:37', '2022-10-01 10:45:37'),
(200, 'A booking has been placed 100312', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-01 12:41:53', '2022-10-01 12:41:53'),
(201, 'A booking has been placed 100313', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-01 13:05:15', '2022-10-01 13:05:15'),
(202, 'A booking has been placed 100314', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-01 13:25:56', '2022-10-01 13:25:56'),
(203, 'A booking has been placed 100315', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-01 13:36:05', '2022-10-01 13:36:05'),
(204, 'A booking has been placed 100316', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-01 16:10:30', '2022-10-01 16:10:30'),
(205, 'A booking has been placed 100317', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-01 16:15:13', '2022-10-01 16:15:13'),
(206, 'A booking has been placed 100318', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-01 16:41:50', '2022-10-01 16:41:50'),
(207, 'A booking has been placed 100319', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-01 16:47:32', '2022-10-01 16:47:32'),
(208, 'A booking has been placed 100320', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-01 16:48:57', '2022-10-01 16:48:57'),
(209, 'A booking has been placed 100321', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-01 17:16:59', '2022-10-01 17:16:59'),
(210, 'A booking has been placed 100322', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-01 18:20:01', '2022-10-01 18:20:01'),
(211, 'A booking has been placed 100323', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-01 18:20:54', '2022-10-01 18:20:54'),
(212, 'A booking has been placed 100324', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-01 18:37:40', '2022-10-01 18:37:40'),
(213, 'A booking has been placed 100325', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-01 18:44:19', '2022-10-01 18:44:19'),
(214, 'A booking has been placed 100326', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-01 18:46:15', '2022-10-01 18:46:15'),
(215, 'A booking has been placed 100327', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-01 18:57:46', '2022-10-01 18:57:46'),
(216, 'A booking has been placed 100328', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 1, '2022-10-01 19:06:28', '2022-10-03 10:21:40'),
(217, 'A booking has been placed 100329', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-03 11:29:04', '2022-10-03 11:29:04'),
(218, 'A booking has been placed 100330', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-03 11:30:03', '2022-10-03 11:30:03'),
(219, 'A booking has been placed 100331', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-03 11:31:12', '2022-10-03 11:31:12'),
(220, 'A booking has been placed 100332', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-03 11:38:07', '2022-10-03 11:38:07'),
(221, 'A booking has been placed 100333', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-03 11:42:50', '2022-10-03 11:42:50'),
(222, 'A booking has been placed 100334', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-03 12:08:49', '2022-10-03 12:08:49'),
(223, 'A booking has been placed 100335', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-03 16:18:49', '2022-10-03 16:18:49'),
(224, 'A booking has been placed 100336', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-03 16:42:28', '2022-10-03 16:42:28'),
(225, 'A booking has been placed 100337', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-03 16:56:13', '2022-10-03 16:56:13'),
(226, 'A booking has been placed 100338', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-03 17:27:16', '2022-10-03 17:27:16'),
(227, 'A booking has been placed 100339', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-03 17:43:34', '2022-10-03 17:43:34'),
(228, 'A booking has been placed 100340', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-03 17:57:06', '2022-10-03 17:57:06'),
(229, 'A booking has been placed 100341', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-03 18:21:31', '2022-10-03 18:21:31'),
(230, 'A booking has been placed 100342', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-03 19:35:55', '2022-10-03 19:35:55'),
(231, 'A booking has been placed 100343', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-03 20:41:14', '2022-10-03 20:41:14'),
(232, 'A booking has been placed 100344', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-03 20:48:35', '2022-10-03 20:48:35'),
(233, 'A booking has been placed 100345', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-03 20:50:43', '2022-10-03 20:50:43'),
(234, 'A booking has been placed 100346', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-03 20:53:06', '2022-10-03 20:53:06'),
(235, 'A booking has been placed 100347', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-03 20:56:29', '2022-10-03 20:56:29'),
(236, 'A booking has been placed 100348', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-03 21:21:16', '2022-10-03 21:21:16');
INSERT INTO `vendor_notifications` (`id`, `title`, `message`, `vendor_id`, `is_seen`, `created_at`, `updated_at`) VALUES
(237, 'A booking has been placed 100349', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-03 21:26:09', '2022-10-03 21:26:09'),
(238, 'A booking has been placed 100350', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-03 21:52:39', '2022-10-03 21:52:39'),
(239, 'A booking has been placed 100351', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-03 21:53:34', '2022-10-03 21:53:34'),
(240, 'A booking has been placed 100352', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-03 21:59:25', '2022-10-03 21:59:25'),
(241, 'A booking has been placed 100353', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-03 22:32:26', '2022-10-03 22:32:26'),
(242, 'A booking has been placed 100354', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-03 22:37:54', '2022-10-03 22:37:54'),
(243, 'A booking has been placed 100355', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 9, 0, '2022-10-03 22:40:36', '2022-10-03 22:40:36'),
(244, 'A booking has been placed 100356', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 12, 0, '2022-10-03 22:43:33', '2022-10-03 22:43:33'),
(245, 'A booking has been placed 100357', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-04 03:33:32', '2022-10-04 03:33:32'),
(246, 'A booking has been placed 100358', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-04 06:33:57', '2022-10-04 06:33:57'),
(247, 'A booking has been placed 100359', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-04 08:52:42', '2022-10-04 08:52:42'),
(248, 'A booking has been placed 100360', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-04 08:57:25', '2022-10-04 08:57:25'),
(249, 'A booking has been placed 100361', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-04 10:21:22', '2022-10-04 10:21:22'),
(250, 'A booking has been placed 100362', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-04 10:27:51', '2022-10-04 10:27:51'),
(251, 'A booking has been placed 100363', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-04 10:29:47', '2022-10-04 10:29:47'),
(252, 'A booking has been placed 100364', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-04 10:34:38', '2022-10-04 10:34:38'),
(253, 'A booking has been placed 100365', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-04 10:59:54', '2022-10-04 10:59:54'),
(254, 'A booking has been placed 100366', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-04 11:00:41', '2022-10-04 11:00:41'),
(255, 'A booking has been placed 100367', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-04 11:05:38', '2022-10-04 11:05:38'),
(256, 'A booking has been placed 100368', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-04 11:08:25', '2022-10-04 11:08:25'),
(257, 'A booking has been placed 100369', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-04 11:10:57', '2022-10-04 11:10:57'),
(258, 'A booking has been placed 100370', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-04 11:21:08', '2022-10-04 11:21:08'),
(259, 'A booking has been placed 100371', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-04 11:34:38', '2022-10-04 11:34:38'),
(260, 'A booking has been placed 100372', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-04 11:38:59', '2022-10-04 11:38:59'),
(261, 'A booking has been placed 100373', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-04 12:13:34', '2022-10-04 12:13:34'),
(262, 'A booking has been placed 100374', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-04 12:25:36', '2022-10-04 12:25:36'),
(263, 'A booking has been placed 100375', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-04 13:53:24', '2022-10-04 13:53:24'),
(264, 'A booking has been placed 100376', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-04 13:54:51', '2022-10-04 13:54:51'),
(265, 'A booking has been placed 100377', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-04 13:55:28', '2022-10-04 13:55:28'),
(266, 'A booking has been placed 100378', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-04 13:59:53', '2022-10-04 13:59:53'),
(267, 'A booking has been placed 100379', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-04 14:20:38', '2022-10-04 14:20:38'),
(268, 'A booking has been placed 100380', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-04 14:22:45', '2022-10-04 14:22:45'),
(269, 'A booking has been placed 100381', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-04 15:27:46', '2022-10-04 15:27:46'),
(270, 'A booking has been placed 100382', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-04 16:48:51', '2022-10-04 16:48:51'),
(271, 'A booking has been placed 100383', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-04 17:33:38', '2022-10-04 17:33:38'),
(272, 'A booking has been placed 100384', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-04 17:34:51', '2022-10-04 17:34:51'),
(273, 'A booking has been placed 100385', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-04 18:56:23', '2022-10-04 18:56:23'),
(274, 'A booking has been placed 100386', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-04 19:01:12', '2022-10-04 19:01:12'),
(275, 'A booking has been placed 100387', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-05 17:41:35', '2022-10-05 17:41:35'),
(276, 'A booking has been placed 100388', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-05 17:48:12', '2022-10-05 17:48:12'),
(277, 'A booking has been placed 100389', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-05 17:50:46', '2022-10-05 17:50:46'),
(278, 'A booking has been placed 100390', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-05 17:51:35', '2022-10-05 17:51:35'),
(279, 'A booking has been placed 100391', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-05 17:52:25', '2022-10-05 17:52:25'),
(280, 'A booking has been placed 100392', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-05 17:53:50', '2022-10-05 17:53:50'),
(281, 'A booking has been placed 100393', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-05 17:57:58', '2022-10-05 17:57:58'),
(282, 'A booking has been placed 100394', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-05 18:13:21', '2022-10-05 18:13:21'),
(283, 'A booking has been placed 100395', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-05 18:24:29', '2022-10-05 18:24:29'),
(284, 'A booking has been placed 100396', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-06 11:57:27', '2022-10-06 11:57:27'),
(285, 'A booking has been placed 100397', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-06 12:08:21', '2022-10-06 12:08:21'),
(286, 'A booking has been placed 100398', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-06 12:08:33', '2022-10-06 12:08:33'),
(287, 'A booking has been placed 100399', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-06 12:09:24', '2022-10-06 12:09:24'),
(288, 'A booking has been placed 100400', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-06 12:11:37', '2022-10-06 12:11:37'),
(289, 'A booking has been placed 100401', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-06 13:13:42', '2022-10-06 13:13:42'),
(290, 'A booking has been placed 100402', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-06 13:23:13', '2022-10-06 13:23:13'),
(291, 'A booking has been placed 100403', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-06 13:30:31', '2022-10-06 13:30:31'),
(292, 'A booking has been placed 100404', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-06 13:31:39', '2022-10-06 13:31:39'),
(293, 'A booking has been placed 100405', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-06 13:52:32', '2022-10-06 13:52:32'),
(294, 'A booking has been placed 100406', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-06 14:00:38', '2022-10-06 14:00:38'),
(295, 'A booking has been placed 100407', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-10-07 13:42:05', '2022-10-07 13:42:05'),
(296, 'A booking has been placed 100408', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-10-07 13:52:47', '2022-10-07 13:52:47'),
(297, 'A booking has been placed 100409', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 12, 0, '2022-10-19 12:50:17', '2022-10-19 12:50:17'),
(298, 'A booking has been placed 100410', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 9, 0, '2022-10-20 17:45:50', '2022-10-20 17:45:50'),
(299, 'A booking has been placed 100411', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 9, 0, '2022-11-01 18:25:22', '2022-11-01 18:25:22'),
(300, 'A booking has been placed 100412', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-11-01 18:32:24', '2022-11-01 18:32:24'),
(301, 'A booking has been placed 100413', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-11-01 18:38:29', '2022-11-01 18:38:29'),
(302, 'A booking has been placed 100414', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-11-02 14:50:22', '2022-11-02 14:50:22'),
(303, 'A booking has been placed 100415', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-11-03 10:25:19', '2022-11-03 10:25:19'),
(304, 'A booking has been placed 100416', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-11-03 10:27:00', '2022-11-03 10:27:00'),
(305, 'A booking has been placed 100417', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-11-03 10:31:25', '2022-11-03 10:31:25'),
(306, 'A booking has been placed 100418', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-11-03 10:33:21', '2022-11-03 10:33:21'),
(307, 'A booking has been placed 100419', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-11-03 10:36:10', '2022-11-03 10:36:10'),
(308, 'A booking has been placed 100420', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-11-03 11:02:49', '2022-11-03 11:02:49'),
(309, 'A booking has been placed 100421', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 1, '2022-11-03 11:56:12', '2022-11-03 14:51:35'),
(310, 'A booking has been placed 100422', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 12, 0, '2022-11-03 12:07:03', '2022-11-03 12:07:03'),
(311, 'A booking has been placed 100423', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 12, 0, '2022-11-03 12:40:19', '2022-11-03 12:40:19'),
(312, 'A booking has been placed 100424', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 12, 0, '2022-11-03 12:45:03', '2022-11-03 12:45:03'),
(313, 'A booking has been placed 100425', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 12, 0, '2022-11-03 13:06:55', '2022-11-03 13:06:55'),
(314, 'A booking has been placed 100426', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 12, 0, '2022-11-03 13:54:22', '2022-11-03 13:54:22'),
(315, 'A booking has been placed 100427', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-11-03 18:29:16', '2022-11-03 18:29:16'),
(316, 'A booking has been placed 100428', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 10, 0, '2022-11-03 18:47:40', '2022-11-03 18:47:40'),
(317, 'A booking has been placed 100429', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-11-04 17:08:11', '2022-11-04 17:08:11'),
(318, 'A booking has been placed 100430', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-11-04 17:12:11', '2022-11-04 17:12:11'),
(319, 'A booking has been placed 100431', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-11-04 17:34:36', '2022-11-04 17:34:36'),
(320, 'A booking has been placed 100432', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-11-05 12:24:33', '2022-11-05 12:24:33'),
(321, 'A booking has been placed 100433', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-11-09 15:22:45', '2022-11-09 15:22:45'),
(322, 'A booking has been placed 100434', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-11-11 11:48:06', '2022-11-11 11:48:06'),
(323, 'A booking has been placed 100435', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-11-15 11:31:22', '2022-11-15 11:31:22'),
(324, 'A booking has been placed 100436', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-11-15 11:33:21', '2022-11-15 11:33:21'),
(325, 'A booking has been placed 100437', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-11-15 11:35:05', '2022-11-15 11:35:05'),
(326, 'A booking has been placed 100438', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-11-15 11:42:19', '2022-11-15 11:42:19'),
(327, 'A booking has been placed 100439', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-11-15 11:46:28', '2022-11-15 11:46:28'),
(328, 'A booking has been placed 100440', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 11, 0, '2022-11-15 11:50:03', '2022-11-15 11:50:03'),
(329, 'A booking has been placed 100441', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 9, 0, '2023-01-10 10:31:34', '2023-01-10 10:31:34'),
(330, 'A booking has been placed 100442', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 23, 0, '2023-01-12 10:24:17', '2023-01-12 10:24:17'),
(331, 'A booking has been placed 100443', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 23, 0, '2023-01-12 10:27:36', '2023-01-12 10:27:36'),
(332, 'A booking has been placed 100444', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 23, 0, '2023-01-12 10:33:37', '2023-01-12 10:33:37'),
(333, 'A booking has been placed 100445', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 23, 0, '2023-01-12 10:51:25', '2023-01-12 10:51:25'),
(334, 'A booking has been placed 100446', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 23, 0, '2023-01-12 11:08:03', '2023-01-12 11:08:03'),
(335, 'A booking has been placed 100447', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 23, 0, '2023-01-12 11:08:44', '2023-01-12 11:08:44'),
(336, 'A booking has been placed 100448', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 23, 0, '2023-01-12 11:12:20', '2023-01-12 11:12:20'),
(337, 'A booking has been placed 100449', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 20, 0, '2023-01-12 11:26:41', '2023-01-12 11:26:41'),
(338, 'A booking has been placed 100450', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 20, 0, '2023-01-12 11:43:19', '2023-01-12 11:43:19'),
(339, 'A booking has been placed 100451', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 20, 0, '2023-01-12 12:04:14', '2023-01-12 12:04:14'),
(340, 'A booking has been placed 100452', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 20, 0, '2023-01-12 13:48:43', '2023-01-12 13:48:43'),
(341, 'A booking has been placed 100453', 'This is to notify you that a booking has been placed on your service, please login into your account for confirmation', 20, 0, '2023-01-12 13:50:26', '2023-01-12 13:50:26');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_requests`
--

INSERT INTO `withdraw_requests` (`id`, `vendor_id`, `admin_id`, `transaction_note`, `amount`, `approved`, `created_at`, `updated_at`) VALUES
(4, 11, NULL, NULL, '1500.60', 1, '2022-10-15 19:33:44', '2022-11-05 11:51:44'),
(5, 11, NULL, NULL, '34.90', 1, '2022-10-17 12:31:40', '2022-11-05 11:22:10');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` polygon NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_wise_topic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_wise_topic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryman_wise_topic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `name`, `coordinates`, `status`, `created_at`, `updated_at`, `restaurant_wise_topic`, `customer_wise_topic`, `deliveryman_wise_topic`) VALUES
(1, 'test', 0x0000000001030000000100000002000000148e440f2a980a406c4ca82985eb1a40148e440f2a980a406c4ca82985eb1a40, 0, '2022-07-08 15:27:34', '2022-10-14 13:39:08', 'zone_1_restaurant', 'zone_1_customer', 'zone_1_delivery_man'),
(2, 'Akwa Ibom', 0x0000000001030000000100000009000000571c5da553e61e4058f6cf956f121640571c5da513271e4009e24e01d3f41440571c5da573211e40e295a5e3c14c1440571c5da5f3dd1d405050a81b80ed1340571c5da5734e1e40a1aa0d838cde11402b8eaed219a0204095ec13350e2d12402b8eaed259ab20405a824b9c39b912402b8eaed249162040476ed8f76ade1440571c5da553e61e4058f6cf956f121640, 0, '2022-07-08 15:32:11', '2022-10-14 13:39:18', 'zone_2_restaurant', 'zone_2_customer', 'zone_2_delivery_man'),
(3, 'I', 0x000000000103000000010000000800000071b9e070d9d45240b858d9651724404071b9e070d9c65140e5d8d776b18f3b4071b9e070595651402688f478c2173b4071b9e07019a55140cbf3df51cd66384071b9e07059fc50405b19bfdc77c2374071b9e070d999514093a225478a2c344071b9e07019ff5140850c550a2929354071b9e070d9d45240b858d96517244040, 0, '2022-08-15 17:04:11', '2022-10-14 13:39:26', 'zone_3_restaurant', 'zone_3_customer', 'zone_3_delivery_man'),
(4, 'India', 0x000000000103000000010000002d00000071b9e070891553403043c0086ca6404071b9e070e9965340f60a36a76864404071b9e070a9b853407034225ffd843f4071b9e070c92e5440eb88fb1226503e4071b9e07069075440d96de87f68dc3c4071b9e070e9a454402a9df35d548b3b4071b9e07089315540126bc1f36a3b3b4071b9e070c969554095b51c5708af3a4071b9e070a92e564017f49b26cc863a4071b9e070a901564050dfa4c04ee5394071b9e07029455640b52ff931f342394071b9e070490756407bbd9167bd9f384071b9e070a95b564097647ba645a2354071b9e07069c9554097647ba645a2354071b9e070e9b255407488bc3589d0344071b9e07049ad5540ab0423f380e8334071b9e070e9585540e1f491bf2bbe334071b9e070c90f554076cb314cf469324071b9e070698e5440b27bdd1cde91304071b9e07069075440c5500b5a16c62e4071b9e070c901544089068cdeeaaf2a4071b9e070e91d54404edc86043c25294071b9e070e9f0534068e4eb135d99274071b9e07089f65340aed18790557e244071b9e070c94d53408f9bf425439d1f4071b9e070e9e252408e4488a45f0c264071b9e07049565240dd89f1427e732f4071b9e0704929524010e2bd6d22ff324071b9e07029e05140903d5cd26391344071b9e070c98b5140e41fcfd08fe5344071b9e070292c51407c10f9093649364071b9e070497551402fe947469d87364071b9e070690a5140a90e9b77d356374071b9e070093d51407bbd9167bd9f384071b9e07029865140077603efd14d384071b9e07069be51407bbd9167bd9f384071b9e070898051401ad59304f8213a4071b9e0708953514061d9690448eb3a4071b9e07009975140f7f762f44c3e3c4071b9e07069be5140f63547d103db3b4071b9e07089075240549216de782a3c4071b9e070495652403de6080456db3d4071b9e070699f524056d06895a1113f4071b9e07009a55240980349f5b2e43f4071b9e070891553403043c0086ca64040, 1, '2022-08-15 17:07:12', '2023-01-12 12:37:15', 'zone_4_restaurant', 'zone_4_customer', 'zone_4_delivery_man'),
(5, 'indore', 0x0000000001030000000100000003000000f489b628a9f652406b3b6156efc236406512582274fb5240bde4a765e2c23640f489b628a9f652406b3b6156efc23640, 0, '2022-08-24 21:49:52', '2022-10-14 13:39:35', 'zone_5_restaurant', 'zone_5_customer', 'zone_5_delivery_man'),
(6, 'khajrana', 0x0000000001030000000100000003000000f2ffffff38c0853ff0d77cfc9fdc893f1f9adcd50cfa52404ce7fa7ad5bc3640f2ffffff38c0853ff0d77cfc9fdc893f, 1, '2022-08-24 22:18:19', '2022-10-14 15:38:56', 'zone_6_restaurant', 'zone_6_customer', 'zone_6_delivery_man'),
(8, 'mumbai', 0x000000000103000000010000000200000040171c2eb1f2874054081881cdd4744040171c2eb1f2874054081881cdd47440, 1, '2022-09-01 23:16:59', '2022-10-14 16:31:59', 'zone_8_restaurant', 'zone_8_customer', 'zone_8_delivery_man'),
(9, 'Kolkata', 0x0000000001030000000100000009000000631d9ac65fc85540cef532dff2ad3640401d9ac6d9e45540a697f44a5b1d3740631d9ac6af0e56403803b9a9f73e3740631d9ac63b465640c4fb8a530eaa3640401d9ac699335640be4d9487150a3640401d9ac6191d564042e239652c063640401d9ac6e9f2554019c74a79e7113640631d9ac68fc555403e242f52e2973640631d9ac65fc85540cef532dff2ad3640, 1, '2022-11-08 11:29:44', '2022-11-08 11:29:44', 'zone_8_restaurant', 'zone_8_customer', 'zone_8_delivery_man');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `add_ons`
--
ALTER TABLE `add_ons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_notifications`
--
ALTER TABLE `customer_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man_wallets`
--
ALTER TABLE `delivery_man_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_men_phone_unique` (`phone`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_m_reviews`
--
ALTER TABLE `d_m_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_roles`
--
ALTER TABLE `employee_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_configs`
--
ALTER TABLE `mail_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_delivery_histories`
--
ALTER TABLE `order_delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `phone_verifications`
--
ALTER TABLE `phone_verifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_verifications_phone_unique` (`phone`);

--
-- Indexes for table `provide_d_m_earnings`
--
ALTER TABLE `provide_d_m_earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `restaurants_phone_unique` (`phone`);

--
-- Indexes for table `restaurant_wallets`
--
ALTER TABLE `restaurant_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_zone`
--
ALTER TABLE `restaurant_zone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `track_deliverymen`
--
ALTER TABLE `track_deliverymen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_phone_unique` (`phone`),
  ADD UNIQUE KEY `vendors_email_unique` (`email`);

--
-- Indexes for table `vendor_employees`
--
ALTER TABLE `vendor_employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendor_employees_email_unique` (`email`);

--
-- Indexes for table `vendor_notifications`
--
ALTER TABLE `vendor_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zones_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `add_ons`
--
ALTER TABLE `add_ons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customer_notifications`
--
ALTER TABLE `customer_notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_man_wallets`
--
ALTER TABLE `delivery_man_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `d_m_reviews`
--
ALTER TABLE `d_m_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_verifications`
--
ALTER TABLE `email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_roles`
--
ALTER TABLE `employee_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mail_configs`
--
ALTER TABLE `mail_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100454;

--
-- AUTO_INCREMENT for table `order_delivery_histories`
--
ALTER TABLE `order_delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=470;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `phone_verifications`
--
ALTER TABLE `phone_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `provide_d_m_earnings`
--
ALTER TABLE `provide_d_m_earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `restaurant_wallets`
--
ALTER TABLE `restaurant_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `restaurant_zone`
--
ALTER TABLE `restaurant_zone`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `track_deliverymen`
--
ALTER TABLE `track_deliverymen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=363;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `vendor_employees`
--
ALTER TABLE `vendor_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_notifications`
--
ALTER TABLE `vendor_notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=342;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
