import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodapp/widgets/single_item.dart';

import '../model/review_cart_model.dart';

class ReviewCartProvider with ChangeNotifier {
  List<ReviewCartModel> reviewCartDataList = [];

  Future<void> addReviewCartData({
    required String cartId,
    String? cartImage,
    String? cartName,
    int? cartPrice,
    int? cartQuantity,
  }) async {
    // Use the user ID directly to avoid potential null errors
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId != null) {
      await FirebaseFirestore.instance
          .collection('ReviewCart')
          .doc(userId)
          .collection("Your_ReviewCart")
          .doc(cartId)
          .set({
        "cartId": cartId,
        "cartImage": cartImage,
        "cartName": cartName,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
      });
    }
  }

  Future<void> getReviewCartData() async {
    // Clear the existing list before fetching data
    reviewCartDataList.clear();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userId = user.uid;

      // Query the Firestore for the user's cart data
      QuerySnapshot<Map<String, dynamic>> reviewCartValue =
      await FirebaseFirestore.instance
          .collection("ReviewCart")
          .doc(userId)
          .collection("Your_ReviewCart")
          .get();

      reviewCartDataList = reviewCartValue.docs.map((element) {
        return ReviewCartModel(
          cartId: element.get("cartId"),
          cartImage: element.get("cartImage"),
          cartName: element.get("cartName"),
          cartPrice: element.get("cartPrice"),
          cartQuantity: element.get("cartQuantity"),

        );
      }).toList();
      print("Review Cart Data: $reviewCartDataList");

      notifyListeners();
    }
  }

  List<ReviewCartModel> get getReviewCartDataList {
    return reviewCartDataList;
  }
}
