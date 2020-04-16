import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myshop_flutter/config/index.dart';


class LoadingDialogWidget extends StatefulWidget{
  @override
  _LoadingDialogWidgetState createState() => _LoadingDialogWidgetState();

}

class _LoadingDialogWidgetState extends State<LoadingDialogWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitFoldingCube(
          size: ScreenUtil.instance.setWidth(60.0),
          color: KColor.watingColor,
        ),
      ),
    );
  }
}