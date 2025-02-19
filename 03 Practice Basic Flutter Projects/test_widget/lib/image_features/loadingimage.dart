import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Loadingimage extends StatefulWidget {
  const Loadingimage({super.key});

  @override
  State<Loadingimage> createState() => _LoadingimageState();
}

class _LoadingimageState extends State<Loadingimage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading Image"),
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: "https://wallpapers.com/images/featured/4k-nature-ztbad1qj8vdjqe0p.jpg",
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),

        ) ,
      ),
    );
  }
}
