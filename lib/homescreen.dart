import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/controller/apicontroller.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Apicontroller apicontroller = Get.put(Apicontroller());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '   product List',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.green[50],
      ),
      body: Obx(() {
        if (apicontroller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.separated(
          itemCount: apicontroller.cartList.length,
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
          itemBuilder: (context, index) {
            final cart = apicontroller.cartList[index];
            return Container(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cart.products?.length ?? 0,
                itemBuilder: (context, productIndex) {
                  final product = cart.products![productIndex];
                  return Container(
                    width: 450,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              product.thumbnail ?? '',
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 30),
                            Text('Product ID: ${product.id}',
                                style: TextStyle(fontSize: 14)),
                            Text('Title: ${product.title}',
                                style: TextStyle(fontSize: 14)),
                            Text('Price: ${product.price}',
                                style: TextStyle(fontSize: 14)),
                            Text('Quantity: ${product.quantity}',
                                style: TextStyle(fontSize: 14)),
                            Text('Total: ${product.total}',
                                style: TextStyle(fontSize: 14)),
                            Text(
                                'Discount Percentage: ${product.discountPercentage}',
                                style: TextStyle(fontSize: 14)),
                            Text('Discounted Total: ${product.discountedTotal}',
                                style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}
