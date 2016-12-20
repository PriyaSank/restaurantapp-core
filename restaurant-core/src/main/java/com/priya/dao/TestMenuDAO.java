package com.priya.dao;

import com.priya.model.Menu;

public class TestMenuDAO {
	public static void main(String[] args) {

		MenuDAO menuDAO = new MenuDAO();

		 Menu menu = new Menu();

		 menu.setId(1);
		 menu.setName("Vada");

		 menuDAO.save(menu);
		// menuDAO.update(menu);
//		menuDAO.delete(1);

	}
}