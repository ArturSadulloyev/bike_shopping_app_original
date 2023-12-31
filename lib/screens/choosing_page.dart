import 'package:flutter/material.dart';

import '../services/colors.dart';
import '../services/fonts.dart';
import '../services/images.dart';
import '../services/strings.dart';
import '../views/app_bar_view.dart';
import '../views/bottom_add_to_cart_view.dart';
import '../views/button_bottom_sheet.dart';

class ChoosingSecondPage extends StatefulWidget {
  const ChoosingSecondPage({Key? key}) : super(key: key);

  @override
  State<ChoosingSecondPage> createState() => _ChoosingSecondPageState();
}

class _ChoosingSecondPageState extends State<ChoosingSecondPage> {
  String activeButton = '';
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: CustomColors.oxFF242C3B,

      /// #BottomSheet
      bottomSheet: Container(
        height: 110,
        decoration: const ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.38, -0.93),
            end: Alignment(-0.38, 0.93),
            colors: [CustomColors.oxFF353F53, CustomColors.oxFF212734],
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.5),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 60,
              offset: Offset(0, -20),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            /// #First Button
            GestureDetector(
              onTap: () {
                activeButton = CustomStrings.description;
                setState(() {});
                showModalBottomSheet(
                  context: context,
                  builder: (ctx) {
                    return Container(
                      height: 450,
                      width: 50,
                      color: const Color(0xFF242C3B),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  activeButton = CustomStrings.description;
                                  setState(() {});
                                },
                                child: ButtonBottomSheet(
                                  text: CustomStrings.description,
                                  isActive:
                                      activeButton == CustomStrings.description,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  activeButton = CustomStrings.specification;
                                  setState(() {});
                                },
                                child: ButtonBottomSheet(
                                  text: CustomStrings.specification,
                                  isActive: activeButton ==
                                      CustomStrings.specification,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),

                          /// #BottomSheet Content
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              activeButton = CustomStrings.peugotDescription,
                              style: TextStyle(
                                color: CustomColors.oxFFFFFFFF
                                    .withOpacity(0.6000000238418579),
                                fontSize: 15,
                                fontFamily: CustomFonts.poppins,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ),
                          SizedBox(height: y * 0.047),
                          const BottomAddToCartButton(),
                        ],
                      ),
                    );
                  },
                );
              },
              child: ButtonBottomSheet(
                text: CustomStrings.description,
                isActive: activeButton == CustomStrings.description,
              ),
            ),

            /// #Second Button
            GestureDetector(
              onTap: () {
                activeButton = CustomStrings.specification;
                setState(() {});
                showModalBottomSheet(
                  context: context,
                  builder: (ctx) {
                    return Container(
                      height: 400,
                      width: 50,
                      color: const Color(0xFF242C3B),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  activeButton = CustomStrings.description;
                                  setState(() {});
                                },
                                child: ButtonBottomSheet(
                                  text: CustomStrings.description,
                                  isActive:
                                      activeButton == CustomStrings.description,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  activeButton = CustomStrings.specification;
                                  setState(() {});
                                },
                                child: ButtonBottomSheet(
                                  text: CustomStrings.specification,
                                  isActive: activeButton ==
                                      CustomStrings.specification,
                                ),
                              ),
                            ],
                          ),

                          /// #BottomSheet Content
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              activeButton == CustomStrings.description
                                  ? CustomStrings.peugotDescription
                                  : activeButton == CustomStrings.specification
                                      ? CustomStrings.peugotSpecification
                                      : '',
                              style: TextStyle(
                                color: CustomColors.oxFFFFFFFF
                                    .withOpacity(0.6000000238418579),
                                fontSize: 15,
                                fontFamily: CustomFonts.poppins,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ),
                          const BottomAddToCartButton(),
                        ],
                      ),
                    );
                  },
                );
              },
              child: ButtonBottomSheet(
                text: CustomStrings.specification,
                isActive: activeButton == CustomStrings.specification,
              ),
            ),
          ],
        ),
      ),

      /// #BODY
      body:  Stack(
        children: [
          /// #BackgroundRectangleFull
          Align(
            alignment: Alignment(1, 0),
            child: ClipPath(
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
          ),
          Column(
            children: [
              /// # AppBar
              CustomAppBar(text: CustomStrings.peugotLR01),
              /// #Bicycle Picture
              Center(
                heightFactor: 1,
                child: Image(
                  image: CustomImages.peugotBicycle,
                  width: 388.90,
                  height: 289.58,
                ),
              ),
            ],
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
    path.lineTo(x - 80, 0);
    path.lineTo(x,0);
    path.lineTo(x,y);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}