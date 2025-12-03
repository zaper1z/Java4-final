package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.FavoriteDAO;
import Dao.FavoriteDAOImpl;
import Entity.User;
import Entity.Favorite;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet("/admin-reports")
public class AdminReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminReportServlet() {
        System.out.println("🔥🔥🔥 AdminReportServlet ĐƯỢC TẠO (Constructor) 🔥🔥🔥");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("========================================");
        System.out.println("✅ AdminReportServlet ĐƯỢC GỌI");
        System.out.println("========================================");

        HttpSession session = request.getSession(false);
        
        if (session == null) {
            System.out.println("❌ Session NULL - Redirect về login");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User currentUser = (User) session.getAttribute("currentUser");

        if (currentUser == null) {
            System.out.println("❌ CurrentUser NULL - Redirect về login");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        if (!currentUser.getAdmin()) {
            System.out.println("❌ Không phải Admin - Redirect về home");
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        System.out.println("✅ User hợp lệ: " + currentUser.getFullname());
        System.out.println("✅ Is Admin: " + currentUser.getAdmin());

        try {
            FavoriteDAO favoriteDAO = new FavoriteDAOImpl();
            
            List<Favorite> allFavorites = favoriteDAO.findAll();
            System.out.println("📊 Tổng số favorites: " + allFavorites.size());

            // Xử lý dữ liệu để tạo báo cáo
            Map<String, Long> videoFavoriteCount = allFavorites.stream()
                .collect(Collectors.groupingBy(
                    f -> f.getVideo().getTitle(), 
                    Collectors.counting()
                ));

            request.setAttribute("favoriteVideos", videoFavoriteCount);
            request.setAttribute("favoriteUsers", allFavorites);
            
            System.out.println("📄 Forward đến /admin/reports.jsp");
            
            // ✅ SỬA: Forward đến đường dẫn TUYỆT ĐỐI từ webapp root
            // KHÔNG dùng /admin/reports.jsp vì sẽ bị AdminServlet bắt lại
            request.getRequestDispatcher("/admin/reports.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.out.println("❌ LỖI: " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi load dữ liệu reports");
        }

        System.out.println("========================================");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
