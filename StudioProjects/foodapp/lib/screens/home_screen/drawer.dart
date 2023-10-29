import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/screens/product_overview/product_overview.dart';
import 'package:foodapp/screens/review_cart/review_cart.dart';
import 'package:foodapp/screens/wishlist/wishlist.dart';
import 'package:foodapp/welcome_slider/welcome.dart';

import '../../auth/sign_in.dart';
import '../my_profile/my_profile.dart';
import 'homescreen.dart';

class drawerSide extends StatelessWidget {
  const drawerSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                // color: Color(0xffb0ad13),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 43,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xffb0ad13),
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
                            )
                          ],
                        ),
                      ),

                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome GUEST!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 7),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: Text('Login Page'),
            onTap: () {
              // Handle the Home item tap
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignIn()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Welcome()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shop_outlined),
            title: Text("Review Cart"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ReviewCart(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outlined),
            title: Text("My Profile"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MyProfile(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: Text("Notification"),
          ),
          ListTile(
            leading: const Icon(Icons.star_outline),
            title: Text("Rating & Review"),
          ),
          ListTile(
            leading: const Icon(Icons.favorite_outline),
            title: Text("Wishlist"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => WishList(),
                ),
              );
            },
          ),
          ListTile(leading: const Icon(Icons.copy_outlined), title: Text("Raise a Complaint")),
          ListTile(leading: const Icon(Icons.format_quote_outlined), title: Text("FAQs")),
          SizedBox(height: 10,),
          Divider(height: 5,),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Contact Support"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("Call us:"),
                    SizedBox(
                      width: 10,
                    ),
                    Text("+92........."),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text("Mail us:"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "yum@gmail.com",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
