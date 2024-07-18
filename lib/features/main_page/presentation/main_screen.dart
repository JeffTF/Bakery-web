import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hsu_bakery/constants/color.dart';
import 'package:hsu_bakery/constants/style.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final List<String> imgList = [
      'https://as2.ftcdn.net/v2/jpg/08/13/82/09/1000_F_813820953_ARrbTe1yGJzuvtkSuzWelRFOcmoJyE5M.jpg',
      'https://as1.ftcdn.net/v2/jpg/08/13/82/10/1000_F_813821033_AOz1DYWloB5ETEYPXk5e3geBqWZ1KFX7.jpg',
      'https://as2.ftcdn.net/v2/jpg/08/02/39/27/1000_F_802392708_oiIcKJMygoHFEYwaHILOJy4fV13eWbfi.jpg',
      'https://as2.ftcdn.net/v2/jpg/08/02/39/27/1000_F_802392701_qrGfha7ibofKlqImXeNYkcT1BoNl3TqT.jpg',
      'https://t4.ftcdn.net/jpg/08/02/39/19/240_F_802391940_4CWJCw2WblTno5Njhikc5RfRhf8pzA1V.jpg',
      'https://as2.ftcdn.net/v2/jpg/08/02/39/19/1000_F_802391902_iILt5GE4iTgf20vCM6nN5LG5JTHsUl8E.jpg',
      'https://as1.ftcdn.net/v2/jpg/08/13/82/08/1000_F_813820875_nmrH59nvw97bFcQFsbcLrDkKNyaODdWU.jpg',
      'https://as1.ftcdn.net/v2/jpg/08/13/82/10/1000_F_813821049_DuiBXIYrrQLNjnjYZNmedi58r1ephSUd.jpg'
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColor.cPrimaryColor,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120),
          child: Text(
            'Home',
            style: KStyle.t20TextStyle.copyWith(color: KColor.cSecondaryColor),
          ),
        ),
        actions: [
          Container(
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: KColor.cWhiteColor),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  const SizedBox(
                    width: 40,
                  ),
                  Text(
                    'Search',
                    style: KStyle.t14TextStyle
                        .copyWith(color: KColor.cPrimaryColor.withOpacity(0.9)),
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset(
            'assets/icons/cart.svg',
            color: KColor.cSecondaryColor,
          ),
        ],
      ),
      backgroundColor: const Color(0xFF3e2b27),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                    height: size.height / 1.5,
                    width: size.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              'https://as1.ftcdn.net/v2/jpg/07/67/79/98/1000_F_767799840_9aFgeuLp58T0PPe2hSTvNaXVG26LBdbd.jpg',
                            ),
                            fit: BoxFit.cover)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                  const Color.fromARGB(255, 97, 226, 185)),
                              foregroundColor:
                                  WidgetStateProperty.all<Color>(Colors.white),
                            ),
                            onPressed: () => context.go('/category'),
                            child: const Text('View package'),
                          )
                        ],
                      ),
                    )),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Row(
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                              const Color.fromARGB(255, 97, 226, 185)
                                  .withOpacity(0.2)),
                          foregroundColor:
                              WidgetStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () => context.go('/category'),
                        child: const Text('Home'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                              const Color.fromARGB(255, 97, 226, 185)
                                  .withOpacity(0.2)),
                          foregroundColor:
                              WidgetStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () => context.go('/category'),
                        child: const Text('About us'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                              const Color.fromARGB(255, 97, 226, 185)
                                  .withOpacity(0.2)),
                          foregroundColor:
                              WidgetStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () => context.go('/category'),
                        child: const Text('Our Service'),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: size.width,
              height: size.height / 2,
              decoration: const BoxDecoration(
                  // gradient: LinearGradient(
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  //   colors: [
                  //     Color(0xFF87CEEB), // Light Sky Blue
                  //     Color(0xFF00BFFF), // Deep Sky Blue
                  //     Color(0xFF1E90FF), // Dodger Blue
                  //     Color(0xFF000080), // Navy
                  //   ],
                  //   stops: [0.0, 0.3, 0.7, 1.0], // Adjusting the gradient stops
                  // ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 350.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  viewportFraction: 0.7,
                ),
                items: imgList
                    .map((item) => Container(
                          margin: const EdgeInsets.all(5),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            child: CachedNetworkImage(
                              imageUrl: item,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Center(child: Icon(Icons.error)),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
