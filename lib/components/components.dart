import 'package:flutter/material.dart';

Widget logInSignUpButton(
    String btnText, IconData icon, BuildContext context, VoidCallback onTap) {
  return ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.black,
        fixedSize: Size(MediaQuery.of(context).size.width, 60),
        side: const BorderSide(
          width: 4,
          color: Colors.black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        )),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text(
          "LOG IN",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.arrow_forward_rounded,
          size: 26,
        ),
      ],
    ),
  );
}

// LISTING SCREEN //

Widget richText(String title, String text) {
  return RichText(
    text: TextSpan(
        text: title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: text,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          )
        ]),
  );
}

Widget listingTile(
  String name,
  String position,
  String address,
  DateTime datePosted,
    VoidCallback onTap,
) =>
    Card(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
        tileColor: Colors.lightBlue.withOpacity(0.6),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        leading: CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(
            "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                "01 days ago",
                style: const TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              position,
              style: const TextStyle(fontSize: 14, letterSpacing: 1.2),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    address,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View Details",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );

// Widget listingTile(String name, String position, String address,
//         DateTime datePosted, BuildContext context) =>
//     Container(
//       width: MediaQuery.of(context).size.width,
//       height: 100,
//       color: Colors.blue.withOpacity(0.5),
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 6.0),
//             child: CircleAvatar(
//               radius: 30.0,
//               backgroundColor: Colors.white,
//               backgroundImage: NetworkImage(
//                 "https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=461&q=80",
//               ),
//             ),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     name,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   Text(position)
//                 ],
//               ),
//               Text(position),
//               Row(
//                 children: [
//                   Text(address),
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text(
//                       "View Details",
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.w800,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           // Column(
//           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //   children: [
//           //     Expanded(
//           //       child: Padding(
//           //         padding: const EdgeInsets.only(top: 10,),
//           //         child: Text(position),
//           //       ),
//           //     ),
//           //     TextButton(
//           //       onPressed: () {},
//           //       child: const Text(
//           //         "View Details",
//           //         style: TextStyle(
//           //           color: Colors.blue,
//           //           fontWeight: FontWeight.w800,
//           //         ),
//           //       ),
//           //     ),
//           //   ],
//           // ),
//         ],
//       ),
//     );

Widget screenFooter() => ClipPath(
  clipper: MyCustomClipper(),
  child:   Container(
    color: Colors.white,
    height: 100,
    width: double.infinity,
  ),
);

class MyCustomClipper extends CustomClipper<Path> {
  @override                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             e
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}