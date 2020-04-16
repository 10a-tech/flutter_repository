import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:website/generated/res.dart';

class BannerWidget extends StatelessWidget {
  List<String> banners = <String>[Res.p_1, Res.b_2, Res.b_3, Res.b_4];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = width * 540.0 / 1080.0;

    return Container(
      width: width,
      height: height,
      child: Swiper(
        itemBuilder: (BuildContext context, index) {
          return Container(
            margin: EdgeInsets.only(left: 1, right: 1),
            child: Image.asset(
              banners[index],
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: banners.length,
        scrollDirection: Axis.horizontal,
        autoplay: true,
      ),
    );
  }
}
