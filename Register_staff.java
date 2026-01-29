package medical_store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Register_staff extends Register_cust {
    public static void registerStaff(Connection con) {
        Scanner sc = new Scanner(System.in);
        try {
            System.out.println("\n--- Staff Registration ---");

            System.out.print("Enter Full Name: ");
            String name = sc.nextLine();

            System.out.print("Enter Email ID: ");
            String email = sc.next();

            PreparedStatement checkStmt = con.prepareStatement(
                    "SELECT staff_id FROM staff WHERE staff_email_id = ?");
            checkStmt.setString(1, email);
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next()) {
                System.out.println("Email already registered as staff.");
                return;
            }

            System.out.print("Enter Contact Number: ");
            long contact = sc.nextLong();

            if (String.valueOf(contact).length() < 10) {
                System.out.println("Please enter a valid 10-digit contact number.");
                return;
            }

            System.out.print("Enter Designation (Manager/Pharmacist): ");
            String designation = sc.next();

            System.out.print("Enter Gender (Male/Female/Other): ");
            String gender = sc.next();

            System.out.print("Enter Date of Birth (YYYY-MM-DD): ");
            String dob = sc.next();

            sc.nextLine();
            System.out.print("Enter Address: ");
            String address = sc.nextLine();

            System.out.print("Enter Date of Joining (YYYY-MM-DD): ");
            String doj = sc.next();
            sc.nextLine();

            System.out.println("Enter salary : ");
            double salary = sc.nextDouble();

            PreparedStatement pst = con.prepareStatement(
                    "INSERT INTO staff (staff_name ,gender ,date_of_birth ,contact_no , staff_email_id, address,  designation, date_of_joining, salary) VALUES (?,?,?,?,?,?,?,?,?)");
            pst.setString(1, name);
            pst.setString(2,gender);
            pst.setString(3,dob);
            pst.setLong(4, contact);
            pst.setString(5, email);
            pst.setString(6, address);
            pst.setString(7, designation);
            pst.setString(8, doj);
            pst.setDouble(9, salary);

            int rowsAffected = pst.executeUpdate();
            System.out.println(rowsAffected > 0 ? "Staff registered successfully!" : "Registration failed.");
        } catch (SQLException e) {
            System.out.println("Error during staff registration: " + e.getMessage());
        }
    }
}
