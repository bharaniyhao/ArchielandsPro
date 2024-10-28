
<script>
var sendBtn = document.getElementById('sendBtn');
var textbox = document.getElementById('textbox');
var chatContainer = document.getElementById('chatContainer');

var user = { message: "" };
var arrayOfPossibleMessage = 
    [
         { message: "hi", response: "Hello! Welcome to Mothercare. How can I assist you today?" },
    { message: "how are you?", response: "I'm just a bot, but I'm here and ready to help you with your Mothercare needs!" },
    { message: "store locations", response: "We have several store locations! Where are you located? I can help you find the nearest one." },
    { message: "product categories", response: "We offer a wide range of products for infants, toddlers, and expecting mothers. What are you looking for?" },
    { message: "opening hours", response: "Our store hours vary by location. Would you like me to find the hours for a specific store?" },
    { message: "contact information", response: "You can contact us at support@mothercare.com or call us at 1-800-MOTHERCARE. How else can I assist you?" },
    { message: "sales or promotions", response: "We frequently have sales and promotions! Is there something specific you're interested in?" },
    { message: "returns policy", response: "Our returns policy allows for returns within 30 days of purchase with a valid receipt. Do you need help with a return?" },
    { message: "gift cards", response: "Yes, we offer gift cards! They're perfect for baby showers or any occasion. How much would you like to gift?" },
    { message: "order tracking", response: "Do you have an order number? I can check the status of your order for you." },
    { message: "baby clothing", response: "We have an extensive selection of baby clothing, from onesies to sleepwear. What size are you looking for?" },
    { message: "diapers", response: "We carry a variety of diapers in different sizes and brands. Do you need help choosing the right one?" },
    { message: "feeding accessories", response: "We have feeding bottles, bibs, and more. What type of feeding accessories are you looking for?" },
    { message: "strollers", response: "We offer a range of strollers to suit different needs. Are you looking for something specific?" },
    { message: "car seats", response: "We have a collection of car seats for infants and toddlers. What age is the child?" },
    { message: "nursery furniture", response: "We have cribs, changing tables, and more. What furniture do you need for the nursery?" },
    { message: "toys", response: "We have toys suitable for different age groups. What kind of toys are you interested in?" },
    { message: "maternity wear", response: "We offer a stylish range of maternity wear. What size are you looking for?" },
    { message: "baby shower gifts", response: "We have adorable and practical gifts perfect for baby showers. What's your budget?" },
    { message: "parenting books", response: "We have a selection of parenting books. Are you looking for a specific title or topic?" },
    { message: "baby care tips", response: "We provide tips on baby care! What specific advice are you seeking?" },
    { message: "breast pumps", response: "We offer a range of breast pumps. Are you looking for an electric or manual one?" },
    { message: "potty training", response: "We have resources for potty training. How can I assist you with that?" },
    { message: "baby skincare products", response: "We have gentle skincare products for babies. Any particular product you're looking for?" },
    { message: "baby monitors", response: "We offer a variety of baby monitors. What features are you interested in?" },
    { message: "toddler shoes", response: "We have a collection of toddler shoes. What size are you looking for?" },
    { message: "baby safety products", response: "We provide safety products for babies and toddlers. What safety item are you looking for?" },
    { message: "baby travel essentials", response: "We have travel-friendly products for babies. What specifically do you need for travel?" },
    { message: "baby teething solutions", response: "We offer teething toys and products. Is the baby teething?" },
    { message: "baby bathtubs", response: "We have a range of baby bathtubs. What size or type are you looking for?" },
    { message: "baby carriers", response: "We have various types of baby carriers. Do you prefer a sling or a structured carrier?" },
    { message: "breastfeeding accessories", response: "We offer breastfeeding accessories. Are you looking for nursing pads or other items?" },
    { message: "baby skincare tips", response: "We can provide tips for baby skincare. What specific advice do you need?" },
    { message: "baby sleep solutions", response: "We have products to assist with baby sleep. What sleep-related issue are you facing?" },
    { message: "baby teething remedies", response: "We offer natural teething remedies. What type of remedy are you interested in?" },
    { message: "baby developmental toys", response: "We have toys that aid in baby development. What age group are you looking for?" },
    { message: "baby nutrition advice", response: "We can provide nutritional advice for babies. Are you seeking specific information?" },
    { message: "baby safety gates", response: "We have safety gates for baby-proofing. What size or type do you need?" },
    { message: "baby bath products", response: "We offer gentle bath products for babies. What specific product are you looking for?" },
    { message: "baby first aid kits", response: "We provide first aid kits for babies. What items do you want in the kit?" },
    { message: "baby sleepwear", response: "We have comfortable sleepwear for babies. What size and style are you looking for?" },
    { message: "baby learning toys", response: "We offer toys for early learning. What skills are you looking to develop?" },
    { message: "baby outdoor gear", response: "We have outdoor gear suitable for babies. What outdoor activity are you planning?" },
    { message: "baby health advice", response: "We provide advice on baby health. What health concern are you facing?" },
    { message: "baby proofing solutions", response: "We offer products for baby-proofing your home. What areas need childproofing?" },
    { message: "baby playmats", response: "We have colorful playmats for babies. What size or design are you interested in?" },
    { message: "baby travel tips", response: "We can provide travel tips for babies. What specific information do you need?" },
    { message: "baby room decor", response: "We offer decor items for baby rooms. What theme or style are you interested in?" },
    { message: "baby safety locks", response: "We have safety locks for cabinets and drawers. What type are you looking for?" }
        
    ]
function sendMessage(userMessage) {
    var messageElement = document.createElement('div');
    messageElement.style.textAlign = "right";
    messageElement.style.margin = "10px";

    messageElement.innerHTML = "<span> You: </span>" +
        "<span>" + userMessage + "</span>";

    chatContainer.appendChild(messageElement);
}

function chatbotResponse(userMessage) {
    var chatbotmessage = "";
    if (userMessage.length > 3 || userMessage.toLowerCase() == "hi") {
        var result = arrayOfPossibleMessage.find(val => val.message.toLowerCase() === userMessage.toLowerCase());
        if (result) {
            chatbotmessage = result.response;
        } else {
            chatbotmessage = "Please send another message";
        }
    } else {
        chatbotmessage = "Please send a different message";
    }

    var messageElement = document.createElement('div');
    messageElement.style.textAlign = "left";
    messageElement.style.margin = "10px";

    messageElement.innerHTML = "<span> Click Mothercare: </span>" +
        "<span>" + chatbotmessage + "</span>";

    setTimeout(() => {
        chatContainer.appendChild(messageElement);
        chatContainer.scrollTop = chatContainer.scrollHeight;
    }, 1000);
}

sendBtn.addEventListener('click', function(e) {
    var userMessage = textbox.value;

    if (userMessage === "") {
        alert('Please type in a message');
    } else {
        let userMessageText = userMessage.trim();
        user.message = userMessageText;
        textbox.value = "";
        sendMessage(userMessageText);
        chatbotResponse(userMessageText);
    }
});
</script>