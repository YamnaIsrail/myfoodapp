import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';

class SingleItem extends StatelessWidget {

  //SingleItem({super.key});

  SingleItem(
      {required bool this.isbool,
      required this.productPrice,
      required this.productImage,
      required this.productName,
      required this.productId,
      required this.productQuantity,
      required this.onDelete,



      });

  bool isbool= false;
  String productImage;
  String productName;
  int productPrice;
  String productId;
  int productQuantity;
  final Function() onDelete;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(child: Container(
                child: Image.network(productImage),
                height: 100,
              ),),
              Expanded(child: Container(
                height: 100,
                child: Column(
                  mainAxisAlignment:isbool==false
                      ? MainAxisAlignment.spaceAround
                      : MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(productName, style: TextStyle(color: Colors.black),),
                        Text("\n $productPrice\$", style: TextStyle(color: text2Color),),
                      ],
                    ),
                    isbool== false
                        ? Container(
                      margin: EdgeInsets.only(right: 15),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30)

                      ),

                          child: Row(
                        children: [
                          Expanded(child:
                          Text(
                            "50 Gram",
                            style: TextStyle(
                              color: text2Color,
                              fontSize: 14,
                            ),
                          ),
                          ),
                          Center(
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                              color: primaryColor,
                            ),
                          )
                        ],
                      ),
                    )
                        : Text('40 Gram', style: TextStyle(color: Colors.black45),),

                  ],
                ),

              ),
              ),
              Expanded(child: Container(
                height: 100,
                padding: isbool==false
                    ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                    : EdgeInsets.only(left: 15, right: 15),
                child: isbool==false
                    ? Container(
                  height: 25,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: primaryColor, size: 20,),
                        Text("Add", style: TextStyle(color: primaryColor),),
                      ],
                    ),
                  ),
                )
                    :Column(
                  children: [
                    Icon(Icons.delete, size: 30, color: Colors.black54,),
                    SizedBox(height: 5,),
                    Container(
                      height: 25,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, color: primaryColor, size: 20,),
                            Text("Add", style: TextStyle(color: primaryColor),),
                          ],
                        ),
                      ),
                    )
                  ],
                ),

              ),),

            ],
          ),
        ),
        isbool==false
            ? Container()
            : Divider(height: 1,color: Colors.black45,)
      ],
    );

  }
}
