import 'package:flutter/material.dart';
import 'package:self_worker/components/components.dart';
import 'package:self_worker/components/home_screen_components.dart';
import 'package:self_worker/screens/profile_screen.dart';

class ListingScreen extends StatefulWidget {
  const ListingScreen({Key? key}) : super(key: key);

  @override
  State<ListingScreen> createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listing"),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: richText("WHAT", "(TITLE, KEYWORDS OR CATEGORY)"),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: _categoryController,
                  decoration: InputDecoration(
                    hintText: "Title, Keywords or Category",
                    fillColor: Colors.grey.withOpacity(0.2),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
                    child: richText(
                      "LOCATION  ",
                      "(EX: Delhi, Mumbai)",
                    )),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: _locationController,
                  decoration: InputDecoration(
                    hintText: "Ex: Delhi, Mumbai",
                    fillColor: Colors.grey.withOpacity(0.2),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
                    child: richText("FIND WITH  ", "(PINCODE)")),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: _pincodeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter Pincode",
                    fillColor: Colors.grey.withOpacity(0.2),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    height: 50,
                    width: 150,
                    child: elevatedButton("Search", Icons.search, () {}),
                  ),
                ),
              ]),
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: listingTile(
                      "Atul Chauhan",
                      "Web Developer",
                      "Johri Pur, Delhi 110094",
                      DateTime.now(),
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
