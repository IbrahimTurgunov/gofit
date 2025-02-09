import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gofit/screens/categories.dart';
import 'package:gofit/screens/main/styles.dart';
import 'package:shimmer/shimmer.dart';
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
  List<dynamic> alldata = [];
  bool isloading = false;
  bool isfalse = false;

  Future<void> getdata() async {
    //Get data fro API
    setState(() {
      isloading = true;
    });

    // Handle errors gracefully
    try {
      Response response = await Dio()
          .get("https://gofit-7036c-default-rtdb.firebaseio.com/gofit.json");
      isloading = false;
      isfalse = false;

      alldata = response.data;

      setState(() {});
    } catch (e) {
      isloading = false;
      // ignore: unused_local_variable
      isfalse = true;
      setState(() {});
    }
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  Widget errorWiddget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.warning),
          const Text(
              "Error, there is a problem with internet connecton, please check!"),
          ElevatedButton(onPressed: getdata, child: const Text("Try again"))
        ],
      ),
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<AllProvider>(context, listen: false).fetchItems();
  // }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<AllProvider>(context);

    return RefreshIndicator(
        onRefresh: () async {
          await getdata();
        },
        child: isloading
            ? SizedBox(
                height: 720,
                width: 360,
                child: Shimmer.fromColors(
                    baseColor: grey,
                    highlightColor: white,
                    child: GridView.builder(
                      itemCount: 7,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 180,
                      ),
                      itemBuilder: (_, index) => ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          color: grey,
                          height: 180,
                          width: 360,
                        ),
                      ),
                    )),
              )
            : isfalse
                ? errorWiddget()
                : GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: alldata.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 0,
                            mainAxisExtent: 200),
                    itemBuilder: (BuildContext context, int index) {
                      final item = alldata[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllCategories(
                                        categoryData: item,
                                      )));
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[900],
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(item["image"] ?? ""),
                                ),
                              ),
                              height: 180,
                              width: 360,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                    }));
  }
}
