
<!-- payment.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Page</title>
    <script type="text/javascript">
        // Function to validate the form
        function validateForm() {
            var cardNumber = document.forms["paymentForm"]["cardNumber"].value;
            var cardHolder = document.forms["paymentForm"]["cardHolder"].value;
            var expiryDate = document.forms["paymentForm"]["expiryDate"].value;
            var cvv = document.forms["paymentForm"]["cvv"].value;

            // Validate card number, card holder, CVV, and expiration date
            if (cardNumber == "" || cardHolder == "" || cvv == "") {
                alert("All fields must be filled out.");
                return false;
            }
            
            // Validate expiration date
            var currentDate = new Date();
            var [month, year] = expiryDate.split("/").map(Number);
            var expiryYear = 2000 + year; // Convert YY to YYYY
            var expiryMonth = month;

            // Check if the expiry date is valid
            if (expiryYear < currentDate.getFullYear() || (expiryYear == currentDate.getFullYear() && expiryMonth < (currentDate.getMonth() + 1))) {
                alert("Card has expired. Please enter a valid expiration date.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <h2>Payment Page</h2>
    <form name="paymentForm" action="processPayment.jsp" method="POST" onsubmit="return validateForm()">
        <label for="cardNumber">Card Number:</label>
        <input type="text" id="cardNumber" name="cardNumber" placeholder="**** **** **** ****" maxlength="16" required><br><br>

        <label for="cardHolder">Card Holder:</label>
        <input type="text" id="cardHolder" name="cardHolder" placeholder="Enter Name" required><br><br>

        <label for="expiryDate">Expiry Date (MM/YY):</label>
        <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" required><br><br>

        <label for="cvv">CVV:</label>
        <input type="password" id="cvv" name="cvv" placeholder="***" maxlength="3" required><br><br>

        <input type="submit" value="Submit Payment">
    </form>
</body>
</html>
