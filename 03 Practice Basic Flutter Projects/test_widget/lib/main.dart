import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_widget/TextExpandFeatures/provider/text_expanded_provider.dart';
import 'package:test_widget/api_features/providers/comments_provider.dart';
import 'package:test_widget/api_features/providers/posts_provider.dart';
import 'package:test_widget/deviceIdentify/findDevice.dart';
import 'package:test_widget/homepage.dart';
import 'package:test_widget/routes_features/onGenerateroute/routes/app_router_version1.dart';
import 'package:test_widget/slidable_features/list_slide.dart';
import 'package:test_widget/slidable_features/list_slide_provider.dart';
import 'package:test_widget/websocket_features/web_socket_screen.dart';

import 'bluetooth_search_features/bluetooth_home_page.dart';
import 'gesturedetector_features/gesture.dart';
import 'gesturedetector_features/scale.dart';
import 'location_features/find_location.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> TextExpandedProvider()),
        ChangeNotifierProvider(create: (_)=> PostsProvider()),
        ChangeNotifierProvider(create: (_)=>CommentsProvider()),
        ChangeNotifierProvider(create: (_)=> ListSlideProvider()),
        
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,

        builder: (context,child){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Testing All",
            theme: ThemeData(
              primaryColor: Colors.blue,
            ),
            // onGenerateRoute: AppRouterVersion1.route,

            // initialRoute: "/camera_handler",
            home: WebSocketScreen(),
          );
        },
      ),

    );
  }
}
