package com.priya.dao;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import com.priya.model.OrderDetailsModel;
import com.priya.model.SeatConfigurationModel;
import com.priya.util.ConnectionUtil;

public class OrderDetailsDAO {
JdbcTemplate jdbcTemplate = ConnectionUtil.getJdbcTemplate();
	
	public void save(int seatno) {

		String sql = "insert into order_details(SEAT_NO) values(?)";
		Object[] params = { seatno };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows inserted: " + rows);
	}
	
	public void updateOrderStatus(OrderDetailsModel order) {

		String sql = "update order_details SET STATUS=? where ID=?";
		Object[] params = { order.getStatus(),order.getId() };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows updated: " + rows);

	}
	
	public void delete(int id) {

		String sql = "delete from order_details where id=?";
		Object[] params = { id };
		int rows = jdbcTemplate.update(sql, params);
		System.out.println("No of rows deleted: " + rows);

	}
	
	public List<OrderDetailsModel> listAllOrderData() {
		String sql = "select * from order_details";
		return jdbcTemplate.query(sql, (rs, rowNum) -> {
			OrderDetailsModel order=new OrderDetailsModel();
			order.setId(rs.getInt("ID"));
			SeatConfigurationModel seat=new SeatConfigurationModel(); 
			seat.setId(rs.getInt("SEAT_NO"));
			order.setSeat(seat);
			order.setStatus(rs.getString("STATUS"));
			return order;	
		});

}

	public OrderDetailsModel listParticularOrderData(int id) {
		String sql = "select * from order_details where ID=?";
		Object[] params = { id };
		return jdbcTemplate.queryForObject(sql,params, (rs, rowNum) -> {
			OrderDetailsModel order=new OrderDetailsModel();
			order.setId(rs.getInt("ID"));
			SeatConfigurationModel seat=new SeatConfigurationModel();
			seat.setId(rs.getInt("SEAT_NO"));
			order.setSeat(seat);
			order.setStatus(rs.getString("STATUS"));
			return order;	
		});
}
}
