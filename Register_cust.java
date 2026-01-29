package medical_store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Register_cust {
    public static void registerCustomer(Connection con) {
        Scanner sc = new Scanner(System.in);

        try {
            System.out.println("\n--- Customer Registration ---");

            System.out.print("Enter Full Name: ");
            String name = sc.nextLine();

            System.out.print("Enter Email ID: ");
            String email = sc.next();

            PreparedStatement checkStmt = con.prepareStatement(
                    "SELECT customer_id FROM customer WHERE customer_email_id = ?");
            checkStmt.setString(1, email);
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next()) {
                System.out.println("Email already registered. Please login instead.");
                return;
            }

            System.out.print("Enter Contact Number: ");
            long contact = sc.nextLong();

            if (String.valueOf(contact).length() < 10) {
                System.out.println("Please enter a valid 10-digit contact number.");
                return;
            }

            System.out.print("Enter Gender (Male/Female/Other): ");
            String gender = sc.next();

            System.out.print("Enter Date of Birth (YYYY-MM-DD): ");
            String dob = sc.next();

            sc.nextLine();
            System.out.print("Enter Address: ");
            String address = sc.nextLine();

            PreparedStatement pst = con.prepareStatement(
                    "INSERT INTO customer (customer_id, customer_name, customer_gender, date_of_birth, contact_no, customer_email_id, address) VALUES (NULL,?,?,?,?,?,?)");
            pst.setString(1, name);
            pst.setString(2, gender);
            pst.setDate(3, java.sql.Date.valueOf(dob));
            pst.setLong(4, contact);
            pst.setString(5, email);
            pst.setString(6, address);

            int rowsAffected = pst.executeUpdate();
            System.out.println(rowsAffected > 0 ? "Registration successful!" : "Registration failed.");
        } catch (SQLException e) {
            System.out.println("Error during registration: " + e.getMessage());
        }
    }
}
