import 'package:flutter/material.dart';
import 'package:gofit/screens/main/styles.dart';

// ignore: must_be_immutable
class AllGif extends StatefulWidget {
  String reps;
  String gif;
  String sets;
  String rest;
  int index;
   AllGif({super.key, 
      required this.reps,
      required this.gif,
      required this.sets,
      required this.rest,
      required this.index});

  @override
  State<AllGif> createState() => _AllGifState();
}

class _AllGifState extends State<AllGif> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite exercise",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: blue, fontSize: 27)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                Container(
                  height: 500,
                  width: 350,
                  decoration: BoxDecoration(
                    color: white,
                    image: DecorationImage(
                        image: NetworkImage(widget.gif), fit: BoxFit.contain),
                    border: Border.all(width: 2, color: grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
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
    );
  }
}