import 'package:flutter/material.dart';

class MoveControlHub extends StatelessWidget {
  const MoveControlHub({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final Size size = MediaQuery.of(context).size;  
    return Container(
      padding: EdgeInsets.fromLTRB(0,  size.height/4, 0, 0),
      alignment: Alignment.center,
      child: Column(
        
        children: [
          Container(  // 前进
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            height: 60,
            width: 140,
            child: ElevatedButton.icon(onPressed: (){},icon: const Icon(Icons.arrow_upward),label: const Text("Forward")),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox( // 左转
                height: 60,
                width: 140,
                child: ElevatedButton.icon(onPressed: (){},icon: const Icon(Icons.arrow_back),label: const Text("TurnLeft")),
              ),
              SizedBox( // 右转
                height: 60,
                width: 140,
                child: ElevatedButton.icon(onPressed: (){},icon: const Icon(Icons.arrow_forward),label: const Text("TurnRight")),
              ),
           ],
          ),
          
          Container( // 后退
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            height: 60,
            width: 140,
            child: ElevatedButton.icon(onPressed: (){},icon: const Icon(Icons.arrow_downward),label: const Text("Backward")),
          ),
      ],
      ),


    );
  }
}
