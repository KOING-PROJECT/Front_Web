import 'package:flutter/material.dart';
import 'package:koing_web_ver/notifier.dart';
import 'package:provider/provider.dart';
import 'pages/home.dart';

/*
CODE BY Hmida71 Github
Site Web https://hmida71.netlify.app
For any service text me on instagram : hmida_._071 -- https://www.instagram.com/hmida_._071
*/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KOING WEB 🤣',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MultiProvider(
        providers: [ChangeNotifierProvider.value(value: indexNotifier)],
          child:LayoutBuilder(
            builder: (context, constraints) {
              return const Home();
             /* if (constraints.maxWidth > 1000) {

              } else if (constraints.maxWidth <= 1000 &&
                  constraints.maxWidth >= 600) {
                return const Scaffold(
                  body: Center(child: Text("THIS IS TABLET WIDGET")),
                );
              } else {
                return const Scaffold(
                  body: Center(child: Text("THIS IS MOBILE WIDGET")),
                );
              }*/
            },
          ),
      ),
    );
  }
}
