import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NoteBox extends StatelessWidget {
  const NoteBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * .5,
            width: MediaQuery.of(context).size.width * .8,
            decoration: BoxDecoration(
                color: const Color(0xffEFF1F2),
                borderRadius: BorderRadius.circular(3.h)),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * .25,
                  width: MediaQuery.of(context).size.width * .8,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white10.withAlpha(80)),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withAlpha(10),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
