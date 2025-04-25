import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {

  dynamic _timer;

  @override
  void initState(){
    super.initState();

    _timer = Timer(const Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, '/home');
    });
  
  }

  @override
  void dispose(){
    super.dispose();
    _timer.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text('Furaha Centre',
        style: GoogleFonts.viaodaLibre(
          color: Colors.black,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
        ),
        const SizedBox(height: 5.0,),
        const SpinKitPulse(
          color: Colors.black,
          size:60.0
        ),
        ], 
      ),
      
    );
  }
}