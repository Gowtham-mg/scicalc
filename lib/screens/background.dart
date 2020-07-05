import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final keyboardType = StateProvider((ref)=>false);
class BackGround extends StatelessWidget {
  final Widget _child;
  BackGround(this._child);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SciCalc'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.autorenew),
            onPressed: (){
              keyboardType.read(context).state = !keyboardType.read(context).state;
              print(keyboardType.read(context).state);
              // evaluate(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.save),
            // onPressed: ,
          )
        ],
      ),
      body: Container(
        child: _child
      ),
    );
  }
}