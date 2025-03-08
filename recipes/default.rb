# Deploy HTML landing page with improved styling
file '/var/www/html/index.html' do
  content <<-EOH
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nginx Server</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #ADD8E6; /* Light blue background */
            color: #333;
            text-align: center;
            padding: 50px;
            margin: 0;
        }
        .container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            display: inline-block;
        }
        h1 {
            font-size: 40px;
            margin-bottom: 10px;
            color: #0056b3;
        }
        p {
            font-size: 22px;
            font-weight: bold;
        }
        .version {
            color: #D32F2F;
            font-size: 24px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>This machine is yet to be configured!</h1>
        <p>Your web server is up and running.</p>
        <p class="version">Installed Nginx Version: <strong>1.24.0</strong></p>
    </div>
</body>
</html>
  EOH
  mode '0644'
  owner 'www-data'
  group 'www-data'
end

# Restart Nginx to apply changes
service 'nginx' do
  action :restart
end  
