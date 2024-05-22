<%@ page import="java.sql.*" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
            <%@ page import="javax.servlet.http.*" %>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Track Stock</title>
                    <style>
                        body {
                            margin: 0;
                            font-family: Arial, sans-serif;
                        }

                        .navbar {
                            background-color: white;
                            overflow: hidden;
                            padding: 10px 20px;
                            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                        }

                        .navbar a {
                            margin-left: 12px;
                            float: left;
                            display: block;
                            color: #333;
                            text-align: center;
                            padding: 14px 20px;
                            text-decoration: none;
                            font-size: 16px;
                        }

                        .navbar a:hover {
                            background-color: #f2f2f2;
                            color: #555;
                        }

                        .navbar a.active {
                            background-color: #0a6fdc;
                            color: white;

                        }

                        .navbar a:first-child {
                            font-weight: bold;
                        }

                        .navbar a.signup,
                        .navbar a.login,
                        .navbar a.try-ai {
                            border: none;
                        }

                        @media screen and (max-width: 600px) {
                            .navbar a {
                                float: none;
                                display: block;
                                text-align: left;
                            }
                        }

                        .background-image {
                            position: absolute;
                            top: 0;
                            left: 0;
                            width: 100vw;
                            height: 112vh;
                            /* Adjust as needed */
                            z-index: -1;
                            /* Ensure the image stays behind the text */
                            background-image: url('./Main.jpg');
                            /* Replace 'your-image.jpg' with the path to your image */
                            background-size: cover;
                            background-position: center;
                            /* Adjust as needed */
                            /* filter: blur(10px);  Adjust the blur amount */
                            /*-webkit-filter: blur(10px); /* For compatibility with some browsers */
                        }

                        #blur {
                            background-color: rgba(255, 255, 255, 0.325);
                        }

                        .overlay-text {
                            position: absolute;
                            top: 50%;
                            left: 50%;
                            transform: translate(-50%, -50%);
                            font-size: 134px;
                            color: rgb(255, 252, 252);
                            text-align: center;
                            z-index: 1;
                            /* Ensure the text appears on top of the image */
                            cursor: pointer;

                        }

                        @media screen and (max-width: 768px) {
                            .background-image {
                                height: 50vh;
                                /* Adjust as needed */
                            }
                        }

                        @media screen and (max-width: 480px) {
                            .background-image {
                                height: 30vh;
                                /* Adjust as needed */
                            }
                        }
                    </style>
                </head>

                <body>

                    <div class="navbar">
                        <a href='<%= response.encodeRedirectURL("index.jsp") %>'  class="active">Track Stock</a>
                        <a href='<%= response.encodeRedirectURL(" signup.jsp ") %>'class="signup">Signup</a>
                        <a href='<%= response.encodeRedirectURL(" signin.jsp") %>' class="login">Login</a>
                        <a href='<%= response.encodeRedirectURL(" signup.jsp") %>' class="try-ai">Try AI</a>
                    </div>
                    <!--
<div class="background-image">
    <img src="./Main.jpg" alt="Description of the image">

</div>
-->
                    <div class="background-image"></div>
                    <div id="blur">
                        <div class="overlay-text" onclick="location.href='your-link-here';">Track Your Stock</div>
                    </div>
                </body>

                </html>