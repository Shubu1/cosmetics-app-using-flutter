import 'package:flutter/material.dart';
import 'package:flutter_login/WelcomePage.dart';
import 'package:flutter_login/cartPage.dart';
import 'package:flutter_login/constants/apptheme.dart';
import 'package:flutter_login/detailsPage.dart';
import 'package:flutter_login/location.dart';
import 'package:flutter_login/notification.dart';
import 'package:flutter_login/productProvider/item_bag_provider.dart';
import 'package:flutter_login/productProvider/product_provider.dart';
import 'package:flutter_login/productProvider/selectedChipProvider.dart';
import 'package:flutter_login/widgets/adsBannerWidget.dart';
import 'package:flutter_login/widgets/cardwidget.dart';
import 'package:flutter_login/widgets/chipwidget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class NewPage extends ConsumerWidget {
  const NewPage({super.key, required this.userData});
  final String userData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final itemBage = ref.watch(itemBagprovider);
    final productWatcher = ref.watch(productProvider);
    final selectedChip = ref.watch(selectedChipProvider);
    final filterProducts = productWatcher.where((product) {
      if (selectedChip == 'All') {
        return true;
      } else {
        return product.title.contains(selectedChip);
      }
    }).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: SvgPicture.asset(
            'assets/general/store_brand_white.svg',
            color: Colors.white,
            width: 180,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 10),
            child: Badge(
                label: Text(itemBage.length.toString()),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CardPage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      size: 22,
                    ))),
          ),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(
              // top: 60.0,
              ),
          child: Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 233, 246, 233),
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.only(top: 90.0),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.green,
                      backgroundImage: NetworkImage(
                        'https://randomuser.me/api/portraits/men/1.jpg',
                      ),
                    ),
                    title: Text(
                      ' ${userData}',
                      style: AppTheme.bodyTheme
                          .copyWith(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: ListTile(
                  leading: IconButton(
                    icon: const Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  title: Text(
                    'Home',
                    style: AppTheme.bodyTheme.copyWith(color: Colors.black),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CardPage()));
                },
                child: ListTile(
                  leading: IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  title: Text(
                    'Carts',
                    style: AppTheme.bodyTheme.copyWith(color: Colors.black),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocationPage()));
                },
                child: ListTile(
                  leading: IconButton(
                    icon: const Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  title: Text(
                    'Location',
                    style: AppTheme.bodyTheme.copyWith(color: Colors.black),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/notification');
                },
                child: ListTile(
                  leading: IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  title: Text(
                    'Notifications',
                    style: AppTheme.bodyTheme.copyWith(color: Colors.black),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => WelcomePage(userData: userData)));
                },
                child: ListTile(
                  leading: IconButton(
                    icon: const Icon(
                      Icons.people,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  title: Text(
                    'Profile',
                    style: AppTheme.bodyTheme.copyWith(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              //ads banner section
              const AdsBannerWidget(),
              //chip section
              SizedBox(
                  height: 60,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ref
                                .read(selectedChipProvider.notifier)
                                .updateState('All');
                          },
                          child: const ChipWidget(
                            chipLabel: 'All',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ref
                                .read(selectedChipProvider.notifier)
                                .updateState('Foundation');
                          },
                          child: const ChipWidget(
                            chipLabel: 'Foundation',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ref
                                .read(selectedChipProvider.notifier)
                                .updateState('Lipstick');
                          },
                          child: const ChipWidget(
                            chipLabel: 'Lipstick',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ref
                                .read(selectedChipProvider.notifier)
                                .updateState('Sunscreen');
                          },
                          child: const ChipWidget(
                            chipLabel: 'Sunscreen',
                          ),
                        )
                      ])),
              const Gap(12),
              //hot sales section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hot Sales',
                    style: AppTheme.hotsaleTheme,
                  ),
                  Text(
                    'See All',
                    style: AppTheme.seeAllTextTheme,
                  )
                ],
              ),
              const Gap(12),
              Container(
                padding: const EdgeInsets.all(12),
                color: Colors.white,
                width: double.infinity,
                height: 280,
                child: ListView.builder(
                  //3
                  itemCount: filterProducts.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              getIndex: index,
                            ),
                          )),
                      child: ProductCardWidget(
                          productIndex: index,
                          filteredProducts: filterProducts)),
                ), // color: Colors.grey,
              ),
              //feature product section
              const Gap(14),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured Products',
                    style: AppTheme.hotsaleTheme,
                  ),
                  Text(
                    'See All',
                    style: AppTheme.seeAllTextTheme,
                  )
                ],
              ),
              MasonryGridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filterProducts.length,
                  // products.length,
                  shrinkWrap: true,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                getIndex: index,
                              ),
                            )),
                        child: SizedBox(
                          height: 250,
                          child: ProductCardWidget(
                            productIndex: index,
                            filteredProducts: filterProducts,
                          ),
                        ),
                      ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int value) {
          ref.read(currentIndexProvider.notifier).update((state) => value);
          switch (value) {
            case 0:
              // Navigator.of(context).pop();
              break;
            case 1:
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CardPage()));
              break;
            case 2:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LocationPage()));
              break;
            case 3:
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NotificationPage()));
              break;
            case 4:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WelcomePage(userData: userData)));
              break;
          }
        },
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              activeIcon: Icon(
                Icons.home_filled,
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Favorite',
              activeIcon: Icon(Icons.favorite)),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label: 'Location',
              activeIcon: Icon(Icons.location_on)),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              label: 'Notification',
              activeIcon: Icon(Icons.notifications)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
              activeIcon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
