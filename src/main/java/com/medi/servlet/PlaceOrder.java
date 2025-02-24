package com.medi.servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/OrderServlet")
public class PlaceOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String deliveryTime = request.getParameter("deliveryTime");
        String deliveryDate = request.getParameter("deliveryDate");
        String paymentMode = request.getParameter("paymentMode");
        String cartData = request.getParameter("cartData"); // Cart data as formatted string

        Connection conn = null;
        PreparedStatement psOrder = null;
        PreparedStatement psItem = null;

        try {
            // 1️⃣ Database Connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_2", "root", "7860");

            // 2️⃣ Insert Order Details
            String orderQuery = "INSERT INTO orders (name, mobile, address, delivery_time, delivery_date, payment_mode) VALUES (?, ?, ?, ?, ?, ?)";
            psOrder = conn.prepareStatement(orderQuery, Statement.RETURN_GENERATED_KEYS);
            psOrder.setString(1, name);
            psOrder.setString(2, mobile);
            psOrder.setString(3, address);
            psOrder.setString(4, deliveryTime);
            psOrder.setString(5, deliveryDate);
            psOrder.setString(6, paymentMode);

            int orderResult = psOrder.executeUpdate();
            if (orderResult > 0) {
                ResultSet rs = psOrder.getGeneratedKeys();
                int orderId = 0;
                if (rs.next()) {
                    orderId = rs.getInt(1);
                }

                // 3️⃣ Insert Order Items
                if (cartData != null && !cartData.isEmpty()) {
                    String[] cartItems = cartData.split(";"); // Splitting items

                    String itemQuery = "INSERT INTO order_items (order_id, product_name, quantity, price) VALUES (?, ?, ?, ?)";
                    psItem = conn.prepareStatement(itemQuery);

                    for (String item : cartItems) {
                        String[] itemDetails = item.split(","); // Splitting details

                        // Ensure valid parsing
                        if (itemDetails.length == 3) {
                            String productName = itemDetails[0];
                            int quantity = Integer.parseInt(itemDetails[1].trim()); // Convert string to int
                            double price = Double.parseDouble(itemDetails[2].trim()); // Convert string to double

                            psItem.setInt(1, orderId);
                            psItem.setString(2, productName);
                            psItem.setInt(3, quantity);
                            psItem.setDouble(4, price);
                            psItem.executeUpdate();
                        }
                    }
                }

                // 4️⃣ Redirect to Confirmation Page
             // Pass order details using session
                HttpSession session = request.getSession();
                session.setAttribute("orderId", orderId);
                session.setAttribute("name", name);
                session.setAttribute("mobile", mobile);
                session.setAttribute("address", address);
                session.setAttribute("deliveryTime", deliveryTime);
                session.setAttribute("deliveryDate", deliveryDate);
                session.setAttribute("paymentMode", paymentMode);
                session.setAttribute("cartItems", cartData); // Store cart details

                response.sendRedirect("./medi/confirmation.jsp");

            } else {
                response.sendRedirect("./medi/checkout.jsp?status=error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("./medi/checkout.jsp?status=error");
        } finally {
            try {
                if (psOrder != null) psOrder.close();
                if (psItem != null) psItem.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
