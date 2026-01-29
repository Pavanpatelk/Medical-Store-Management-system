package medical_store;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

import static medical_store.MSM2.cart;

public class Login_page extends Register_cust{
    static  Scanner sc = new Scanner(System.in);
    public static void login(Connection con) throws SQLException{
            System.out.println("\n--- Login ---");
            System.out.print("Enter Email ID: ");
            String email = sc.next();
            System.out.print("Enter Contact Number: ");
            long contact = sc.nextLong();

            PreparedStatement pst = con.prepareStatement(
                    "SELECT * FROM staff WHERE staff_email_id=? AND contact_no=?");
            pst.setString(1, email);
            pst.setLong(2, contact);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                String name = rs.getString("staff_name");
                String role = rs.getString("designation");
                System.out.println("Welcome " + name + " (" + role + ")");
                if (role.equalsIgnoreCase("Manager")) managerMenu(con);
                else pharmacistMenu(con, email);
                return;
            }

            pst = con.prepareStatement("SELECT * FROM customer WHERE customer_email_id=? AND contact_no=?");
            pst.setString(1, email);
            pst.setLong(2, contact);
            rs = pst.executeQuery();

            if (rs.next()) {
                String name = rs.getString("customer_name");
                System.out.println("Welcome " + name + " (Customer)");
                customerMenu(con, email);
                return;
            }

