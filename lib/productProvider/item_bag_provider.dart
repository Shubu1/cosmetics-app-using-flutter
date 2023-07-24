import 'package:flutter_login/productModel/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<ProductModel> itemBag = [];

class ItemBagNotifier extends StateNotifier<List<ProductModel>> {
  ItemBagNotifier() : super(itemBag);
  //add new item
  void addNewItem(ProductModel productModel) {
    state = [...state, productModel];
  }

  // remove the item
  void removeItem(int pid) {
    state = [
      for (final product in state)
        if (product.pid != pid) product,
    ];
  }
}

final itemBagprovider =
    StateNotifierProvider<ItemBagNotifier, List<ProductModel>>((ref) {
  return ItemBagNotifier();
});
final priceCalcProvider = StateProvider((ref) {
  final itemBag = ref.watch(itemBagprovider);
  double sum = 0;
  for (var element in itemBag) {
    sum += element.price;
  }
  return sum;
});
