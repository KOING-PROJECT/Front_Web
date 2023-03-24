import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../notifier.dart';

class RightSide extends StatefulWidget {
  const RightSide({super.key});

  @override
  State<RightSide> createState() => RightSideState();
}

class RightSideState extends State<RightSide> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      //flex: 7,
      child: Column(
        children: [
          appBar(),
          Expanded(
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
              }, scrollbars: false),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [

                    //story(),
                    container1(),
                    SizedBox(height: 70,),
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
  SizedBox container1() {
    return SizedBox(
      height: 146,

      child: ListView(scrollDirection:Axis.horizontal,children: [
       const SizedBox(width: 80,),

         Container(width: 1504,
           height: 146,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15),
             color: Colors.white,
           ),child: Row(children: [
             const SizedBox(width: 80,),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Opacity(
                   opacity: 0.70,
                   child: Text(
                     "총 매출",
                     style: TextStyle(
                       color: Color(0xff1f1f1f),
                       fontSize: 16,
                       fontFamily: "Pretendard",
                       fontWeight: FontWeight.w500,
                     ),
                   )),
               Text(
                 "1,128,000 원",
                 style: TextStyle(
                   color: Color(0xff1f1f1f),
                   fontSize: 25,
                   fontFamily: "Pretendard",
                   fontWeight: FontWeight.w600,
                 ),
               )

             ],
           ),
           Row(children:  [ SizedBox(width: 150,),Container(height:80,child: VerticalDivider(width: 1,)),SizedBox(width: 100,)],),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Opacity(
                   opacity: 0.70,
                   child: Text(
                     "앱 다운로드 수",
                     style: TextStyle(
                       color: Color(0xff1f1f1f),
                       fontSize: 16,
                       fontFamily: "Pretendard",
                       fontWeight: FontWeight.w500,
                     ),
                   )),
               Text(
                 "183,203",
                 style: TextStyle(
                   color: Color(0xff1f1f1f),
                   fontSize: 25,
                   fontFamily: "Pretendard",
                   fontWeight: FontWeight.w600,
                 ),
               )

             ],
           ),
             Row(children:  [ SizedBox(width: 150,),Container(height:80,child: VerticalDivider(width: 1,)),SizedBox(width: 100,)],),

             Column(
             crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Opacity(
                   opacity: 0.70,
                   child: Text(
                     "유저 현황",
                     style: TextStyle(
                       color: Color(0xff1f1f1f),
                       fontSize: 16,
                       fontFamily: "Pretendard",
                       fontWeight: FontWeight.w500,
                     ),
                   )),
               Text(
                 "95,784 명",
                 style: TextStyle(
                   color: Color(0xff1f1f1f),
                   fontSize: 25,
                   fontFamily: "Pretendard",
                   fontWeight: FontWeight.w600,
                 ),
               )

             ],
           ),
             Row(children:  [ SizedBox(width: 150,),Container(height:80,child: VerticalDivider(width: 1,)),SizedBox(width: 100,)],),

             Column(
             crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Opacity(
                   opacity: 0.70,
                   child: Text(
                     "누적 탐험 수",
                     style: TextStyle(
                       color: Color(0xff1f1f1f),
                       fontSize: 16,
                       fontFamily: "Pretendard",
                       fontWeight: FontWeight.w500,
                     ),
                   )),
               Text(
                 "10,219 개",
                 style: TextStyle(
                   color: Color(0xff1f1f1f),
                   fontSize: 25,
                   fontFamily: "Pretendard",
                   fontWeight: FontWeight.w600,
                 ),

               )
             ],
           ),
             const SizedBox(width: 150,),
         ],),)

      ],),
    );
  }
  SizedBox container2() {
    return SizedBox(
      height: 600,

      child: ListView(scrollDirection:Axis.horizontal,children: [
        const SizedBox(width: 80,),

        Container( width: 1504,
          height: 146,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),child: Row(children: [
            const SizedBox(width: 80,),

          ],),)

      ],),
    );
  }
  /*Container feed() {
    return Container(
      // color: Colors.green,
      // height: 400,
      child: Column(
        children: [
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Feed",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          StaggeredGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              axisDirection: AxisDirection.down,
              children: [
                ...List.generate(userData.length, (index) {
                  
                  return Container(
                    margin: const EdgeInsets.only(
                        top: 10, left: 12, right: 5, bottom: 5),
                    child: Material(
                      elevation: 10,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                  title: SizedBox(
                                    width: double.infinity,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      child: Text(
                                        userData[index]["name"],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  subtitle: Text(
                                    userData[index]["country"],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  leading: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: const Color(0xFFE1E2E2),
                                    child: CircleAvatar(
                                      radius: 23,
                                      backgroundImage:
                                          AssetImage(userData[index]["logo"]),
                                    ),
                                  ),
                                  trailing: const CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.transparent,
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Colors.grey,
                                      size: 30,
                                    ),
                                  )),
                              Container(
                                height: 200,
                                margin: const EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  right: 10,
                                  bottom: 0,
                                ),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(userData[index]["img"]),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(24)),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  children: [
                                    userData[index]["isLiked"]
                                        ? IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.favorite,
                                              color: Colors.pink,
                                            ),
                                          )
                                        : IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                                Icons.favorite_outline),
                                          ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.message_outlined),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.send_outlined),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.bookmark_border),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 10),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 6,
                                      backgroundImage:
                                          AssetImage(userData[index]["logo"]),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      "Like By ",
                                      style: TextStyle(
                                        fontSize: 12,
                                        // letterSpacing: 1.1,
                                      ),
                                    ),
                                    const Text(
                                      "Andrew and 360 others",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        // letterSpacing: 1.1,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 10,
                                ),
                                child: Text(
                                  userData[index]["desc"],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    // letterSpacing: 1.1,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  );
                })
              ]),
        ],
      ),
    );
  }

  Container story() {
    return Container(
      // color: Colors.red,
      margin: const EdgeInsets.only(bottom: 10),
      // height: 400,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Stories",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                }, scrollbars: false),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...List.generate(storyData.length, (index) {
                        if (index == 0) {
                          return Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.centerRight,
                                  children: const [
                                    CircleAvatar(
                                      radius: 38,
                                      backgroundImage:
                                          AssetImage('images/2m.jpg'),
                                    ),
                                    Positioned(
                                      bottom: -0,
                                      right: 0,
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.blue,
                                        child: Icon(
                                          Icons.add,
                                          size: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                const Text("Your Story")
                              ],
                            ),
                          );
                        }
                        return Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  const CircleAvatar(
                                    radius: 44,
                                    backgroundColor:
                                        Color.fromARGB(255, 245, 60, 13),
                                    child: CircleAvatar(
                                      radius: 41,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 38,
                                    backgroundImage: AssetImage(
                                      "${storyData[index]["logo"]}",
                                    ),
                                  ),
                                  if (storyData[index]["isLive"])
                                    Positioned(
                                      bottom: -3,
                                      child: Container(
                                        color: Colors.pink,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 4),
                                        child: const Text(
                                          "LIVE",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    )
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(storyData[index]["firstName"])
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }*/

  Padding appBar() {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 80),
      child: Row(
        children: [
          const Text(
            "대시보드",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
