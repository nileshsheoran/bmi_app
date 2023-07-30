import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  TextEditingController feetController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  double bmi = 0;
  double weight = 0;
  double feet = 0;
  double inch = 0;
  String Bmi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI  Calculator'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: feetController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Enter your feet',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: inchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Enter your inch',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: weightController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Enter your weight',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  int feet = int.parse(feetController.text);
                  int inch = int.parse(inchController.text);
                  int weight = int.parse(weightController.text);
                  int totalInch = (feet * 12) + inch;
                  double cm = totalInch * 2.54;
                  double meter = cm / 100;
                   bmi = weight / (meter * meter);

                  if (bmi < 18.5) {
                    Bmi = ("underWeight");
                  } else if (bmi >= 18.5 && bmi <= 25) {
                    Bmi = ("normalWeight");
                  } else {
                    Bmi = ("overWeight");
                  }
                  setState(() {});
                },
                child: const Text(
                  'Calculate',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'bmi=$bmi',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'BMI=$Bmi',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
