package Servlet;

import java.time.*;
import java.util.Date;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class redemption extends HttpServlet {

    private Connection conn;
    private PreparedStatement pstmt;
    private String host = "jdbc:derby://localhost:1527/hackathondb";
    private String user = "nbuser";
    private String password = "nbuser";

    // Initialize variables
    @Override
    public void init() throws ServletException {
        initializeJdbc();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Obtain parameters from the client
        HttpSession httpSession = request.getSession();

        String username = (String) (httpSession.getAttribute("userid"));
        int id = Integer.parseInt(request.getParameter("id"));
        
        try {
            redemption(username, id);
            response.sendRedirect("user/profile.jsp");
        } catch (Exception ex) {
            response.sendRedirect("user/redeem.jsp?error=SQL error!");
        }

        
}

private void initializeJdbc() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(host, user, password);
            pstmt = conn.prepareStatement("INSERT INTO REDEMPTION(USERID, VOUCHERID) VALUES(?, ?)");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void redemption(String username, int id) throws SQLException {
        pstmt.setString(1, username);
        pstmt.setInt(2, id);
        pstmt.executeUpdate();
    }

    public boolean equals(Object obj) {
        return (this == obj);
    }
}
