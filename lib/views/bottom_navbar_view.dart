import 'dart:ui';

import 'package:bike_shop/screens/checkout_page.dart';
import 'package:bike_shop/screens/shopping_cart_page.dart';
import 'package:flutter/material.dart';

import '../services/icons.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onPressedCheckOutPage() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const CheckoutPage(),
        ),
      );
    }

    void onPressedShoppingCartPage() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ShoppingCartPage(),
        ),
      );
    }

    return ClipPath(
      clipper: BottomNavigationBarClipper(),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4.6,
          sigmaY: 4.6,
        ),
        child: SizedBox(
          height: 90,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 4.6,
              sigmaY: 4.6,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.14),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        offset: Offset(0, 4),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(),
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {},
                          minWidth: 10,
                          child: const Image(
                            image: CustomIcons.bicycleBottomNavbar,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          onPressed: onPressedCheckOutPage,
                          minWidth: 10,
                          child: const Image(
                            image: CustomIcons.mapBottomNavbar,
                            height: 19,
                            width: 18,
                          ),
                        ),
                      ),
                      // const SizedBox(width: 10),
                      Expanded(
                        child: MaterialButton(
                          minWidth: 10,
                          onPressed: onPressedShoppingCartPage,
                          child: const Image(
                            image: CustomIcons.cartBottomNavbar,
                            height: 19,
                            width: 18,
                          ),
                        ),
                      ),
                      // const SizedBox(width: 10),
                      Expanded(
                        child: MaterialButton(
                          minWidth: 10,
                          onPressed: () {},
                          child: const Image(
                            image: CustomIcons.personBottomNavbar,
                            height: 19,
                            width: 18,
                          ),
                        ),
                      ),
                      // const SizedBox(width: 10),
                      Expanded(
                        child: MaterialButton(
                          minWidth: 10,
                          onPressed: () {},
                          child: const Image(
                            image: CustomIcons.docTextBottomNavbar,
                            height: 19,
                            width: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavigationBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double y = size.height;
    double x = size.width;
    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(x, 0)
      ..lineTo(x, y)
      ..lineTo(0, y)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      this != oldClipper;
}
