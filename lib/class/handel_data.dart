import 'package:flutter/material.dart';

import '../function/check_internet.dart';
import 'package:lottie/lottie.dart';
class HandlingDataView extends StatelessWidget {
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool online=checkInternet();
    return online == false
        ? Center(
            child: Lottie.asset("assets/lottie/offline.json", width: 250, height: 250))
        : widget;
  }
}
