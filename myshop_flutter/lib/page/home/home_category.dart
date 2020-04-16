import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myshop_flutter/model/home_model.dart';
import 'package:myshop_flutter/utils/navigator_util.dart';
import 'package:myshop_flutter/widgets/cached_image_widget.dart';

class HomeCategoryWidget extends StatelessWidget {
  List<Channel> categoryList;

  HomeCategoryWidget(this.categoryList);

  _goCategoryView(BuildContext context, Channel channel) {
    NavigatorUtil.goCategoryGoodsListPage(context, channel.name, channel.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return _getGridViewTiem(context, categoryList[index]);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: ScreenUtil.instance.setWidth(20.0),
          crossAxisSpacing: ScreenUtil.instance.setWidth(20.0),
        ),
      ),
    );
  }

  Widget _getGridViewTiem(BuildContext context, Channel channel) {
    return Center(
      child: InkWell(
        onTap: () => _goCategoryView(context, channel),
        child: Column(
          children: <Widget>[
            CachedImageWidget(
              ScreenUtil.instance.setWidth(60.0),
              ScreenUtil.instance.setHeight(60.0),
              channel.iconUrl,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil.instance.setHeight(10.0),
              ),
            ),
            Text(
              channel.name,
              style: TextStyle(
                fontSize: ScreenUtil.instance.setSp(26.0),
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
