echo '{
    "log": {
        "loglevel": "warning"
    },
    "inbounds": [
        {
            "port": '$PORT',
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "'$id'",
                        "flow": "xtls-rprx-direct"
                    }
                ],
                "decryption": "none",
                "fallbacks": [
                    {
                        "dest": 3001
                    },
                    {
                        "path": "/2779497e-8454-440d-a82b-7ff3891852c0-trojan",
                        "dest": 3002
                    },
                    {
                        "path": "/2779497e-8454-440d-a82b-7ff3891852c0-vmess",
                        "dest": 3003
                    }
                ]
            },
            "streamSettings": {
                "network": "tcp"
            }
        },
        {
            "port": 3001,
            "listen": "127.0.0.1",
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "'$id'"
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
                "security": "none"
            }
        },
        {
            "port": 3002,
            "listen": "127.0.0.1",
            "protocol": "trojan",
            "settings": {
                "clients": [
                    {
                        "password": "'$id'"
                    }
                ]
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "path": "/2779497e-8454-440d-a82b-7ff3891852c0-trojan"
                }
            }
        },
        {
            "port": 3003,
            "listen": "127.0.0.1",
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "'$id'"
                    }
                ]
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "path": "/2779497e-8454-440d-a82b-7ff3891852c0-vmess"
                }
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}' > config.json

chmod +x ./web
./web -config=config.json