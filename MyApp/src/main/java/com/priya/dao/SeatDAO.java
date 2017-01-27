package com.priya.dao;


import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import com.priya.model.SeatConfigurationModel;
import com.priya.util.ConnectionUtil;

public class SeatDAO {
	JdbcTemplate jdbcTemplate = ConnectionUtil.getJdbcTemplate();

	public void save(int seatNo) {

		String sql = "insert into seat_configuration(ID) values(?)";
		Object[] params = { seatNo };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows inserted: " + rows);
	}
	
	public void updateSeatStatus(SeatConfigurationModel seat) {

		String sql = "update seat_configuration set STATUS=? where ID=?";
		Object[] params = { seat.getStatus(), seat.getId() };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows updated: " + rows);

	}

	public void delete(int id) {

		String sql = "delete from seat_configuration where id=?";
		Object[] params = { id };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows deleted: " + rows);

	}
	public List<SeatConfigurationModel> listAllSeatData() {
		String sql = "select * from seat_configuration";
		return jdbcTemplate.query(sql, (rs, rowNum) -> {
			SeatConfigurationModel seat=new SeatConfigurationModel(); 
			seat.setId(rs.getInt("ID"));
			seat.setStatus(rs.getBoolean("STATUS"));
			return seat;
		});
}

	
}