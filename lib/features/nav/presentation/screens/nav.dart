import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsu_bakery/constants/color.dart';
import 'package:hsu_bakery/constants/style.dart';
import 'package:hsu_bakery/features/gallery/presentation/screens/gallery.dart';
import 'package:hsu_bakery/features/main_page/presentation/main_page.dart';
import 'package:hsu_bakery/features/main_page/presentation/main_screen.dart';
import 'package:hsu_bakery/features/nav/presentation/bloc/navigation_cubit.dart';
import 'package:hsu_bakery/features/nav/presentation/screens/sidebar_menu.dart';
import 'package:hsu_bakery/services/responsive.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  String _currentPage = 'Home';

  int currentIndex = 0;

  List<Widget> tabs = const [
    MainPage(),
    MainScreen(),
  ];

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocListener<NavigationCubit, NavigationState>(
      listener: (context, state) {
        if (state is NavigationHome) {
          setState(() {
            _currentPage = "Home";
            currentIndex = 0;
          });
        } else if (state is NavigationAbout) {
          setState(() {
            _currentPage = "About";
            currentIndex = 1;
          });
        }
      },
      child: Responsive(
        mobile: Scaffold(
          key: drawerKey,
          appBar: AppBar(
            //toolbarHeight: 80,
            leading: GestureDetector(
              child: Image.asset(
                'assets/images/bakery_logo.png',
                fit: BoxFit.cover,
                height: 60,
              ),
              onTap: () {
                drawerKey.currentState!.openDrawer();
              },
            ),
            backgroundColor: KColor.cPrimaryColor,
            title: Text(
              "Hsu's",
              style: KStyle.t20TextStyle.copyWith(fontWeight: FontWeight.w600),
            ),
            actions: [
              Text(
                'Menu',
                style: KStyle.t20TextStyle,
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                width: size.width * 0.2,
                decoration: BoxDecoration(
                    color: KColor.cWhiteColor,
                    border: Border.all(width: 0.1),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              const Icon(Icons.shopping_cart_outlined),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
          drawer: SideMenu(
            activePage: _currentPage,
          ),
          body: IndexedStack(
            index: currentIndex,
            children: tabs,
          ),
        ),
        desktop: Scaffold(
          body: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: SideMenu(
                    activePage: _currentPage,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: IndexedStack(
                    index: currentIndex,
                    children: tabs,
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
