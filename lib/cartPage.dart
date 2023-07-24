import 'package:flutter/material.dart';
import 'package:flutter_login/constants/apptheme.dart';
import 'package:flutter_login/esewaPayment/esewaClass.dart';
import 'package:flutter_login/productProvider/item_bag_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
//import 'package:flutter_stripe/flutter_stripe.dart';

class CardPage extends ConsumerWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemBag = ref.watch(itemBagprovider);
    if (itemBag.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('My Cart'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
          child: Container(
            height: 100,
            width: 400,
            child: Card(
              child: Column(
                children: [
                  Text(
                    "No Items",
                    style: AppTheme.bigText.copyWith(color: Colors.black),
                  ),
                  const Gap(10),
                  Text(
                    'No items added in the cart',
                    style: AppTheme.bodyTheme.copyWith(
                        color: Colors.black, fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('My Cart'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView.builder(
                      itemCount: itemBag.length,
                      itemBuilder: (context, index) => Card(
                            child: Container(
                              color: Colors.white,
                              width: double.infinity,
                              height: 120,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Image.asset(itemBag[index].imgUrl),
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              itemBag[index].title,
                                              style: AppTheme.bigText.copyWith(
                                                  color: Colors.black),
                                            ),
                                            const Gap(6),
                                            Text(
                                              itemBag[index].shortDescription,
                                              style: AppTheme.bodyTheme
                                                  .copyWith(
                                                      color: Colors.blueGrey),
                                            ),
                                            const Gap(4),
                                            Text(
                                              ('${itemBag[index].price}'),
                                              style: AppTheme.bodyTheme
                                                  .copyWith(
                                                      color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          )),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Have a cupon code? enter here'),
                      const Gap(12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 1,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'FDS2023',
                                style: AppTheme.bigText
                                    .copyWith(color: Colors.black),
                              ),
                              Container(
                                child: Row(children: [
                                  Text(
                                    'Available',
                                    style: AppTheme.bodyTheme.copyWith(
                                        color: const Color.fromARGB(
                                            255, 179, 17, 71)),
                                  ),
                                  const Gap(5),
                                  Icon(Icons.check_circle),
                                ]),
                              ),
                            ]),
                      ),
                      const Gap(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Subtotal:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Rs. ${ref.watch(priceCalcProvider)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Fee:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Free',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Discount:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'No Discount',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 137, 9, 52),
                            ),
                          ),
                          Text(
                            'Rs . ${ref.watch(priceCalcProvider)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 121, 12, 48),
                            ),
                          ),
                        ],
                      ),
                      const Gap(12),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.pink,
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                )),
                            onPressed: () {
                              Esewa esewa = Esewa();
                              esewa.pay();
                            },
                            child: const Text('Pay via Esewa')),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
