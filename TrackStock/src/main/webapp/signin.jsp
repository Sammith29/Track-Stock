<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Track-Stock&nbsp;Sign up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
        body {
            background-color: white;
        }

        #signup {
            background-color: transparent;
            border: none;
            color: blue;
            text-decoration: none;
        }

        #signin {
            background-color: transparent;
            border: none;
            color: blue;
        }
    </style>
</head>

<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div id="card" class="card">
                    <div class="card-header">
                        <h4 class="align-middle">Sign in</h4>
                    </div>
                    <div class="card-body">
                        <form id="signin">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" placeholder="Enter email">
                            </div><br>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" placeholder="Enter password">
                            </div><br>
                           
                            <button id="SignIn" class="btn btn-primary" name="signin_submit" value="Signin">Sign In</button>
                            <br><br>
                        </form>
                        <h6>Create an Account Click to <a id="signup" href='<%= response.encodeRedirectURL("signup.jsp") %>'>Sign up</a>
                        </h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<!--Firebase Auth-->
<script type="module">
    // Import the functions you need from the SDKs you need
    import { initializeApp } from "https://www.gstatic.com/firebasejs/10.10.0/firebase-app.js";
    import { getDatabase, set, ref, update } from "https://www.gstatic.com/firebasejs/10.10.0/firebase-database.js";
    import { getAuth, createUserWithEmailAndPassword, signInWithEmailAndPassword } from "https://www.gstatic.com/firebasejs/10.10.0/firebase-auth.js";

    // TODO: Add SDKs for Firebase products that you want to use
    // https://firebase.google.com/docs/web/setup#available-libraries
    // Your web app's Firebase configuration
    // For Firebase JS SDK v7.20.0 and later, measurementId is optional

    const firebaseConfig = {
        apiKey: "AIzaSyDavqCr-kcqTBd-esjxgEl96JVv5L_jJTI",
        authDomain: "track-stocks-1be2a.firebaseapp.com",
        databaseURL: "https://track-stocks-1be2a-default-rtdb.asia-southeast1.firebasedatabase.app",
        projectId: "track-stocks-1be2a",
        storageBucket: "track-stocks-1be2a.appspot.com",
        messagingSenderId: "283994559658",
        appId: "1:283994559658:web:b5257f2ce3ed934cdf6cd3",
        measurementId: "G-5CJL7XCNS2"
    };

    // Initialize Firebase
    const app = initializeApp(firebaseConfig);
    const database = getDatabase(app);
    const auth = getAuth();

    const Signin = document.getElementById("SignIn");
    Signin.addEventListener("click", (e) => {
        e.preventDefault();
        console.log("event signuin called");
        var login_email = document.getElementById('email').value;
        var login_pass = document.getElementById("password").value;
        signInWithEmailAndPassword(auth, login_email, login_pass)
            .then((credential) => {
                console.log("Logged in!");
                alert("signed successfully");
                //redirect to anotherpage
                window.location.href = '<%= response.encodeRedirectURL("Dashboard.jsp") %>';
            }).catch((error) => {
                let errorCode = error.code;
                let errorMessage = error.message;
                alert(errorMessage);
            });

    });
    </script>
<script src="./Sign.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>

</html>