import 'package:flutter/material.dart';
import 'package:gofit/screens/exercises.dart';
import 'package:gofit/screens/main/styles.dart';

class AllCategories extends StatefulWidget {
  final dynamic categoryData;

  const AllCategories({super.key, required this.categoryData});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    var categories = widget.categoryData["category"];

    if (categories == null || categories.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.categoryData["title"] ?? 'Category'),
        ),
        body: const Center(
          child: Text("In process"),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.categoryData["title"] ?? 'Category',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: blue,
              fontSize: 27,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisSpacing: 0, mainAxisExtent: 235),
              itemBuilder: (BuildContext context, int index) {
                final subCategory = categories[index];
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 23),
                      Text(
                        subCategory["title2"] ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: blue,
                            fontSize: 20),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Material(
                          color: white,
                          child: Ink.image(
                              image: NetworkImage(subCategory["image1"] ?? ''),
                              height: 180,
                              width: 360,
                              fit: BoxFit.contain,
                              child: InkWell(
                                splashColor: blue,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ExercisesScreen(
                                          subCategoryData: subCategory),
                                    ),
                                  );
                                },
                              )),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
