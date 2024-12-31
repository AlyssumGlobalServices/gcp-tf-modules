project_name = "swap"
environment  = "dev"
project_id   = "swap-cloud-uat"
region       = "us-central1"
dns_zone_name = "alyssum-test"

# Keycloak settings
kc_image                = "docker.io/keycloak/keycloak:23.0.6"
kc_container_port       = 8080
kc_memory_limit         = "2048Mi"
kc_cpu_limit            = "2"
kc_container_args       = ["start-dev"]
keycloak_admin          = "admin"
keycloak_admin_password = "admin"
kc_proxy                = "edge"
kc_custom_domain        = "first.dataaiworks.org"

# Security container settings
security_image                  = "gcr.io/swap-cloud-uat/security:buildone"
security_container_port         = 5050
security_container_memory_limit = "1048Mi"
security_container_cpu_limit    = "1"
security_custom_domain          = "second.dataaiworks.org"

# Firebase settings
FIREBASE_DATABASE_URL        = "https://swap-cloud-uat-swap-security-db.nam5.firebasedatabase.app"
FIREBASE_STORAGE_BUCKET_NAME = "swap-security-secret-bucket"
FIREBASE_STORAGE_BUCKET_URL  = "swap-security-secret-bucket.appspot.com"
FIREBASE_PROJECT_ID          = "swap-cloud-uat"
FIREBASE_PRIVATE_KEY         = "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCbYkTvTpR/gAN2\nHhkX7d0zBvTzEO2Ur//63+7Ef3aVWVWlVgtsPxXp/2aB75v5IG+dTPdZu4JjDXuc\nepqYgllKgh5To6eVSFpKxbRXT6osGADIp+aQvWTVubf+kLUIl+VwMMNffwU/+hyH\nkmYrBPdUmknc0sM9o3nQz9YW8aH/OZzacObGSXEYlGyx5rbrLD7MXFUaansd3wfD\ndaRS2bmFdBXei/Vy5v6EnD+AS9SpWmhJt3EyteC13yTTutfrJXPhNFtsl56b5Zsk\nO0B8+0f5V3CY0oDfAsDcVGzzpTWo3tOnhw/YnGQsY3Cif28wdP0whUdkBK1FAZwO\ncmdsk9R7AgMBAAECggEAA1vB4qw/oGvbZ0uqPi6pd8dgNvq4L90H+tupNP0OSpcW\nN08fSxUn+5lGFWvg4qcVUoCN3hYj8NEjSVQLEF3M4UPjtOoWHq9kKDaSucpigrZ4\nGd4rKRi227m6ZNmq2Ac0cdLT/jXoHqRgxntfEvH2CJGXJBs4FhZ49Q7w8SkC19nV\nzNuKbxUySPkNqHWuyhOffD+XDjd9VUE5URx4wYvCsWR0qWXjJJs9bFNtmIFJ1Cey\nLLwMiMR+Iy/Y/1r1sqvfrB6sGnc2Jkk2kE8sFH6NbVhMVQjRyGBH6aY2lTlM6EYC\n6Ci6huPoWnJl4tqp7sTW908WwGmPnCKc3F1mKmnwQQKBgQDRTgRdOoIvpbd+M+3n\nR2s9RT723ugQW7Ml5KLFBMDoSJSCIH5+Gl+aCbmlwWiqURWR7OCA3TBGlU+Gfacu\n8LG4lZpWFd1/r3HaJejaYBhEUZ/MfZ6YtgMdJ8XO31uINesTl8rQax/d4qCnzBvp\nM7QnUAEwbfDd9gA7LLZsF2sZQQKBgQC+DK26I6fsYs64iuw0nodXwgSk12DiFag1\nqtABMC8A7A+7Ktdr3uuw00mhE8J73OsL9fcmZ5b4EqXQiq0WeavJCCDNjzzbJsLw\nhUhMVEF1Wd+j3Ywif+q2mpmZkov7DtgQ/xV+TJsdIZgSnnHW3/fqLpSGYRoKdhey\n75pzjM3iuwKBgDiLVCB/kvYeVeERVF8b6zvFPkphU94/d7lv+A0zyI24Ne6lqqaU\np2ks4WuHQahpeWNP1CLcHpOi+LYDsiu7OLf+KpDBHXLGSgK+JRcByOyEBKCw+yyU\nV2kD+qt1qfu1XUmQw2jk19oQxIgwWwX4Qt4v/fJAcUb1k4BpButStEtBAoGAKuCt\naWuV/U0lmpktRYnmuzP43EADib6dHs6U80+tqyWXPwEhbSL0RgbFe+P7YvqqxR4P\nTsjcVMfQRUakWofE7Cw7SmVgs4kBPkaz0xTHV/SY8l2PulDl4aDruqxHjLMCqIME\nlGQwMthbeQfqYzJQurMbq13JBEc0fZh1XlCMOvUCgYBGACJWARdiEqpDwXZO2c0F\nVxFz5EOJTf8jYCZ7TbsehQrFu5YUlon763zAUEK13ltq3NG298V1bkIxM8TYHtZp\nq2ylH1tqKdgZrCwhyZdNzTbdQJnRpo+ymEOSKyo/qjjg69cA8SKW63cQtEafzCDz\nY+tfFgb5Kd6obcvD/hsldg==\n-----END PRIVATE KEY-----\n"
FIREBASE_CLIENT_EMAIL        = "firebase-adminsdk-o88cv@swap-cloud-uat.iam.gserviceaccount.com"
FIREBASE_API_KEY             = "AIzaSyBCQuPRpHsVOT-8lmmdzAR6wA_8_Y-FC-o"
FIREBASE_DATABASE_ID         = "swap-security-db"

# Keycloak client settings
KEYCLOAK_CLIENT_ID       = "merchant-service"
KEYCLOAK_CLIENT_SECRET   = "wy7Fx7DnogiAOEGvE7a7v7xhGinV9RBv"
KEYCLOAK_AUTH_SERVER_URL = "https://keycloak-prod-93326999095.us-central1.run.app"
KEYCLOAK_REALM           = "master"
CRYPTO_SECRET_KEY        = "kjbkjhgf784gfuwegf847wfhgufwigei"
