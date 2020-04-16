package com.ospoon.flutter_server.controller;

import com.ospoon.flutter_server.bean.Good;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class GoodController {

    @PostMapping("/list")
    public Map<String, Object> list(@RequestParam("shopId") String shopId) {

        List<Good> goods = new ArrayList<>();
        goods.add(new Good(
                "剑指Java自研框架，决胜Spring源码",
                "https://img2.mukewang.com/szimg/5e4644f609ffdfa312000676-360-202.png",
                new BigDecimal(399.00),
                0001,
                new BigDecimal(399.00)
        ));
        goods.add(new Good(
                "Vue2.6+Node.js+MongoDB 全栈打造商城系统",
                "https://img2.mukewang.com/szimg/5e781869096aad9112000676-360-202.png",
                new BigDecimal(348.00),
                0002,
                new BigDecimal(348.00)
        ));
        goods.add(new Good(
                "Typescript + React 高仿 Antd 从零到一打造自己的组件库",
                "https://img4.mukewang.com/szimg/5e6b4ede09bc3b4412000676-360-202.png",
                new BigDecimal(388.00),
                0003,
                new BigDecimal(388.00)
        ));
        goods.add(new Good(
                "大学计算机必修课新讲--编译原理+操作系统+图形学",
                "https://img3.mukewang.com/szimg/5e703f1408bd81a506000338-360-202.jpg",
                new BigDecimal(229.00),
                0004,
                new BigDecimal(229.00)
        ));
        goods.add(new Good(
                "编程必备基础 计算机组成原理+操作系统+计算机网络",
                "https://img3.mukewang.com/szimg/5d1032ab08719e0906000338-360-202.jpg",
                new BigDecimal(236.00),
                0005,
                new BigDecimal(236.00)
        ));
        goods.add(new Good(
                "剑指Java自研框架，决胜Spring源码",
                "https://img2.mukewang.com/szimg/5e4644f609ffdfa312000676-360-202.png",
                new BigDecimal(399.00),
                0001,
                new BigDecimal(399.00)
        ));
        goods.add(new Good(
                "Vue2.6+Node.js+MongoDB 全栈打造商城系统",
                "https://img2.mukewang.com/szimg/5e781869096aad9112000676-360-202.png",
                new BigDecimal(348.00),
                0002,
                new BigDecimal(348.00)
        ));
        goods.add(new Good(
                "Typescript + React 高仿 Antd 从零到一打造自己的组件库",
                "https://img4.mukewang.com/szimg/5e6b4ede09bc3b4412000676-360-202.png",
                new BigDecimal(388.00),
                0003,
                new BigDecimal(388.00)
        ));
        goods.add(new Good(
                "大学计算机必修课新讲--编译原理+操作系统+图形学",
                "https://img3.mukewang.com/szimg/5e703f1408bd81a506000338-360-202.jpg",
                new BigDecimal(229.00),
                0004,
                new BigDecimal(229.00)
        ));
        goods.add(new Good(
                "编程必备基础 计算机组成原理+操作系统+计算机网络",
                "https://img3.mukewang.com/szimg/5d1032ab08719e0906000338-360-202.jpg",
                new BigDecimal(236.00),
                0005,
                new BigDecimal(236.00)
        ));
        goods.add(new Good(
                "剑指Java自研框架，决胜Spring源码",
                "https://img2.mukewang.com/szimg/5e4644f609ffdfa312000676-360-202.png",
                new BigDecimal(399.00),
                0001,
                new BigDecimal(399.00)
        ));
        goods.add(new Good(
                "Vue2.6+Node.js+MongoDB 全栈打造商城系统",
                "https://img2.mukewang.com/szimg/5e781869096aad9112000676-360-202.png",
                new BigDecimal(348.00),
                0002,
                new BigDecimal(348.00)
        ));
        goods.add(new Good(
                "Typescript + React 高仿 Antd 从零到一打造自己的组件库",
                "https://img4.mukewang.com/szimg/5e6b4ede09bc3b4412000676-360-202.png",
                new BigDecimal(388.00),
                0003,
                new BigDecimal(388.00)
        ));
        goods.add(new Good(
                "大学计算机必修课新讲--编译原理+操作系统+图形学",
                "https://img3.mukewang.com/szimg/5e703f1408bd81a506000338-360-202.jpg",
                new BigDecimal(229.00),
                0004,
                new BigDecimal(229.00)
        ));
        goods.add(new Good(
                "编程必备基础 计算机组成原理+操作系统+计算机网络",
                "https://img3.mukewang.com/szimg/5d1032ab08719e0906000338-360-202.jpg",
                new BigDecimal(236.00),
                0005,
                new BigDecimal(236.00)
        ));
        Map<String, Object> map = new HashMap<>();
        map.put("code", 200);
        map.put("message", "获取成功");
        map.put("data", goods);

        return map;
    }
}
