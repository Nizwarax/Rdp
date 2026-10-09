# Nizwarax RDP - Independent Edition
1-Command Windows RDP & Universal OS Reinstall untuk KVM.

### Windows RDP (10-20 Menit Jadi)
**1. Paling Gampang:**
```bash
curl -sSL https://raw.githubusercontent.com/Nizwarax/Rdp/main/install.sh -o i.sh && chmod +x i.sh && sudo bash i.sh
# Ketik YES
```
**2. Stabil (8 VPS Tested):**
```bash
curl -sSL https://raw.githubusercontent.com/Nizwarax/Rdp/main/reinstall.sh -o reinstall.sh && chmod +x reinstall.sh && sudo bash reinstall.sh windows --image-name "Windows Server 2022 SERVERDATACENTER" --lang en --password "Rdp123@@" --allow-ping
```
**3. One Liner (Tanpa download):**
```bash
bash <(curl -sSL https://raw.githubusercontent.com/Nizwarax/Rdp/main/reinstall.sh) windows --password Rdp123@@ --allow-ping
```
Login: `Administrator / Rdp123@@ / Port 3389`

---
### Daftar Perintah Lengkap (Tinggal Tempel)

> **Catatan:** Kalau belum ada file `reinstall.sh`, pakai versi `# Belum download`. Kalau sudah ada, pakai yang biasa.

**Windows ISO:**
```bash
# Server 2022 (Recommended) - Sudah download
bash reinstall.sh windows --image-name "Windows Server 2022 SERVERDATACENTER" --password "Rdp123@@" --allow-ping
# Belum download
bash <(curl -sSL https://raw.githubusercontent.com/Nizwarax/Rdp/main/reinstall.sh) windows --image-name "Windows Server 2022 SERVERDATACENTER" --password "Rdp123@@" --allow-ping

# Server 2019 - Sudah download
bash reinstall.sh windows --image-name "Windows Server 2019 SERVERDATACENTER" --password "Rdp123@@" --allow-ping
# Belum download
bash <(curl -sSL https://raw.githubusercontent.com/Nizwarax/Rdp/main/reinstall.sh) windows --image-name "Windows Server 2019 SERVERDATACENTER" --password "Rdp123@@" --allow-ping

# Server 2016 / 2025
bash reinstall.sh windows --image-name "Windows Server 2016 SERVERDATACENTER" --password "Rdp123@@"
bash reinstall.sh windows --image-name "Windows Server 2025 SERVERDATACENTER" --password "Rdp123@@"

# Windows 11 / 10 - Sudah download
bash reinstall.sh windows --image-name "Windows 11 Pro" --lang en --password "Rdp123@@"
bash reinstall.sh windows --image-name "Windows 10 Pro" --lang en --password "Rdp123@@"
# Belum download
bash <(curl -sSL https://raw.githubusercontent.com/Nizwarax/Rdp/main/reinstall.sh) windows --image-name "Windows 11 Pro" --lang en --password "Rdp123@@"
```

**Linux - Debian / Ubuntu:**
```bash
# Sudah download
bash reinstall.sh debian 12
bash reinstall.sh debian 11
bash reinstall.sh ubuntu 22.04
bash reinstall.sh ubuntu 24.04

# Belum download - Langsung Jalan
bash <(curl -sSL https://raw.githubusercontent.com/Nizwarax/Rdp/main/reinstall.sh) debian 12
bash <(curl -sSL https://raw.githubusercontent.com/Nizwarax/Rdp/main/reinstall.sh) ubuntu 22.04
bash <(curl -sSL https://raw.githubusercontent.com/Nizwarax/Rdp/main/reinstall.sh) ubuntu 24.04
```

**Linux - Ringan & Lainnya:**
```bash
# Sudah download
bash reinstall.sh alpine 3.24
bash reinstall.sh alpine 3.19
bash reinstall.sh kali rolling
bash reinstall.sh arch
bash reinstall.sh rocky 9
bash reinstall.sh almalinux 9
bash reinstall.sh fedora 40
bash reinstall.sh centos 9

# Belum download
bash <(curl -sSL https://raw.githubusercontent.com/Nizwarax/Rdp/main/reinstall.sh) alpine 3.24
bash <(curl -sSL https://raw.githubusercontent.com/Nizwarax/Rdp/main/reinstall.sh) kali rolling
bash <(curl -sSL https://raw.githubusercontent.com/Nizwarax/Rdp/main/reinstall.sh) rocky 9
bash <(curl -sSL https://raw.githubusercontent.com/Nizwarax/Rdp/main/reinstall.sh) arch
```

**DD / Custom Image (.vhd/.gz/.xz):**
```bash
# Sudah download
bash reinstall.sh dd --img "https://example.com/win10.vhd.gz"
bash reinstall.sh dd --img "https://example.com/debian.img.xz"

# Belum download
bash <(curl -sSL https://raw.githubusercontent.com/Nizwarax/Rdp/main/reinstall.sh) dd --img "https://example.com/win10.vhd.gz"
```

**Rescue / Tools / Batal:**
```bash
bash reinstall.sh alpine --hold 1    # Live OS buat backup manual
bash reinstall.sh netboot.xyz        # Menu netboot.xyz
bash reinstall.sh reset              # Batalin sebelum reboot

# Versi belum download:
bash <(curl -sSL https://raw.githubusercontent.com/Nizwarax/Rdp/main/reinstall.sh) alpine --hold 1
bash <(curl -sSL https://raw.githubusercontent.com/Nizwarax/Rdp/main/reinstall.sh) netboot.xyz
```

---
### Kebutuhan Sistem
| OS | RAM | Disk |
|---|---|---|
| Alpine | 256MB | 1GB |
| Debian/Ubuntu | 256-512MB | 1-2GB |
| Windows | 1GB+ | 25GB |
Hanya KVM/Dedicated. No OpenVZ/LXC.

### File Include
`install.sh` `reinstall.sh` `trans.sh` `windows.xml` `windows-driver-utils.sh` `windows-*.bat` `fix-eth-name.*` + 15 file lain (bundle anti 404, sudah fix UDF pakai 7z).

### Credit
Maintained by Nizwarax | GPL-3.0 | Core: bin456789
