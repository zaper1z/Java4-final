package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public HomeServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String pathInfo = request.getPathInfo();
        String page = "index"; 
        

        if (pathInfo != null && pathInfo.length() > 1 && !pathInfo.equals("/*")) {
            page = pathInfo.substring(1); 
        }
        
        String targetPath = "/views/" + page + ".jsp";
        
        try {
            request.getServletContext().getRequestDispatcher(targetPath).forward(request, response);
        } catch (Exception e) {

            response.sendError(HttpServletResponse.SC_NOT_FOUND, 
                "Page not found: " + page);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}