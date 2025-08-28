
# Nexus

Installer Java.

```
sudo apt install default-jre
```

Télécharger Nexus et décompresser.

```
tar xvz --keep-directory-symlink -f nexus-3.83.0-08-linux-x86_64.tar.gz
```

Lancer Nexus.

```
./nexus start
./nexus stop
./nexus run
```

# Gitlab

https://docs.gitlab.com/install/package/debian/

```
sudo EXTERNAL_URL="https://gitlab.jfremont.fr" apt install gitlab-ce
sudo apt install -y curl
curl "https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh" | sudo bash
```

Dans /etc/gitlab/gitlab.rb.

```
nginx['ssl_certificate'] = "/etc/gitlab/ssl/gitlab.jfremont.fr.crt"
nginx['ssl_certificate_key'] = "/etc/gitlab/ssl/gitlab.jfremont.fr.key"
```

Dans /etc/gitlab/ssl (certificat auto-signé).

```
openssl req -x509 -newkey rsa:4096 -sha512 -days 3650   -nodes -keyout gitlab.jfremont.fr.key -out gitlab.jfremont.fr.crt -extensions san -config   <(echo "[req]";
```

