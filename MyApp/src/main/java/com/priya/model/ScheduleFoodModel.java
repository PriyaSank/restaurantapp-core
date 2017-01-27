package com.priya.model;

import lombok.Data;

@Data
public class ScheduleFoodModel {
private int id;
private SeedScheduleModel sch;
private FoodItemModel food;
private int foodCount;
}
