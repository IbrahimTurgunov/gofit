import 'package:flutter/material.dart';
import 'package:gofit/screens/categories.dart';
import 'package:gofit/screens/main/styles.dart';
import 'package:gofit/screens/providers/allgifprovider.dart';
import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class ListData extends StatefulWidget {
  const ListData({
    super.key,
  });

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  

  @override
  void initState() {
    super.initState();
    Provider.of<AllProvider>(context, listen: false).fetchItems();
  }

  

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AllProvider>(context);
    
   return  
    // SizedBox(
    //           height: 720,
    //           width: 360,
    //           child: Shimmer.fromColors(                   
    //               baseColor: grey,
    //               highlightColor: white,
    //               child: GridView.builder(
    //                 itemCount: 7,
    //                 shrinkWrap: true,
    //                 physics: const NeverScrollableScrollPhysics(),
    //                 gridDelegate:
    //                     const SliverGridDelegateWithFixedCrossAxisCount(
    //                   crossAxisCount: 1,
    //                   crossAxisSpacing: 10,
    //                   mainAxisSpacing: 10,
    //                   mainAxisExtent: 180,
    //                 ),
    //                 itemBuilder: (_, index) => ClipRRect(
    //                    borderRadius: const BorderRadius.all(Radius.circular(20)),
    //                   child: Container(
    //                     color: grey,
    //                     height: 180,
    //                     width: 360,
    //                   ),
    //                 ),
    //               )),
    //         )
            
                 GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: provider.items.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 0,
                            mainAxisExtent: 200),
                    itemBuilder: (BuildContext context, int index){
                    final item = provider.items[index];
                     return
                        GestureDetector(
                      onTap: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AllCategories(categoryData: item,)));                        
                      },
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    item["image"] ?? ""),
                              ),
                            ),
                            height: 180,
                            width: 360,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["info"],
                                  style: const TextStyle(
                                      color: white, fontSize: 15),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item["title"],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: white,
                                          fontSize: 27),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Container(
                                        color: white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Text(
                                            item["time"],
                                            style: const TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
  });
  }
}
