<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediCare - Home</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        /* Custom Styles */
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background: linear-gradient(135deg, #2c3e50, #3498db);
            padding: 1rem;
        }
        .cart-container {
            position: relative;
        }
        .cart-icon {
            font-size: 24px;
            color: white;
            position: relative;
            text-decoration: none;
        }
        .cart-badge {
            position: absolute;
            top: -5px;
            right: -10px;
            background-color: red;
            color: white;
            font-size: 14px;
            font-weight: bold;
            border-radius: 50%;
            padding: 3px 7px;
            display: none;
        }
        .medicine-card {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s;
            text-align: center;
        }
        .medicine-card:hover {
            transform: translateY(-5px);
        }
        .medicine-img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-dark">
    <a class="navbar-brand" href="../index.jsp"><i class="fa-solid fa-arrow-left"></i>Back</a>
        <div class="container d-flex justify-content-between">        	
            <a class="navbar-brand" href="med.jsp">MediCare</a>
            <div class="cart-container">
                <a href="cart.jsp" class="cart-icon">
                    <i class="fas fa-shopping-cart"></i>
                    <span id="cartCount" class="cart-badge">0</span>
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="search-bar mb-3">
            <input type="text" class="form-control" id="medicineSearch" placeholder="Search medicines..." onkeyup="searchMedicines()">
        </div>
        <div id="medicineList" class="row"></div>
    </div>

    <script>
        const medicines = [
            { id: 1, name: 'Paracetamol', price: 5.99, img: 'https://www.orionlifes.com/wp-content/uploads/2022/04/brexodol-tab.jpeg', description: 'Pain reliever and fever reducer.', doctorRecommendation: 'Recommended for mild pain and fever.', moreDetails: 'Can be used for headaches, menstrual cramps, and cold symptoms.' },
            { id: 2, name: 'Vitamin C', price: 8.99, img: 'https://5.imimg.com/data5/SELLER/Default/2022/11/EH/JE/NW/122957552/vitamin-c-chewable-limcee-tablet-500mg-500x500.jpg', description: 'Boosts immunity and fights infections.', doctorRecommendation: 'Recommended for daily immune support.', moreDetails: 'Helps in fighting colds and boosting skin health.' },
            { id: 3, name: 'Cold Relief', price: 7.99, img: 'https://onemg.gumlet.io/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/79a75dc9b91f4698b93f9fbbb562b63e.jpg', description: 'Alleviates symptoms of cold and flu.', doctorRecommendation: 'Helps with cough and nasal congestion.', moreDetails: 'Works for both dry and productive coughs.' },
            { id: 4, name: 'Pain Killer', price: 9.99, img: 'https://5.imimg.com/data5/SELLER/Default/2024/3/402631009/OE/NR/XQ/110231603/pain-killer-tablets.jpeg', description: 'Strong pain reliever for intense pain.', doctorRecommendation: 'Use for severe pain like backache or injury.', moreDetails: 'Should not be taken for extended periods without medical supervision.' },
            { id: 5, name: 'Cough Syrup', price: 6.49, img: 'https://www.cofsils.com/uploadfile/product/wet_cough.jpg', description: 'Relieves dry and wet cough.', doctorRecommendation: 'Helps with throat irritation and cough.', moreDetails: 'Suitable for both adults and children.' }
        ];

        function displayMedicines(filteredList = medicines) {
            const medicineList = document.getElementById('medicineList');
            medicineList.innerHTML = filteredList.length > 0 ? filteredList.map(med => `
                <div class="col-md-4">
                    <div class="medicine-card" onclick="viewProduct(${med.id})">
                        <img src="${med.img}" alt="${med.name}" class="medicine-img">
                        <h5>${med.name}</h5>
                        <p>Price: $${med.price}</p>
                        <button class="btn btn-primary" onclick="addToCart(event, ${med.id})">Add to Cart</button>
                    </div>
                </div>
            `).join('') : `<p class="text-center">No medicines found.</p>`;
        }

        function searchMedicines() {
            const searchValue = document.getElementById('medicineSearch').value.toLowerCase();
            const filteredMedicines = medicines.filter(med => med.name.toLowerCase().includes(searchValue));
            displayMedicines(filteredMedicines);
        }

        function viewProduct(id) {
            window.location.href = `product.jsp?id=${id}`;
        }

        function addToCart(event, id) {
            event.stopPropagation(); // Prevent click event from triggering the product view
            let cart = JSON.parse(localStorage.getItem('cart')) || [];
            const medicine = medicines.find(m => m.id === id);
            
            let existingItem = cart.find(item => item.id === id);
            if (existingItem) {
                existingItem.quantity += 1;
            } else {
                medicine.quantity = 1;
                cart.push(medicine);
            }

            localStorage.setItem('cart', JSON.stringify(cart));
            updateCartCount();
            alert('Added to cart!');
        }

        function updateCartCount() {
            let cart = JSON.parse(localStorage.getItem('cart')) || [];
            let totalItems = cart.reduce((total, item) => total + item.quantity, 0);
            let cartBadge = document.getElementById('cartCount');

            if (cartBadge) {
                cartBadge.textContent = totalItems;
                cartBadge.style.display = totalItems > 0 ? 'inline-block' : 'none';
            }
        }

        window.onload = function() {
            displayMedicines();
            updateCartCount();
        };
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
