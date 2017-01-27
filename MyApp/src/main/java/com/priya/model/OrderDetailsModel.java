package com.priya.model;

import lombok.Data;

@Data
public class OrderDetailsModel {
private int id;
private SeatConfigurationModel seat;
private String status;
}
