#!/bin/bash

cat > index.html <<EOF
<h1>Hello, World</h1>
<p>DB address: ${db_address}</p>
<p>DB port: ${db_port}</p>
EOF

#nohup busybox httpd -f -p "${server_port}" &
source /home/ubuntu/flaskdb/bin/activate
sed -i 's/192.168.1.47/${db_address}/g' /home/ubuntu/flaskdb/flaskdb/config.py
sed -i 's/fake1d123/${db_password}/g' /home/ubuntu/flaskdb/flaskdb/config.py
python /home/ubuntu/flaskdb/flaskdb/server.py
