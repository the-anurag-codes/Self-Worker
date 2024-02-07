import 'package:flutter/material.dart';
import 'package:self_worker/components/components.dart';
import 'package:self_worker/components/home_screen_components.dart';
import 'package:self_worker/screens/categories_screen.dart';
import 'package:self_worker/screens/fill_your_details.dart';
import 'package:self_worker/screens/listing_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Self Worker"),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: ListView(
        children: [
          // HEADER
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                animatedText("Find Best People For Your Any Work", 32),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Find best worker for your any kind of work, who is best in their work. and call, message and whatsapp people directly in one click.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white54),
                ),
                const SizedBox(
                  height: 15,
                ),
                elevatedButton(
                  "POST YOUR RESUME",
                  Icons.file_present,
                  () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FillYourDetailsScreen(),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // CATEGORIES
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
            child: GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              children: [
                categoryTile(Icons.accessible_forward, "Band Playing", "123",
                    Colors.blueAccent),
                categoryTile(Icons.accessible_forward, "Welding", "123",
                    Colors.purpleAccent),
                categoryTile(Icons.accessible_forward, "Goldsmith", "123",
                    Colors.amberAccent),
                categoryTile(Icons.accessible_forward, "Catering", "123",
                    Colors.pinkAccent),
                categoryTile(Icons.accessible_forward, "Carpentry", "123",
                    Colors.greenAccent),
                categoryTile(Icons.accessible_forward, "Labour", "123",
                    Colors.tealAccent),
              ],
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: elevatedButton(
              "VIEW ALL CATEGORY",
              Icons.arrow_forward_ios_rounded,
              () => WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CategoriesScreen(),
                  ),
                );
              }),
            ),
          ),

          // ABOUT
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Expanded(
                    child: Image.network(
                      "https://images.unsplash.com/photo-1637416067365-2b5e7e8fe8fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        animatedText("Self-Worker", 28),

                        SizedBox(
                          height: 5,
                        ),

                        const Text(
                          "Self-Worker is a platform where people can show their work and also people can find best worker for any work. you can talk directly with people through call, message and whatsapp.",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54),
                        ),

                        //  READ MORE
                        const SizedBox(
                          height: 10,
                        ),

                        elevatedButton(
                          "READ MORE",
                          Icons.arrow_forward_ios_rounded,
                          () => Future.delayed(Duration.zero, () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const ListingScreen(),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // FOOTER
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: screenFooter(),
          ),
        ],
      ),
    );
  }
}
