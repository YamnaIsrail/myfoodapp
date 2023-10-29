// import 'package:flutter/material.dart';
// import 'package:foodapp/auth/sign_in.dart';
// import 'package:foodapp/config/colors.dart';
// import 'package:foodapp/providers/product_provider.dart';
// import 'package:foodapp/screens/home_screen/bottom_nav.dart';
// import 'package:foodapp/screens/home_screen/drawer.dart';
// import 'package:foodapp/screens/home_screen/single_product.dart';
// import 'package:foodapp/screens/my_profile/my_profile.dart';
// import 'package:foodapp/screens/product_overview/product_overview.dart';
// import 'package:provider/provider.dart';
//
// import '../search/search.dart';
//
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   late ProductProvider productProvider;
//   @override
//   void initState() {
//     ProductProvider productProvider= Provider.of(context, listen: false);
//     productProvider.fetchProductData();
//     super .initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     productProvider= Provider.of(context);
//
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       drawer: const Padding(
//         padding:  EdgeInsets.only(right: 80.0),
//         child: drawerSide(),
//       ),
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.black),
//         backgroundColor: primaryColor,
//         title: const Text(
//           'Home',
//           style: TextStyle(color: Colors.black),
//         ),
//         actions: [
//           CircleAvatar(
//               radius: 15,
//               backgroundColor: const Color(0xffd4d181),
//               child: IconButton(
//                   onPressed:(){
//                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const search()));
//                   },
//                   icon: const Icon(Icons.search, size: 20, color: Colors.black))
//
//           ),
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 5),
//             child: CircleAvatar(
//               radius: 15,
//               backgroundColor: Color(0xffd4d181),
//               child: Icon(Icons.shop, size: 20, color: Colors.black),
//             ),
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//         child: ListView(
//           children: [
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   Container(
//                     height: 160,
//                     width: screenWidth,
//                     decoration: BoxDecoration(
//                       image: const DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage('assets/images/home2.png'),
//                       ),
//                       color: const Color(0xff930c0c),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Expanded(
//                       flex: 2,
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(right: 300),
//                             child: Container(
//                               height: 40,
//                               width: 70,
//                               decoration: const BoxDecoration(
//                                 color: Color(0xffcecb0b),
//                                 borderRadius: BorderRadius.only(
//                                   bottomRight: Radius.circular(50),
//                                   bottomLeft: Radius.circular(50),
//                                 ),
//                               ),
//                               child: const Padding(
//                                 padding:
//                                 EdgeInsets.only(left: 15),
//                                 child: Text(
//                                   'Yum',
//                                   style: TextStyle(
//                                     fontSize: 25,
//                                     fontFamily: 'Signatra',
//                                     color: Colors.black,
//                                     shadows: [
//                                       BoxShadow(
//                                         color: Color(0xffd6b738),
//                                         blurRadius: 10,
//                                         offset: Offset(3, 3),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(right: 150),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   '30% Off',
//                                   style: TextStyle(
//                                     fontSize: 40,
//                                     color: Colors.green[300],
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const Text(
//                                   'On all vegetable products',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     color: Colors.grey,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 15),
//                   Container(
//                     height: 160,
//                     width: screenWidth,
//                     decoration: BoxDecoration(
//                       image: const DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage('assets/images/home2.jpg'),
//                       ),
//                       color: Colors.red,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Expanded(
//                       flex: 2,
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(right: 300),
//                             child: Container(
//                               height: 50,
//                               width: 80,
//                               decoration: const BoxDecoration(
//                                 color: Color(0xffd6b738),
//                                 borderRadius: BorderRadius.only(
//                                   bottomRight: Radius.circular(50),
//                                   bottomLeft: Radius.circular(50),
//                                 ),
//                               ),
//                               child: const Padding(
//                                 padding:
//                                 EdgeInsets.symmetric(horizontal: 20),
//                                 child: Text(
//                                   'Yum',
//                                   style: TextStyle(
//                                     fontSize: 25,
//                                     fontFamily: 'Signatra',
//                                     color: Colors.black,
//                                     shadows: [
//                                       BoxShadow(
//                                         color: Color(0xffd6b738),
//                                         blurRadius: 10,
//                                         offset: Offset(3, 3),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(right: 150),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   '30% Off',
//                                   style: TextStyle(
//                                     fontSize: 40,
//                                     color: Colors.green[300],
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const Text(
//                                   'On all vegetable products',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     color: Colors.grey,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//                   Container(
//                     height: 160,
//                     width: screenWidth,
//                     decoration: BoxDecoration(
//                       image: const DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage('assets/images/home2.jpg'),
//                       ),
//                       color: Colors.red,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Expanded(
//                       flex: 2,
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(right: 300),
//                             child: Container(
//                               height: 50,
//                               width: 80,
//                               decoration: const BoxDecoration(
//                                 color: Color(0xffd6b738),
//                                 borderRadius: BorderRadius.only(
//                                   bottomRight: Radius.circular(50),
//                                   bottomLeft: Radius.circular(50),
//                                 ),
//                               ),
//                               child: const Padding(
//                                 padding:
//                                 EdgeInsets.symmetric(horizontal: 20),
//                                 child: Text(
//                                   'Yum',
//                                   style: TextStyle(
//                                     fontSize: 25,
//                                     fontFamily: 'Signatra',
//                                     color: Colors.black,
//                                     shadows: [
//                                       BoxShadow(
//                                         color: Color(0xffd6b738),
//                                         blurRadius: 10,
//                                         offset: Offset(3, 3),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(right: 150),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   '30% Off',
//                                   style: TextStyle(
//                                     fontSize: 40,
//                                     color: Colors.green[300],
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const Text(
//                                   'On all vegetable products',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     color: Colors.grey,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Herbs Seasonings'),
//                   Text('View all', style: TextStyle(color: Colors.grey)),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   ListView(
//                     children: productProvider.getProductsdataList
//                         .map((ProductData) {
//                       return  singleProduct(
//                         onTap: () {
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) => ProductOverview(
//                                   productImage: ProductData.productImage,
//                                   productPrice: 50,
//                                   productName: ProductData.productName
//                               ),
//                             ),
//                           );
//                         },
//                         productName: ProductData.productName,
//                         productImage: ProductData.productImage,
//                         productPrice:ProductData.productPrice,
//                         productQuantity: 50,
//                         productdescription: 'Double cheese',
//                       );
//
//                     }).toList(),
//                   )
//
//
//                   // singleProduct(
//                   //   onTap: () {
//                   //     Navigator.of(context).push(
//                   //         MaterialPageRoute(builder: (context) => ProductOverview(
//                   //             productImage: 'assets/images/img3.png',
//                   //             productName: 'Pizza')));
//                   //   },
//                   //   productName: 'Pizza',
//                   //   productImage: 'assets/images/img3.png',
//                   //   productPrice: 10,
//                   //   productQuantity: 50,
//                   //   productdescription: 'Double cheese',
//                   // ),
//                   // singleProduct(
//                   //   onTap: () {
//                   //     Navigator.of(context).push(
//                   //         MaterialPageRoute(builder: (context) => ProductOverview(
//                   //             productImage: 'assets/images/img2.png',
//                   //             productName: 'Burger')));
//                   //   },
//                   //   productName: 'Burger',
//                   //   productImage: 'assets/images/img2.png',
//                   //   productPrice: 10,
//                   //   productQuantity: 50,
//                   //   productdescription: 'Double cheese',
//                   // ),
//                   // singleProduct(
//                   //   onTap: () {
//                   //     Navigator.of(context).push(
//                   //         MaterialPageRoute(builder: (context) => ProductOverview(
//                   //             productImage: 'assets/images/roll.png',
//                   //             productName: 'Pizza')));
//                   //   },
//                   //   productName: 'Pizza',
//                   //   productImage: 'assets/images/roll.png',
//                   //   productPrice: 10,
//                   //   productQuantity: 50,
//                   //   productdescription: 'Double cheese',
//                   // ),
//                   // singleProduct(
//                   //   onTap: () {
//                   //     Navigator.of(context).push(
//                   //         MaterialPageRoute(builder: (context) => ProductOverview(
//                   //             productImage: 'assets/images/bg.png',
//                   //             productName: 'Pizza')));
//                   //   },
//                   //   productName: 'Pizza',
//                   //   productImage: 'assets/images/bg.png',
//                   //   productPrice: 10,
//                   //   productQuantity: 50,
//                   //   productdescription: 'Double cheese',
//                   // ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Fresh Food '),
//                   Text('View all', style: TextStyle(color: Colors.grey)),
//                 ],
//               ),
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   singleProduct(
//                     onTap: () {
//                       Navigator.of(context).push(
//                           MaterialPageRoute(builder: (context) => ProductOverview(
//                               productImage: 'assets/images/burger.png',
//                               productPrice: 50,
//
//                               productName: 'Pizza')));
//                     },
//                     productName: 'Burger',
//                     productImage: 'assets/images/burger.png',
//                     productPrice: 10,
//                     productQuantity: 50,
//                     productdescription: 'Double cheese',
//                   ),
//                   singleProduct(
//                     onTap: () {
//                       Navigator.of(context).push(
//                           MaterialPageRoute(builder: (context) => ProductOverview(
//                               productImage: 'assets/images/img2.png',
//                               productPrice: 50,
//
//                               productName: 'Pizza')));
//                     },
//                     productName: 'Burger',
//                     productImage: 'assets/images/img2.png',
//                     productPrice: 10,
//                     productQuantity: 50,
//                     productdescription: 'Double cheese',
//                   ),
//                   singleProduct(
//                     onTap: () {
//                       Navigator.of(context).push(
//                           MaterialPageRoute(builder: (context) => ProductOverview(
//                               productImage: 'assets/images/burger.png',
//                               productPrice: 50,
//
//                               productName: 'Burger')));
//                     },
//                     productName: 'Pizza',
//                     productImage: 'assets/images/burger.png',
//                     productPrice: 10,
//                     productQuantity: 50,
//                     productdescription: 'Double cheese',
//                   ),
//                   singleProduct(
//                     onTap: () {
//                       Navigator.of(context).push(
//                           MaterialPageRoute(builder: (context) => ProductOverview(
//                               productImage: 'assets/images/img3.png',
//                               productPrice: 50,
//                               productName: 'Pizza')));
//                     },
//                     productName: 'Pizza',
//                     productImage: 'assets/images/img3.png',
//                     productPrice: 10,
//                     productQuantity: 50,
//                     productdescription: 'Double cheese',
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//
//
//
//     );
//   }
// }