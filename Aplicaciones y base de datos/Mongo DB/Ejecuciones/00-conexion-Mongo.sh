sergio@Sergio:~$ sudo apt update
sudo apt install -y gnupg
Hit:1 https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 InRelease
Hit:2 http://security.ubuntu.com/ubuntu jammy-security InRelease
Hit:3 http://archive.ubuntu.com/ubuntu jammy InRelease
Hit:4 http://archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:5 https://deb.nodesource.com/node_18.x nodistro InRelease
Hit:6 https://packages.grafana.com/oss/deb stable InRelease
Hit:7 http://archive.ubuntu.com/ubuntu jammy-backports InRelease
Hit:8 https://packages.microsoft.com/ubuntu/23.04/prod lunar InRelease
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
W: https://repo.mongodb.org/apt/ubuntu/dists/jammy/mongodb-org/6.0/InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.
W: https://packages.grafana.com/oss/deb/dists/stable/InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.
W: https://packages.microsoft.com/ubuntu/23.04/prod/dists/lunar/InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
gnupg is already the newest version (2.2.27-3ubuntu2.1).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
sergio@Sergio:~$ wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo tee /etc/apt/trusted.gpg.d/mongodb.asc
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.4.11 (GNU/Linux)

mQINBGIWTroBEADgSBs1z1MC5Hog5yd2wYHskzPE0SOl9LGB35Xhw1894hrKsswp
AS7JnViltXE71iJMoAqepJBvfmZLOyQO0rXcLlHXExK/IctnosRqGQeyLxNZKS0h
e1xQYQrPCWRaHqseYLuJ5wME49aFQ2YS7caFowBvKjsT5AoT7B0uXDp6nHZDUQG2
MBZJqUKziVYYt7PARv81llDNKqPvLDSc2McL/2aa4mNR/pM5r8iQjACbSnj37ERm
zca2gJ0GzCeZSqfmjoF7I6Ez1Nc/2ge1+fZA24pDFg+7W25du3JIqbnpJQAK5TAz
7tVzvEKU8WT9aQW3G1e5ox3YtlRPTSrTxN9dzLh123NGCd0J9a4moFkZIr8HmySd
jkdz4V1pKv9aTOhLjQpF/bhRaUuNuGK7TV7ZzY+PCVE51fmJx2EX4Ck5c6sW03rJ
59KbrxeTq02AcIBTFUY0Mfh7nxvYvwvLI0OKBOqFGXi4hFXpV4uo0rDLe+tGLFDD
+HsajFUUyAlMETE80PXOuTs44TZiW+SGCTyP2Sm8TBIiacSqsGNsryjgEDaIG6c1
FB++njqTfGlyZujamYbF3s3wBK8nDBVRympJcsHjLqUhvbh1Bq4hyF2pxio93SgA
mPEm6kl0KBCqpJNZpAFSVHK8penQtQUa0jFQetYPDUFfgTsg7qdZDQNcUwARAQAB
tDdNb25nb0RCIDYuMCBSZWxlYXNlIFNpZ25pbmcgS2V5IDxwYWNrYWdpbmdAbW9u
Z29kYi5jb20+iQI+BBMBAgAoBQJiFk66AhsDBQkJZgGABgsJCAcDAgYVCAIJCgsE
FgIDAQIeAQIXgAAKCRBqJrGuZMPDiADhEACex1qu1HbVIeBwZO4GYYEc8OpswguI
LvTL1ufWMVbpSFkm0XDzx7JU0SewCEBzr7BTri2zjNaPm7RQHYFl1ztTnNvxrvzu
AUoj/BClAgQXujSuUcEu+uA9pBHObiLHAkYFy61EnKgXu2iTOMn7HqRvjvHZyOnr
5llGG2zUq8YbEVs4GTHVV9CjCWBkf78stdqEAPCH69DtR1Bv2jQfUslVSDKUnluX
feTRDgWXnIKo4ld6EoqtYurIbcJIGvXHbFx90PoZiPJXn+eTY+6HS3I/TXDGAOkF
xkgmVsPWcZvbU0dLXjAiTIADODyiEiZlonrxYXJztIs/KXLl5CnvAEeXKXACbgaN
nuIMKtprtrLvFDpXwfyI90He0Vv8iE1wXSLcuztT5R1h6NmisMz9oRYQL3hqsSEn
TjV+Ko34Kyo459Bs9PhJO0DcZGg+B8iU9TdJgfp1KEs2HJFAueVtYAUJ3y5+UJFn
AkQoD5CC0Y+93z0+nHQPvjyxQ/7swFWNtrumrthcpYbGMIKEWqaQoEz2My5gVXHh
v5pHEXxXiARNe44GsS8r+1DYQypDUAh5Tw9mQRagWuC5Dsaaqob5vCdcFEAgiK5W
a/coP3B6WzUoQE8NKa8qnKDvX5RU0dxG5oUre+PuOwiHpom9G+375YYkwIL9a6pE
RRM5efxf1F532A==
=Cc71
-----END PGP PUBLIC KEY BLOCK-----
sergio@Sergio:~$ echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse
sergio@Sergio:~$ sudo apt update
sudo apt install -y mongodb-org
Hit:1 http://archive.ubuntu.com/ubuntu jammy InRelease
Hit:2 http://security.ubuntu.com/ubuntu jammy-security InRelease
Hit:3 https://packages.grafana.com/oss/deb stable InRelease
Get:4 https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 InRelease [4009 B]
Hit:5 https://deb.nodesource.com/node_18.x nodistro InRelease
Hit:6 http://archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:7 http://archive.ubuntu.com/ubuntu jammy-backports InRelease
Hit:8 https://packages.microsoft.com/ubuntu/23.04/prod lunar InRelease
Get:9 https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0/multiverse arm64 Packages [85.9 kB]
Get:10 https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0/multiverse amd64 Packages [89.5 kB]
Fetched 179 kB in 1s (206 kB/s)
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
2 packages can be upgraded. Run 'apt list --upgradable' to see them.
W: https://packages.grafana.com/oss/deb/dists/stable/InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.
W: https://packages.microsoft.com/ubuntu/23.04/prod/dists/lunar/InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
mongodb-org is already the newest version (6.0.20).
0 upgraded, 0 newly installed, 0 to remove and 2 not upgraded.
sergio@Sergio:~$ sudo systemctl start mongod
sudo systemctl enable mongod
Created symlink /etc/systemd/system/multi-user.target.wants/mongod.service → /lib/systemd/system/mongod.service.
sergio@Sergio:~$ sudo systemctl status mongod
● mongod.service - MongoDB Database Server
     Loaded: loaded (/lib/systemd/system/mongod.service; enabled; ven>
     Active: active (running) since Sat 2025-03-08 12:29:44 CST; 6s a>
       Docs: https://docs.mongodb.org/manual
   Main PID: 87478 (mongod)
     Memory: 76.8M
     CGroup: /system.slice/mongod.service
             └─87478 /usr/bin/mongod --config /etc/mongod.conf

Mar 08 12:29:44 Sergio systemd[1]: Started MongoDB Database Server.
Mar 08 12:29:44 Sergio mongod[87478]: {"t":{"$date":"2025-03-08T18:29>
set mark: ...skipping...
● mongod.service - MongoDB Database Server
     Loaded: loaded (/lib/systemd/system/mongod.service; enabled; ven>
     Active: active (running) since Sat 2025-03-08 12:29:44 CST; 6s a>
       Docs: https://docs.mongodb.org/manual
   Main PID: 87478 (mongod)
     Memory: 76.8M
     CGroup: /system.slice/mongod.service
             └─87478 /usr/bin/mongod --config /etc/mongod.conf

Mar 08 12:29:44 Sergio systemd[1]: Started MongoDB Database Server.
Mar 08 12:29:44 Sergio mongod[87478]: {"t":{"$date":"2025-03-08T18:29>
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
