<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<html>
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet" />
    <link href="index.css" rel="stylesheet" />
    <title>Purchase</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <style>
    body {
      margin: 14px;
    }
  
    #button {
      background-color: white;
    }
  
    #API {
      border-color: white;
      width: 90%;
    }
    #AddAPi {
      display: flex;
      justify-content: right;
    }
  
    h4 {
      margin-left: 25%;
      margin-top: 12px;
      margin-right: 25%;
      background-color: black;
      color: white;
    }
  
    img {
      margin: 12px;
      margin-left: 133px;
    }
  </style>
    
<body>
    <heard class="p-3 m-0 border-0 bd-example">
      <nav class="navbar navbar-expand-lg bg-light">
        <div class="container-fluid">
          <a class="navbar-brand" href='<%= response.encodeRedirectURL("Dashboard.jsp") %>'>Dash Board</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href='<%= response.encodeRedirectURL("Billing.jsp") %>'>Billing</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href='<%= response.encodeRedirectURL("Purchase.jsp") %>'>Stock Purchase</a>
              </li>
              <li class="nav-item">
                <a id="nav-link" class="nav-link active" aria-current="page"  href='<%= response.encodeRedirectURL("Analytics.jsp") %>'>Trade Advisor</a>           
            </li>
            </ul>
          </div>
        </div>
      </nav>
    </heard>
    <section>
      <div id="body">
        <div class="card-header">
             <div class="container mt-5">
        <div class="row justify-content-center">
          <div class="col-md-4">
            <div id= "card" class="card">
              <div class="card-header">
                    <h5 class="align-middle">Product Name/ Bulk Products</h5>
                  </div>
                  <div class="card-body">
                    <form action="" method="post">
                      <div class="form-group">
                        <label for="SupplierID">SupplierID</label>
                        <input type="number" class="form-control" name="SupplierID" placeholder="Supplier ID">
                      </div><br>
                      <div class="form-group">
                        <label for="quantity">Quantity</label>
                        <input type="number" class="form-control" id="Quantity" name="QTY" placeholder="Quantity">
                      </div><br>
                      <button type="submit" class="btn btn-primary">Oreder</button>
                    </form>
                    <%
                      if ("post".equalsIgnoreCase(request.getMethod())) {
                      int SupplierID = Integer.parseInt(request.getParameter("SupplierID"));
                      int QTY = Integer.parseInt(request.getParameter("QTY"));
                      Connection conn = null; // Declare conn here
                      PreparedStatement ps = null;
                      ResultSet rs = null;
                      try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/TrackStock", "root", "pass");
                  
                        // Check if QR Code exists first                  
                        String updateSql = "UPDATE StockDetails SET Quantity = Quantity + ? WHERE SupplierID = ?";
                        ps = conn.prepareStatement(updateSql);
                        ps.setInt(1, QTY); // Set first parameter: quantity to add (int)
                        ps.setInt(2, SupplierID); // Set second parameter: SupplierID (String)
                        int rowsUpdated = ps.executeUpdate();
                        
                        if (rowsUpdated > 0) {
                          out.println("<b>Stock quantity for Supplier " + SupplierID + " updated successfully.</b>");
                        } else {
                          out.println("<b>Supplier ID not found or quantity update failed.</b>");
                        }
                      }
                       catch (Exception e) {
                        out.println("<h2>Error: " + e.getMessage() + "</h2>");
                        e.printStackTrace(); // Consider using a logger for more robust error handling
                      } 
                      finally {
                        // Close resources
                        try {
                          if (rs != null) {
                            rs.close();
                          }
                          if (ps != null) {
                            ps.close();
                          }
                          if (conn != null) {
                            conn.close();
                          }
                        } catch (SQLException ex) {
                          out.println("<h2>Error closing resources: " + ex.getMessage() + "</h2>");
                        }
                      }
                    }
                  %>
                  </div>
            </div>
          </div>
        </div>
      </div>
      <button id="AddAPi" type="submit" class="btn btn-primary float-right" onclick="AddAPI()">Add API</button>
      </div>
    </section>
  </body>
  <script>
    function AddAPI(){
      var API = prompt("Please enter API KEY:");
    }
   function Pament(){
      var API = prompt("Please enter API KEY:");
    }
  </script>
</html>

    