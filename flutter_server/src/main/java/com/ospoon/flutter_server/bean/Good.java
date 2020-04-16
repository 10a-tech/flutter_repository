package com.ospoon.flutter_server.bean;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class Good {
    private String name;
    private String image;
    private BigDecimal presentPrice;
    private Integer goodsId;
    private BigDecimal oriPrice;

    public Good() {
    }

    public Good(String name, String image, BigDecimal presentPrice, Integer goodsId, BigDecimal oriPrice) {
        this.name = name;
        this.image = image;
        this.presentPrice = presentPrice;
        this.goodsId = goodsId;
        this.oriPrice = oriPrice;
    }
}
