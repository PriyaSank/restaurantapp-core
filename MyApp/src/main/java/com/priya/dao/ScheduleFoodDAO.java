package com.priya.dao;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import com.priya.model.FoodItemModel;
import com.priya.model.ScheduleFoodModel;
import com.priya.model.SeedScheduleModel;
import com.priya.util.ConnectionUtil;

public class ScheduleFoodDAO {
JdbcTemplate jdbcTemplate = ConnectionUtil.getJdbcTemplate();
	
	public void save(ScheduleFoodModel scfood) {

		String sql = "insert into schedule_food_relation(SCHEDULE_ID,FOOD_ID,FOOD_COUNT) values(?,?,?)";
		Object[] params = { scfood.getSch().getId(),scfood.getFood().getId(),scfood.getFoodCount() };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows inserted: " + rows);
	}
	
	public void updateScheduleId(ScheduleFoodModel scfood) {

		String sql = "update schedule_food_relation SET SCHEDULE_ID=? where ID=?";
		Object[] params = { scfood.getSch().getId(),scfood.getId() };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows updated: " + rows);

	}

	public void updateFoodId(ScheduleFoodModel scfood) {

		String sql = "update schedule_food_relation SET FOOD_ID=? where ID=?";
		Object[] params = {scfood.getFood().getId(),scfood.getId() };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows updated: " + rows);

	}
	
	public void updateFoodCount(ScheduleFoodModel scfood) {

		String sql = "update schedule_food_relation SET FOOD_COUNT=? where ID=?";
		Object[] params = {scfood.getFoodCount(), scfood.getId() };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows updated: " + rows);

	}

	
	public void delete(int id) {

		String sql = "delete from schedule_food_relation where id=?";
		Object[] params = { id };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows deleted: " + rows);

	}
	
	public List<ScheduleFoodModel> listAllData(){
		String sql = "select ID,SCHEDULE_ID,FOOD_ID,FOOD_COUNT from schedule_food_relation";
		return jdbcTemplate.query(sql, (rs, rowNum) -> {
			ScheduleFoodModel scfood=new ScheduleFoodModel();
			scfood.setId(rs.getInt("ID"));
			SeedScheduleModel seed=new SeedScheduleModel();
			seed.setId(rs.getInt("ID"));
			scfood.setSch(seed);
			FoodItemModel food=new FoodItemModel();
			food.setId(rs.getInt("ID"));
			scfood.setFood(food);
			scfood.setFoodCount(rs.getInt("FOOD_COUNT"));
			return scfood;
		});

}

	

}
