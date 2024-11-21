import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PaymentAnimationScreen extends StatefulWidget {
  @override
  _PaymentAnimationScreenState createState() => _PaymentAnimationScreenState();
}

class _PaymentAnimationScreenState extends State<PaymentAnimationScreen> {
  bool isProcessing = false;
  bool isSuccess = false;

  void processPayment() {
    setState(() {
      isProcessing = true;
    });

    // Simulate payment delay
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isProcessing = false;
        isSuccess = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Animation"),
      ),
      body: Center(
        child: isProcessing
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              color: Colors.blue,
              size: 50.0,
            ),
            SizedBox(height: 20),
            Text(
              "Processing Payment...",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        )
            : isSuccess
            ? Lottie.asset(
          'assets/Lottie/Animation - 1732084330120.json', // Replace with your Lottie animation
          width: 200,
          height: 200,
        )
            : ElevatedButton(
          onPressed: processPayment,
          child: Text("Make Payment"),
        ),
      ),
    );
  }
}

