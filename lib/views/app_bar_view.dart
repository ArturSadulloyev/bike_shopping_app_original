import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/colors.dart';
import '../services/fonts.dart';
import '../services/icons.dart';

class CustomAppBar extends StatelessWidget {
  final String text;

  const CustomAppBar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Row(
        children: [
          const SizedBox(width: 15),
          Transform.scale(
            scale: 3,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                      alignment: Alignment.center,
                      height: 16,
                      width: 16,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
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
                       Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 7,
                      ),
                    ),
            ),
          ),
          SizedBox(width: x * 0.15),
          Text(
            text,
            style: const TextStyle(
              color: CustomColors.oxFFFFFFFF,
              fontSize: 20,
              fontFamily: CustomFonts.poppins,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.30,
            ),
          ),
        ],
      ),
    );
  }
}
