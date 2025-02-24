<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - MediBook</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background: linear-gradient(135deg, #2c3e50, #3498db);
            padding: 1rem;
        }
        .checkout-container {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="med.jsp">MediBook</a>
        </div>
    </nav>

    <div class="container mt-4">
        <h3>Checkout</h3>
        <div class="checkout-container">
            <form action="../OrderServlet" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="mb-3">
                    <label for="mobile" class="form-label">Mobile No</label>
                    <input type="text" class="form-control" id="mobile" name="mobile" required>
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="deliveryTime" class="form-label">Delivery Time</label>
                    <input type="time" class="form-control" id="deliveryTime" name="deliveryTime" required>
                </div>
                <div class="mb-3">
                    <label for="deliveryDate" class="form-label">Delivery Date</label>
                    <input type="date" class="form-control" id="deliveryDate" name="deliveryDate" required>
                </div>
                <div class="mb-3">
                    <label for="paymentMode" class="form-label">Payment Mode</label>
                    <select class="form-control" id="paymentMode" name="paymentMode" required>
                        <option value="Credit Card">Credit Card</option>
                        <option value="Cash on Delivery">Cash on Delivery</option>
                        <option value="PayPal">PayPal</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Confirm Checkout</button>
                <input type="hidden" id="cartData" name="cartData">

                
            </form>
        </div>
    </div>


    <script>

    document.querySelector("form").addEventListener("submit", function () {
        const cart = JSON.parse(localStorage.getItem("cart")) || []; // Get cart from localStorage

        // Convert cart to a format the server can easily process
        const cartFormatted = cart.map(item => `${item.name},${item.quantity},${item.price}`).join(";");

        // Store the formatted cart data in the hidden field
        document.getElementById("cartData").value = cartFormatted;
    });


    
        function confirmCheckout() {
            const name = document.getElementById('name').value;
            const mobile = document.getElementById('mobile').value;
            const address = document.getElementById('address').value;
            const deliveryTime = document.getElementById('deliveryTime').value;
            const deliveryDate = document.getElementById('deliveryDate').value;
            const paymentMode = document.getElementById('paymentMode').value;

            if (name && mobile && address && deliveryTime && deliveryDate && paymentMode) {
                // Get cart items from localStorage
                const cart = JSON.parse(localStorage.getItem('cart')) || []; // Default to empty array if no cart

                localStorage.setItem('orderDetails', JSON.stringify({ name, mobile, address, deliveryTime, deliveryDate, paymentMode, cart }));
                window.location.href = 'confirmation.jsp';
            } else {
                alert('Please fill all the details.');
            }
        }
    </script>
</body>
</html>