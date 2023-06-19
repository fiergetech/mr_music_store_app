import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mr_music_store_app/users/fragments/favourites_fragment_screen.dart';
import 'package:mr_music_store_app/users/fragments/home_fragment_screen.dart';
import 'package:mr_music_store_app/users/fragments/order_fragment_screen.dart';
import 'package:mr_music_store_app/users/fragments/profile_fragment_screen.dart';
import 'package:mr_music_store_app/users/userPreferences/current_user.dart';

class DashboardOfFragments extends StatelessWidget {
  CurrentUser _rememberCurrentUser = Get.put(CurrentUser());

  List<Widget> _fragmentScreen = [
    HomeFragmentScreen(),
    FavouritesFragmentScreen(),
    OrderFragmentScreen(),
    ProfileFragmentScreen(),
  ];

  List _navigationButtonsProperties = [
    {
      "active_icon": Icons.home,
      "nonactive_icon": Icons.home_outlined,
      "label": "Home",
    },
    {
      "active_icon": Icons.favorite,
      "nonactive_icon": Icons.favorite_outline,
      "label": "Favourites",
    },
    {
      "active_icon": FontAwesomeIcons.boxOpen,
      "nonactive_icon": FontAwesomeIcons.box,
      "label": "Order",
    },
    {
      "active_icon": Icons.person,
      "nonactive_icon": Icons.person_outline,
      "label": "Order",
    },
  ];

  RxInt _indexNumber = 0.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentUser(),
      initState: (currentState) {
        _rememberCurrentUser.getUserInfo();
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(240, 240, 240, 1),
          body: SafeArea(
            child: Obx(() => _fragmentScreen[_indexNumber.value]),
          ),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              currentIndex: _indexNumber.value,
              onTap: (value) {
                _indexNumber.value = value;
              },
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: Color.fromRGBO(59, 89, 167, 1),
              unselectedItemColor: Colors.grey,
              items: List.generate(4, (index) {
                var navBtnProperty = _navigationButtonsProperties[index];
                return BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(navBtnProperty["nonactive_icon"]),
                  activeIcon: Icon(navBtnProperty["active_icon"]),
                  label: navBtnProperty["label"],
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
