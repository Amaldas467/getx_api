import 'package:get/get.dart';

import 'package:getx_api/model/api/cart.dart';
import 'package:getx_api/servicefile/apiservice.dart';

class Apicontroller extends GetxController {
  var cartList = <Cart>[].obs;
  var isLoading = true.obs;
  final CartService apiService = CartService();

  @override
  void onInit() {
    super.onInit();
    fetchCarts();
  }

  Future<void> fetchCarts() async {
    try {
      isLoading(true);
      var cartapi = await apiService.getCarts();
      cartList.assignAll(cartapi.carts ?? []);
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading(false);
    }
  }
}
