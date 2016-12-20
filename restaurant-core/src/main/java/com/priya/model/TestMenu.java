package com.priya.model;

import com.priya.model.Menu;

public class TestMenu {
	public static void main(String[] args) {

		Menu menu = new Menu();

		System.out.println(menu.getId());
		System.out.println(menu.getName());

		menu.setId(1);
		menu.setName("Idli");

		System.out.println(menu.toString());

		System.out.println(menu.getId());
		System.out.println(menu.getName());
	}
}
