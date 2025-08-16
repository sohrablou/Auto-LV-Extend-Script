# Auto LV Extend Script

A Bash script to automatically extend an LVM Logical Volume if free space exists in the Volume Group (VG).  
Designed for Linux systems with LVM, ideal for auto-scaling storage scenarios.

---

## 🚀 Features
- Detects free space in the Volume Group
- Automatically extends the Logical Volume and filesystem
- Logs all actions with timestamps
- Supports common filesystems like `ext4` and `xfs`

---

## 📦 Requirements
- Linux system with LVM installed
- `lvextend`, `resize2fs` (for ext4) or `xfs_growfs` (for xfs)

---

## 🔧 Installation
Clone this repository:
```bash
git clone https://github.com/sohrablou/auto-lv-extend-script.git
cd auto-lv-extend-script
```

## ▶️ Usage
Make the script executable:
```bash
chmod +x auto_lv_extend.sh
```

Run the script:
```bash
sudo ./auto_lv_extend.sh
```

Example Output:
```
[2025-08-16 18:45:12] Found 10GB free in VG 'vg_data'
[2025-08-16 18:45:12] Extending LV 'lv_data' by 10GB...
[2025-08-16 18:45:13] Resizing filesystem...
[2025-08-16 18:45:15] ✅ Extension completed successfully.
```

## 📜 License
This project is licensed under the MIT License - see the LICENSE file for details.


## 👨‍💻 Author
Mohammad Sohrablou – Backend Architecture & System Automation

https://github.com/sohrablou/
