package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.VideoDAO;
import Dao.VideoDAOImpl;
import Entity.Video;

import java.io.IOException;
import java.util.List;

@WebServlet("/index")
public class IndexServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        VideoDAO videoDAO = new VideoDAOImpl();
        
        // Lấy 6 video có lượt xem cao nhất
        List<Video> videos = videoDAO.findSixMostViewed();
        
        request.setAttribute("items", videos);
        request.setAttribute("currentPage", 0);
        
        request.getRequestDispatcher("/views/index.jsp").forward(request, response);
    }
}