<%-- 
    Document   : recipient_menu_help
    Created on : 27-Mar-2025, 5:21:47 pm
    Author     : Manikandan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help & Support</title>
    <link rel="short icon" href="logo2.png" type="image/x-icon">
    <script src="https://cdn.tailwindcss.com"></script>
    
</head>
<body class="bg-gray-100">

    <div class="max-w-4xl mx-auto mt-10 p-6 bg-white shadow-lg rounded-lg">
        <h2 class="text-3xl font-bold text-center text-orange-600">Help & Support</h2>

        <div class="mt-6">
            <h3 class="text-xl font-semibold mb-3">Frequently Asked Questions</h3>
            <div class="space-y-4">
                <div class="border-b pb-2">
                    <button class="faq-toggle flex justify-between w-full text-lg font-medium text-gray-700">
                        How do I request food donations?
                        <span class="text-orange-500">+</span>
                    </button>
                    <p class="faq-answer hidden text-gray-600 mt-2">Fill in the form with your details and submit your request. Donors will be matched based on availability.</p>
                </div>
                <div class="border-b pb-2">
                    <button class="faq-toggle flex justify-between w-full text-lg font-medium text-gray-700">
                        Can I track my food request?
                        <span class="text-orange-500">+</span>
                    </button>
                    <p class="faq-answer hidden text-gray-600 mt-2">Yes, go to "Request Status" in your profile to see updates.</p>
                </div>
                <div class="border-b pb-2">
                    <button class="faq-toggle flex justify-between w-full text-lg font-medium text-gray-700">
                        How can I contact a donor?
                        <span class="text-orange-500">+</span>
                    </button>
                    <p class="faq-answer hidden text-gray-600 mt-2">Go to "Donor List & Communication" in the menu to find donor details.</p>
                </div>
            </div>
        </div>

       
       

        
        <div class="text-center mt-6">
            <a class="bg-blue-500 text-white px-6 py-2 rounded-full shadow-md hover:bg-blue-600" href="https://chatgpt.com/c/67e68b7f-cc0c-8002-83a7-9c115add7817">
                💬 Live Chat Support
            </a>
        </div>
    </div>

    <script>
    document.addEventListener("DOMContentLoaded", () => {
        const buttons = document.querySelectorAll(".faq-toggle");

        buttons.forEach(button => {
            button.addEventListener("click", () => {
                const answer = button.nextElementSibling;
                answer.classList.toggle("hidden");
                button.querySelector("span").textContent = answer.classList.contains("hidden") ? "+" : "−";
            });
        });
    });
</script>


</body>
</html>

