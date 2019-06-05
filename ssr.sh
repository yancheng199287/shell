#!/bin/bash
echo "we will install shadowsocks, So,you should know what it is do !"

apt-get update && apt install shadowsocks

echo "Now,please tell me parameters,in order to customize your config"

echo "Your current server host,like ip address or domain,please input: "

read host

echo "your input value：$host"


echo "Your current shadowsocks server password,your client need it,please input:"

read password

echo "your input value：$password"


cat>~/shadowsocks.json<<EOF
{
    "server": "$host",

    "local_address": "127.0.0.1",

    "local_port":1080,

    "port_password": {

        "8381": "$password",

        "8382": "$password",

        "8383": "$password",

        "8384": "$password",

        "8385": "$password"
    },

    "timeout": 300,

    "method":"rc4-md5",

    "fast_open": false

}
EOF

ssserver -c ~/shadowsocks.json -d start

echo -e "Congratulations! Let's enjoy it! "

echo "Attention,important info: Server:$host ,Encrypt Method:rc4-md5,Port:8381,8382,8384,8385"

echo "If you alter config, you find file where in ~/shadowsocks.json，and if you have any question，please tell me by QQ648830605"
