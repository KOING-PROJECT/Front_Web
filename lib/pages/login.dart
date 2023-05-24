import 'package:flutter/material.dart';
import 'package:koing_web_ver/back_end/login_service.dart';

import '../back_end/backend_model.dart';
import '../back_end/secure_storage.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _signSuccess='';
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfffff5f8),
        body: Center(
          child: Container(
            width: 564,
            height: 700,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Image.asset(
                      "assets/icons/KOING Logo_GRD.png",
                      width: 70,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "assets/icons/Admin.png",
                      scale: 4,
                    ),
                    const SizedBox(
                      height: 105,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Text(
                          "관리자 ID",
                          style: TextStyle(
                            color: Color(0xff928e8f),
                            fontSize: 18,
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 460,
                          height: 70,
                          child: TextFormField(
                              controller: _idController,
                              decoration: InputDecoration(
                                hintText: 'ID를 입력하세요',
                                filled: true,
                                fillColor: const Color(0xfffff5f8),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color:  Color(0xfff1eeef), width: 0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color:  Color(0xfff1eeef), width: 0)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color:  Color(0xfff1eeef), width: 0)),
                              )),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "관리자 비밀번호",
                          style: TextStyle(
                            color: Color(0xff928e8f),
                            fontSize: 18,
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 460,
                          height: 70,
                          child: TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                hintText: '비밀번호를 입력하세요',
                                filled: true,
                                fillColor: const Color(0xfffff5f8),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color:  Color(0xfff1eeef), width: 0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color:  Color(0xfff1eeef), width: 0)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color:  Color(0xfff1eeef), width: 0)),
                              )),
                        )
                      ],
                    ),
                  const   SizedBox(height: 50,),
                    InkWell(
                      onTap: ()async{
                        BackendModel signInRequestModel = await LoginService().isSigning(_idController.text, _passwordController.text);
                        setState(() {
                          _signSuccess = signInRequestModel.message!;
                        });
                        print(signInRequestModel.data);
                        if (signInRequestModel.success!) {

                          String userId=await SecureStorage().readSecureData('userId');

                          try {
                            String token=await SecureStorage().readSecureData('token');
                            String jwtToken=await SecureStorage().readSecureData('userAccessToken');


                          } catch (e) {
                            print('connect: ERROR: $e');
                            throw e;
                          }
                          //print(signInRequestModel.data['jwt']['accessToken']);
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()),);
                        }

                        },
                      child: Container(
                        width: 460,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xfff63c6e),
                        ),
                        child: const Center(
                          child: Text(
                            "로그인",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
