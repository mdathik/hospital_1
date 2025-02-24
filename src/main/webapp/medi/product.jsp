<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details - MediCare</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .product-container {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
        }
        .product-img {
            width: 50%;
            height: 300px;
            object-fit: cover;
            border-radius: 10px;
        }
        .doctor-recommendations {
            background: #f1f1f1;
            padding: 1rem;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="product-container" id="productDetails"></div>
    </div>

    <script>
        const medicines = [
            { id: 1, name: 'Paracetamol', price: 5.99, img: 'https://www.orionlifes.com/wp-content/uploads/2022/04/brexodol-tab.jpeg', details: 'Pain reliever and fever reducer.', dosage: '500mg 2 times a day', recommendedDoctors: ['Dr. Smith', 'Dr. Jones'] },
            { id: 2, name: 'Vitamin C', price: 8.99, img: 'https://5.imimg.com/data5/SELLER/Default/2022/11/EH/JE/NW/122957552/vitamin-c-chewable-limcee-tablet-500mg-500x500.jpg', details: 'Helps to boost immune system.', dosage: '1 tablet a day', recommendedDoctors: ['Dr. Lee', 'Dr. Kumar'] },
            { id: 3, name: 'Cold Relief', price: 7.99, img: 'https://onemg.gumlet.io/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/79a75dc9b91f4698b93f9fbbb562b63e.jpg', details: 'Relieves cold symptoms.', dosage: '1 tablet every 4 hours', recommendedDoctors: ['Dr. Patel', 'Dr. Davis'] },
            { id: 4, name: 'Pain Killer', price: 9.99, img: 'https://5.imimg.com/data5/SELLER/Default/2024/3/402631009/OE/NR/XQ/110231603/pain-killer-tablets.jpeg', details: 'Pain relief for moderate to severe pain.', dosage: '1 tablet every 6 hours', recommendedDoctors: ['Dr. Morgan', 'Dr. Clark'] },
            { id: 5, name: 'Cough Syrup', price: 6.49, img: 'https://www.cofsils.com/uploadfile/product/wet_cough.jpg', details: 'Relieves coughing and throat irritation.', dosage: '10ml every 4 hours', recommendedDoctors: ['Dr. Williams', 'Dr. Brown'] }
        ];

        function getProductDetails() {
            const urlParams = new URLSearchParams(window.location.search);
            const productId = parseInt(urlParams.get('id'));
            const product = medicines.find(med => med.id === productId);

            if (product) {
                const productContainer = document.getElementById('productDetails');
                productContainer.innerHTML = `
                    <h2>${product.name}</h2>
                    <img src="${product.img}" alt="${product.name}" class="product-img">
                    <p><strong>Price:</strong> $${product.price}</p>
                    <p><strong>Details:</strong> ${product.details}</p>
                    <p><strong>Dosage:</strong> ${product.dosage}</p>
                    <div class="doctor-recommendations">
                        <h4>Recommended by Doctors:</h4>
                        <ul>
                            ${product.recommendedDoctors.map(doctor => `<li>${doctor}</li>`).join('')}
                        </ul>
                    </div>
                `;
            }
        }

        window.onload = getProductDetails;
    </script>
</body>
</html>
