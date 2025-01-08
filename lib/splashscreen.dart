import 'package:blood_donation/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key, required void Function() onGetStarted});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BloodDonationPage(),
        ),
      );
    });

    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 193, 6, 6), // Teal background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  "assets/blooddonation2.png", // Replace with your image asset.
                  height: 150, // Adjust the size as needed.
                  width:
                      150, // Ensure width matches height for a perfect circle.
                  fit: BoxFit
                      .cover, // Ensures the image fills the circular shape.
                ),
              ),
              Text(
                "SAVE LIFE",
                style: GoogleFonts.poppins(
                  fontSize: 30, // Slightly larger font size for more prominence
                  fontWeight: FontWeight
                      .w700, // Extra-bold weight for a more striking look
                  color: const Color.fromARGB(255, 253, 252, 250),
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 4.0,
                      color: Colors.black
                          .withOpacity(0.5), // Adds a subtle shadow for depth
                    ),
                  ],
                  letterSpacing: 1.5, // Spaced out letters for elegance
                ),
                textAlign: TextAlign.center, // Centers the text horizontally
              ),
            ],
          ),
        ),
      ),
    );
  }
}
