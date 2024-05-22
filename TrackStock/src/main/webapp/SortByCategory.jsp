<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<html>
<head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
      <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet" />
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
      <link href="index.css" rel="stylesheet" />
      <title>Home</title>
</head>
<style>
body {
  padding: 10px; /* Increased padding for better spacing */
  font-family: Arial, sans-serif; /* Standard font family */
}

#navbar {
  margin: 5px 2% 1% 3%;
  background-color: rgba(255, 0, 0, 0); /* Corrected background color */
  font-size: 18px; /* Adjusted font size for navbar */
}

#navbar a {
  text-decoration: none; /* Removed underline */
  color: black; /* Set default text color */
  transition: color 0.3s; /* Smooth transition for color change */
  font-size: 28px; /* Adjusted font size */
}

#navbar a:hover {
  color: currentColor; /* Change text color to current color on hover */
}

#body{
  margin: 5px 2% 1% 3%;
}
.sortby, #filters, .input-field, .input-submit {
  height: 40px;
  border: 0px solid rgb(175, 180, 181);
  border-radius: 7px;
  width: 12%;
  margin: 7px 0;
  outline: none;
  font-weight: 500;
  padding: 0 10px;
  font-size: 17px;
  color: black;
  background: transparent;
  transition: all .3s ease-in-out;
  text-decoration: none;
}
.sortby:hover {
  color:rgb(65, 218, 165);
}
#filters:hover{
  color:rgb(65, 218, 165);
}
#productCategory {
  width: 11%;
  height: 40px;
  padding: 5px;
  font-size: 16px;
  border-radius: 5px;
  border: 2px solid #ddd;
  background-color: #fff;
  color: #333;
  outline: none;
}
#productCategory option {
  padding: 10px;
  font-size: 16px;
  border-radius: 5px;
  background-color: #fff;
  color: #333;
}
.input-submit {
  padding: 0;
  background-color: #1e263a;
  border: none;
  width: 65px;
  color: #ffffff;
  cursor: pointer;
  transition: background-color 0.3s ease-in-out;
  border-radius: 7px;
  font-size: 17px;
}

.input-submit:hover {
  background-color: #c4c7cd;
  color: rgb(65, 218, 165);
}

#displaydata {
  margin: 12px;
  margin-left: 37px;
}

table {
  width: 100%;
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

@media screen and (max-width: 600px) {
  table {
    border: 0;
  }
  table caption {
    font-size: 1.3em;
  }
  table thead {
    display: none;
  }
  table tr {
    border-bottom: 3px solid #ddd;
    display: block;
    margin-bottom: 5px;
  }
  table td {
    display: block;
    text-align: right;
    font-size: 13px;
  }
  table td::before {
    content: attr(data-label);
    font-weight: bold;
    float: left;
    text-transform: uppercase;
  }
}
</style>
      <body>
        <header id="header" class="card-header">
          <nav id="navbar" class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
              <a id="nav-link" class="navbar-brand" href='<%= response.encodeRedirectURL("Dashboard.jsp") %>'>DashBoard</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
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
                      href='<%= response.encodeRedirectURL("Purchase.jsp") %>'>Stock Purchase</a>
                  </li>
                  <li class="nav-item">
                    <a id="nav-link" class="nav-link active" aria-current="page"  href='<%= response.encodeRedirectURL("Analytics.jsp") %>'>Trade Advisor</a>           
                </li>
                </ul>
              </div>
            </div>
          </nav>
        </header>
        <section>
          <div id="body">
            <div class="card-header">
              <div>
                <a href='<%= response.encodeRedirectURL("Dashboard.jsp") %>' class="sortby">Sort by</a>
                <a id="filters"  href="#">Catagory</a>
                <a id="filters" href='<%= response.encodeRedirectURL("SortByQR.jsp") %>'>QR</a>
                <a id="filters" href='<%= response.encodeRedirectURL("SortByCatQTY.jsp") %>'>Catagory with QTY</a>
                <a id="filters" href='<%= response.encodeRedirectURL("SortByQTY.jsp") %>'>QTY</a>
              </div>
              <div>
                <form action="" method="get">
                    <div class="input-box">
                        <label for="Category">Category</label>
                        <select name="selectedCategory" id="productCategory" required>
                          <option name="category" value="Vegitables">Groceries </option>
                          <option name="category" value="Electronics">Electronics</option>
                          <option name="category" value="clothing">Clothing</option>
                          <option name="category" value="books">Books</option>
                          <option name="category" value="toys">Toys</option>
                          <!-- Add more options as needed -->
                        </select>
                        <button type="submit" class="input-submit">Submit</button>
                    </div>
                </form>
            </div>
            </div>
            <div>
              <div id="displaydata"> 
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
                  <% String selectedCategory = request.getParameter("selectedCategory");
                     Connection conn = null;
                     PreparedStatement ps = null;
                     ResultSet rs = null;
                    try {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/TrackStock", "root", "pass");
                      String sql = "SELECT * FROM stockdetails WHERE Category = ?";
                      ps = conn.prepareStatement(sql);
                      ps.setString(1, selectedCategory); // Bind parameter here
                      rs = ps.executeQuery();

                      while (rs.next()) {
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
          </div>
        </section>
      </body>
</html>