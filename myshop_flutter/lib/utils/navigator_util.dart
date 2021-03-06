import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:myshop_flutter/router/application.dart';
import 'package:myshop_flutter/router/routers.dart';
import 'package:myshop_flutter/utils/fluro_convert_util.dart';
import 'package:myshop_flutter/utils/string_util.dart';

class NavigatorUtil{

  //跳转至首页
  static goShopMainPage(BuildContext context){
    Application.router.navigateTo(
      context,
      Routers.home,
      transition: TransitionType.inFromRight,replace: true);
  }

  //跳转至商品列表页面
  static goCategoryGoodsListPage(BuildContext context,String categoryName,int categoryId){
    var categoryNameText = StringUtil.encode(categoryName);
    Application.router.navigateTo(
        context,
        Routers.categoryGoodsList + "?categoryName=$categoryNameText&categoryId=$categoryId",
        transition: TransitionType.inFromRight);
  }

//  //跳转至商品详情页面
//  static goGoodsDetails(BuildContext context,int goodsId){
//    Application.router.navigateTo(
//        context,
//        Routers.goodsDetail + "?goodsId=$goodsId",
//        transition: TransitionType.inFromRight);
//  }
//
//  //跳转至填写订单页面
//  static goFillInOrder(BuildContext context,int cartId){
//    Application.router.navigateTo(
//        context,
//        Routers.fillInOrder + "?cartId=$cartId",
//        transition: TransitionType.inFromRight);
//  }
//
//  static goRegister(BuildContext context){
//    Application.router.navigateTo(
//        context,
//        Routers.register,
//        transition: TransitionType.inFromRight);
//  }
//
//  static goLogin(BuildContext context){
//    Application.router.navigateTo(
//        context,
//        Routers.login,
//        transition: TransitionType.inFromRight);
//  }
//
//  static goOrder(BuildContext context){
//    Application.router.navigateTo(
//        context,
//        Routers.mineOrder,
//        transition: TransitionType.inFromRight);
//  }
//
//  static goAboutUs(BuildContext context){
//    Application.router.navigateTo(
//        context,
//        Routers.aboutUs,
//        transition: TransitionType.inFromRight);
//  }
//
//  static Future goOrderDetail(BuildContext context,int orderId,String token){
//    Application.router.navigateTo(
//        context,
//        Routers.mineOrderDetail + "?orderId=$orderId&token=$token",
//        transition: TransitionType.inFromRight);
//  }
//
//  static popRegister(BuildContext context){
//    Application.router.pop(context);
//  }
//
//  static Future goAddress(BuildContext context){
//    return Application.router.navigateTo(
//        context,
//        Routers.address,
//        transition: TransitionType.inFromRight);
//  }
//
//  static Future goAddressEdit(BuildContext context,int addressId){
//    return Application.router.navigateTo(
//        context,
//        Routers.addressEdit + "?addressId=$addressId",
//        transition: TransitionType.inFromRight);
//  }
//
//  static goCollect(BuildContext context){
//    return Application.router.navigateTo(
//        context,
//        Routers.mineCollect,
//        transition: TransitionType.inFromRight);
//  }

  static goWebView(BuildContext context,String title,String url){
    var titleName = FluroConvertUtil.fluroCnParamsEncode(title);
    var urlEncode = FluroConvertUtil.fluroCnParamsEncode(url);
    Application.router.navigateTo(
        context,
        Routers.brandDetail + "?title=$titleName&&url=$urlEncode",
        transition: TransitionType.inFromRight);
  }

}