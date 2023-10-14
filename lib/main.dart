// NABEGHEHA.COM

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(const MyApp());

  // Add this code below

  doWhenWindowReady(() {
    const initialSize = Size(400, 250);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = "NABEGHEHA APP";
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isYesClicked = false;
  var noButtonRight = 100;
  var noButtonBottom = 30;
  int maxRight = 150;
  int minRight = 10;
  int maxBotton = 30;
  int minBotton = 5;
  final borderColor = const Color(0xFF805306);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: borderColor,
        width: 1,
        child: Column(
          children: [
            WindowTitleBarBox(
              child: Row(
                children: [
                  Expanded(
                    child: MoveWindow(),
                  ),
                  const WindowButtons(),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50.0),
                isYesClicked
                    ? const Text(
                        'مرسی که صادق بودی :)))))',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontFamily: 'Iran',
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      )
                    : const Text(
                        'صادقانه پاسخ بده. آیا تو یک احمقی؟؟',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontFamily: 'Iran',
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
              ],
            ),
            const SizedBox(height: 50.0),
            SizedBox(
              height: 50,
              child: Stack(
                // NABEGHEHA.COM
                children: [
                  Positioned(
                    left: 100,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isYesClicked = true;
                        });
                      },
                      child: const Text(
                        'بله، من احمقم',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Iran',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: noButtonRight.toDouble(),
                    bottom: noButtonBottom.toDouble(),
                    child: MouseRegion(
                      onHover: (event) {
                        setState(() {
                          noButtonRight = minRight + Random().nextInt((maxRight + 1) - minRight);
                          // noButtonBottom = minBotton + Random().nextInt((maxBotton + 1) - minBotton);
                        });
                      },
                      child: const Text(
                        'نخیر',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Iran',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(),
        MaximizeWindowButton(),
        CloseWindowButton(),
      ],
    );
  }
}
