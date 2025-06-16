package model;

import java.util.ArrayList;

public class Account {
    private int accountId;
    private String accountType;
    private double balance;
    private ArrayList<String> transactions;

    public Account(int accountId, String accountType) {
        this.accountId = accountId;
        this.accountType = accountType;
        this.balance = 0;
        this.transactions = new ArrayList<>();
    }

    public int getAccountId() {
        return accountId;
    }

    public String getAccountType() {
        return accountType;
    }

    public double getBalance() {
        return balance;
    }

    public ArrayList<String> getTransactions() {
        return transactions;
    }

    public void deposit(double amount) {
        balance += amount;
        transactions.add("Deposit: " + amount);
    }

    public boolean withdraw(double amount) {
        if (balance >= amount) {
            balance -= amount;
            transactions.add("Withdraw: " + amount);
            return true;
        }
        return false;
    }
}
