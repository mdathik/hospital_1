<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart - MediBook</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background: linear-gradient(135deg, #2c3e50, #3498db);
            padding: 1rem;
        }
        .cart-container {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
        }
        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .quantity-control {
            display: flex;
            align-items: center;
        }
        .quantity-control button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            margin: 0 5px;
        }
        .quantity-control span {
            min-width: 30px;
            text-align: center;
            font-weight: bold;
        }
        .remove-btn {
            background-color: red;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn a{
            text-decoration: none;
            color: white;
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
        <h3>Shopping Cart</h3>
        <div class="cart-container" id="cartItems">
            <p>Your cart is empty.</p>
        </div>
        <button class="btn btn-primary mt-3" onclick="goToCheckout()">Proceed to Checkout</button>
        <button class="btn btn-primary mt-3" id="btn"><a href="med.jsp">Back</a></button>
    </div>


    <script>
        let cart = JSON.parse(localStorage.getItem('cart')) || [];
        const cartItems = document.getElementById('cartItems');

        function displayCart() {
            if (cart.length === 0) {
                cartItems.innerHTML = '<p>Your cart is empty.</p>';
            } else {
                cartItems.innerHTML = cart.map((med, index) => `
                    <div class="cart-item">
                        <div>
                            <h5>${med.name}</h5>
                            <p>Price: $${med.price}</p>
                        </div>
                        <div class="quantity-control">
                            <button onclick="changeQuantity(${index}, -1)">-</button>
                            <span>${med.quantity}</span>
                            <button onclick="changeQuantity(${index}, 1)">+</button>
                        </div>
                        <button class="remove-btn" onclick="removeFromCart(${index})">Remove</button>
                    </div>
                `).join('');
            }
        }

        function changeQuantity(index, amount) {
            cart[index].quantity += amount;
            if (cart[index].quantity <= 0) {
                cart.splice(index, 1); // Remove if quantity is 0
            }
            localStorage.setItem('cart', JSON.stringify(cart));
            displayCart();
        }

        function removeFromCart(index) {
            cart.splice(index, 1);
            localStorage.setItem('cart', JSON.stringify(cart));
            displayCart();
        }

        function goToCheckout() {
            if (cart.length > 0) {
                window.location.href = 'checkout.jsp';
            } else {
                alert('Your cart is empty!');
            }
        }

        displayCart();
    </script>
</body>
</html>
