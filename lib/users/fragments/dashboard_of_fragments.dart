import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_music_store_app/users/userPreferences/current_user.dart';

class DashboardOfFragments extends StatelessWidget {
  CurrentUser _rememberCurrentUser = Get.put(CurrentUser());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentUser(),
      initState: (currentState) {
        _rememberCurrentUser.getUserInfo();
      },
      builder: (controller) {
        return Scaffold();
      },
    );
  }
}
