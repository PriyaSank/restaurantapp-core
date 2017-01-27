package com.priya.dao;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import com.priya.model.FoodItemModel;

import com.priya.util.ConnectionUtil;

public class FoodItemDAO {
	JdbcTemplate jdbcTemplate = ConnectionUtil.getJdbcTemplate();
	
	public void save(FoodItemModel food) {

		String sql = "insert into food_item(ID,NAME,PRICE) values(?,?,?)";
		Object[] params = { food.getId(), food.getName(),food.getPrice() };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows inserted: " + rows);
	}
	
	public void updateFoodPrice(FoodItemModel food) {

		String sql = "update food_item set SET PRICE=? where ID=?";
		Object[] params = { food.getPrice(),food.getId() };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows updated: " + rows);

	}

	public void updateItemName(FoodItemModel food) {

		String sql = "update food_item set SET NAME=? where ID=?";
		Object[] params = { food.getId(), food.getName() };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows updated: " + rows);

	}

	
	public void delete(int id) {

		String sql = "delete from food_item where id=?";
		Object[] params = { id };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows deleted: " + rows);

	}

	public List<FoodItemModel> listAllItemsData() {
		String sql = "select ID,NAME,PRICE from food_item";
		return jdbcTemplate.query(sql, (rs, rowNum) -> {
			FoodItemModel food=new FoodItemModel();
			food.setId(rs.getInt("ID"));
			food.setName(rs.getString("NAME"));
			food.setPrice(rs.getInt("PRICE"));
	
			return food;
			
		});

}

	

	public List<String> listAllItemNames() {
		String sql = "select NAME from food_item";
		return jdbcTemplate.queryForList(sql, String.class);
	}

		public FoodItemModel listParticularItemData(int id) {
			String sql = "select * from food_item where ID=?";
			Object[] params = { id };
			return jdbcTemplate.queryForObject(sql,params, (rs, rowNum) -> {
				FoodItemModel food=new FoodItemModel();
				food.setId(rs.getInt("ID"));
				food.setName(rs.getString("NAME"));
				food.setPrice(rs.getInt("PRICE"));
				return food;	
			});
}


}

