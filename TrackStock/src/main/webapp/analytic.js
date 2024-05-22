import { GoogleGenerativeAI } from "@google/generative-ai";
//for backup of the API code 

const apiKey = ''; 
// Access your API key (see "Set up your API key" above)
const genAI = new GoogleGenerativeAI(apiKey);
<script type="module">
import { GoogleGenerativeAI } from "@google/generative-ai";

// Fetch your API_KEY
const API_KEY = "AIzaSyDryQRYX3IPDIaZ92Wjt92HoAxqw5pt95Y";

// Access your API key (see "Set up your API key" above)
const genAI = new GoogleGenerativeAI(API_KEY);

async function run() {
    // For text-only input, use the gemini-pro model
    const model = genAI.getGenerativeModel({ model: "gemini-pro" });

    const prompt = "Write a story about a magic backpack."

    const result = await model.generateContent(prompt);
    const response = await result.response;
    const text = response.text();
    console.log(text);
}
run();
</script>
<script src="./analytic.js"></script>