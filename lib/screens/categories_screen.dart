import 'package:flutter/material.dart';
import 'package:self_worker/components/home_screen_components.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Widget> categoryList = [
    categoryTile(
        Icons.accessible_forward, "Band Playing", "123", Colors.redAccent),
    categoryTile(
        Icons.accessible_forward, "Band Playing", "123", Colors.blueAccent),
    categoryTile(
        Icons.accessible_forward, "Band Playing", "123", Colors.purpleAccent),
    categoryTile(
        Icons.accessible_forward, "Band Playing", "123", Colors.greenAccent),
    categoryTile(
        Icons.accessible_forward, "Band Playing", "123", Colors.yellowAccent),
    categoryTile(
        Icons.accessible_forward, "Band Playing", "123", Colors.tealAccent),
    categoryTile(
        Icons.accessible_forward, "Band Playing", "123", Colors.orangeAccent),
    categoryTile(
        Icons.accessible_forward, "Band Playing", "123", Colors.pinkAccent),
    categoryTile(
        Icons.accessible_forward, "Band Playing", "123", Colors.amberAccent),
    categoryTile(
        Icons.accessible_forward, "Band Playing", "123", Colors.orangeAccent),
    categoryTile(
        Icons.accessible_forward, "Band Playing", "123", Colors.pinkAccent),
    categoryTile(
        Icons.accessible_forward, "Band Playing", "123", Colors.amberAccent),
    categoryTile(
        Icons.accessible_forward, "Band Playing", "123", Colors.blueAccent),
    categoryTile(
        Icons.accessible_forward, "Band Playing", "123", Colors.redAccent),
    categoryTile(
        Icons.accessible_forward, "Band Playing", "123", Colors.greenAccent),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                animatedText("Category", 35),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        "SEARCH BY CATEGORY NAME",
                        style: TextStyle(letterSpacing: 1.0, fontSize: 10),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.15,
                      height: 35,
                      child: TextField(
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: "Search...",
                          suffixIcon: Container(
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 18,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // CATEGORY GRID
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: categoryList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (BuildContext context, int index) {
                return categoryList[index];
              },
            ),
          )
        ],
      ),
    );
  }
}
