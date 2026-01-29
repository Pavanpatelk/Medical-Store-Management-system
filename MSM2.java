package medical_store;

import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

import static medical_store.Login_page.login;


public class MSM2 extends CartManager{
    static Scanner sc = new Scanner(System.in);
    static LinkedList<CartItem> cart = new LinkedList<>();

    public static void main(String[] args) throws Exception {
        Connection con = null;
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_store_management", "root", "");
            System.out.println(con != null ? "Connected" : "Not Connected");
        } catch (SQLException e) {
            System.out.println("Database connection failed: " + e.getMessage());
            return;
        }

        System.out.println("Welcome To Medical Store Management");

        while (true) {
            System.out.println("\n1. Login");
            System.out.println("2. Register as Customer");
            System.out.println("3. Register as Staff (Manager/Pharmacist)");
            System.out.println("4. Exit");

            int mainChoice;
            try {
                System.out.print("Enter choice: ");
                mainChoice = sc.nextInt();
            } catch (Exception e) {
                System.out.println("Please enter a valid number.");
                sc.nextLine();
                continue;
            }

            switch (mainChoice) {
                case 1:
                    login(con);
                    break;
                case 2:
                    registerCustomer(con);
                    break;
                case 3:
                    registerStaff(con);
                    break;
                case 4:
                    System.out.println("Exiting...");
                    System.exit(0);
                default:
                    System.out.println("Invalid choice. Please try again.");
            }

        }
    }

}