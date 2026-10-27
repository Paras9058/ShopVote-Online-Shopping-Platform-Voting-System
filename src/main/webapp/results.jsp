<%@ page import="java.sql.*" %>
<%@ page import="com.shopvote.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>ShopVote Results</title>
</head>
<body>

    <h1>ShopVote Results</h1>

    <h3>Voting Results</h3>

    <table border="1" cellpadding="10">
        <tr>
            <th>Shopping Platform</th>
            <th>Total Votes</th>
        </tr>

        <%
            String sql = "SELECT platform, COUNT(*) AS total FROM votes GROUP BY platform";

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                boolean found = false;

                while (rs.next()) {
                    found = true;
        %>
        <tr>
            <td><%= rs.getString("platform") %></td>
            <td><%= rs.getInt("total") %></td>
        </tr>
        <%
                }

                if (!found) {
        %>
        <tr>
            <td colspan="2">No votes have been recorded yet.</td>
        </tr>
        <%
                }

            } catch (SQLException e) {
        %>
        <tr>
            <td colspan="2">Unable to load results. Please check the database connection.</td>
        </tr>
        <%
                e.printStackTrace();
            }
        %>
    </table>

    <br>

    <a href="<%= request.getContextPath() %>/index.jsp">Back to Voting</a>

</body>
</html>