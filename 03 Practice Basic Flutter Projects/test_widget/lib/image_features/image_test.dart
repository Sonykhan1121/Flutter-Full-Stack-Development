import 'package:flutter/material.dart';

class ImageTest extends StatefulWidget {
  const ImageTest({super.key});

  @override
  State<ImageTest> createState() => _ImageTestState();
}

class _ImageTestState extends State<ImageTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Test'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 500,
                width: double.infinity,
                color: Colors.purple,

                child: Image.asset(
                  'assets/images/splash_image.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 500,
                width: double.infinity,
                color: Colors.red,
                child: Image.asset(
                  'assets/images/splash_image.jpg',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 500,
                width: double.infinity,
                color: Colors.grey,
                child: Image.asset(
                  'assets/images/splash_image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                height: 500,
                color: Colors.orange,
                child: Image.asset(
                  'assets/images/splash_image.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                height: 500,
                color: Colors.pink,
                child: Image.asset(
                  'assets/images/splash_image.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                height: 500,
                color: Colors.blueAccent,
                child: Image.asset(
                  'assets/images/splash_image.jpg',
                  fit: BoxFit.scaleDown,
                  color: Colors.red,
                  colorBlendMode: BlendMode.multiply,
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 500,
                width: double.infinity,
                color:Colors.teal,
                child: Image.asset(
                  "assets/images/t.png",
                  alignment: Alignment.topLeft,
                ),
              ),
              SizedBox(height: 30,),
              Container(


                height: 300,
                width: double.infinity,
                child: Image.asset("assets/images/t.png",
                  repeat: ImageRepeat.repeat,
                ),
              ),

              Image.network(
                'https://www.shutterstock.com/image-photo/blond-hair-girl-taking-photo-260nw-2492842415.jpg',
                cacheHeight: 50,
                cacheWidth: 50,

              ),
            ],
          ),
        ),
      ),
    );
  }
}
