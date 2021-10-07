import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:product_app/UI%20Screen/home.dart';
import 'package:product_app/UI%20Screen/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner:false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {

  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/splash.png"),
          fit: BoxFit.cover),
          
      ),
         child: Container(
           child: Center(
             
             child: ElevatedButton(onPressed: (){
             Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Home(),
              ));
             }, 
             style: ElevatedButton.styleFrom(
               primary:Colors.white
             ),
             child: Text("Select User", style: TextStyle(
               color: Colors.grey
             ),)),
           ),
           
         ),
         
         
    ),

  );    
      
  }
}
