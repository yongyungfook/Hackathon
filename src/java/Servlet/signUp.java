package Servlet;

import java.time.*;
import java.util.Date;
import java.io.*;
import java.sql.*;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class signUp extends HttpServlet {

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Obtain parameters from the client
        String id = request.getParameter("id");
        String pass = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        char status = 'A'; //approved
        char type = 'U'; //user
        int score = 0;
        
        InputStream inputStream = null;

        Part filePart = request.getPart("photo");
        
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
           
        
        try {
            signUpUser(id, pass, name, status, type, email, inputStream, score);
            response.sendRedirect("login.jsp");
        } catch (SQLException ex) {
            response.sendRedirect("signUp.jsp?error=Username taken!");
        }

        
}

private void initializeJdbc() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(host, user, password);
            pstmt = conn.prepareStatement("INSERT INTO ACCOUNT(USERID, NAME, PASSWORD, TYPE, STATUS, EMAIL, PHOTO, LOYALTYSCORE) VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void signUpUser(String id, String pass, String name, char status, char type, String email, InputStream photo, int score) throws SQLException {
        pstmt.setString(1, id);
        pstmt.setString(2, name);
        pstmt.setString(3, pass);
        pstmt.setString(4, String.valueOf(type));
        pstmt.setString(5, String.valueOf(status));
        pstmt.setString(6, email);
        pstmt.setBlob(7, photo);
        pstmt.setInt(8, score);
        pstmt.executeUpdate();
    }

    public boolean equals(Object obj) {
        return (this == obj);
    }
}
