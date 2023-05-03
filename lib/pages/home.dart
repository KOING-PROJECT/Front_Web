import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:koing_web_ver/widgets/user_manage.dart';
import 'package:koing_web_ver/widgets/tour_access.dart';

import '../notifier.dart';
import '../widgets/left_side.dart';
import '../widgets/right_side.dart';
import 'package:provider/provider.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffff5f8),
      body: Row(
        children:  [
          LeftSide(),
          context.watch<IndexNotifier>().selectedIndex==1?UserManagement() :context.watch<IndexNotifier>().selectedIndex==7?TourAccess(): RightSide(),
        ],
      ),
    );
  }
}
