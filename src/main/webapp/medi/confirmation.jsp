<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
  
</head>
<body>
    <div class="container mt-5">
        <h2>Order Confirmation</h2>
        <p>Your order has been placed successfully!</p>

        <h4>Order Details:</h4>
        <ul>
            <li><strong>Order ID:</strong> <%= session.getAttribute("orderId") %></li>
            <li><strong>Name:</strong> <%= session.getAttribute("name") %></li>
            <li><strong>Mobile:</strong> <%= session.getAttribute("mobile") %></li>
            <li><strong>Address:</strong> <%= session.getAttribute("address") %></li>
            <li><strong>Delivery Time:</strong> <%= session.getAttribute("deliveryTime") %></li>
            <li><strong>Delivery Date:</strong> <%= session.getAttribute("deliveryDate") %></li>
            <li><strong>Payment Mode:</strong> <%= session.getAttribute("paymentMode") %></li>
        </ul>

        <h4>Order Items:</h4>
        <table class="table table-bordered" id="orderTable">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String cartData = (String) session.getAttribute("cartItems");
                    if (cartData != null && !cartData.isEmpty()) {
                        String[] cartItems = cartData.split(";");
                        for (String item : cartItems) {
                            String[] details = item.split(",");
                            if (details.length == 3) {
                %>
                                <tr>
                                    <td><%= details[0] %></td>
                                    <td><%= details[1] %></td>
                                    <td>₹<%= details[2] %></td>
                                </tr>
                <%
                            }
                        }
                    }
                %>
            </tbody>
        </table>

        <button class="btn btn-success mt-3" onclick="downloadReceipt()">Download Receipt</button>
        <a href="index.html" class="btn btn-primary mt-3">Back to Home</a>
    </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.25/jspdf.plugin.autotable.min.js"></script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const { jsPDF } = window.jspdf; // Correct way to access jsPDF

        if (!jsPDF) {
            console.error("jsPDF is not loaded. Check script import.");
            return;
        }

        window.downloadReceipt = function () {  // Make sure it's in global scope
            console.log("Download button clicked!");

            const doc = new jsPDF();
            doc.setFontSize(16);
            doc.text("MediBook - Order Receipt", 14, 10);
            doc.setFontSize(12);
            doc.text("----------------------------------------", 14, 15);
            doc.text("Order Details", 14, 20);
            doc.text("----------------------------------------", 14, 25);

            let y = 35;

            // Fetch session attributes safely
            const orderId = "<%= session.getAttribute("orderId") != null ? session.getAttribute("orderId").toString() : "" %>";
            const name = "<%= session.getAttribute("name") != null ? session.getAttribute("name").toString() : "" %>";
            const mobile = "<%= session.getAttribute("mobile") != null ? session.getAttribute("mobile").toString() : "" %>";
            const address = "<%= session.getAttribute("address") != null ? session.getAttribute("address").toString() : "" %>";
            const deliveryTime = "<%= session.getAttribute("deliveryTime") != null ? session.getAttribute("deliveryTime").toString() : "" %>";
            const deliveryDate = "<%= session.getAttribute("deliveryDate") != null ? session.getAttribute("deliveryDate").toString() : "" %>";
            const paymentMode = "<%= session.getAttribute("paymentMode") != null ? session.getAttribute("paymentMode").toString() : "" %>";

            doc.text(`Order ID: ${orderId}`, 14, y);
            doc.text(`Name: ${name}`, 14, y + 10);
            doc.text(`Mobile: ${mobile}`, 14, y + 20);
            doc.text(`Address: ${address}`, 14, y + 30);
            doc.text(`Delivery Time: ${deliveryTime}`, 14, y + 40);
            doc.text(`Delivery Date: ${deliveryDate}`, 14, y + 50);
            doc.text(`Payment Mode: ${paymentMode}`, 14, y + 60);

            if (typeof doc.autoTable !== "function") {
                console.error("autoTable plugin is not loaded. Check script import.");
                return;
            }

            // Extract table data
            const orderTable = document.getElementById("orderTable");
            const tableData = [];
            for (let i = 1; i < orderTable.rows.length; i++) {
                const row = orderTable.rows[i];
                const rowData = [
                    row.cells[0].textContent,
                    row.cells[1].textContent,
                    row.cells[2].textContent
                ];
                tableData.push(rowData);
            }

            // Generate the table
            doc.autoTable({
                head: [['Product Name', 'Quantity', 'Price']],
                body: tableData,
                startY: y + 70,
            });

            // Save the file
            console.log("Saving PDF...");
            doc.save("order_receipt.pdf");
        };
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    

</body>
</html>
