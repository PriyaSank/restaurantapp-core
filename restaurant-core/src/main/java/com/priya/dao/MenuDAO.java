package com.priya.dao;

import org.springframework.jdbc.core.JdbcTemplate;

import com.priya.model.Menu;
import com.priya.util.ConnectionUtil;



public class MenuDAO {

	JdbcTemplate jdbcTemplate = ConnectionUtil.getJdbcTemplate();

	public void save(Menu menu) {

		String sql = "insert into menu(id,menu_name) values(?,?)";
		Object[] params = { menu.getId(), menu.getName() };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows inserted: " + rows);

	}

	public void update(Menu menu) {

		String sql = "update menu set name=? where id=?";
		Object[] params = { menu.getName(), menu.getId() };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows updated: " + rows);

	}

	public void delete(int id) {

		String sql = "delete from menu where id=?";
		Object[] params = { id };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows deleted: " + rows);

	}

}