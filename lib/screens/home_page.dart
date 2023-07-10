import 'dart:ui';

import 'package:bike_shop/screens/choosing_page.dart';
import 'package:bike_shop/services/colors.dart';
import 'package:bike_shop/services/fonts.dart';
import 'package:bike_shop/services/icons.dart';
import 'package:bike_shop/services/images.dart';
import 'package:bike_shop/services/strings.dart';
import 'package:bike_shop/views/bottom_navbar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/bicycle_container_clipper.dart';
import '../views/categories_view.dart';
import '../views/shopping_cart_clipper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;

    void onTap(){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ChoosingSecondPage(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: CustomColors.oxFF242C3B,
      bottomNavigationBar: const BottomNavBarWidget(),
      extendBodyBehindAppBar: false,
      body: Stack(
        children: [
          /// #Background Half Rectangle
          ClipPath(
            clipper: Clipper(),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(55, 182, 233, 1),
                    Color.fromRGBO(75, 76, 237, 1),
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: y * 0.08),

                /// #HeaderText
                Row(
                  children: [
                    const SizedBox(width: 25),
                    const Text(
                      CustomStrings.chooseYourBike,
                      style: TextStyle(
                        color: CustomColors.oxFFFFFFFF,
                        fontSize: 21,
                        fontFamily: CustomFonts.poppins,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: x * 0.36),
                    Container(
                      alignment: Alignment.center,
                      height: 44,
                      width: 44,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(52, 200, 232, 1),
                            Color.fromRGBO(78, 74, 242, 1),
                          ],
                        ),
                      ),
                      child: const Icon(
                        CupertinoIcons.search,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 18),
                  ],
                ),

                SizedBox(height: y * 0.03),

                /// #BicycleHeaderBanner
                ClipPath(
                  clipper: BicycleContainerClipper(),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 4.6,
                      sigmaY: 4.6,
                    ),
                    child: SizedBox(
                      height: 240,
                      width: 350,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 4.6,
                          sigmaY: 4.6,
                        ),
                        child: Container(
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Image(image: CustomImages.electricBicycle),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: Text(
                                  CustomStrings.off30Percent,
                                  style: TextStyle(
                                    color: CustomColors.oxFFFFFFFF
                                        .withOpacity(0.6000000238418579),
                                    fontSize: 26,
                                    fontFamily: CustomFonts.poppins,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// #Categories
                const SizedBox(height: 10),
                const SizedBox(
                  height: 120,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40,right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// # First Category
                        Align(
                          alignment: Alignment(0.4, -0),
                          child: MyButton(text: CustomStrings.all),
                        ),
                  
                        /// #Second Category
                        Align(
                          alignment: Alignment(0.4, -0.4),
                          child: CategoriesWidget(
                            icon: Image(image: CustomIcons.bicycleBottomNavbar),
                          ),
                        ),
                  
                        /// #Third Category
                        Align(
                          alignment: Alignment(0.4, -0.8),
                          child: CategoriesWidget(
                            icon: Image(image: CustomIcons.union),
                          ),
                        ),
                  
                        /// #Fourth Category
                        Align(
                          alignment: Alignment(0.4, -1.2),
                          child: CategoriesWidget(
                            icon: Image(image: CustomIcons.mountain),
                          ),
                        ),
                  
                        /// #Fifth Category
                        Align(
                          alignment: Alignment(0.4, -1.6),
                          child: CategoriesWidget(
                            icon: Image(image: CustomIcons.helmet),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// #Shopping Carts
                GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 2 / 2.6,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    /// #First Product
                    GestureDetector(
                      onTap: onTap,
                      child: const BicycleCartClipper(
                        image: CustomImages.peugotBicycle,
                        icon: CupertinoIcons.heart,
                        productType: CustomStrings.roadBike,
                        productName: CustomStrings.peugotLR01,
                        productPrice: CustomStrings.price1999,
                        iconColor: CustomColors.oxFF34CAE8,
                      ),
                    ),

                    /// #Second Product
                    const BicycleCartClipper(
                      image: CustomImages.helmet,
                      icon: CupertinoIcons.heart,
                      productType: CustomStrings.roadHelmet,
                      productName: CustomStrings.smithTrade,
                      productPrice: CustomStrings.price120,
                      iconColor: CustomColors.oxFFFFFFFF,
                    ),

                    /// #Third Product
                    const BicycleCartClipper(
                      image: CustomImages.helmet,
                      icon: CupertinoIcons.heart,
                      productType: CustomStrings.roadHelmet,
                      productName: CustomStrings.smithTrade,
                      productPrice: CustomStrings.price120,
                      iconColor: CustomColors.oxFF34CAE8,
                    ),

                    /// #Fourth Product
                    const BicycleCartClipper(
                      image: CustomImages.mikkelBechBicycle,
                      icon: CupertinoIcons.heart,
                      productType: CustomStrings.mountainBike,
                      productName: CustomStrings.pilotChromoly,
                      productPrice: CustomStrings.price1999,
                      iconColor: CustomColors.oxFFFFFFFF,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final x = size.width;
    final y = size.height;
    Path path = Path();
    path.moveTo(0, y);
    path.lineTo(x * 0.75, y * 0.2);
    path.lineTo(x, y * 0.3);
    path.lineTo(x, y);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
