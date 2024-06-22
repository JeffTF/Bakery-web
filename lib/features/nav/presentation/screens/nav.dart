import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsu_bakery/constants/color.dart';
import 'package:hsu_bakery/features/gallery/presentation/screens/gallery.dart';
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
   MainScreen(),
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
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: KColor.cPrimaryColor,
              ),
              onPressed: () {
                drawerKey.currentState!.openDrawer();
              },
            ),
            backgroundColor: KColor.cWhiteColor,
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