            System.out.println("Invalid credentials.");
    }



    public static void managerMenu(Connection con) throws SQLException {
        Login_page msm2 = new Login_page();
        while (true) {
            System.out.println("\n--- Manager Menu ---");
            System.out.println("1. Add Medicine");
            System.out.println("2. Remove Medicine");
            System.out.println("3. Update Medicine");
            System.out.println("4. Download Stock List");
            System.out.println("5. Logout");
            System.out.print("Enter choice: ");

            int choice;
            try {
                choice = sc.nextInt();
            } catch (Exception e) {
                System.out.println("Please enter a valid number.");
                sc.nextLine();
                continue;
            }

            switch (choice) {
                case 1:
                    msm2.addMedicine(con);
                    break;
                case 2:
                    msm2.removeMedicine(con);
                    break;
                case 3:
                    msm2.updateMedicine(con);
                    break;
                case 4:
                    msm2.downloadStockList(con);
                    break;
                case 5:
                    System.out.println("Logging out...");
                    return;
                default:
                    System.out.println("Invalid Choice");
            }
        }
    }


    public static void pharmacistMenu(Connection con, String staffEmail) throws SQLException {
        Login_page msm2 = new Login_page();
        while (true) {
            System.out.println("\n--- Pharmacist Menu ---");
            System.out.println("1. Sell Product");
            System.out.println("2. View Sales History");
            System.out.println("3. Edit Sale");
            System.out.println("4. Logout");
            System.out.print("Enter choice: ");

            int choice;
            try {
                choice = sc.nextInt();
            } catch (Exception e) {
                System.out.println("Please enter a valid number.");
                sc.nextLine(); // clear invalid input
                continue;
            }

            switch (choice) {
                case 1:
                    msm2.sellProduct(con, staffEmail);
                    break;
                case 2:
                    msm2.viewSalesHistory(con);
                    break;
                case 3:
                    msm2.editSale(con);
                    break;
                case 4:
                    System.out.println("Logging out...");
                    return;
                default:
                    System.out.println("Invalid Choice");
            }
        }
    }


    public static void customerMenu(Connection con, String custEmail) throws SQLException {
        Login_page msm2 = new Login_page();
        while (true) {
            System.out.println("\n--- Customer Menu ---");
            System.out.println("1. Add To Cart");
            System.out.println("2. Edit Cart");
            System.out.println("3. View Cart");
            System.out.println("4. Checkout");
            System.out.println("5. Purchase History");
            System.out.println("6. Logout");
            System.out.print("Enter choice: ");

            int choice;
            try {
                choice = sc.nextInt();
            } catch (Exception e) {
                System.out.println("Please enter a valid number.");
                sc.nextLine(); // clear invalid input
                continue;
            }

            switch (choice) {
                case 1:
                    msm2.addCart(con);
                    break;
                case 2:
                    msm2.editCart();
                    break;
                case 3:
                    msm2.viewCart();
                    break;
                case 4:
                    msm2.checkout(con, custEmail);
                    break;
                case 5:
                    msm2.purchaseHistory(con, custEmail);
                    break;
                case 6:
                    System.out.println("Logging out...");
                    return;
                default:
                    System.out.println("Invalid Choice");
            }
        }
    }

    static public void addMedicine(Connection con) throws SQLException {
        try {
            PreparedStatement pst = con.prepareStatement("INSERT INTO medicines (med_name,manufacture_name,med_type,med_price,quantity,mfg_date,exp_date,description) VALUES (?,?,?,?,?,?,?,?)");

            sc.nextLine();
            System.out.print("Enter Medicine Name: ");
            String mName = sc.nextLine();

            PreparedStatement pst2 = con.prepareStatement("SELECT * FROM medicines WHERE med_name=?");
            pst2.setString(1, mName);
            ResultSet rs2 = pst2.executeQuery();
            if (rs2.next()) {
                System.out.println("Medicine already exists. Please enter a new name.");
                return;
            } else {
                pst.setString(1, mName);
            }

            System.out.print("Enter Manufacture: ");
            pst.setString(2, sc.next());

            System.out.print("Enter Medicine Type: ");
            pst.setString(3, sc.next());

            System.out.print("Enter Price: ");
            pst.setDouble(4, sc.nextDouble());

            System.out.print("Enter Quantity: ");
            pst.setInt(5, sc.nextInt());

            System.out.println("Enter Manufacture Date (YYYY-MM-DD): ");
            pst.setDate(6, java.sql.Date.valueOf(sc.next()));

            System.out.println("Enter Expiry Date (YYYY-MM-DD): ");
            pst.setDate(7, java.sql.Date.valueOf(sc.next()));

            System.out.print("Enter Description: ");
            sc.nextLine();
            pst.setString(8, sc.nextLine());

            int r = pst.executeUpdate();
            System.out.println((r > 0) ? "Medicine Added Successfully" : "Medicine Not Added");
        } catch (SQLException e) {
            System.out.println("Error adding medicine: " + e.getMessage());
        }
    }
    public void removeMedicine(Connection con) {
        try {
            System.out.print("Enter Medicine name to remove: ");
            sc.nextLine(); // Clear buffer
            String medName = sc.nextLine();

            PreparedStatement pst = con.prepareStatement("DELETE FROM medicines WHERE med_name=?");
            pst.setString(1, medName);

            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Medicine '" + medName + "' removed successfully!");
            } else {
                System.out.println("Medicine not found or could not be removed.");
            }
        } catch (SQLException e) {
            System.out.println("Error removing medicine: " + e.getMessage());
        }
    }

    public void updateMedicine(Connection con) {
        try {
            System.out.print("Enter Medicine ID to update: ");
            int medId = sc.nextInt();

            PreparedStatement checkStmt = con.prepareStatement("SELECT * FROM medicines WHERE med_id=?");
            checkStmt.setInt(1, medId);
            ResultSet rs = checkStmt.executeQuery();

            if (!rs.next()) {
                System.out.println("Medicine with ID " + medId + " not found.");
                return;
            }

            System.out.println("Current details:");
            System.out.println("Name: " + rs.getString("med_name"));
            System.out.println("Price: " + rs.getDouble("med_price"));
            System.out.println("Quantity: " + rs.getInt("quantity"));

            System.out.println("\nEnter new details (press Enter to keep current value):");
            sc.nextLine();

            System.out.print("New Price (" + rs.getDouble("med_price") + "): ");
            String priceInput = sc.nextLine();
            double newPrice = priceInput.isEmpty() ? rs.getDouble("med_price") : Double.parseDouble(priceInput);

            System.out.print("New Quantity (" + rs.getInt("quantity") + "): ");
            String qtyInput = sc.nextLine();
            int newQty = qtyInput.isEmpty() ? rs.getInt("quantity") : Integer.parseInt(qtyInput);

            PreparedStatement pst = con.prepareStatement("UPDATE medicines SET med_price=?, quantity=? WHERE med_id=?");
            pst.setDouble(1, newPrice);
            pst.setInt(2, newQty);
            pst.setInt(3, medId);

            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Medicine updated successfully!");
            } else {
                System.out.println("Failed to update medicine.");
            }
        } catch (SQLException e) {
            System.out.println("Error updating medicine: " + e.getMessage());
        } catch (NumberFormatException e) {
            System.out.println("Invalid number format. Please enter valid numbers.");
        }
    }

    public void downloadStockList(Connection con) {
        try {
            PreparedStatement pst = con.prepareStatement("SELECT * FROM medicines ORDER BY med_name");
            ResultSet rs = pst.executeQuery();

            // Create downloads directory if it doesn't exist
            File downloadsDir = new File(System.getProperty("user.home") + "/Downloads/MedicalStore");
            if (!downloadsDir.exists()) {
                downloadsDir.mkdirs();
            }

            // Create file with timestamp
            String timestamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
            File file = new File(downloadsDir, "StockList_" + timestamp + ".txt");

            FileWriter writer = new FileWriter(file);
            writer.write("MEDICAL STORE STOCK LIST\n");
            writer.write("Generated on: " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) + "\n");
            writer.write("================================================================================\n\n");

            int totalMedicines = 0;
            double totalValue = 0;

            while (rs.next()) {
                writer.write("Medicine ID: " + rs.getInt("med_id") + "\n");
                writer.write("Name: " + rs.getString("med_name") + "\n");
                writer.write("Manufacturer: " + rs.getString("manufacture_name") + "\n");
                writer.write("Type: " + rs.getString("med_type") + "\n");
                writer.write("Price: ₹" + rs.getDouble("med_price") + "\n");
                writer.write("Quantity: " + rs.getInt("quantity") + "\n");
                writer.write("Stock Value: ₹" + (rs.getDouble("med_price") * rs.getInt("quantity")) + "\n");
                writer.write("Mfg Date: " + rs.getDate("mfg_date") + "\n");
                writer.write("Exp Date: " + rs.getDate("exp_date") + "\n");
                writer.write("Description: " + rs.getString("description") + "\n");
                writer.write("--------------------------------------------------------------------------------\n");

                totalMedicines++;
                totalValue += (rs.getDouble("med_price") * rs.getInt("quantity"));
            }

            writer.write("\nSUMMARY:\n");
            writer.write("Total Medicines: " + totalMedicines + "\n");
            writer.write("Total Stock Value: ₹" + totalValue + "\n");
            writer.write("================================================================================\n");

            writer.close();
            System.out.println("Stock list downloaded successfully to: " + file.getAbsolutePath());
        } catch (SQLException | IOException e) {
            System.out.println("Error downloading stock list: " + e.getMessage());
        }
    }

    public void sellProduct(Connection con, String staffEmail) throws SQLException {
        try{
            System.out.print("Enter Customer Email: ");
            String custEmail = sc.next();

            PreparedStatement pst = con.prepareStatement("SELECT * FROM customer WHERE customer_email_id=?");
            pst.setString(1, custEmail);
            ResultSet rs = pst.executeQuery();
            if (!rs.next()) {
                System.out.println(" Customer not found!");
                return;
            }
            int customerId = rs.getInt("customer_id");

            System.out.print("Enter Medicine Name: ");
            sc.nextLine();
            String medName = sc.nextLine();

            pst = con.prepareStatement("SELECT * FROM medicines WHERE med_name=?");
            pst.setString(1, medName);
            rs = pst.executeQuery();

            if (rs.next()) {
                int medId = rs.getInt("med_id");
                int stock = rs.getInt("quantity");
                double price = rs.getDouble("med_price");

                System.out.println("Available Stock: " + stock + " | Price: " + price);
                System.out.print("Enter Quantity: ");
                int qty = sc.nextInt();

                if (qty <= 0 || qty > stock) {
                    System.out.println(" Invalid quantity");
                    return;
                }

                double total = qty * price;

                pst = con.prepareStatement("UPDATE medicines SET quantity=quantity-? WHERE med_id=?");
                pst.setInt(1, qty);
                pst.setInt(2, medId);
                pst.executeUpdate();

                pst = con.prepareStatement("SELECT staff_id FROM Staff WHERE staff_email_id=?");
                pst.setString(1, staffEmail);
                ResultSet rs2 = pst.executeQuery();
                rs2.next();
                int staffId = rs2.getInt("staff_id");

                pst = con.prepareStatement("INSERT INTO sales_history (customer_id, staff_id, med_id, quantity, total_price, med_name) VALUES (?,?,?,?,?,?)");
                pst.setInt(1, customerId);
                pst.setInt(2, staffId);
                pst.setInt(3, medId);
                pst.setInt(4, qty);
                pst.setDouble(5, total);
                pst.setString(6, medName);
                pst.executeUpdate();

                pst = con.prepareStatement("INSERT INTO bill (customer_id, staff_id, purchase_date, total_amount, payment_method, customer_email_id) VALUES (?,?,CURDATE(),?,?,?)");
                pst.setInt(1, customerId);
                pst.setInt(2, staffId);
                pst.setDouble(3, total);
                System.out.print("Enter Payment Method (Cash/UPI/Card): ");
                pst.setString(4, sc.next());
                pst.setString(5, custEmail);
                pst.executeUpdate();

                System.out.println(" Sale completed! Total: " + total);
            } else {
                System.out.println(" Medicine not found!");
            }
        } catch (SQLException  e) {
            System.out.println("Error while processing sale: " + e.getMessage());
        }

    }

    public void viewSalesHistory(Connection con) throws SQLException {

        try {
            PreparedStatement pst = con.prepareStatement("SELECT * FROM sales_history");
            ResultSet rs = pst.executeQuery();
            System.out.println("\n---------- Sales History ----------");
            while (rs.next()) {
                System.out.println("Sale ID: " + rs.getInt("sale_id") +
                        " | Customer ID: " + rs.getInt("customer_id") +
                        " | Medicine ID: " + rs.getInt("med_id") +
                        " | Medicine Name: " + rs.getString("med_name") +   // NEW
                        " | Qty: " + rs.getInt("quantity") +
                        " | Total: " + rs.getDouble("total_price") +
                        " | Date: " + rs.getTimestamp("sale_date"));

            }
        } catch (SQLException e) {
            System.out.println("Error fetching sales history: " + e.getMessage());
        }

    }

    public void editSale(Connection con) throws SQLException {
        try{
            System.out.print("Enter Sale ID to edit: ");
            int saleId = sc.nextInt();

            PreparedStatement pst = con.prepareStatement("SELECT * FROM sales_history WHERE sale_id=?");
            pst.setInt(1, saleId);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                int oldQty = rs.getInt("quantity");
                int medId = rs.getInt("med_id");
                double pricePerUnit = rs.getDouble("total_price") / oldQty;

                System.out.print("Enter new quantity: ");
                int newQty = sc.nextInt();

                int diff = newQty - oldQty;
                pst = con.prepareStatement("UPDATE medicines SET quantity=quantity-? WHERE med_id=?");
                pst.setInt(1, diff);
                pst.setInt(2, medId);
                pst.executeUpdate();

                pst = con.prepareStatement("UPDATE sales_history SET quantity=?, total_price=? WHERE sale_id=?");
                pst.setInt(1, newQty);
                pst.setDouble(2, newQty * pricePerUnit);
                pst.setInt(3, saleId);
                pst.executeUpdate();

                System.out.println(" Sale updated successfully!");
            } else {
                System.out.println(" Sale not found!");
            }
        }
        catch (SQLException e) {
            System.out.println("Error updating sale: " + e.getMessage());
        }
    }

    public void addCart(Connection con) throws SQLException {
        try {
            System.out.print("Enter Medicine Name to add: ");
            sc.nextLine();
            String medName = sc.nextLine();

            PreparedStatement pst = con.prepareStatement("SELECT * FROM medicines WHERE med_name=?");
            pst.setString(1, medName);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                double price = rs.getDouble("med_price");
                int stock = rs.getInt("quantity");
                int medId = rs.getInt("med_id");

                System.out.println("Medicine: " + medName + " | Price: " + price + " | Stock: " + stock);
                System.out.print("Enter quantity: ");
                int qty = sc.nextInt();

                if (qty <= 0 || qty > stock) {
                    System.out.println(" Invalid quantity");
                    return;
                }

                cart.add(new CartItem(medId, medName, price, qty));
                System.out.println(medName + " added to cart!");
            } else {
                System.out.println(" Medicine not found!");
            }
        }
        catch (SQLException e) {
            System.out.println("Error while adding to cart: " + e.getMessage());
        }
    }

    void editCart() {
        if (cart.isEmpty()) {
            System.out.println(" Cart is empty!");
            return;
        }

        System.out.print("Enter Medicine Name to edit: ");
        sc.nextLine();
        String medName = sc.nextLine();

        for (CartItem item : cart) {
            if (item.getMedName().equals(medName)) {
                System.out.print("Enter new quantity: ");
                int newQty = sc.nextInt();

                if (newQty == 0) {
                    cart.remove(item);
                }

                if (newQty < 0) {
                    System.out.println(" Quantity must be greater than 0.");
                    return;
                }

                item.setQuantity(newQty);
                System.out.println(" Quantity updated successfully!");
                return;
            }
        }

        System.out.println(" Medicine not found in cart!");
    }

    void viewCart() {
        if (cart.isEmpty()) {
            System.out.println(" Cart is empty!");
            return;
        }

        System.out.println("\n---------- Your Cart ----------");
        double total = 0;
        for (CartItem item : cart) {
            System.out.println("ID: " + item.getMedId() + " | " + item.getMedName() +
                    " | Qty: " + item.getQuantity() +
                    " | Price: " + item.getPrice() +
                    " | Subtotal: " + item.getTotal());
            total += item.getTotal();
        }
        System.out.println("--------------------------------");
        System.out.println("TOTAL = " + total);
    }

    public void checkout(Connection con, String custEmail) throws SQLException {
        PreparedStatement pst;
        ResultSet rs;

        pst = con.prepareStatement("SELECT customer_id FROM customer WHERE customer_email_id=?");
        pst.setString(1, custEmail);
        rs = pst.executeQuery();

        int customerId = 0;
        if (rs.next()) {
            customerId = rs.getInt("customer_id");
        } else {
            System.out.println("Customer not found!");
            return;
        }

        pst = con.prepareStatement("SELECT IFNULL(MAX(bill_id),0)+1 AS nextId FROM bill");
        rs = pst.executeQuery();
        int billId = 1;
        if (rs.next()) {
            billId = rs.getInt("nextId");
        }

        System.out.println("Enter Payment Method (Cash/UPI/Card):");
        String paymentMethod = sc.next();

        double totalAmount = 0.0;
        for (CartItem item : cart) {
            totalAmount += item.getPrice() * item.getQuantity();
        }

        java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(System.currentTimeMillis());

        try{
            pst = con.prepareStatement("INSERT INTO bill ( customer_id, purchase_date, total_amount,payment_method,customer_email_id) VALUES (?, ?, ?, ?, ?)");

            pst.setInt(1, customerId);
            pst.setTimestamp(2, currentTimestamp);
            pst.setDouble(3, totalAmount);
            pst.setString(4, paymentMethod);
            pst.setString(5, custEmail);
            pst.executeUpdate();

            for (CartItem item : cart) {
                pst = con.prepareStatement("INSERT INTO sales_history (customer_id, med_id, quantity, total_price, sale_date, med_name) VALUES (?, ?, ?, ?, ?, ?)");
                pst.setInt(1, customerId);
                pst.setInt(2, item.getMedId());
                pst.setInt(3, item.getQuantity());
                pst.setDouble(4, item.getPrice() * item.getQuantity());
                pst.setTimestamp(5, currentTimestamp);
                pst.setString(6, item.getMedName());
                pst.executeUpdate();

            }

            cart.clear();
            System.out.println("Checkout complete! Bill ID: " + billId);
            System.out.println("Thank You For Shopping With Us!");

        }
        catch (SQLException e) {
            System.out.println("Error during checkout: " + e.getMessage());
        }
        pst = con.prepareStatement("INSERT INTO bill (bill_id, customer_id, purchase_date, total_amount,payment_method,customer_email_id) VALUES (?, ?, ?, ?, ?, ?)");
        pst.setInt(1, billId);
        pst.setInt(2, customerId);
        pst.setTimestamp(3, currentTimestamp);
        pst.setDouble(4, totalAmount);
        pst.setString(5, paymentMethod);
        pst.setString(6, custEmail);
        pst.executeUpdate();

        for (CartItem item : cart) {
            pst = con.prepareStatement("INSERT INTO sales_history (customer_id, med_id, quantity, total_price, sale_date, med_name) VALUES (?, ?, ?, ?, ?, ?)");
            pst.setInt(1, customerId);
            pst.setInt(2, item.getMedId());
            pst.setInt(3, item.getQuantity());
            pst.setDouble(4, item.getPrice() * item.getQuantity());
            pst.setTimestamp(5, currentTimestamp);
            pst.setString(6, item.getMedName());
            pst.executeUpdate();

        }

        cart.clear();
        System.out.println("Checkout complete! Bill ID: " + billId);
        System.out.println("Thank You For Shopping With Us!");
    }


    void purchaseHistory(Connection con, String custEmail) throws SQLException {
        PreparedStatement pst = con.prepareStatement(
                "SELECT b.bill_id, b.purchase_date, b.total_amount, b.payment_method FROM bill b WHERE b.customer_email_id=? ORDER BY b.purchase_date DESC"
        );
        pst.setString(1, custEmail);
        ResultSet rs = pst.executeQuery();

        System.out.println("\n---------- Purchase History ----------");
        while (rs.next()) {
            System.out.println("Bill ID: " + rs.getInt("bill_id") +
                    " | Date: " + rs.getDate("purchase_date") +
                    " | Total: " + rs.getDouble("total_amount") +
                    " | Payment: " + rs.getString("payment_method"));
        }
    }
}
