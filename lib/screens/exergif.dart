import 'package:flutter/material.dart';
import 'package:gofit/screens/main/styles.dart';

// ignore: must_be_immutable
class Exergif extends StatefulWidget {
  final dynamic gifData;
  const Exergif({super.key, required this.gifData});

  @override
  State<Exergif> createState() => _ExergifState();
}

class _ExergifState extends State<Exergif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(widget.gifData["title2"] ?? '',
        //     style: const TextStyle(
        //         fontWeight: FontWeight.bold,
        //         color: blue,
        //         fontSize: 27)),
        // centerTitle: true,
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(widget.gifData["gif"]),
                        fit: BoxFit.contain),
                    // border: Border.all(width: 2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sets: ${widget.gifData["sets"]}",
                    style: const TextStyle(
                        color: blue, fontWeight: FontWeight.w600)),
                Text("Reps: ${widget.gifData["reps"]}",
                    style: const TextStyle(
                        color: blue, fontWeight: FontWeight.w600)),
                Text("Rest: ${widget.gifData["rest"]}",
                    style: const TextStyle(
                        color: blue, fontWeight: FontWeight.w600)),
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
                          color: Colors.white, fontWeight: FontWeight.bold))),
            ),
          )
        ],
      ),
    );
  }
}
