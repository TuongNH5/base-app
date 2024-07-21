import 'package:baseapp/app/main/home_screen.dart';
import 'package:baseapp/app/main/notification_screen.dart';
import 'package:baseapp/app/main/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:myutils/base/view/bottom_nav_bar_item.dart';
import 'package:myutils/helpers/extension/icon_extension.dart';



final List<BottomNavBarItem> tabs = [
  BottomNavBarItem(
    icon: ColorFiltered(
        colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.srcIn),
        child: MyAppIcon.iconNamedSupplier(iconName: "account.svg", width: 24)),
    activeIcon: ColorFiltered(
        colorFilter: const ColorFilter.mode(Colors.green, BlendMode.srcIn),
        child: MyAppIcon.iconNamedSupplier(iconName: "account.svg", width: 24)),
    label: 'Home',
    initialLocation: HomeScreen.route,
  ),
  BottomNavBarItem(
    icon: ColorFiltered(
        colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.srcIn),
        child: MyAppIcon.iconNamedSupplier(iconName: "account.svg", width: 24)),
    activeIcon: ColorFiltered(
        colorFilter: const ColorFilter.mode(Colors.green, BlendMode.srcIn),
        child: MyAppIcon.iconNamedSupplier(iconName: "list-booking.svg", width: 24)),
    label: 'Notification',
    initialLocation: NotificationScreen.route,
  ),
  BottomNavBarItem(
    icon: ColorFiltered(
        colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.srcIn),
        child: MyAppIcon.iconNamedSupplier(iconName: "account.svg", width: 24)),
    activeIcon: ColorFiltered(
        colorFilter: const ColorFilter.mode(Colors.green, BlendMode.srcIn),
        child: MyAppIcon.iconNamedSupplier(iconName: "account.svg", width: 24)),
    label: 'Profile',
    initialLocation: ProfileScreen.route,
  ),
];
