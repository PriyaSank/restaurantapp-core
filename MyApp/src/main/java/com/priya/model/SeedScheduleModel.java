package com.priya.model;

import lombok.Data;
import java.time.LocalTime;

@Data
public class SeedScheduleModel {
private int id;
private String name;
private LocalTime fromTime;
private LocalTime toTime;
}
