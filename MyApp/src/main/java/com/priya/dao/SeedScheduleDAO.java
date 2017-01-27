package com.priya.dao;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;


import com.priya.model.SeedScheduleModel;
import com.priya.util.ConnectionUtil;

public class SeedScheduleDAO {
JdbcTemplate jdbcTemplate = ConnectionUtil.getJdbcTemplate();
	
	public void save(SeedScheduleModel seed) {

		String sql = "insert into seed_schedule(ID,NAME,FROM_TIME,TO_TIME) values(?,?,?,?)";
		Object[] params = { seed.getId(), seed.getName(),seed.getFromTime(),seed.getToTime() };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows inserted: " + rows);
	}
	
	public void updateTimings(SeedScheduleModel seed) {

		String sql = "update seed_schedule SET FROM_TIME=? ,TO_TIME=? where ID=?";
		Object[] params = { seed.getFromTime(),seed.getToTime(),seed.getId() };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows updated: " + rows);

	}

	public void updateScheduleName(SeedScheduleModel seed) {

		String sql = "update seed_schedule SET NAME=? where ID=?";
		Object[] params = { seed.getName(),seed.getId() };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows updated: " + rows);

	}

	
	public void delete(int id) {

		String sql = "delete from seed_schedule where id=?";
		Object[] params = { id };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows deleted: " + rows);

	}
	
	public List<SeedScheduleModel> listAllScheduleData() {
		String sql = "select ID,NAME,FROM_TIME,TO_TIME from seed_schedule";
		return jdbcTemplate.query(sql, (rs, rowNum) -> {
			SeedScheduleModel seed=new SeedScheduleModel();
			seed.setId(rs.getInt("ID"));
			seed.setName(rs.getString("NAME"));
			seed.setFromTime(rs.getTime("FROM_TIME").toLocalTime());
			seed.setToTime(rs.getTime("TO_TIME").toLocalTime());
			return seed;
		});

}

	public SeedScheduleModel listParticularScheduleData(int id) {
		String sql = "select ID,NAME,FROM_TIME,TO_TIME from seed_schedule where ID=?";
		Object[] params = { id };
		return jdbcTemplate.queryForObject(sql,params, (rs, rowNum) -> {
			SeedScheduleModel seed=new SeedScheduleModel();
			seed.setId(rs.getInt("ID"));
			seed.setName(rs.getString("NAME"));
			seed.setFromTime(rs.getTime("FROM_TIME").toLocalTime());
			seed.setToTime(rs.getTime("TO_TIME").toLocalTime());
			return seed;	
		});
}
}
