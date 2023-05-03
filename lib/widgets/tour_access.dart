import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TourAccess extends StatefulWidget {
  const TourAccess({super.key});

  @override
  State<TourAccess> createState() => TourAccessState();
}

class TourAccessState extends State<TourAccess> with TickerProviderStateMixin {
  final TextEditingController _nameSearchController = TextEditingController();
  late TabController _selectTabController;
  bool clicked = false;

  @override
  void initState() {
    _selectTabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //flex: 7,
      child: Column(
        children: [
          appBar(),
          Row(
            children: [
              clicked
                  ? Container()
                  : TabBar(
                      controller: _selectTabController,
                      indicatorColor: Color(0xfff63c6e),
                      labelColor: Colors.pink,
                      unselectedLabelColor: Colors.black54,
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      labelStyle: TextStyle(
                        color: Color(0xfff63c6e),
                        fontSize: 22,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w600,
                      ),
                      tabs: [
                        Container(
                          width: 200,
                          child: Tab(
                            text: "승인 대기",
                          ),
                        ),
                        Container(
                          width: 200,
                          child: Tab(
                            text: "반려",
                          ),
                        )
                      ],
                    ),
              Expanded(child: Container())
            ],
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
              }, scrollbars: false),
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: clicked ? detailContainer() : accessContainer()),
            ),
          )
        ],
      ),
    );
  }

  Container accessContainer() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 1200,
            height: 600,
            child: TabBarView(
              controller: _selectTabController,
              children: [
                ListView(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 150,
                          height: 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xfff1eeef),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 150,
                          height: 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xfff63c6e),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 30,
                      //item 개수
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        //1 개의 행에 보여줄 item 개수
                        childAspectRatio: 361 / 322,
                        //item 의 가로 1, 세로 2 의 비율
                        mainAxisSpacing: 60,
                        //수평 Padding
                        crossAxisSpacing: 20, //수직 Padding
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        //item 의 반목문 항목 형성
                        return InkWell(
                            onTap: () {
                              clicked = true;
                              setState(() {});
                            },
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 361,
                                      height: 190,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.red,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.check_circle_outline))
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Jinny",
                                      style: TextStyle(
                                        color: Color(0xff1f1f1f),
                                        fontSize: 20,
                                        fontFamily: "Pretendard",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Intermediate",
                                          style: TextStyle(
                                            color: Color(0xff928e8f),
                                            fontSize: 17,
                                            fontFamily: "Pretendard",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Text(
                                          "누적 승인 12회",
                                          style: TextStyle(
                                            color: Color(0xff4c89ff),
                                            fontSize: 17,
                                            fontFamily: "Pretendard",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ));
                      },
                    ),
                  ],
                ),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container detailContainer() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 1200,
            height: 600,
            child: ListView(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 150,
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xfff1eeef),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 150,
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xfff63c6e),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
                  child: Container(
                    height: 600,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      child: Row(
        children: [
          const Text(
            "탐험 승인",
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
            "승인 완료되지 않은 탐험이 35건 있습니다.",
            style: TextStyle(
              color: Color(0xfff63c6e),
              fontSize: 20,
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
