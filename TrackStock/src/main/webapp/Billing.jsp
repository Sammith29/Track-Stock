<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet" />
  <link href="index.css" rel="stylesheet" />
  <title>Billing</title>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
  *{
    font-family: Arial, sans-serif;
  }
  body {
    margin: 14px;
  }
  #button {
    background-color: white;
  }
  API {
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
  #body{
    margin: 1px;
  }
  .flexrow{
    display: flex;
   flex-direction: row;

    
  }
  .flexrow div{
     margin: 12px 65px 1px 15px ;

  }
  .row{
  
   width:46%;
  }
 
table {
  width: 20%;
  border-collapse: collapse;
  border: 2px solid #ddd;
}

th, td {
  padding: 10px; /* Increased padding for better spacing */
  text-align: left;
  border-bottom: 1px solid #ddd;
}

th {
  background-color: #f2f2f2;
}

tr:hover {
  background-color: #f5f5f5;
}

form {
  max-width: 400px;
  margin: 0 auto;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  background-color: #f9f9f9;
}

caption {
  font-size: 1.2em;
  margin-bottom: 10px;
}

label {
  display: block;
  margin-bottom: 5px;
}

input[type="text"],
input[type="number"],
input[type="submit"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 15px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box; /* Include padding and border in element's total width and height */
}

input[type="submit"] {
  background-color: #4CAF50;
  color: white;
  cursor: pointer;
}

input[type="submit"]:hover {
  background-color: #45a049;
}

@media screen and (max-width: 600px) {
  form {
    width: 90%;
  }
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
        <% Connection conn=null; 
           Statement stmt=null;
           ResultSet rs=null;
           try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/TrackStock", "root" , "pass" );
            stmt=conn.createStatement();
            String sql = "SELECT * FROM StockDetails";
            rs=stmt.executeQuery(sql);
             %>
      <div class="flexrow">  
           <div class="row">
          <table>
            <tr>
              <th>Stock ID</th>
              <th>Product Name</th>
              <th>Category</th>
              <th>QR Code</th>
              <th>Price</th>
              <th>Quantity</th>
              <th>Supplier ID</th>
              <th>Status</th>
            </tr>
            <%  while (rs.next()) {
              int stockID = rs.getInt("StockID");
              String productName = rs.getString("ProductName");
              String category = rs.getString("Category");
              String qrCode = rs.getString("QRCode");
              double price = rs.getDouble("Price");
              int quantity = rs.getInt("Quantity");
              int supplierID = rs.getInt("SupplierID");
              String status = rs.getString("Status"); %>
            <tr>
              <td><%= rs.getInt("StockID") %></td>
              <td><%= rs.getString("ProductName") %></td>
              <td><%= rs.getString("Category") %></td>
              <td><%= rs.getString("QRCode") %></td>
              <td><%= rs.getDouble("Price") %></td>
              <td><%= rs.getInt("Quantity") %></td>
              <td><%= rs.getInt("SupplierID") %></td>
              <td><%= rs.getString("Status") %></td>
            </tr>
          <% } } catch (Exception e) { out.println("<h2>Error: " + e.getMessage() + "</h2>");
              } finally {
              try {
              if (rs != null) {
              rs.close();
              }
              if (stmt != null) {
              stmt.close();
              }
              if (conn != null) {
              conn.close();
              }
              } catch (SQLException ex) {
              out.println("<h2>Error closing resources: " + ex.getMessage() + "</h2>");
              }
              }
              %>
         </table>
         </div>
        <div class="row">
          <form action="" method="post">
            <caption>Add Bulk Stock</caption>
            <label for="qr_code">QR Code:</label>
            <input type="text" id="qr_code" name="qr_code" required><br><br>
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" required><br><br>
            <input type="submit" value="Place Order">
        </form>
        <%
        if ("post".equalsIgnoreCase(request.getMethod())) {
          String qrCode = request.getParameter("qr_code");
          int newQuantity = Integer.parseInt(request.getParameter("quantity"));
          conn = null; // Declare conn here
          PreparedStatement ps = null;
          rs = null;
      
          try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/TrackStock", "root", "pass");
      
            // Check if QR Code exists first
            String checkSql = "UPDATE StockDetails SET Quantity = Quantity - ? WHERE QRCode = ?";
            ps = conn.prepareStatement(checkSql);
            ps.setInt(1, newQuantity);
            ps.setString(2, qrCode);
            int rowsUpdated = ps.executeUpdate(); // Use executeUpdate for update statements
      
            if (rowsUpdated > 0) {
                out.println("<b>Stock quantity for QR Code " + qrCode + " updated successfully.</b>");
             } else {
                out.println("<b>QR Code not found or quantity update failed.</b>");
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
  </section>
</body>
</html>