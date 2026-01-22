# docker-nut-builder
[![status-badge](https://build02.sotolar.net/api/badges/41/status.svg)](https://build02.sotolar.net/repos/41)

Network UPS Tools (NUT) backport build container

## Debian APT Repository

Import the public GPG key that is used to sign the packages:

```bash
curl -fsSL https://repo.sotolar.com/deb/archive-keyring.asc \
  | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/repo.sotolar.com.gpg
```

Then add the repository to the APT sources list:

```bash
sudo tee /etc/apt/sources.list.d/nut.sources >/dev/null <<'EOF'
Types: deb
URIs: https://repo.sotolar.com/deb/debian
Suites: trixie-backports
Components: nut
Signed-By: /etc/apt/trusted.gpg.d/repo.sotolar.com.gpg
EOF
```
