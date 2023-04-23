/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller.auth;

import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.assignment.Account;
import model.assignment.Role;

/**
 *
 * @author DELL
 */
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("view/auth/login.jsp").forward(request, response);
    } 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        AccountDBContext db = new AccountDBContext();
        Account account = db.get(username, password);
        if(account == null)
        {
            response.sendRedirect("login");
        }
        else
        {
            request.getSession().setAttribute("account", account);
           Role role = account.getRoles().get(0);
            if (role != null) {
                if (role.getId() == 2) {
                    request.getRequestDispatcher("/view/student/home.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("/view/lecturer/home.jsp").forward(request, response);
                }
            } else {
                response.getWriter().println("This account doesn't have any role");
            }
        }
    }
}