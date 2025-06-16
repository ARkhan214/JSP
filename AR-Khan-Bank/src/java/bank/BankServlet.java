package bank;

import model.Account;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;

public class BankServlet extends HttpServlet {

    private HashMap<Integer, Account> accounts = new HashMap<>();

    @Override
    public void init() {
        // Sample account
        accounts.put(101, new Account(101, "Savings"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("accounts", accounts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/home.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int accountId = Integer.parseInt(request.getParameter("accountId"));
        String action = request.getParameter("action");
        double amount = Double.parseDouble(request.getParameter("amount"));

        Account account = accounts.get(accountId);
        String message = "";

        if (account != null) {
            if ("deposit".equals(action)) {
                account.deposit(amount);
                message = "Deposited " + amount;
            } else if ("withdraw".equals(action)) {
                if (account.withdraw(amount)) {
                    message = "Withdrawn " + amount;
                } else {
                    message = "Insufficient balance!";
                }
            }
        } else {
            message = "Account not found";
        }

        request.setAttribute("message", message);
        request.setAttribute("accounts", accounts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/home.jsp");
        dispatcher.forward(request, response);
    }
}
