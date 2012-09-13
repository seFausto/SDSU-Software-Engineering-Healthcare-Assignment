<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Health Track</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <link rel="stylesheet" href="css/normalize.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/main.css">

        <script src="js/vendor/modernizr-2.6.1.min.js"></script>
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an outdated browser. <a href="http://browsehappy.com/">Upgrade your browser today</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to better experience this site.</p>
        <![endif]-->
        <div class="container">
            <div class="navbar navbar-fixed-top">
              <div class="navbar-inner">
                <a class="brand" href="#">&nbsp;Health Track</a>
                <ul class="nav">
                    <li class="active"><a href="#" data-bind="html: navigation.dashboard()"><i class="icon-home"></i> Dashboard</a></li>
                    <li><a href="#" data-bind="html: navigation.patient_records()"><i class="icon-file"></i> Patient Records</a></li>
                    <li><a href="#" data-bind="html: navigation.physician_scheduler()"><i class="icon-time"></i> Physician Scheduler</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="#" ><span data-bind="html: navigation.order_tracking()"><i class="icon-barcode"></i> Order Tracking </span> <b class="caret"></b></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">Pharmacy</a></li>
                            <li><a href="#">Lab</a></li>
                        </ul>
                    </li>
                    <li><a href="#" data-bind="html: navigation.insurance_billing()"><i class="icon-list-alt"></i> Insurance Billing</a></li>
                    <li><a href="#"  data-bind="html: navigation.equipment_and_inventory()"><i class="icon-tags"></i> Equipment and Inventory</a></li>
                </ul>
                <ul class="nav pull-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="#"><i class="icon-user">&nbsp;</i> Aaron Smith <b class="caret"></b></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Log Out</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="#">Administration <b class="caret"></b></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#" data-bind="click: toggleShowIcons, text: (!showIcons() ? 'Show icons with menu text' : 'Show only menu text')">Show only menu text</a></li>
                            <li><a href="#">Manage Users</a></li>
                            <li><a href="#">Manage Permissions</a></li>
                        </ul>
                    </li>
                </ul>
              </div>
            </div>
        </div>
        

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.8.1.min.js"><\/script>')</script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/vendor/knockout-2.1.0.js"></script>
        <script src="js/view_models/indexViewModel.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>

        <script>
            var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
            (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
            g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
            s.parentNode.insertBefore(g,s)}(document,'script'));
        </script>
    </body>
</html>
