<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>StepStyle - Shoe Store</title>
    <style>
        body {
            background-color: #FFC0CB;
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
        }

        h1 {
            color: #cc4400;
        }

        h2 {
            color: #333333;
        }

        p {
            color: gray;
            font-size: 18px;
        }

        a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            color: yellow;
        }

        .box {
            background-color: white;
            border: 2px solid #cc4400;
            border-radius: 10px;
            padding: 30px;
            width: 60%;
            margin: auto;
        }

        .btn {
            background-color: #cc4400;
            padding: 12px 30px;
            border-radius: 8px;
            display: inline-block;
            margin-top: 10px;
        }

        .btn:hover {
            background-color: #aa3300;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        th {
            background-color: #cc4400;
            color: white;
            padding: 10px;
        }

        td {
            padding: 10px;
            border: 1px solid #ddd;
            color: #333;
        }

        tr:nth-child(even) {
            background-color: #fff0e8;
        }
    </style>
</head>
<body>

    <div class="box">

        <h1>👟 Welcome to StepStyle Shoe Store</h1>

        <h2>Your Destination for Trendy & Comfortable Footwear</h2>

        <p>Walk in style with our latest collection of sports, casual and formal shoes.</p>

        <h3>🛒 Our Popular Categories</h3>

        <table>
            <tr>
                <th>Category</th>
                <th>Brand</th>
                <th>Price</th>
                <th>Availability</th>
            </tr>
            <tr>
                <td>Sports Shoes</td>
                <td>Nike</td>
                <td>₹3,499</td>
                <td>In Stock</td>
            </tr>
            <tr>
                <td>Casual Shoes</td>
                <td>Adidas</td>
                <td>₹2,799</td>
                <td>In Stock</td>
            </tr>
            <tr>
                <td>Formal Shoes</td>
                <td>Bata</td>
                <td>₹1,999</td>
                <td>In Stock</td>
            </tr>
            <tr>
                <td>Sandals</td>
                <td>Puma</td>
                <td>₹1,299</td>
                <td>Limited</td>
            </tr>
            <tr>
                <td>Running Shoes</td>
                <td>Reebok</td>
                <td>₹4,199</td>
                <td>In Stock</td>
            </tr>
        </table>

        <h4>📍 Store Location : Hyderabad, Telangana, India</h4>

        <h5>📞 Contact Us : +91-9876543210</h5>

        <h6>📧 Email : support@stepstyle.com</h6>

        <p><b>Free Delivery on Orders Above ₹999 !</b></p>

        <a href="#" class="btn">Shop Now</a>

    </div>

</body>
</html>
