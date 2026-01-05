import 'package:brewly/Screens/fragment/home_fragment.dart';
import 'package:brewly/Screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class coffee_order extends StatefulWidget {
  const coffee_order({super.key});

  @override
  State<coffee_order> createState() => _coffee_orderState();
}

class _coffee_orderState extends State<coffee_order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const HomeScreen()),
                  (route) => false,
            ),
        ),
        title: Text(
          'Order',
            style: GoogleFonts.sora
              (
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
        ),
        centerTitle: true,
      ),
    );
  }
}
