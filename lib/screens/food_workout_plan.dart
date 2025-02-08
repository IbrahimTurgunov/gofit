import 'package:flutter/material.dart';
import 'package:gofit/screens/main/styles.dart';

class FoodList extends StatefulWidget {
  const FoodList({super.key});

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Workout Plan & Food List",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(25),
              ),
              child: TabBar(
                enableFeedback: false,
                controller: _tabController,
                indicator: BoxDecoration(
                  color: blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white, // Active tab text
                unselectedLabelColor: Colors.black, // Inactive tab text
                labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                tabs: const [
                  Tab(text: "Workout Plan"),
                  Tab(text: "Food"),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Center(
                    child: Text("In progress", style: TextStyle(fontSize: 18))),
                Center(
                    child: Text("In progress", style: TextStyle(fontSize: 18))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
