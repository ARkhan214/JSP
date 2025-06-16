<%@include file="header.jsp" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Banking System</title></head>
<body>
<h1>Simple Banking System</h1>

<!--<c:if test="${not empty message}">
    <p style="color:green;">${message}</p>
</c:if>-->

<table border="1">
    <tr>
        <th>Account ID</th>
        <th>Account Type</th>
        <th>Balance</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="acc" items="${accounts.values()}">
        <tr>
            <td>${acc.accountId}</td>
            <td>${acc.accountType}</td>
            <td>${acc.balance}</td>
            <td>
                <form action="BankServlet" method="post" style="display:inline;">
                    <input type="hidden" name="accountId" value="${acc.accountId}">
                    <input type="hidden" name="action" value="deposit">
                    Amount: <input type="text" name="amount" required>
                    <input type="submit" value="Deposit">
                </form>
                <form action="BankServlet" method="post" style="display:inline;">
                    <input type="hidden" name="accountId" value="${acc.accountId}">
                    <input type="hidden" name="action" value="withdraw">
                    Amount: <input type="text" name="amount" required>
                    <input type="submit" value="Withdraw">
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
<%@include file="footer.jsp" %>