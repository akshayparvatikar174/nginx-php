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
            background: linear-gradient(135deg, #2196F3, #1E88E5);
            color: white;
            text-align: center;
            padding: 50px;
            margin: 0;
        }
        .container {
            background: rgba(0, 0, 0, 0.6);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.3);
            display: inline-block;
        }
        h1 {
            font-size: 40px;
            margin-bottom: 10px;
        }
        p {
            font-size: 22px;
            font-weight: bold;
        }
        .version {
            color: #FFEB3B;
            font-size: 24px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚀 Welcome to Nginx Server!</h1>
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
