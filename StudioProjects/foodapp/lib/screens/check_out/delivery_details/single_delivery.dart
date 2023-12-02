import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';

class SingleDeliveryItem extends StatelessWidget {
  final String title;
  final String address;
  final String number;
  final String addressType;

  const SingleDeliveryItem(
    this.title,
    this.address,
    this.number,
    this.addressType,
      );

  @override
  Widget build(BuildContext context) {




    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height:60 ,
            width: 60,
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color:primaryColor,
              borderRadius: BorderRadius.circular(10),

            ),
            child: Center(
              child: Text(title, style: TextStyle(fontSize: 13, color: Colors.white),),
            ),
          ),
        ],
      ),
      leading: CircleAvatar(
        radius: 8,
        backgroundColor: Colors.black,


      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(address),
          SizedBox(
            height: 5,
          ),
          Text(number),
          Divider(height: 35,)

        ],
      ),

    );

  }
}
