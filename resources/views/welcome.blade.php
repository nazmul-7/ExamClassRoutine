<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
	<head>
		<!-- META DATA -->
		<meta charset="UTF-8">
		<meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=0'>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="description" content="Buy , Sale , Barter">
		{{--<meta name="author" content="Spruko Technologies Private Limited">
		<meta name="keywords" content="directory listing html template, bootstrap html template, directory html template, directory website template, directory listing html template, directory listing template, listing website template, business directory template, membership directory template, directory template, service directory template, bootstrap business directory template, directory listing website template, business directory html template, online directory template, online directory website templates, best website templates, html template, html5 template, themeforest html, themeforest html templates"> --}}
		
		<link rel="icon" href="favicon.ico" type="image/x-icon"/>
		<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />

		<!-- Title -->
		<title>Kerpink</title>
		<link rel="stylesheet" href="/assets/fonts/fonts/font-awesome.min.css">

		<!-- Font Family-->
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">


		<!-- Bootstrap Css -->
		<link href="/assets/plugins/bootstrap-4.3.1-dist/css/bootstrap.min.css" rel="stylesheet" />

		<!-- Dashboard Css -->
		<link href="/assets/css/dashboard.css" rel="stylesheet" />
		<link href="/assets/css/admin-custom.css" rel="stylesheet" />

		<!-- Sidemenu Css -->
		<link href="/assets/plugins/toggle-sidebar/sidemenu.css" rel="stylesheet" />

		<!-- Custom scroll bar css-->
		<link href="/assets/plugins/scroll-bar/jquery.mCustomScrollbar.css" rel="stylesheet" />

		<!---Font icons-->
		<link href="/assets/css/icons.css" rel="stylesheet"/>
		<link href="/assets/plugins/iconfonts/icons.css" rel="stylesheet" />
        <script>
           
           (function () {
               window.Laravel = {
                   csrfToken: '{{ csrf_token() }}'
               };
           })();
         
       </script>

	</head>
    <body>
         <div id="app">
             @if(Auth::check())
                <mainapp :user="{{Auth::user()}}"></mainapp>
            @else 
                <mainapp :user="false"></mainapp>
            @endif
         </div>

        

		 <script src="{{mix('/js/app.js')}}"></script>
		 <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&key=AIzaSyCD3ExNbq5rW8gR-WV-Q0B1vMKEIc5zvsk"></script>s
        <!-- Dashboard Core -->
		<script src="/assets/js/vendors/jquery-3.2.1.min.js"></script>
		<script src="/assets/plugins/bootstrap-4.3.1-dist/js/popper.min.js"></script>
		<script src="/assets/plugins/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<script src="/assets/js/vendors/jquery.sparkline.min.js"></script>
		<script src="/assets/js/vendors/selectize.min.js"></script>
		<script src="/assets/js/vendors/jquery.tablesorter.min.js"></script>
		<script src="/assets/js/vendors/circle-progress.min.js"></script>
		<script src="/assets/plugins/rating/jquery.rating-stars.js"></script>

		<!--Counters -->
		<script src="/assets/plugins/counters/counterup.min.js"></script>
		<script src="/assets/plugins/counters/waypoints.min.js"></script>

		<!-- Fullside-menu Js-->
		<script src="/assets/plugins/toggle-sidebar/sidemenu.js"></script>

		<!-- CHARTJS CHART -->
		<script src="/assets/plugins/chart/Chart.bundle.js"></script>
		<script src="/assets/plugins/chart/utils.js"></script>

		<!-- Custom scroll bar Js-->
		<script src="/assets/plugins/scroll-bar/jquery.mCustomScrollbar.concat.min.js"></script>

		<!-- ECharts Plugin -->
		<script src="/assets/plugins/echarts/echarts.js"></script>
		<script src="/assets/plugins/echarts/echarts.js"></script>
		<script src="/assets/js/index1.js"></script>

		<!-- Custom Js-->
		<script src="/assets/js/admin-custom.js"></script>
    </body>
</html>
