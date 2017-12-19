# mac-ansible
Uses ansible, homebrew and homebrew-cask to privision your MacOSX machine

Install / Update MacOSX

```
bash <(curl -s https://raw.githubusercontent.com/fruwe/mac-ansible/master/install.sh)
```

Random notes and additional settings:

- Increase Samba throughput, if you use only LAN

`printf "[default]\nsigning_required=no\n" | sudo tee /etc/nsmb.conf >/dev/null`
