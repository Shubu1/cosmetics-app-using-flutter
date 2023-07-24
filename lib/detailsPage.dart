import 'package:flutter/material.dart';
import 'package:flutter_login/constants/apptheme.dart';
import 'package:flutter_login/productModel/product_model.dart';
import 'package:flutter_login/productProvider/item_bag_provider.dart';
import 'package:flutter_login/productProvider/product_provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class DetailsPage extends ConsumerWidget {
  DetailsPage({super.key, required this.getIndex});
  final int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final product = ref.watch(productProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Details Page'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.local_mall)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.blue.shade100,
              child: Image.asset(
                product[getIndex].imgUrl,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product[getIndex].title,
                    style: AppTheme.bigText
                        .copyWith(color: const Color.fromARGB(255, 138, 7, 51)),
                  ),
                  const Gap(12),
                  Row(
                    children: [
                      RatingBar(
                        itemSize: 28,
                        initialRating: 3.5,
                        minRating: 1,
                        maxRating: 5,
                        allowHalfRating: true,
                        ratingWidget: RatingWidget(
                            full: const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            half: const Icon(
                              Icons.star_half_sharp,
                              color: Colors.amber,
                            ),
                            empty: const Icon(
                              Icons.star_border,
                              color: Colors.amber,
                            )),
                        onRatingUpdate: (value) => null,
                      ),
                      const Gap(12),
                      const Text(
                        '96 review',
                        style: AppTheme.productNameTheme,
                      ),
                    ],
                  ),
                  const Gap(12),
                  Text(
                    product[getIndex].longDescription,
                    style: AppTheme.bodyTheme.copyWith(color: Colors.black),
                  ),
                  const Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rs .${product[getIndex].price * product[getIndex].qty.toDouble()}',
                        style: AppTheme.bigText.copyWith(
                            color: const Color.fromARGB(255, 121, 8, 45)),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  ref
                                      .read(productProvider.notifier)
                                      .decreaseQty(product[getIndex].pid);
                                },
                                icon: const Icon(
                                  Icons.do_disturb_on_outlined,
                                  size: 28,
                                )),
                            Text(
                              product[getIndex].qty.toString(),
                              style: AppTheme.bigText
                                  .copyWith(fontSize: 24, color: Colors.black),
                            ),
                            IconButton(
                              onPressed: () {
                                ref
                                    .read(productProvider.notifier)
                                    .incrementQty(product[getIndex].pid);
                              },
                              icon: const Icon(
                                Icons.add_circle_outline,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  SizedBox(
                    height: 50,
                    width: 400,
                    child: ElevatedButton(
                      onPressed: () {
                        ref
                            .read(productProvider.notifier)
                            .isSelectedProduct(product[getIndex].pid, getIndex);
                        if (product[getIndex].isSelected == false) {
                          ref.read(itemBagprovider.notifier).addNewItem(
                              ProductModel(
                                  pid: product[getIndex].pid,
                                  imgUrl: product[getIndex].imgUrl,
                                  title: product[getIndex].title,
                                  price: product[getIndex].price.toDouble() *
                                      product[getIndex].qty.toDouble(),
                                  shortDescription:
                                      product[getIndex].shortDescription,
                                  longDescription:
                                      product[getIndex].longDescription,
                                  reviews: product[getIndex].reviews,
                                  ratings: product[getIndex].ratings));
                        } else {
                          ref
                              .read(itemBagprovider.notifier)
                              .removeItem(product[getIndex].pid);
                        }
                        var snackBar = const SnackBar(
                          content: Text('Item Added Successfully'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 116, 9, 44),
                          foregroundColor: Colors.white),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart),
                          Gap(8),
                          Text("Add Item To Cart"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
