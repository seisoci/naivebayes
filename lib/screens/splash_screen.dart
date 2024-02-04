import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naivebayes/routes/app_route_constants.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=> GoRouter.of(context)
                .pushNamed(RouteConstants.dashboardRouteName)
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}
class OtherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Splash Screen in Flutter")),
      body: Center(
        // your UI here
      ),
    );
  }
}