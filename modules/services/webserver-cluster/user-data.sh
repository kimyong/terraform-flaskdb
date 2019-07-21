#!/bin/bash

cat > index.html <<EOF
<h1>Hello, World</h1>
<p>DB address: ${elb_address}</p>
EOF

#nohup busybox httpd -f -p "${server_port}" &
sed -i 's/appservers-stage-26155628.ap-southeast-1.elb.amazonaws.com/${elb_address}/g' /etc/nginx/sites-enabled/default
/etc/init.d/nginx restart
