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
    return Container(
      width: 200,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 80),
          Column(
            children: [
              Image.asset("assets/icons/KOING Logo_GRD.png",width: 70,),
              Image.asset("assets/icons/Admin.png",scale: 4,),
            ],
          ),
SizedBox(height: 50,),
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
                    "대시보드",
                    style: TextStyle(
                      color: Color(0xfff63c6e),
                      fontSize: 18,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w600,
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
                    "유저 관리", style: TextStyle(
                      color: Color(0xfff63c6e),
                fontSize: 18,
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w600,
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
                    "탐험 관리",
                    style: TextStyle(
                      color: Color(0xfff63c6e),
                      fontSize: 18,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w600,
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
                    "채팅 관리",
                    style: TextStyle(
                      color: Color(0xfff63c6e),
                      fontSize: 18,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 600),
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
    );
  }
}
