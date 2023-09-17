import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home:Scaffold(
        appBar: AppBar(title: const Text("NanoClient")),
        body : const Column(   // 竖着排列的布局
          children: [
             MyApp() , 
             MyButton(),
          ],
        ),
      )
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        alignment: Alignment.center, // 配置Container 容器内元素的方位
        width : 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.red , // 背景颜色 Color.fromARGB(a, r, g, b)
          border: Border.all(color: Colors.black), // 配置边框
          borderRadius: BorderRadius.circular(10), // 配置圆角
          boxShadow: const [  // 配置阴影
            BoxShadow(
              color: Colors.purple,
              blurRadius: 10,
            ),
          ],
          gradient: const LinearGradient(   // 渐变
            colors: [Colors.green,Colors.yellow],
          ),
        ),
        child: const Text("hello,nanoclient",style: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),),
      )
    );
  }
}


class MyButton extends StatelessWidget {
const MyButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      width: 200,
      height: 40,
      margin: const EdgeInsets.fromLTRB(0,80,0,0), // 外间距
      transform: Matrix4.skewY(0.1),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blue,
      ),
      child: const Text(
        "Button",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
      ),
    );
  }
}