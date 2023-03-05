import 'dart:ui';
import 'package:flutter/material.dart';
import '../global.dart';

class LeftSide extends StatefulWidget {
  const LeftSide({super.key});

  @override
  State<LeftSide> createState() => _LeftSideState();
}

class _LeftSideState extends State<LeftSide> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.white,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          }, scrollbars: false),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Column(
                  children: [
                    Image.asset("assets/icons/KOING Logo_GRD.png",width: 50,),
                    Image.asset("assets/icons/Admin.png",scale: 4,),
                  ],
                ),
SizedBox(height: 500,),
                Column(children: [
                  Container(
                    height: 30,
                    // color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.home,
                          color: Colors.black,
                          size: 28,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Feed",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 30,
                    // color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.search_outlined,
                          color: Colors.black54,
                          size: 28,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Explore",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 30,
                    // color: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.video_library_outlined,
                          color: Colors.black54,
                          size: 28,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Reels",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 30,
                    // color: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.settings_outlined,
                          color: Colors.black54,
                          size: 28,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 30,
                    // color: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.logout_outlined,
                          color: Colors.black54,
                          size: 28,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],)


              ],
            ),
          ),
        ),
      ),
    );
  }
}
