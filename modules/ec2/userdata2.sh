#!/bin/bash
sudo yum update -y
sudo yum install -y httpd

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AWS ALB Demo - WEB-02</title>

<style>
body{
    margin:0;
    font-family:Arial,Helvetica,sans-serif;
    background:#eefaf0;
}

.container{
    width:700px;
    margin:60px auto;
    background:white;
    border-radius:12px;
    padding:35px;
    box-shadow:0 10px 30px rgba(0,0,0,.15);
    text-align:center;
}

h1{
    color:#1565C0;
}

.badge{
    display:inline-block;
    padding:10px 18px;
    background:#1565C0;
    color:white;
    border-radius:30px;
    font-weight:bold;
    margin:20px 0;
}

.info{
    font-size:18px;
    margin:12px 0;
}

.footer{
    margin-top:30px;
    color:gray;
}
</style>

</head>

<body>

<div class="container">

<h1 style="color:#2E7D32;">
🚀 AWS Application Load Balancer Demo
</h1>

<div class="badge" style="background:#2E7D32;">
WEB SERVER 02
</div>

<div class="info">
<b>Environment:</b> Production
</div>

<div class="info">
<b>Availability:</b> Healthy
</div>

<div class="info">
<b>Hosted On:</b> Amazon EC2
</div>

<div class="info">
<b>Load Balancer:</b> AWS Application Load Balancer
</div>

<p>
Refresh the page multiple times.<br>
If the Application Load Balancer forwards traffic to another EC2,
the page design and server label will change.
</p>

<div class="footer">
Terraform • AWS • Docker • Application Load Balancer
</div>

</div>

</body>
</html>

EOF

sudo systemctl start httpd
sudo systemctl enable httpd