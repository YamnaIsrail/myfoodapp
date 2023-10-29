import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/providers/review_cart_provider.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget {
  Count({
    required this.productPrice,
    required this.productName,
    required this.productImage,
    required this.productId,
    required this.count_design

  });

  final String productName;
  final String productImage;
  final String productId;
  final int productPrice;
  bool count_design;

  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;
  bool count_design= true;

  @override

  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Container(
      height: 15,
      decoration: count_design== true
          ? BoxDecoration(
          color: buttonColor,
          border: Border.all(color: buttonOutline),
          borderRadius: BorderRadius.circular(8),
        )
          : BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xffb6b6b6)),
          borderRadius: BorderRadius.circular(30),
        ),
      child: isTrue
          ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                if (count > 1) {
                  count--;
                }
              });
            },
            child: Icon(Icons.remove, size: 12, color: iconcolor),
          ),
          Text(
            '$count',
            style: TextStyle(color: textColor, fontSize: 12),
          ),
          InkWell(
            onTap: () {
              setState(() {
                count++;
              });
            },
            child: Icon(Icons.add, size: 12, color: iconcolor  ),
          ),
        ],
      )
          : Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isTrue = true;
            });
            reviewCartProvider.addReviewCartData(
              cartId: widget.productId,
              cartImage: widget.productImage,
              cartName: widget.productName,
              cartPrice: widget.productPrice,
              cartQuantity: count,
            );
          },
          child: Text(
            "ADD",
            style: TextStyle(color: primaryColor , fontSize: 12),
          ),
        ),
      ),
    );
  }
}
