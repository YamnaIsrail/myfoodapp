import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodapp/model/delivery_address_model.dart';
import 'package:foodapp/model/review_cart_model.dart'; // Import the ReviewCartModel
import 'package:provider/provider.dart';

import '../../../providers/review_cart_provider.dart';

class home_pay extends StatelessWidget {
  final double total;
  final DeliveryAddressModel deliveryAddress;
  final List<ReviewCartModel> products; // Assuming ReviewCartModel is used

  home_pay({
    required this.total,
    required this.deliveryAddress,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    // Create a map with user details, product details, and delivery address
    Map<String, dynamic> orderData = {
      'totalAmount': total,
      'userDetails': {
        'userName': deliveryAddress.firstName + ' ' + deliveryAddress.lastName,
        'mobileNo': deliveryAddress.mobileNo,
      },
      'deliveryAddress': {
        'area': deliveryAddress.area,
        'street': deliveryAddress.street,
        'pinCode': deliveryAddress.pinCode,
      },
      'products': products.map((product) => {
        'cartName': product.cartName,
        'cartPrice': product.cartPrice,
        'cartQuantity': product.cartQuantity,
      }).toList(),
      'timestamp': FieldValue.serverTimestamp(),
    };

    // Add order data to Firestore
    _placeOrder(orderData);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Pay'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Do something after placing the order
          },
          child: Text('Place Order'),
        ),
      ),
    );
  }

  // Function to add order data to Firestore
  void _placeOrder(Map<String, dynamic> orderData) async {
    try {
      String? userId = FirebaseAuth.instance.currentUser?.uid;

      if (userId != null) {
        await FirebaseFirestore.instance
            .collection('Orders')
            .doc(userId)
            .collection("UserOrders")
            .add(orderData);

        // // Clear the review cart data after placing the order
        // Provider.of<ReviewCartProvider>(context, listen: false).reviewCartDataDelete();

      }
    } catch (error) {
      print('Error placing order: $error');
    }
  }
}
