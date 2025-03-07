import 'package:flutter/material.dart';
import 'package:test_widget/routes_features/gorouter/pages/error_test.dart';
import 'package:test_widget/routes_features/gorouter/pages/home_test.dart';
import 'package:test_widget/routes_features/gorouter/pages/login_test.dart';
import 'package:test_widget/routes_features/gorouter/pages/profile_test.dart';

import '../pages/signup_test.dart';

class AppRouterVersion1{
   static bool isauth = false;
  static Route<dynamic> route (RouteSettings settings)
  {
    final args = settings.arguments;
    if(settings.name=='/')
      {
        if(!isauth)
          {

            return MaterialPageRoute(builder: (context)=>LoginTest());
          }
        else {
          return MaterialPageRoute(builder: (context)=>HomeTest());
        }
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
            return MaterialPageRoute(builder: (context)=>ProfileTest(userId: args as String));
          }
        else
          {
            return MaterialPageRoute(builder: (context)=>ErrorTest(message: "data is not a String"));
          }


      }
    else
      {
        return MaterialPageRoute(builder: (context)=>ErrorTest(message: "Route Not Found",));
      }
  }
}