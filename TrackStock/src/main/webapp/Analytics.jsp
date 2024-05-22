<%@ page import="java.sql.*" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
            <%@ page import="javax.servlet.http.*" %>
                <html>

                <head>
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
                        rel="stylesheet" />
                    <title>Track GPT</title>
                </head>
                <style>
                    body {
                        padding: 10px;
                        font-family: Arial, sans-serif;
                    }

                    #navbar {
                        margin: 5px 2% 1% 3%;
                        background-color: rgba(255, 0, 0, 0);
                        font-size: 18px;
                    }

                    #navbar a {
                        text-decoration: none;
                        color: black;
                        transition: color 0.3s;
                        font-size: 28px;
                    }

                    #navbar a:hover {
                        color: currentColor;
                    }


                    #input,
                    #submit {
                        width: 100%;
                        padding: 10px;
                        font-size: 16px;
                    }

                    #input {
                        margin-bottom: 10px;
                        border: 1px solid #ccc;
                        border-radius: 3px;
                    }

                    #submit {
                        background-color: #4CAF50;
                        color: white;
                        cursor: pointer;
                        border: none;
                        border-radius: 3px;
                    }

                    #submit:disabled {
                        background-color: #ddd;
                        cursor: default;
                    }

                    .chat-container {
                        width: 86%;
                        /* adjust the width as needed */
                        height: 75%;
                        /* adjust the height as needed */
                        margin: 20px auto;
                        /* add some margin for better visibility */
                        padding: 10px;
                        /* add some padding for better visibility */
                        border: 1px solid #ccc;
                        /* add a border for better visibility */
                        border-radius: 10px;
                        /* add a border radius for better visibility */
                        display: flex;
                        /* use flexbox to layout the chat container */
                        flex-direction: column;
                        /* stack the chat messages and input vertically */
                    }

                    .chat-messages {
                        flex-grow: 1;
                        /* take up the remaining space */
                        overflow-y: auto;
                        /* add a scrollbar if the chat messages exceed the height */
                        padding: 10px;
                        /* add some padding for better visibility */
                    }

                    .chat-input {
                        display: flex;
                        align-items: center;
                        /* Align items vertically */
                        padding: 10px;

                    }

                    .input {
                        /* Your existing styles */
                        flex: 1;
                        margin-left: 41%;
                        margin-right: 10px;
                        width: 70%;
                        min-height: 40px;
                        /* Set a minimum height to prevent collapsing */
                        max-height: 164px;
                        /* Set a maximum height */
                        height: auto;
                        /* Let the textarea's height adjust dynamically */
                        border: 1px solid #ccc;
                        padding: 10px;
                        border-radius: 11px;
                        resize: none;
                        overflow-y: auto;
                        scrollbar-width: thin;
                        scrollbar-color: #ccc transparent;
                    }

                    .chat-submit-btn {
                        width: 11%;
                        padding: 7px;
                        font-size: 27px;
                        border: none;
                        border-radius: 10px;
                        background-color: #4CAF50;
                        color: #fff;
                        cursor: pointer;
                        height: 70px;
                        /* Fixed height for the button */
                    }


                    /* Style the scrollbar */
                    .input::-webkit-scrollbar {
                        width: 8px;
                        /* Width of the scrollbar */
                    }

                    /* Handle */
                    .input::-webkit-scrollbar-thumb {
                        background-color: #ccc;
                        /* Color of the handle */
                        border-radius: 10px;
                        /* Rounded corners */
                    }

                    /* Track */
                    .input::-webkit-scrollbar-track {
                        background-color: transparent;
                        /* Color of the track */
                    }


                    .chat-input-field {
                        width: 70%;
                        /* take up 70% of the parent width */
                        padding: 10px;
                        /* add some padding for better visibility */
                        border: 1px solid #ccc;
                        /* add a border for better visibility */
                        border-radius: 10px;
                        /* add a border radius for better visibility */
                    }
                </style>

                <body>
                    <header id="header" class="card-header">
                        <nav id="navbar" class="navbar navbar-expand-lg bg-light">
                            <div class="container-fluid">
                                <a id="nav-link" class="navbar-brand" href="#">DashBoard</a>
                                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                        <li class="nav-item">
                                            <a id="nav-link" class="nav-link active" aria-current="page"
                                                href='<%= response.encodeRedirectURL("Billing.jsp") %>'>Billing</a>
                                        </li>
                                        <li class="nav-item">
                                            <a id="nav-link" class="nav-link active" aria-current="page"
                                                href='<%= response.encodeRedirectURL("Purchase.jsp") %>'>Stock
                                                Purchase</a>
                                        </li>
                                        <li class="nav-item">
                                            <a id="nav-link" class="nav-link active" aria-current="page"
                                                href='<%= response.encodeRedirectURL("Analytics.jsp") %>'>Trade
                                                Advisor</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                    </header>
                    <section>
                        <div class="chat-container">
                            <div class="chat-messages">
                                <!-- chat messages will be displayed here -->

                            </div>
                            <div class="chat-input">

                                <textarea class="input" id="prompt" placeholder="Type a message..."></textarea></input>
                                <button id='callapi' class="chat-submit-btn" >Send</button>
                            </div>
                        </div>
                        <script>
                            const input = document.querySelector('.input');

                            input.addEventListener('input', function () {
                                const maxHeight = 164; // Maximum height in pixels

                                // Update the textarea height
                                this.style.height = '100%';
                                if (this.scrollHeight <= maxHeight) {
                                    this.style.height = (this.scrollHeight) + 'px';
                                } else {
                                    this.style.height = maxHeight + 'px';
                                    this.style.overflowY = 'scroll'; // Add scrollbar when maximum height is reached
                                }
                            });

                        </script>
                    </section>
                    <style>
                        .chat-message {
                            margin: 10px;
                            padding: 10px;
                            border-radius: 5px;
                            background-color: #f0f0f0;
                            max-width: 80%;
                            /* Adjust as needed */
                        }

                        /* Align user messages to the left */
                        .gpt-message {
                            text-align: left;
                            margin-left: 4%;
                            margin-right: 41%;
                        }

                        /* Align bot messages to the right */
                        .user-message {
                            text-align: right;
                            margin-right: 4%;
                            margin-left: 43%;
                        }
                    </style>
                </body>
                <script type="importmap">
                    {
                      "imports": {
                        "@google/generative-ai": "https://esm.run/@google/generative-ai"
                      }
                    }
                 </script>
                <script type="module">
                    import { GoogleGenerativeAI } from "@google/generative-ai";
                    const apiKey = '';
                    // Access your API key (see "Set up your API key" above)
                    const genAi = new GoogleGenerativeAI(apiKey);

                    function userChat(prompt) {
                        const userprompt = prompt;
                        const chatMessages = document.querySelector('.chat-messages');
                        if (chatMessages) { // Check if the element exists before using it
                            // Create and append the new content
                            const design = document.createElement("div");
                            design.classList.add("user-message");
                            design.innerHTML = `<div>
                                 <p><sup>You </sup>${userprompt}</p>
                               </div>
                               </div>`;
                            chatMessages.appendChild(design);
                        }
                        else {
                            console.error("Element with ID 'ChatMessages' not found!");
                        }
                    }


                    function gptchat(textgpt) {
                        const gptai = textgpt;
                        const chatMessages = document.querySelector('.chat-messages');
                        if (chatMessages) { // Check if the element exists before using it
                            // Create and append the new content
                            const design = document.createElement("div");
                            design.classList.add("gpt-message");
                            design.innerHTML = `<div>
                                 <p><sup>Your Advisor </sup>${gptai}</p>
                               </div>
                               </div>`;
                            chatMessages.appendChild(design);
                        }
                        else {
                            console.error("Element with ID 'ChatMessages' not found!");
                        }
                    }

                    async function run() {
                        console.log("runncalled");
                        const promptText = document.getElementById("prompt").value;
                        userChat(promptText);
                        // For text-only input, use the gemini-pro model
                        const model = genAi.getGenerativeModel({ model: "gemini-pro" });
                        const result = await model.generateContent(promptText);
                        const response = await result.response;
                        const aigpt = response.text();
                        gptchat(aigpt);
                        console.log(promptText);
                        console.log(aigpt);
                    }
                    document.getElementById("callapi").addEventListener("click", run);
                </script>

                </html>