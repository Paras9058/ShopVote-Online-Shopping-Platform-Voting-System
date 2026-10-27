<%@ page import="jakarta.servlet.ServletException" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ShopVote</title>
</head>

<body bgcolor="#E6E6FA">

    <center>

        <h1>ShopVote</h1>

        <h2>Your Choice, Your Voice</h2>

        <p>Vote for your favourite online shopping platform.</p>

        <hr width="70%">

        <h3>Select Your Favourite Platform</h3>

        <form action="${pageContext.request.contextPath}/vote" method="post">

            <table border="1" cellpadding="12">

                <tr>
                    <td>
                        <input type="radio" name="platform"
                               value="Amazon" required>
                        Amazon
                    </td>
                </tr>

                <tr>
                    <td>
                        <input type="radio" name="platform"
                               value="Meesho">
                        Meesho
                    </td>
                </tr>

                <tr>
                    <td>
                        <input type="radio" name="platform"
                               value="Myntra">
                        Myntra
                    </td>
                </tr>

                <tr>
                    <td>
                        <input type="radio" name="platform"
                               value="HM">
                        H&amp;M
                    </td>
                </tr>

                <tr>
                    <td>
                        <input type="radio" name="platform"
                               value="Flipkart">
                        Flipkart
                    </td>
                </tr>

                <tr>
                    <td>
                        <input type="radio" name="platform"
                               value="Other">
                        Other
                    </td>
                </tr>

            </table>

            <br>

            <input type="submit" value="Submit My Vote">

        </form>

        <br>

        <a href="results.jsp">View Voting Results</a>

        <hr width="70%">

        <p>Thank you for participating in ShopVote!</p>

    </center>

</body>
</html>