package medical_store;

import java.util.LinkedList;
import java.util.Scanner;

class CartItem  {
    private int medId;
    private String medName;
    private double price;
    private int quantity;

    public CartItem(int medId, String medName, double price, int quantity) {
        this.medId = medId;
        this.medName = medName;
        this.price = price;
        this.quantity = quantity;
    }

    public int getMedId() {
        return medId;
    }

    public String getMedName() {
        return medName;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal() {
        return price * quantity;
    }
}

public class CartManager extends Register_staff{
    static Scanner sc = new Scanner(System.in);
    static LinkedList<CartItem> cart = new LinkedList<>();

    public static void addCartItem() {
        System.out.print("Enter Medicine ID: ");
        int id = sc.nextInt();

        sc.nextLine();
        System.out.print("Enter Medicine Name: ");
        String name = sc.nextLine();

        System.out.print("Enter Price: ");
        double price = sc.nextDouble();

        System.out.print("Enter Quantity: ");
        int qty = sc.nextInt();

        CartItem item = new CartItem(id, name, price, qty);
        cart.add(item);

        System.out.println(name + " added to cart.");
    }

    public static void removeCartItem() {
        if (cart.isEmpty()) {
            System.out.println("Cart is empty!");
            return;
        }

        sc.nextLine();
        System.out.print("Enter Medicine Name to remove: ");
        String name = sc.nextLine();

        for (CartItem item : cart) {
            if (item.getMedName().equalsIgnoreCase(name)) {
                cart.remove(item);
                System.out.println(name + " removed from cart.");
                return;
            }
        }
        System.out.println("Item not found in cart.");
    }

    public static void viewCartItems() {
        if (cart.isEmpty()) {
            System.out.println("🛒 Cart is empty!");
            return;
        }

        double total = 0;
        System.out.println("\n--- Cart Items ---");
        for (CartItem item : cart) {
            System.out.println("ID: " + item.getMedId() +
                    " | Name: " + item.getMedName() +
                    " | Price: " + item.getPrice() +
                    " | Qty: " + item.getQuantity() +
                    " | Subtotal: " + item.getTotal());
            total += item.getTotal();
        }
        System.out.println("-----------------------------");
        System.out.println("TOTAL = " + total);
    }
}
