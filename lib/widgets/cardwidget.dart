import 'package:flutter/material.dart';
import 'package:flutter_login/constants/apptheme.dart';
import 'package:flutter_login/productModel/product_model.dart';
import 'package:flutter_login/productProvider/item_bag_provider.dart';
import 'package:flutter_login/productProvider/product_provider.dart';
import 'package:flutter_login/productProvider/selectedChipProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class ProductCardWidget extends ConsumerWidget {
  const ProductCardWidget({
    super.key,
    required this.productIndex,
    required this.filteredProducts,
  });
  final int productIndex;
  final List<ProductModel> filteredProducts;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChip = ref.watch(selectedChipProvider);
    final productWatcher = ref.watch(productProvider);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 4),
        ],
      ),
      // color: Colors.grey,
      margin: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.only(top: 1, bottom: 1, left: 1, right: 1),
              width: 157,
              color: Colors.white,
              child: Image.asset(
                filteredProducts[productIndex].imgUrl,
                fit: BoxFit.fill,
                width: 50,
                height: 50,
              ),
            ),
          ),
          const Gap(4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  filteredProducts[productIndex].title,
                  style: AppTheme.productNameTheme,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  filteredProducts[productIndex].shortDescription,
                  style: AppTheme.descriptionTheme,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rs .${filteredProducts[productIndex].price}',
                      style: AppTheme.priceTheme,
                    ),
                    IconButton(
                        onPressed: () {
                          ref.read(productProvider.notifier).isSelectedProduct(
                              filteredProducts[productIndex].pid, productIndex);
                          if (filteredProducts[productIndex].isSelected ==
                              false) {
                            ref.read(itemBagprovider.notifier).addNewItem(
                                ProductModel(
                                    pid: filteredProducts[productIndex].pid,
                                    imgUrl:
                                        filteredProducts[productIndex].imgUrl,
                                    title: filteredProducts[productIndex].title,
                                    price: filteredProducts[productIndex].price,
                                    shortDescription:
                                        filteredProducts[productIndex]
                                            .shortDescription,
                                    longDescription:
                                        filteredProducts[productIndex]
                                            .longDescription,
                                    reviews:
                                        filteredProducts[productIndex].reviews,
                                    ratings: filteredProducts[productIndex]
                                        .ratings));
                          } else {
                            ref
                                .read(itemBagprovider.notifier)
                                .removeItem(filteredProducts[productIndex].pid);
                          }
                        },
                        icon: Icon(
                          filteredProducts[productIndex].isSelected
                              ? Icons.check_circle
                              : Icons.add_circle,
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
