import 'package:flutter/material.dart';
import 'package:flutter_login/constants/apptheme.dart';
import 'package:gap/gap.dart';

class AdsBannerWidget extends StatelessWidget {
  const AdsBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      // width: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(218, 168, 1, 57),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Cosmetics Store",
                    style: AppTheme.bigText,
                  ),
                  Gap(7),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      "Find cosmetics products and accessories that you are looking for",
                      style: AppTheme.bodyTheme.copyWith(color: Colors.white),
                    ),
                  ),
                  const Gap(4),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {},
                      child: Text("Shop new year"))
                ],
              ),
            ),
          ),
          Image.asset('assets/general/makeup.jpg'),
        ],
      ),
    );
  }
}
