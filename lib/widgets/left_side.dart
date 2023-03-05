import 'package:flutter/material.dart';

class LeftSide extends StatefulWidget {
  const LeftSide({super.key});

  @override
  State<LeftSide> createState() => _LeftSideState();
}

class _LeftSideState extends State<LeftSide> {
   int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
      ),
      child: ListView(
       // direction: Axis.vertical,
        children: [
          const SizedBox(height: 80),
          Column(
            children: [
              Image.asset(
                "assets/icons/KOING Logo_GRD.png",
                width: 70,
              ),
              Image.asset(
                "assets/icons/Admin.png",
                scale: 4,
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              InkWell(
                onTap: (){
                  _selectedIndex=0;
                  setState(() {

                  });
                },
                child: Container(
                  width: 210,
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: _selectedIndex==0? const Color(0xfffff5f8):Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children:  [
                      const SizedBox(width: 5,),
                      Image.asset('assets/icons/dash.png',scale: 4,color: _selectedIndex==0?const Color(0xfff63c6e):Colors.black,),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "대시보드",
                        style: TextStyle(
                          color: _selectedIndex==0?const Color(0xfff63c6e):Colors.black,
                          fontSize: 18,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  _selectedIndex=1;
                  setState(() {

                  });
                },
                child: Container(
                  width: 210,
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: _selectedIndex==1?const Color(0xfffff5f8):Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children:  [
                      Image.asset('assets/icons/user.png',scale: 4,color:  _selectedIndex==1?const Color(0xfff63c6e):Colors.black,),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "유저 관리",
                        style: TextStyle(
                          color: _selectedIndex==1?const Color(0xfff63c6e):Colors.black,
                          fontSize: 18,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: (){
                  _selectedIndex=2;
                  setState(() {

                  });
                },
                child: Container(
                  width: 210,
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: _selectedIndex==2?const Color(0xfffff5f8):Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children:  [
                      Image.asset('assets/icons/explore.png',scale: 4,color: _selectedIndex==2?const Color(0xfff63c6e):Colors.black,),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "탐험 관리",
                        style: TextStyle(
                          color: _selectedIndex==2?const Color(0xfff63c6e):Colors.black,
                          fontSize: 18,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: (){
                  _selectedIndex=3;
                  setState(() {

                  });
                },
                child: Container(
                  width: 210,
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:_selectedIndex==3?const Color(0xfffff5f8):Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children:  [
                      Image.asset('assets/icons/chatting.png',scale: 4,color:  _selectedIndex==3?const Color(0xfff63c6e):Colors.black,),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "채팅 관리",
                        style: TextStyle(
                          color: _selectedIndex==3?const Color(0xfff63c6e):Colors.black,
                          fontSize: 18,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 300,),

              InkWell(
                onTap: (){
                  _selectedIndex=4;
                  setState(() {

                  });
                },
                child: Container(
                  width: 225,
                  height: 54,
                  decoration: const BoxDecoration(
                    border:  Border(

                      top:  BorderSide( // POINT
                        color:Color(0xfffff5f8),
                        width: 2.0,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children:  [
                      ClipOval(child: Image.asset('assets/icons/KOING Logo_GRD BG.png',width: 30,),),
                      SizedBox(
                        width: 14,
                      ),
                      Text(
                        "관리자 01",
                        style: TextStyle(
                          color: Color(0xff1f1f1f),
                          fontSize: 16,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                     const Icon(
                        Icons.logout_outlined,
                        color: Colors.black,
                        size: 25,
                      ),


                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
