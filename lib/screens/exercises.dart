import 'package:flutter/material.dart';
import 'package:gofit/screens/exergif.dart';
import 'package:gofit/screens/main/styles.dart';
import 'package:gofit/screens/providers/favoriteprovider.dart';
import 'package:provider/provider.dart';

class ExercisesScreen extends StatefulWidget {
  final dynamic subCategoryData;

  const ExercisesScreen({super.key, required this.subCategoryData});
  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subCategoryData["title2"],
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: blue, fontSize: 27)),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: widget.subCategoryData["lower"]?.length ??
              widget.subCategoryData["upper"]?.length ??
              widget.subCategoryData["middle"]?.length ??
              widget.subCategoryData["fourth"]?.length,
          itemBuilder: (BuildContext context, int index) {
            dynamic exercise;
            if (widget.subCategoryData["lower"] != null) {
              
              exercise = widget.subCategoryData["lower"][index];
            } else if (widget.subCategoryData["upper"] != null) {
              
              exercise = widget.subCategoryData["upper"][index];
            } else if (widget.subCategoryData["middle"] != null) {
              
              exercise = widget.subCategoryData["middle"][index];
            }else if (widget.subCategoryData["fourth"] != null) {
              
              exercise = widget.subCategoryData["fourth"][index];
            }
            return Padding(
              padding: const EdgeInsets.only(
                  left: 25, top: 40, right: 25, bottom: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: grey,
                  width: 200,
                  height: 80,
                  child: Material(
                    color: grey,
                    child: InkWell(
                      enableFeedback: false,
                      splashColor: blue,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Exergif(
                            gifData: exercise,
                            
                          );
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(exercise["gif"] ?? "",
                                  height: 100, width: 80, fit: BoxFit.cover),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  exercise["name"],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: blue,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            IconButton(
                              enableFeedback: false,
                              onPressed: () {
                                provider.toggleFavorite(
                                    exercise["name"],
                                    exercise["gif"],
                                    exercise["sets"],
                                    exercise["reps"],
                                    exercise["rest"]);
                              },
                              icon: provider.isExist(
                                      exercise["name"])
                                  ? const Icon(Icons.favorite, color: red)
                                  : const Icon(Icons.favorite, color: white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
