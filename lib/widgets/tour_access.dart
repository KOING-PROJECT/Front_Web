import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../back_end/backend_model.dart';
import '../back_end/secure_storage.dart';
import 'package:koing_web_ver/back_end/tour_access_service.dart';

class TourAccess extends StatefulWidget {
  const TourAccess({super.key});

  @override
  State<TourAccess> createState() => TourAccessState();
}

class TourAccessState extends State<TourAccess> with TickerProviderStateMixin {
  final TextEditingController _nameSearchController = TextEditingController();
  late TabController _selectTabController;
  int clicked = 0;

  List<dynamic>? travelList;
  @override
  void initState() {
    _asyncMethod();
    _selectTabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  void _asyncMethod() async{
    dynamic userToken =
        await SecureStorage().readSecureData('userAccessToken');
  BackendModel travelListModel = await TourAccessService().getTourList(userToken, ['7']);
  travelList=travelListModel.data['tours'];
   setState(() {

   });
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
              clicked==1
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
                  fontSize: 16,
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
          travelList==null?Expanded(child: Container()):Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
              }, scrollbars: false),
              child: SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: clicked==1 ? detailContainer() : accessContainer()),
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
                    Padding(padding: EdgeInsets.only(right: 10),child: Row(
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
                        InkWell(
                          onTap: () {
                            showDialog(
                                useRootNavigator: false,
                                context: context,
                                builder: (context2) {
                                  return BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10.0, sigmaY: 10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: 926,
                                            height: 636,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(10),
                                                  color: Colors.white
                                              ),)
                                        )

                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            width: 150,
                            height: 54,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xfff63c6e),
                            ),
                          ),
                        ),
                      ],
                    ),),
                    SizedBox(
                      height: 30,
                    ),
                    GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: travelList!.length,
                      //item 개수
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        //1 개의 행에 보여줄 item 개수
                        childAspectRatio: 361 / 352,
                        //item 의 가로 1, 세로 2 의 비율
                        mainAxisSpacing: 60,
                        //수평 Padding
                        crossAxisSpacing: 20, //수직 Padding
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        //item 의 반목문 항목 형성
                        return InkWell(
                            onTap: () {
                              clicked = 1;
                              setState(() {});
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [

                                    Container(
                                      width: 280,
                                      height: 190,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          // 탐험 사진
                                            image: NetworkImage(
                                                travelList![index]
                                                [
                                                'thumbnails'][0].replaceFirst('https', 'http')),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        width: 280,
                                        height: 100,
                                        decoration:
                                        BoxDecoration(
                                          borderRadius:
                                          BorderRadius
                                              .circular(15),
                                          gradient: LinearGradient(
                                              colors: [
                                                Colors
                                                    .transparent,
                                                Colors.black54
                                              ],
                                              begin: Alignment
                                                  .topCenter,
                                              end: Alignment
                                                  .bottomCenter),
                                        ),
                                      ),
                                    ),
                                  Positioned( bottom: 15,left:15,child:   Text(
                                    travelList![index]['tourTitle'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: "Pretendard",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.check_circle_outline))
                                  ],
                                ),
                                Padding(padding: EdgeInsets.only(left: 20),child:  Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 12,),
                                    Text(
                                      travelList![index]['guideName'],
                                      style: TextStyle(
                                        color: Color(0xff1f1f1f),
                                        fontSize: 16,
                                        fontFamily: "Pretendard",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          travelList![index]['guideGrade'],
                                          style: TextStyle(
                                            color: Color(0xff928e8f),
                                            fontSize: 12,
                                            fontFamily: "Pretendard",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Text(
                                          "누적 승인 12회",
                                          style: TextStyle(
                                            color: Color(0xff4c89ff),
                                            fontSize: 12,
                                            fontFamily: "Pretendard",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),)
                              ],
                            ));
                      },
                    ),
                  ],
                ),
                ListView(
                  children: [
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
                              clicked = 1;
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
            width: 1800,
            height: 590,
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 0),
              children: [

                Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 80,),
                    child:
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      height: 590,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(onPressed: () {
                                clicked=0;
                                setState(() {

                                });
                              },
                                  icon: Icon(Icons.arrow_back_ios)),
                              Text(
                                "탐험 상세 내역  (1) 탐험 정보",
                                style: TextStyle(
                                  color: Color(0xff1f1f1f),
                                  fontSize: 18,
                                  fontFamily: "Pretendard",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      useRootNavigator: false,
                                      context: context,
                                      builder: (context2) {
                                        return BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 10.0, sigmaY: 10.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  width: 502,
                                                  height: 340,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(10),
                                                        color: Colors.white
                                                    ),)
                                              )

                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  width: 108,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xfff1eeef),
                                  ),
                                  child: Center(child: Text(
                                    "반려",
                                    style: TextStyle(
                                      color: Color(0xff1f1f1f),
                                      fontSize: 16,
                                      fontFamily: "Pretendard",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),)
                                ),
                              ),

                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      useRootNavigator: false,
                                      context: context,
                                      builder: (context2) {
                                        return BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 10.0, sigmaY: 10.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  width: 502,
                                                  height: 340,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(10),
                                                        color: Colors.white
                                                    ),)
                                              )

                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  width: 108,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xfff63c6e),
                                  ),
                                   child: Center(child: Text(
                                     "승인",
                                     style: TextStyle(
                                       color: Colors.white,
                                       fontSize: 16,
                                       fontFamily: "Pretendard",
                                       fontWeight: FontWeight.w600,
                                     ),
                                   ),)
                                ),
                              ),

                            ],
                          ),
                          Divider(height: 30,thickness: 0.5,color: Colors.black12,),

                          Stack(
                            children: [
                              Container(
                                height: 400,

                              ),
                              Positioned(top:200,right:10,child: InkWell(
                                  onTap: () {

                                  },
                                  child: Image.asset(
                                    'assets/icons/arrow.png', scale: 4,),
                              ),)

                            ],
                          )

                        ],
                      ),
                    )


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
      padding: const EdgeInsets.only(top: 80, bottom:30,left: 40),
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
              fontSize: 18,
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
