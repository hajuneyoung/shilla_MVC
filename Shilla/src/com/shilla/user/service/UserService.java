package com.shilla.user.service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface UserService {

	int checkUsesrID(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException;

	void userResgister(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException;

}
