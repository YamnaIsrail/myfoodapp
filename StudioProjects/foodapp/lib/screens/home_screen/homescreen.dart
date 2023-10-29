import 'package:flutter/material.dart';
import 'package:foodapp/auth/sign_in.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/providers/product_provider.dart';
import 'package:foodapp/screens/home_screen/bottom_nav.dart';
import 'package:foodapp/screens/home_screen/drawer.dart';
import 'package:foodapp/screens/home_screen/single_product.dart';
import 'package:foodapp/screens/my_profile/my_profile.dart';
import 'package:foodapp/screens/product_overview/product_overview.dart';
import 'package:provider/provider.dart';

import '../../model/product_model.dart';
import '../search/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProductData();

    Provider.of<ProductProvider>(context, listen: false).fetchFreshProductData();

    Provider.of<ProductProvider>(context, listen: false).fetchRootProductData();

  }



  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width ;
    final screenHeight = MediaQuery.of(context).size.height;
    final topPadding = MediaQuery.of(context).padding.top;
    final containerHeight = screenHeight - topPadding;

    Widget _buildHerbsProduct(context){
      return Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Herbs Seasonings'),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  Search(
                        search: productProvider.productsDataList,

                      )));
                    },
                    child: Text('View all', style: TextStyle(color: Colors.grey)),
                  ),

                ]),

          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: productProvider.productsDataList
                  .map((ProductModel? productData)   {
                if (productData != null) {
                  return singleProduct(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductOverview(
                            productId: productData.productId,
                            productImage: productData.productImage,
                            productPrice: 50,
                            productName: productData.productName,
                            productQuantity: productData.productQuantity,
                          ),
                        ),
                      );
                    },
                    productName: productData.productName,
                    productImage: productData.productImage,
                    productPrice: productData.productPrice,
                    productId: productData.productId,
                    productdescription: 'Double cheese',
                    productQuantity: productData.productQuantity,
                  );
                }
                return SizedBox(); // Return an empty widget if productData is null.
              }).toList(),
            ),
          ),
        ],
      );
    }
    Widget _buildFreshProduct(context){
      return Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Fresh Food '),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  Search(
                      search: productProvider.freshProductDataList,

                    )));
                  },
                  child: Text('View all', style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              //height: containerHeight,
              //width: screenWidth,
              child: Row(
                children: productProvider.freshProductDataList
                    .map((ProductModel? productData)   {
                  if (productData != null) {
                    return singleProduct(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductOverview(
                              productId: productData.productId,
                              productQuantity: productData.productQuantity,
                              productImage: productData.productImage,
                              productPrice: 50,
                              productName: productData.productName,

                            ),
                          ),
                        );
                      },
                      productName: productData.productName,
                      productImage: productData.productImage,
                      productPrice: productData.productPrice,
                      productId: productData.productId,
                      productdescription: 'Double cheese',
                      productQuantity: productData.productQuantity ,
                    );
                  }
                  return SizedBox(); // Return an empty widget if productData is null.
                }).toList(),
              ),
            ),
          ),

        ],
      );
    }
    Widget _buildRootProduct(context){
      return Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Root Product '),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  Search(
                      search: productProvider.RootDataList,

                    )));
                  },
                  child: Text('View all', style: TextStyle(color: Colors.grey)),
                ),

              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              //height: containerHeight,
              //width: screenWidth,
              child: Row(
                children: productProvider.RootDataList
                    .map((ProductModel? productData)   {
                  if (productData != null) {
                    return singleProduct(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductOverview(
                              productId: productData.productId,
                              productQuantity: productData.productQuantity,
                              productImage: productData.productImage,
                              productPrice: 50,
                              productName: productData.productName,
                            ),
                          ),
                        );
                      },
                      productName: productData.productName,
                      productImage: productData.productImage,
                      productPrice: productData.productPrice,
                      productId: productData.productId,
                      productdescription: 'Double cheese',
                      productQuantity: productData.productQuantity ,
                    );
                  }
                  return SizedBox(); // Return an empty widget if productData is null.
                }).toList(),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      drawer: const Padding(
        padding: EdgeInsets.only(right: 80.0),
        child: drawerSide(),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: primaryColor,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: const Color(0xffd4d181),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Search(
                  search: productProvider.getAllProductSearch,

                )
                )
                );
              },
              icon: const Icon(Icons.search, size: 20, color: Colors.black),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: const Color(0xffd4d181),
              child: Icon(Icons.shop, size: 20, color: Colors.black),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 20,),
                Container(
                  height: 160,
                 // width: screenWidth,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/home2.png'),
                    ),
                    color: const Color(0xff930c0c),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 300),
                        child: Container(
                          height: 40,
                          width: 70,
                          decoration: const BoxDecoration(
                            color: Color(0xffcecb0b),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              'Yum',
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Signatra',
                                color: Colors.black,
                                shadows: [
                                  BoxShadow(
                                    color: Color(0xffd6b738),
                                    blurRadius: 10,
                                    offset: Offset(3, 3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 150),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '30% Off',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.green[300],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'On all vegetable products',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  height: 160,
                 // width: screenWidth,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/home2.jpg'),
                    ),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 300),
                        child: Container(
                          height: 50,
                          width: 80,
                          decoration: const BoxDecoration(
                            color: Color(0xffd6b738),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Yum',
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Signatra',
                                color: Colors.black,
                                shadows: [
                                  BoxShadow(
                                    color: Color(0xffd6b738),
                                    blurRadius: 10,
                                    offset: Offset(3, 3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 150),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '30% Off',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.green[300],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'On all vegetable products',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  height: 160,
                  //width: screenWidth,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/home2.jpg'),
                    ),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 300),
                        child: Container(
                          height: 50,
                          width: 80,
                          decoration: const BoxDecoration(
                            color: Color(0xffd6b738),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Yum',
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Signatra',
                                color: Colors.black,
                                shadows: [
                                  BoxShadow(
                                    color: Color(0xffd6b738),
                                    blurRadius: 10,
                                    offset: Offset(3, 3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 150),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '30% Off',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.green[300],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'On all vegetable products',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          _buildHerbsProduct(context),
          _buildFreshProduct(context),
          _buildRootProduct(context)

        ],
      ),
    );
  }
}
