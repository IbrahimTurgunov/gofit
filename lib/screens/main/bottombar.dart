import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gofit/screens/main/searchgif.dart';
import 'package:gofit/screens/main/styles.dart';
import 'package:gofit/screens/mainscreen.dart';
import 'package:gofit/screens/food_workout_plan.dart';
import 'package:gofit/screens/providers/searchprovider.dart';
import 'package:gofit/screens/saved.dart';
import 'package:gofit/screens/settings/settings.dart';
import 'package:provider/provider.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {

  // Future<void> check() async {
  //   try {
  //     Response response = await Dio()
  //         .get("https://gofit-7036c-default-rtdb.firebaseio.com/control.json");
  //     var map = response.data as List?;

  //     if (map != null && map.isNotEmpty) {
  //       var versionData = map[0];
  //       var version = int.tryParse(versionData["version"]);
  //       var minversion = int.tryParse(versionData["minversion"]);

  //       if (version != null && minversion != null) {
  //         if (version < minversion) {
  //           showDialog(
  //             // ignore: use_build_context_synchronously
  //             context: context,
  //             builder: (BuildContext context) {
  //               return AlertDialog(
  //                 title: const Text("New app version is available"),
  //                 content: const Text("You can download now"),
  //                 actions: [
  //                   TextButton(
  //                     child: const Text("Download"),
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                     },
  //                   )
  //                 ],
  //               );
  //             },
  //           );
  //         }
  //       } else {
  //         null;
  //       }
  //     }
  //   } catch (e) {
  //    e;
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   check();
  // }

  final FocusNode _searchFocusNode = FocusNode();
  int currentIndex = 0;
  List screens = const [Mainscreen(), FoodList(), SaveData(), Settings()];
  String? userSelected;
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    return GestureDetector(
      onTap: () {
        _searchFocusNode.unfocus();
      },
      child: Scaffold(
          // drawer: Drawer(
          //   child: Container(
          //     color: blue,
          //     child: Padding(
          //       padding: const EdgeInsets.only(left: 10, top: 40, right: 10),
          //       child: Column(
          //         children: [
          //           const Text(
          //             "Settings",
          //             style: TextStyle(color: white, fontSize: 20),
          //           ),
          //           const SizedBox(
          //             height: 300,
          //           ),
          //           Row(
          //             children: [
          //               Switch(
          //                   inactiveTrackColor: grey,
          //                   inactiveThumbColor: white,
          //                   activeColor: white,
          //                   activeTrackColor: red,
          //                   value: themeProvider.isDarkModeChecked,
          //                   onChanged: (value) {
          //                     themeProvider.updateMode(darkMode: value);
          //                   }),
          //               const SizedBox(width: 20),
          //               Text(
          //                 themeProvider.isDarkModeChecked
          //                     ? "Dark Mode"
          //                     : "Light Mode",
          //                 style: const TextStyle(
          //                     color: white,
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 20),
          //               )
          //             ],
          //           ),
          //           const Padding(
          //             padding: EdgeInsets.only(left: 14, bottom: 10, top: 10),
          //             child: Row(
          //               children: [
          //                 Icon(
          //                   Icons.help,
          //                   color: white,
          //                   size: 30,
          //                 ),
          //                 SizedBox(width: 38),
          //                 Text("Help",
          //                     style: TextStyle(
          //                         color: white,
          //                         fontWeight: FontWeight.bold,
          //                         fontSize: 20)),
          //               ],
          //             ),
          //           ),
          //           const Padding(
          //             padding: EdgeInsets.only(left: 14, bottom: 10, top: 10),
          //             child: Row(
          //               children: [
          //                 Icon(
          //                   Icons.info,
          //                   color: white,
          //                   size: 30,
          //                 ),
          //                 SizedBox(width: 38),
          //                 Text("About App",
          //                     style: TextStyle(
          //                         color: white,
          //                         fontWeight: FontWeight.bold,
          //                         fontSize: 20)),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          appBar: currentIndex == 0
              ? AppBar(
                  // leading: Builder(builder: (context) {
                  //   return IconButton(
                  //       enableFeedback: false,
                  //       padding: const EdgeInsets.only(left: 22),
                  //       onPressed: () {
                  //         Scaffold.of(context).openDrawer();
                  //       },
                  //       icon: Image.asset("assets/images/drawer.png",
                  //           width: 30, height: 27));
                  // }),
                  centerTitle: true,
                  title: TypeAheadField(
                    suggestionsCallback: (query) async {
                      await searchProvider.fetchItems();
                      return searchProvider.items;
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        leading: Image.network(
                          suggestion["gif"] ?? "",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ), // Example icon
                        title: Text(suggestion['name'] ?? 'Unnamed Item'),
                      );
                    },
                    builder: (context, controller, focusNode) {
                      return SizedBox(
                        width: 335,
                        child: TextField(
                          autofocus: false,
                            controller: controller,
                            focusNode: focusNode,
                            onChanged: searchProvider.search,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(0),
                              prefixIcon: const Icon(Icons.search,
                                  size: 18, color: grey),
                              fillColor: blue,
                              filled: true,
                              hintText: "Search for exercise",
                              hintStyle: const TextStyle(
                                color: grey,
                                fontSize: 12,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40)),
                            )),
                      );
                    },
                    onSelected: (suggestion) async{
                      // Handle the suggestion selection
                     await  Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Searchgif(
                          index: suggestion['index'] ?? 0,
                          gif: suggestion['gif'] ?? "",
                          reps: suggestion['reps'] ?? "",
                          sets: suggestion['sets'] ?? "",
                          rest: suggestion['rest'] ?? "",
                        );
                      }));
                    },
                    debounceDuration: const Duration(milliseconds: 300),
                  ),
                  // actions: [
                  //   IconButton(
                  //       enableFeedback: false,
                  //       onPressed: () {
                  //         Navigator.push(context,
                  //             MaterialPageRoute(builder: (context) {
                  //           return const ProfilePage();
                  //         }));
                  //       },
                  //       icon: Padding(
                  //         padding: const EdgeInsets.only(right: 30),
                  //         child: Image.asset("assets/images/profile.png",
                  //             width: 25, height: 25),
                  //       ))
                  // ],
                )
              : null,
          // backgroundColor: currentIndex == 3
          //     ? blue
          //     : (Theme.of(context).brightness == Brightness.light
          //         ? Colors.white
          //         : const Color.fromARGB(255, 24, 23, 23)),
          body: screens[currentIndex],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(left: 2, right: 2, bottom: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Expanded(
                child: BottomAppBar(
                  elevation: 1,
                  height: 75,
                  color: blue,
                  shape: const CircularNotchedRectangle(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentIndex = 0;
                          });
                        },
                        style: ButtonStyle(
                          enableFeedback: false,
                          backgroundColor: WidgetStateProperty.all(
                            currentIndex == 0 ? red : blue,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.home_filled,
                              size: 25,
                              color: white,
                            ),
                            currentIndex == 0
                                ? const Text(
                                    "Home",
                                    style:
                                        TextStyle(color: white, fontSize: 12),
                                  )
                                : const SizedBox.shrink()
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentIndex = 1;
                          });
                        },
                        style: ButtonStyle(
                          enableFeedback: false,
                          backgroundColor: WidgetStateProperty.all(
                            currentIndex == 1 ? red : blue,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.list_alt_rounded,
                              size: 25,
                              color: white,
                            ),
                            currentIndex == 1
                                ? const Text(
                                    "Plan&Food",
                                    style:
                                        TextStyle(color: white, fontSize: 12),
                                  )
                                : const SizedBox.shrink()
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentIndex = 2;
                          });
                        },
                        style: ButtonStyle(
                          enableFeedback: false,
                          backgroundColor: WidgetStateProperty.all(
                            currentIndex == 2 ? red : blue,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.favorite,
                              size: 25,
                              color: white,
                            ),
                            currentIndex == 2
                                ? const Text(
                                    "Saved",
                                    style:
                                        TextStyle(color: white, fontSize: 12),
                                  )
                                : const SizedBox.shrink()
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentIndex = 3;
                          });
                        },
                        style: ButtonStyle(
                          enableFeedback: false,
                          backgroundColor: WidgetStateProperty.all(
                            currentIndex == 3 ? red : blue,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.settings,
                              size: 25,
                              color: white,
                            ),
                            currentIndex == 3
                                ? const Text(
                                    "Settings",
                                    style:
                                        TextStyle(color: white, fontSize: 12),
                                  )
                                : const SizedBox.shrink()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
