<%-- 
    Document   : donor_main_feedback
    Created on : 27-Mar-2025, 4:11:05 pm
    Author     : Manikandan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback & Reviews</title>
    <link rel="short icon" href="logo2.png" type="image/x-icon">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex justify-center items-center min-h-screen">
    <div class="bg-white p-6 rounded-2xl shadow-xl w-full max-w-lg">
        <h2 class="text-2xl font-bold text-center text-gray-800 mb-4">We Value Your Feedback</h2>
        <p class="text-gray-500 text-center mb-6">Let us know about your experience!</p>
        
        <div class="flex justify-center space-x-1 mb-4" id="star-container">
            <span class="cursor-pointer text-gray-400 text-3xl" data-value="1">★</span>
            <span class="cursor-pointer text-gray-400 text-3xl" data-value="2">★</span>
            <span class="cursor-pointer text-gray-400 text-3xl" data-value="3">★</span>
            <span class="cursor-pointer text-gray-400 text-3xl" data-value="4">★</span>
            <span class="cursor-pointer text-gray-400 text-3xl" data-value="5">★</span>
        </div>
        
        <textarea id="feedback" rows="4" class="w-full p-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500" placeholder="Write your feedback here..."></textarea>
        
        <button class="mt-4 w-full bg-orange-500 text-white py-2 rounded-lg hover:bg-orange-600 transition">Submit Feedback</button>
    </div>

    <script>
        const stars = document.querySelectorAll('#star-container span');
        let selectedRating = 0;

        stars.forEach(star => {
            star.addEventListener('click', function () {
                selectedRating = this.getAttribute('data-value');
                stars.forEach(s => s.classList.remove('text-yellow-500'));
                for (let i = 0; i < selectedRating; i++) {
                    stars[i].classList.add('text-yellow-500');
                }
            });
        });
    </script>
</body>
</html>

