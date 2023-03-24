import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserManagement extends StatefulWidget {
  const UserManagement({super.key});

  @override
  State<UserManagement> createState() => UserManagementState();
}

class UserManagementState extends State<UserManagement> {
  final TextEditingController _nameSearchController = TextEditingController();


  @override
  void dispose() {
    _nameSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //flex: 7,
      child: Column(
        children: [
          appBar(),
          Expanded(
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
                    //story(),
                    container2(),
                    //feed(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  SizedBox container2() {
    return SizedBox(
      height: 700,
      child:

      ListView(scrollDirection:Axis.horizontal,children: [
        const SizedBox(width: 80,),

        Container( width: 1504,
          height: 800,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Container(
                  height: 100,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.check_box_outline_blank_rounded,size: 18,),
                          Container(width: 230,child: Text(
                            "이름",
                            style: TextStyle(
                              color: Color(0xff1f1f1f),
                              fontSize: 17,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.start,
                          ),),
                          Container(
                            width:100,
                            child: Row(
                              children: [
                                Text(
                                  "모드",
                                  style: TextStyle(
                                    color: Color(0xff1f1f1f),
                                    fontSize: 17,
                                    fontFamily: "Pretendard",
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(width: 10,),
                                InkWell(onTap: (){

                                },child: Icon(Icons.keyboard_arrow_down_rounded,size: 18,),)
                              ],
                            ),
                          ),
                          Container(
                            width:100,
                            child: Row(
                              children: [
                                Text(
                                  "등급",
                                  style: TextStyle(
                                    color: Color(0xff1f1f1f),
                                    fontSize: 17,
                                    fontFamily: "Pretendard",
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(width: 10,),
                                InkWell(onTap: (){

                                },child: Icon(Icons.keyboard_arrow_down_rounded,size: 18,),)
                              ],
                            ),
                          ),
                          Container(
                            width:100,
                            child: Row(
                              children: [
                                Text(
                                  "국적",
                                  style: TextStyle(
                                    color: Color(0xff1f1f1f),
                                    fontSize: 17,
                                    fontFamily: "Pretendard",
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(width: 10,),
                                InkWell(onTap: (){

                                },child: Icon(Icons.keyboard_arrow_down_rounded,size: 18,),)
                              ],
                            ),
                          ),
                          Container(
                            width:100,
                            child: Row(
                              children: [
                                Text(
                                  "가입 일자",
                                  style: TextStyle(
                                    color: Color(0xff1f1f1f),
                                    fontSize: 17,
                                    fontFamily: "Pretendard",
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(width: 10,),
                                InkWell(onTap: (){

                                },child: Icon(Icons.keyboard_arrow_down_rounded,size: 18,),)
                              ],
                            ),
                          ),
                          Container(
                            width:100,
                            child: Row(
                              children: [
                                Text(
                                  "탐험 진행",
                                  style: TextStyle(
                                    color: Color(0xff1f1f1f),
                                    fontSize: 17,
                                    fontFamily: "Pretendard",
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(width: 10,),
                                InkWell(onTap: (){

                                },child: Icon(Icons.keyboard_arrow_down_rounded,size: 18,),)
                              ],
                            ),
                          ),  Container(
                            width:100,
                            child: Row(
                              children: [
                                Text(
                                  "상태",
                                  style: TextStyle(
                                    color: Color(0xff1f1f1f),
                                    fontSize: 17,
                                    fontFamily: "Pretendard",
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(width: 10,),
                                InkWell(onTap: (){

                                },child: Icon(Icons.keyboard_arrow_down_rounded,size: 18,),)
                              ],
                            ),
                          ),
                          Container(
                            width:110,
                            child: Row(
                              children: [
                                Text(
                                  "접수된 신고",
                                  style: TextStyle(
                                    color: Color(0xff1f1f1f),
                                    fontSize: 17,
                                    fontFamily: "Pretendard",
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(width: 10,),
                                InkWell(onTap: (){

                                },child: Icon(Icons.keyboard_arrow_down_rounded,size: 18,),)
                              ],
                            ),
                          ),



                          Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xfff63c6e),
                            ),
                            padding: const EdgeInsets.only(top: 12, bottom: 11, ),
                            child: Center(
                              child: Text(
                                "유저 조치",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: "Pretendard",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          )
                        ],),
                      Divider(color: Colors.black26,thickness: 0.5,height: 20,)
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.check_box_outline_blank_rounded,size: 18,),
                          Container(width: 230,child: Text(
                            "강지수",
                            style: TextStyle(
                              color: Color(0xff1f1f1f),
                              fontSize: 17,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.start,
                          ),),
                          Container(width: 100,child: Text(
                            "마스터",
                            style: TextStyle(
                              color: Color(0xff1f1f1f),
                              fontSize: 17,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.start,
                          ),),Container(width: 100,child: Text(
                            "Beginner",
                            style: TextStyle(
                              color: Color(0xff1f1f1f),
                              fontSize: 17,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.start,
                          ),),Container(width: 100,child: Text(
                            "한국",
                            style: TextStyle(
                              color: Color(0xff1f1f1f),
                              fontSize: 17,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.start,
                          ),),Container(width: 100,child: Text(
                            "22.08.21",
                            style: TextStyle(
                              color: Color(0xff1f1f1f),
                              fontSize: 17,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.start,
                          ),),Container(width: 100,child: Text(
                            "0",
                            style: TextStyle(
                              color: Color(0xff1f1f1f),
                              fontSize: 17,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.start,
                          ),),
                          Container(width: 100,child: Text(
                            "활동 중",
                            style: TextStyle(
                              color: Color(0xff1f1f1f),
                              fontSize: 17,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.start,
                          ),),
                          Container(width: 110,child: Text(
                            "신고 1회",
                            style: TextStyle(
                              color: Color(0xff1f1f1f),
                              fontSize: 17,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.start,
                          ),),
                          Container(width: 100,),
                        ],);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height:30);
                    },
                    itemCount: 12,
                  ),
                ),
              ],
            ),
          ),)

      ],),


    );
  }

  Padding appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      child: Row(
        children: [
          const Text(
            "전체 유저",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          const Text(
            "가입 유저",
            style: TextStyle(
              color: Color(0xfff63c6e),
              fontSize: 20,
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          const Text(
            "탈퇴 유저",
            style: TextStyle(
              color: Color(0xfff63c6e),
              fontSize: 20,
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 700),
          Container(
            width: 476,
            height: 58,
            child: TextFormField(
                controller: _nameSearchController,
                decoration: InputDecoration(
                  hintText: '유저 이름을 검색하세요',
                  filled: true,
                  fillColor: const Color(0xfff1eeef),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide:
                          BorderSide(color: const Color(0xfff1eeef), width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide:
                          BorderSide(color: const Color(0xfff1eeef), width: 1)),
                )),
          )
        ],
      ),
    );
  }
}
