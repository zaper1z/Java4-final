package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.FavoriteDAO;
import Dao.FavoriteDAOImpl;
import Entity.Favorite;
import Entity.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/favorites")
public class FavoriteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        FavoriteDAO favoriteDAO = new FavoriteDAOImpl();
        List<Favorite> favorites = favoriteDAO.findByUser(currentUser.getId());

        request.setAttribute("favoriteList", favorites);
        request.getRequestDispatcher("/views/favorites.jsp").forward(request, response);
    }
}