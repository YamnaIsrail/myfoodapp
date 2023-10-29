import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';

import '../home_screen/drawer.dart';

class MyProfile extends StatelessWidget {

  Widget listTile ({ required IconData icon, required String title}){
    return Column(
      children: [
        Divider(height: 1,),
        ListTile(
          trailing:Icon(Icons.add) ,
          leading: Icon(icon),
          title: Text(title),

        )
      ],
    );
  }
  const MyProfile({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: Text('My Profile', style: TextStyle(fontSize: 18, color: textColor),),
      ),
      drawer: drawerSide(),
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
                      topRight: Radius.circular(30)
                    )
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
                                    Text("Yum", style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: textColor
                                    ),),

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

                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      listTile(
                          icon:Icons.shop_2_outlined,
                          title: "My Orders",
                      ),
                      listTile(
                        icon:Icons.location_pin,
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
                backgroundImage: NetworkImage("data:image/png;base64,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"),
              ),
            ),
          )
        ],
      ),

    );
  }
}
