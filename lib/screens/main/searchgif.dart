import 'package:flutter/material.dart';
import 'package:gofit/screens/main/styles.dart';

// ignore: must_be_immutable
class Searchgif extends StatefulWidget {
  String reps;
  String gif;
  String sets;
  String rest;
  int index;
  Searchgif(
      {super.key,
      required this.reps,
      required this.gif,
      required this.sets,
      required this.rest,
      required this.index});

  @override
  State<Searchgif> createState() => _SearchgifState();
}

class _SearchgifState extends State<Searchgif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercise",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: blue, fontSize: 22)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(     
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Expanded(
                  child: Container(  
                    height: 500,
                    width: 350,
                    decoration: BoxDecoration(
                      boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      color: white,
                      image: DecorationImage(
                          image: NetworkImage(widget.gif), fit: BoxFit.contain),
                     
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 30, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sets: ${widget.sets}",
                        style: const TextStyle(color: blue)),
                    Text("Reps: ${widget.reps}",
                        style: const TextStyle(color: blue)),
                    Text("Rest: ${widget.rest}",
                        style: const TextStyle(color: blue)),
                    const Text(
                      "IMPORTANT: Do a slow negative phase for 2-3 seconds",
                      style: TextStyle(color: red, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        enableFeedback: false,
                        backgroundColor: WidgetStateProperty.all(blue),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Done",
                          style: TextStyle(
                              color: white, fontWeight: FontWeight.bold))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  }