<?php
    //Please check my credentials to view this page :).
?>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" ng-app="healthtrak" ng-controller="healthtrakController"> <!--<![endif]-->
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
                   

                    <a class="brand" href="#">&nbsp;HealthTrak</a>
                    
                    <ul class="nav">
                        <li class=" active-{{currentPage=='home'}}"><a href="#" ><i class="icon-home"></i> </a></li>
                        <li class="active-{{currentPage=='patient_records'}}"><a href="#" ></i> Patient Records</a></li>
                        <li class="active-{{currentPage=='physician_sceduler'}}"><a href="#" ></i> Physician Scheduler</a></li>
                        <li class="active-{{currentPage=='pharmacy'}}" class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="#"><span></b></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#" >Pharmacy</a></li>
                                <li><a href="#" >Lab</a></li>
                            </ul>
                        </li>
                        <li class="active-{{currentPage=='billing'}}"><a href="#" ></i> Billing</a></li>
                        <li class="active-{{currentPage=='equipment'}}"><a href="#"  ></i> Equipment</a></li>
                    </ul>
                    <ul class="nav pull-right">
                        <li class="active-{{currentPage=='account'}}" class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="#"><i class="icon-user">&nbsp;</i> Aaron Smith <b class="caret"></b></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">My Account</a></li>
                                <li><a href="#">Log Out</a></li>
                            </ul>
                        </li>
                        <li class="active-{{currentPage=='admin'}}" class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="#">Administration <b class="caret"></b></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#" >Show only menu text</a></li>
                                <li><a href="#">Manage Users</a></li>
                                <li><a href="#">Manage Permissions</a></li>
                            </ul>
                        </li>
                    </ul>
              </div>
            </div>
        </div>