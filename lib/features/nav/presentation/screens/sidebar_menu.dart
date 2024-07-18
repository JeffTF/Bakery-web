import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hsu_bakery/constants/color.dart';
import 'package:hsu_bakery/constants/style.dart';
import 'package:hsu_bakery/features/nav/presentation/bloc/navigation_cubit.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key, required this.activePage});

  final String activePage;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    String activePage = widget.activePage;
    return Drawer(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      backgroundColor: KColor.cPrimaryColor,
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset(
              'assets/images/bakery_logo.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          DrawerListTile(
              activePage: activePage,
              title: "Home",
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
                color: activePage == "Home"
                    ? KColor.cSecondaryColor
                    : KColor.cWhiteColor,
              ),
              onPressed: () {
                BlocProvider.of<NavigationCubit>(context)
                    .changeTo(NavigationHome());
              }),
          DrawerListTile(
              activePage: activePage,
              title: "About",
              icon: SvgPicture.asset(
                "assets/icons/admin_chat.svg",
                color: activePage == "About"
                    ? KColor.cSecondaryColor
                    : KColor.cWhiteColor,
              ),
              onPressed: () {
                BlocProvider.of<NavigationCubit>(context)
                    .changeTo(NavigationAbout());
              }),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Eat Good, Live Good",
              style: KStyle.t20TextStyle,
            ),
          )
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.activePage,
    required this.icon,
    required this.onPressed,
  });

  final String title, activePage;
  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: activePage == title ? KColor.cPrimaryColor : null),
      child: ListTile(
        selected: activePage == title,
        selectedColor: KColor.c48GreyColor,
        iconColor: KColor.cSecondaryColor,
        onTap: onPressed,
        horizontalTitleGap: 0.0,
        leading: icon,
        title: Text(
          title,
          style: KStyle.t12TextStyle.copyWith(
            color:
                activePage == title ? KColor.cTextColor : KColor.c48GreyColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
