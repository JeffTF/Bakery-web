import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hsu_bakery/constants/color.dart';
import 'package:hsu_bakery/constants/style.dart';
import 'package:hsu_bakery/widgets/custom_button.dart';
import 'package:hsu_bakery/widgets/small_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [KColor.cPrimaryColor, Colors.white],
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //   ),
        // ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Main Intro Image
              Container(
                width: size.width,
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [KColor.cPrimaryColor, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('CELEBRATE'),
                              const SizedBox(
                                height: 12,
                              ),
                              const Text('Your Bithday'),
                              const SizedBox(
                                height: 12,
                              ),
                              const Text('With HSU'),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                  color: KColor.cSecondaryColor,
                                  isShadow: false,
                                  isBorder: false,
                                  onTap: () {},
                                  isDisableTouch: false,
                                  child: Text('Order Now',
                                      style: KStyle.t14TextStyle.copyWith(
                                          color: KColor.cPrimaryColor))),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            'assets/images/main_image.png',
                            fit: BoxFit.contain,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              ///Best Selling Option
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: CustomButton(
                      color: KColor.cPrimaryColor,
                      isShadow: true,
                      isBorder: false,
                      onTap: () {},
                      isDisableTouch: true,
                      child: Text(
                        'Our Best Selling Cakes',
                        style: KStyle.t16TextStyle,
                      ))),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 500,
                  //width: size.width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(120),
                      ),
                      gradient: LinearGradient(
                          colors: [
                            KColor.cPrimaryColor,
                            KColor.cPrimaryColor.withOpacity(0.4)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: const [0.5, 0.5])),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            '6 Inches Birthday Cake',
                            textAlign: TextAlign.center,
                            style: KStyle.t16TextStyle
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Image.asset(
                            'assets/images/cake_1.png',
                            height: 150,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              'Lorem ipsum dolor sit amet consectetur. Hac ultricies rhoncus.',
                              textAlign: TextAlign.center,
                              maxLines: 5,
                              style: KStyle.t12TextStyle,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SmallButton(
                              color: KColor.cSecondaryColor,
                              isShadow: false,
                              isBorder: false,
                              onTap: () {},
                              isDisableTouch: false,
                              child: AutoSizeText(
                                'View',
                                style: KStyle.t12TextStyle
                                    .copyWith(color: KColor.cPrimaryColor),
                              ))
                        ],
                      )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '4 Inches Birthday Cake',
                              textAlign: TextAlign.center,
                              style: KStyle.t16TextStyle
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Lorem ipsum dolor sit amet consectetur. Hac ultricies rhoncus.',
                                    textAlign: TextAlign.center,
                                    maxLines: 6,
                                    style: KStyle.t12TextStyle,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/cake_2.png',
                                      height: 100,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    SmallButton(
                                        color: KColor.cSecondaryColor,
                                        isShadow: false,
                                        isBorder: false,
                                        onTap: () {},
                                        isDisableTouch: false,
                                        child: AutoSizeText(
                                          'View',
                                          style: KStyle.t12TextStyle.copyWith(
                                              color: KColor.cPrimaryColor),
                                        ))
                                  ],
                                )
                              ],
                            ),
                            const Divider(
                              thickness: 0.5,
                            ),
                            Text(
                              '4 Inches Birthday Cake',
                              textAlign: TextAlign.center,
                              style: KStyle.t16TextStyle
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/cake_2.png',
                                      height: 100,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    SmallButton(
                                        color: KColor.cSecondaryColor,
                                        isShadow: false,
                                        isBorder: false,
                                        onTap: () {},
                                        isDisableTouch: false,
                                        child: AutoSizeText(
                                          'View',
                                          style: KStyle.t12TextStyle.copyWith(
                                              color: KColor.cPrimaryColor),
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Flexible(
                                  child: Text(
                                    'Lorem ipsum dolor sit amet consectetur. Hac ultricies rhoncus.',
                                    textAlign: TextAlign.center,
                                    maxLines: 6,
                                    style: KStyle.t12TextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
