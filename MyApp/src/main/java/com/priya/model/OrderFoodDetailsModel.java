package com.priya.model;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class OrderFoodDetailsModel {
private int id;
private OrderDetailsModel order;
private LocalDateTime orderTimestamp;
private FoodItemModel food;
private int foodCount;
private String orderStatus;
}
