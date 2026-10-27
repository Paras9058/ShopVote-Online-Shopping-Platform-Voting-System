package com.shopvote;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/vote")
public class VoteServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();

        String platform = request.getParameter("platform");

        if (session.getAttribute("voted") != null) {
            response.sendRedirect(
                    request.getContextPath() + "/results.jsp");
            return;
        }

        if (platform == null ||
            !(platform.equals("Amazon")
            || platform.equals("Meesho")
            || platform.equals("Myntra")
            || platform.equals("HM")
            || platform.equals("Flipkart")
            || platform.equals("Other"))) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Please select a valid platform.");
            return;
        }

        String voterToken = session.getId();

        String sql = "INSERT INTO votes (platform, voter_token) VALUES (?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, platform);
            ps.setString(2, voterToken);

            ps.executeUpdate();

            session.setAttribute("voted", true);

            response.sendRedirect(
                    request.getContextPath() + "/results.jsp");

        } catch (SQLException e) {

            if ("23000".equals(e.getSQLState())) {
                session.setAttribute("voted", true);

                response.sendRedirect(
                        request.getContextPath() + "/results.jsp");
            } else {
                throw new ServletException(
                        "Unable to save the vote. Check the database connection.",
                        e);
            }
        }
    }
}