import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:product_app/Models/Products.dart';
import 'package:product_app/UI%20Screen/products_items.dart';
import 'package:product_app/UI%20Screen/profile.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {  
  @override
  void initState() {  
    super.initState();
    
     
  }
 
  @override
Widget build(BuildContext context) {
    return Container(
      child: new SplashScreen(
        seconds: 14,
        navigateAfterSeconds: new AfterSplash(),
        image: new Image.asset("images/logo_1.png"),
        imageBackground: AssetImage("images/splash.png"),
        loaderColor: Colors.red,
        photoSize: 200.0,
      ),
      
    );
  }
}
class AfterSplash extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {  
      
    return new Scaffold(
      appBar: new AppBar(
        title: Image(image: AssetImage("images/profile.png")),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.blue[100],
        actions: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {},
                color: Colors.white,
                textColor: Colors.white,
                shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(21)),
                 ), 
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.shopping_cart, color: Colors.black),
                    ],
                  ),
                 
    ),
            ],
          ),
        ),   
     Padding(
       padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.end,
         children: [
           RaisedButton(
                onPressed: () {},
                color: Colors.grey,
                textColor: Colors.white,
                shape:RoundedRectangleBorder(
                 borderRadius: BorderRadius.horizontal(right: Radius.circular(21)),
        ), 
                child: Row(
                  children: <Widget>[
                    Text("Empty"),
                  ],
                ), 
    ),
         ],
       ),
     ), 
  ],  
      ), 
      body: HomePage(),  
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          ProductsItem(),
          Profile(),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('Home'),
            activeColor: Colors.blue,
          ),
          BottomBarItem(
            icon: Icon(Icons.person),
            title: Text('Account'),
            activeColor: Colors.greenAccent.shade700,
             darkActiveColor: Colors.greenAccent.shade400,
          ),
        ],
      ),
    );
  }
}

  