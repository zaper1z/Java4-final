package Utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtils {

    private static EntityManagerFactory factory;

    static {
        try {
            System.out.println("========================================");
            System.out.println("🔄 Đang khởi tạo EntityManagerFactory...");
            System.out.println("========================================");
            
            factory = Persistence.createEntityManagerFactory("PolyOE");
            
            System.out.println("✅ EntityManagerFactory khởi tạo THÀNH CÔNG!");
            System.out.println("========================================");
            
        } catch (Exception e) {
            System.out.println("❌❌❌ LỖI KHỞI TạO EntityManagerFactory ❌❌❌");
            System.out.println("Chi tiết lỗi:");
            e.printStackTrace();
            System.out.println("========================================");
            throw new RuntimeException("Lỗi khởi tạo EntityManagerFactory: " + e.getMessage(), e);
        }
    }

    public static EntityManager getEntityManager() {
        if (factory == null) {
            throw new RuntimeException("EntityManagerFactory chưa được khởi tạo!");
        }
        return factory.createEntityManager();
    }

    public static void shutdown() {
        if (factory != null && factory.isOpen()) {
            factory.close();
        }
    }
}