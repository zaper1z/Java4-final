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

@WebServlet("/detail")
public class DetailServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String videoId = request.getParameter("id");

        if (videoId == null) {
            response.sendRedirect("index");
            return;
        }

        VideoDAO videoDAO = new VideoDAOImpl();
        Video video = videoDAO.findById(videoId);

        if (video == null) {
            response.sendRedirect("index");
            return;
        }


        video.setViews(video.getViews() + 1);
        videoDAO.update(video);

        request.setAttribute("video", video);
        request.getRequestDispatcher("/views/detail.jsp").forward(request, response);
    }
}