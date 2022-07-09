import 'package:flutter/material.dart';

enum TabItem { home, journal, chat, profile }

class TabItemData {
  const TabItemData(
      {required this.title,
        required this.icon,
        required this.activeIcon,
        required this.color});
  final String title;
  final String icon;
  final String activeIcon;
  final Color color;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.home: TabItemData(
      color: Colors.black,
      title: '',
      icon: 'assets/images/home-icon-outline-new.svg',
      activeIcon: 'assets/images/home-full-outline.svg',
    ),
    TabItem.journal: TabItemData(
      color: Colors.black,
      title: '',
      icon: 'assets/images/journal-icon-white-new.svg',
      activeIcon: 'assets/images/edit-full-outline.svg',
    ),
    TabItem.chat: TabItemData(
      color: Colors.black,
      title: '',
      icon: 'assets/images/chat-icon-white-new.svg',
      activeIcon: 'assets/images/chat-full-outline.svg',
    ),
    TabItem.profile: TabItemData(
      color: Colors.black,
      title: '',
      icon: 'assets/images/profile-icon-white-new.svg',
      activeIcon: 'assets/images/profile-full-outline.svg',
    ),
  };
}
