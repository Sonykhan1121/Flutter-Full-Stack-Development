import 'package:flutter/material.dart';
import 'package:test_widget/TransformationController/image_zoom_and_scapping.dart';
import 'package:test_widget/azlistview_packages/azlist_test.dart';
import 'package:test_widget/column_features/column_test.dart';
import 'package:test_widget/handling_camera_features/camera_permission_demo.dart';

import '../../../azlistview_packages/normal_azlist.dart';
import '../../../flutter_toast/toast_test.dart';
import '../../../line_chart_features/bitcoin_price_graph.dart';
import '../../../logging_features/logging_test.dart';
import '../../../url_features/url_launcher_test.dart';
import '../pages/error_test.dart';
import '../pages/home_test.dart';
import '../pages/login_test.dart';
import '../pages/profile_test.dart';
import '../pages/signup_test.dart';

class AppRouterVersion1{

  static Route<dynamic> route (RouteSettings settings)
  {
    final args = settings.arguments;
    if(settings.name=='/')
      {


            // return MaterialPageRoute(builder: (context)=>LoginTest());


          return MaterialPageRoute(builder: (context)=>HomeTest());

      }
    else if(settings.name =='/signuptest')
      {
        return MaterialPageRoute(builder: (context)=>SignupTest());
      }
    else if(settings.name=='/logintest')
      {
        return MaterialPageRoute(builder: (context)=>LoginTest());
      }
    else if(settings.name=='/profiletest')
      {
        if(args is String)
          {
            return MaterialPageRoute(builder: (context)=>ProfileTest(userId: args));
          }
        else
          {
            return MaterialPageRoute(builder: (context)=>ErrorTest(message: "data is not a String"));
          }
      }
    else if(settings.name=='/image_zooming')
      {
        return MaterialPageRoute(builder: (context)=>ImageZoomAndScapping());
      }
    else if(settings.name == '/bitcoinpricegpaph')
      {
        return MaterialPageRoute(builder: (context)=>BitcoinPriceGraph());
      }
    else if(settings.name == '/columnTest')
      {
        return MaterialPageRoute(builder: (context)=> ColumnTest());
      }
    else if(settings.name == '/logtest')
      {
        return MaterialPageRoute(builder: (context)=> LoggingTest());
      }
    else if(settings.name =='/azlist')
      {
        return MaterialPageRoute(builder: (context)=>ToastTest());
      }
    else if(settings.name == '/camera_handler')
      {
        return MaterialPageRoute(builder: (context)=> UrlLauncherTest());
      }
    else
      {
        return MaterialPageRoute(builder: (context)=>ErrorTest(message: "Route Not Found",));
      }
  }
}