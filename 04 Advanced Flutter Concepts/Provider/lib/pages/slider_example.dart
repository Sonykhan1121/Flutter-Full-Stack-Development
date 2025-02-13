import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/slider_provider.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SliderProvider>(context,listen: false);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Example'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(builder: (context,value,child){
            return Slider(value: value.value, onChanged: (val){
              provider.setValue(val);
            });
          }),



          SizedBox(height: 50,),

          Consumer<SliderProvider>(builder: (context,value,child){

            return Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(50.0),
                    child: Center(
                      child: Text('First',),
                    ),
                    color: Colors.green.withOpacity(value.value),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(50.0),

                    child: Center(
                      child: Text('Second'),
                    ),
                    color: Colors.yellow.withOpacity(value.value),
                  ),
                ),
              ],
            );

          }),

        ],

      )
    );
  }
}
