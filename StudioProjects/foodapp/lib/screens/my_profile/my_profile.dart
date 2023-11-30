import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/model/user_model.dart';
import 'package:foodapp/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../home_screen/drawer.dart';

class MyProfile extends StatefulWidget {
final UserProvider userProvider;

MyProfile({required this.userProvider});

@override
State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
Widget listTile({required IconData icon, required String title}) {
return Column(
children: [
Divider(height: 1,),
ListTile(
trailing: Icon(Icons.add),
leading: Icon(icon),
title: Text(title),
)
],
);
}

@override
Widget build(BuildContext context) {
// Use Provider to listen for changes in the UserProvider
var userData = widget.userProvider.currentUserData;

return Scaffold(
backgroundColor: primaryColor,
appBar: AppBar(
backgroundColor: primaryColor,
elevation: 0.0,
title: Text('My Profile', style: TextStyle(fontSize: 18, color: textColor),),
),
drawer: Padding(
padding: const EdgeInsets.only(right: 80),
child: drawerSide(userProvider: widget.userProvider,),
),
body: Stack(
children: [
Column(
children: [
Container(
height: 100,
color: primaryColor,
),
Expanded(
child: Container(
width: double.infinity,
padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
decoration: BoxDecoration(
color: scaffoldBackgroundColor,
borderRadius: BorderRadius.only(
topLeft: Radius.circular(30),
topRight: Radius.circular(30),
),
),
child: ListView(
children: [
Row(
mainAxisAlignment: MainAxisAlignment.end,
children: [
Container(
width: 250,
height: 50,
padding: EdgeInsets.only(left: 20),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: [
Column(
mainAxisAlignment: MainAxisAlignment.spaceAround,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(userData?.userName ?? "Guest",
style: TextStyle(
fontSize: 14,
fontWeight: FontWeight.bold,
color: textColor,
),
),
Text("yum@gmail.com"),
],
),
CircleAvatar(
radius: 15,
backgroundColor: primaryColor,
child: CircleAvatar(
radius: 12,
child: Icon(Icons.edit, color: primaryColor,),
),
),
],
),
),
],
),
listTile(
icon: Icons.shop_2_outlined,
title: "My Orders",
),
listTile(
icon: Icons.location_pin,
title: "My Delivery Address",
                      ),
                      listTile(
                        icon:Icons.person,
                        title: "Refer a Friend",
                      ),
                      listTile(
                        icon:Icons.file_copy_outlined,
                        title: "Terms and Conditions ",
                      ),
                      listTile(
                        icon:Icons.policy_outlined,
                        title: "Privacy Policy",
                      ),
                      listTile(
                        icon:Icons.add_chart,
                        title: "About",
                      ),
                      listTile(
                        icon:Icons.exit_to_app_sharp,
                        title: "Logout",
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                radius: 45,
                backgroundColor: scaffoldBackgroundColor,
                backgroundImage: NetworkImage(
                    userData?.userImage ??
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUA9IuDIQlQ4gfQAEBvKOLBgBUHtEKPqWirw&usqp=CAU"
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
}
