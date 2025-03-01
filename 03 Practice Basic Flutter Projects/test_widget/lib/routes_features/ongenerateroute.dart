// import 'package:flutter/material.dart';
// import 'package:flutter30dayschallenge/pages/day10/animated_builder_example.dart';
// import 'package:flutter30dayschallenge/pages/day10/animated_widget_example.dart';
// import 'package:flutter30dayschallenge/pages/day10/simple_animation_example.dart';
// import 'package:flutter30dayschallenge/pages/day10/simple_basic_animation.dart';
// import 'package:flutter30dayschallenge/pages/day11/animated_drawer_home.dart';
// import 'package:flutter30dayschallenge/pages/grid_view_builder.dart';
// import 'package:flutter30dayschallenge/pages/grid_view_example.dart';
// import 'package:flutter30dayschallenge/pages/home_page.dart';
// import 'package:flutter30dayschallenge/pages/list_view_example.dart';
// import 'package:flutter30dayschallenge/pages/loginpage.dart';
// import 'package:flutter30dayschallenge/pages/page_view_builder.dart';
// import 'package:flutter30dayschallenge/pages/signup.dart';
// import 'package:flutter30dayschallenge/pages/youtube_search/model/item_data.dart';
// import 'package:flutter30dayschallenge/pages/youtube_search/model/play_video.dart';
// import 'package:flutter30dayschallenge/pages/youtube_search/youtube_search_page.dart';
//
// import 'day11/simple_drawer_home.dart';
// import 'day8.dart';
// import 'home_page.dart';
// import 'list_view_builder_example.dart';
// import 'loginpage.dart';
// import 'signup.dart';
//
// class OnGenerateRoute{
//   static Route<dynamic> route(RouteSettings settings)
//   {
//     final args = settings.arguments;
//     if(settings.name =='/')
//     {
//       return MaterialPageRoute(builder: (context)=>YoutubeSearchPage());
//
//     }
//     else if(settings.name =='/playVideo')
//     {
//       if(args is ItemData)
//       {
//
//         return MaterialPageRoute(builder: (context)=>PlayVideo(items: args,));
//       }
//       else
//       {
//         return MaterialPageRoute(builder:(_)=>
//             _errorPage(),
//         );
//       }
//     }
//     else if(settings.name =='/home')
//     {
//       if(args is UserData)
//       {
//         return MaterialPageRoute(builder: (context)=> HomePage(args,));
//       }
//       else
//       {
//         return MaterialPageRoute(builder:(_)=>_errorPage(),
//         );
//       }
//     }
//     else if (settings.name =='/login')
//     {
//       return MaterialPageRoute(builder: (context)=> Loginpage(),);
//     }
//     else if(settings.name =='/signup')
//     {
//       return MaterialPageRoute(builder: (context)=>Signup(),);
//
//     }
//     else
//     {
//       return MaterialPageRoute(builder: (context)=>_errorPage(),);
//     }
//
//   }
//   static Widget _errorPage()
//   {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Error'),
//         backgroundColor: Colors.red,
//       ),
//       body: Center(
//         child: Text('Something Wrong'),
//       ),
//     );
//   }
// }


//in main.dart
// initialRoute:"/",

// routes: {
//   "/": (context)=>HomePage(),
//   "/login":(context) => Loginpage(),
//   "/signup":(context) => Signup(),
// },