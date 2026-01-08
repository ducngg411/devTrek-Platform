# 🚀 HƯỚNG DẪN DEPLOY LÊN INFINITYFREE

## 📝 Các bước thực hiện:

### Bước 1: Đăng ký tài khoản InfinityFree
1. Truy cập: https://www.infinityfree.com/
2. Click "Sign Up" và tạo tài khoản miễn phí
3. Xác thực email

### Bước 2: Tạo Website/Account
1. Đăng nhập vào InfinityFree Control Panel
2. Click "Create Account"
3. Nhập subdomain hoặc domain của bạn (ví dụ: devtrek.wuaze.com)
4. Chọn gói miễn phí và tạo account

### Bước 3: Chuẩn bị Database
1. Trong Control Panel, vào "MySQL Databases"
2. Tạo database mới:
   - Database Name: ghi nhớ tên (dạng epizXXXXX_dbname)
   - Username: tự động tạo (dạng epizXXXXX_user)
   - Password: tạo password mạnh
3. **GHI CHÚ LẠI:**
   - MySQL Hostname: (thường là sqlXXX.infinityfreeapp.com)
   - Database Name: epizXXXXX_dbname
   - Username: epizXXXXX_user
   - Password: your_password

### Bước 4: Import Database
1. Vào "phpMyAdmin" từ Control Panel
2. Chọn database vừa tạo
3. Click tab "Import"
4. Upload file `Database/final_cw.sql`
5. Click "Go" để import

### Bước 5: Cập nhật file cấu hình
1. Mở file `includes/DatabaseConnection.php`
2. Cập nhật thông tin database:
```php
$db_host = 'sqlXXX.infinityfreeapp.com';  // MySQL Hostname từ bước 3
$db_name = 'epizXXXXX_dbname';            // Database name từ bước 3
$db_user = 'epizXXXXX_user';              // Username từ bước 3
$db_pass = 'your_password';               // Password từ bước 3
```

### Bước 6: Upload Files
**Cách 1: Sử dụng File Manager (Online)**
1. Trong Control Panel, click "Online File Manager"
2. Vào thư mục `htdocs`
3. Xóa tất cả file mặc định
4. Upload tất cả file của project (trừ thư mục Database)
5. Đảm bảo cấu trúc thư mục giống local

**Cách 2: Sử dụng FTP (Khuyến nghị - nhanh hơn)**
1. Tải FileZilla Client: https://filezilla-project.org/
2. Lấy thông tin FTP từ Control Panel:
   - FTP Hostname: ftpupload.net
   - FTP Username: epizXXXXX
   - FTP Password: (password account)
   - Port: 21
3. Kết nối FTP và upload file vào thư mục `htdocs`

### Bước 7: Cấu hình Email (PHPMailer)
1. Mở file `mail/email_config.php`
2. Cập nhật SMTP settings (nếu cần):
```php
$mail->Host = 'smtp.gmail.com';  // hoặc SMTP server khác
$mail->Username = 'your-email@gmail.com';
$mail->Password = 'your-app-password';
```

### Bước 8: Test Website
1. Truy cập domain của bạn (ví dụ: https://devtrek.wuaze.com)
2. Kiểm tra:
   - ✅ Trang chủ load được
   - ✅ Login/Register hoạt động
   - ✅ Database kết nối thành công
   - ✅ Upload file (nếu có)
   - ✅ Gửi email (nếu có)

## ⚠️ LƯU Ý QUAN TRỌNG

### Giới hạn InfinityFree:
- **Disk Space:** 5GB
- **Bandwidth:** Unlimited (với Fair Usage Policy)
- **MySQL Databases:** 400
- **Email Accounts:** Không hỗ trợ
- **Cron Jobs:** Không hỗ trợ
- **File Upload:** Max 10MB/file

### Các file KHÔNG nên upload:
- ❌ Thư mục `.git/`
- ❌ File `README.md`
- ❌ File `.env` (nếu có)
- ❌ Thư mục `node_modules/` (nếu có)
- ❌ Thư mục `Database/` (chỉ import SQL)

### Bảo mật:
1. Đổi password database thành password mạnh
2. Không commit file `DatabaseConnection.php` với credentials thật lên Git
3. Enable HTTPS trong `.htaccess` khi đã có SSL
4. Backup database thường xuyên

## 🔧 Troubleshooting

### Lỗi "Could not connect to database":
- Kiểm tra lại credentials trong `DatabaseConnection.php`
- Đảm bảo database đã được tạo và import SQL thành công
- Kiểm tra MySQL Hostname chính xác

### Lỗi "500 Internal Server Error":
- Kiểm tra file `.htaccess`
- Xem error log trong Control Panel
- Đảm bảo file permissions đúng

### Upload file bị lỗi:
- Kiểm tra dung lượng file < 10MB
- Kiểm tra thư mục upload có quyền write (755)

## 📞 Hỗ trợ
- InfinityFree Forum: https://forum.infinityfree.com/
- Documentation: https://docs.infinityfree.com/

---
**Chúc bạn deploy thành công! 🎉**
