import 'package:flutter/material.dart';
import 'package:gofit/screens/main/styles.dart';
import 'package:gofit/screens/favorite/allgif.dart';
import 'package:gofit/screens/providers/favoriteprovider.dart';
import 'package:provider/provider.dart';

class SaveData extends StatefulWidget {
  const SaveData({super.key});

  @override
  State<SaveData> createState() => _SaveDataState();
}

class _SaveDataState extends State<SaveData> {
  @override
Widget build(BuildContext context) {
  final provider = Provider.of<FavoriteProvider>(context);
  final favorites = provider.favorites;

  return Scaffold(
    appBar: AppBar(
        title: const Text("Favorites",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: blue, fontSize: 22)),
        centerTitle: true,
      ),
    body: favorites.isEmpty ? const Center(child: Text("There is not list yet")) : ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.only(
            left: 25, top: 40, right: 25, bottom: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: grey,
            width: 200,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        favorites[index]["gif"] ?? "",
                        height: 100,
                        width: 80,
                        fit: BoxFit.cover),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        favorites[index]["name"] ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: blue, fontSize: 15),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      provider.toggleFavorite(
                        favorites[index]["name"] ?? "",
                        favorites[index]["gif"] ?? "",
                        favorites[index]["sets"] ?? "",
                        favorites[index]["reps"] ?? "",
                        favorites[index]["rest"] ?? ""
                      );
                    },
                    icon: provider.isExist(favorites[index]["name"] ?? "")
                        ? const Icon(Icons.favorite, color: red)
                        : const Icon(Icons.favorite, color: white),
                  ),
                  ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return AllGif(
                                        index: index,
                                        gif: favorites[index]['gif'] ?? "",
                                        reps: favorites[index]['reps'] ?? "",
                                        sets: favorites[index]['sets'] ?? "",
                                        rest: favorites[index]['rest'] ?? "",
                                      );
                                    }));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    enableFeedback: false,
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor: blue,
                                      foregroundColor: white,
                                      shape: const CircleBorder()),
                                  child: const Icon(Icons.play_arrow, size: 25),
                                ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

}
