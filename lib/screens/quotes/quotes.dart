import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gofit/screens/main/styles.dart';

class Quotes extends StatefulWidget {
  final Function(int) onChange;
  final int currentSlide;
  const Quotes({super.key, required this.currentSlide, required this.onChange});

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  List<dynamic> quotes = [];
  Future<void> getdata() async {
    //Get data fro API
    try {
      Response response = await Dio()
          .get("https://gofit-7036c-default-rtdb.firebaseio.com/quotes.json");
      setState(() {
        quotes = response.data; // Update the quotes list
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 160,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/quote.png"),
                  fit: BoxFit.fill)),
          child: quotes.isEmpty // Show loading text if quotes are still empty
              ? const Center(
                  child: Text(
                  "Loading...",
                  style: TextStyle(color: white),
                ))
              : PageView.builder(
                  itemCount: quotes.length,
                  itemBuilder: (context, index) => Center(
                      child: Text(
                    '"${quotes[index]['text']}"',
                    style: const TextStyle(color: white, fontSize: 14),
                  )),
                  scrollDirection: Axis.horizontal,
                  allowImplicitScrolling: true,
                  onPageChanged: (index) {
                    widget.onChange(index);
                  },
                  physics: const ClampingScrollPhysics(),
                ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 10, left: 120),
        child: Text(
          "Daily quotes",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
        // SizedBox(
        //   width: 120,
        //   child: TextButton(
        //       style: const ButtonStyle(enableFeedback: false),
        //       onPressed: () {
        //         if (widget.currentSlide == 0) {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => const Articles()));
        //         } else if (widget.currentSlide == 1) {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => const Articles1()));
        //         } else if (widget.currentSlide == 2) {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => const Articles()));
        //         }
        //       },
        //       child: const Row(
        //         children: [
        //           Text(
        //             "See more",
        //             style: TextStyle(color: white),
        //           ),
        //           Icon(
        //             Icons.navigate_next,
        //             color: red,
        //           )
        //         ],
        //       )),
        // )
      ),
      Positioned.fill(
          bottom: 20,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: widget.currentSlide == index ? 12 : 8,
                  height: widget.currentSlide == index ? 12 : 8,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: widget.currentSlide == index
                        ? white
                        : const Color.fromARGB(117, 255, 255, 255),
                    border: Border.all(
                        color: const Color.fromARGB(117, 255, 255, 255)),
                  ),
                ),
              ),
            ),
          ))
    ]);
  }
}
