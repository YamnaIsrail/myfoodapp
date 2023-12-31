import 'package:flutter/material.dart';
import 'package:foodapp/screens/home_screen/drawer.dart';
import 'package:foodapp/screens/home_screen/home_screen_components/discount_cart.dart';
import 'package:foodapp/screens/home_screen/home_screen_components/fresh_product.dart';
import 'package:foodapp/screens/home_screen/home_screen_components/herbs_product.dart';
import 'package:foodapp/screens/home_screen/home_screen_components/root_product.dart';
import 'package:foodapp/screens/search/search.dart';
import 'package:foodapp/screens/search/search_bar.dart';
import 'package:provider/provider.dart';
import '../../../config/colors.dart';
import '../../../config/size_config.dart';
import '../../model/product_model.dart';
import '../../providers/user_provider.dart';
import '../../providers/product_provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
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
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();
    print("Fresh Products Count: ${productProvider.freshProductDataList.length}");


    return Scaffold(
      drawer: Padding(
        padding: EdgeInsets.only(right: 80.0),
        child: drawerSide(
          userProvider: userProvider,
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Color(0xfff6f6f6),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: const Color(0xff33536f),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Search(
                      search: productProvider.getAllProductSearch,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.search, size: 20, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: const Color(0xff33536f),
              child: Icon(Icons.shop, size: 20, color: Colors.white),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Hi',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  TextSpan(
                    text: '\nAre you hungry?',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.normal, color: Colors.black87),
                  ),
                ],
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: 20),
          MySearchBar(
            query: "",
            onChanged: (value) {},
          ),
          DiscountCard(),
          SizedBox(height: 20),

          //HerbsProductComponent(products: productProvider.productsDataList, context: context),
          FreshProductsComponent(products: productProvider.freshProductDataList, context: context),
          RootProductComponent(rootProducts: productProvider.RootDataList, context: context),

        ],

      ),
    );
  }
}
