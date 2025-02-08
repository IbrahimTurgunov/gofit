import 'package:flutter/material.dart';
import 'package:gofit/screens/main/styles.dart';

class Aboutapp extends StatelessWidget {
  const Aboutapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "About app",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: blue, 
            fontSize: 27,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0), // Adds padding around the text
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to GoFit, your personal fitness companion designed to help you achieve your health and wellness goals. Whether you're a beginner or a seasoned athlete, GoFit offers a variety of exercises, workout plans to guide you on your fitness journey.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Our app provides a wide range of workouts for all areas of the body, from abs and core exercises to full-body routines, targeting specific muscle groups to help you build strength, flexibility, and endurance. You can easily access step-by-step instructions, video tutorials, and tips to ensure you're performing each exercise correctly and effectively.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Key Features:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "• Personalized Workouts: Choose from a variety of fitness categories including abs, legs, arms with more than 170 exercises.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                "• Expert Guidance: Access exercise tutorials and tips designed by professional trainers.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "With GoFit, you'll have everything you need to get in the best shape of your life—right at your fingertips. Join our community of fitness enthusiasts, and start your fitness journey today!",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
