import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
MyTabBar(TabController tabController, BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60),
    child: TabBar(
      indicatorWeight: 4,
      indicatorSize: TabBarIndicatorSize.label,
      controller: tabController,
      labelStyle: Theme.of(context).textTheme.bodyLarge,
      unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
      tabs: [Text("Chats"), Text("Groups"), Text("Calls")],
    ),
  );
}
