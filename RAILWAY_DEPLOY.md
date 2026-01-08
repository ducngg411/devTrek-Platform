# 🚂 HƯỚNG DẪN DEPLOY LÊN RAILWAY

Railway là nền tảng deploy đơn giản nhất cho PHP + MySQL. Deploy trong 10 phút! 🚀

## 📋 CHUẨN BỊ

### 1. Đăng ký Railway
- Truy cập: https://railway.app/
- Click **"Login"** → Đăng nhập bằng **GitHub**
- Xác nhận quyền truy cập GitHub

### 2. Kiểm tra GitHub Repo
✅ Code đã push lên: https://github.com/ducngg411/devTrek-Platform

---

## 🚀 BƯỚC 1: TẠO PROJECT

1. Vào Dashboard Railway: https://railway.app/dashboard
2. Click **"New Project"**
3. Chọn **"Deploy from GitHub repo"**
4. Chọn repo: **ducngg411/devTrek-Platform**
5. Railway sẽ tự động detect PHP và bắt đầu deploy

---

## 🗄️ BƯỚC 2: THÊM MYSQL DATABASE

1. Trong project vừa tạo, click **"+ New"**
2. Chọn **"Database"** → **"Add MySQL"**
3. Railway sẽ tạo MySQL instance tự động
4. Chờ database khởi tạo (1-2 phút)

### Lấy thông tin Database:
1. Click vào **MySQL service**
2. Vào tab **"Variables"**
3. Copy các giá trị:
   - `MYSQL_HOST`
   - `MYSQL_PORT`
   - `MYSQL_DATABASE`
   - `MYSQL_USER`
   - `MYSQL_PASSWORD`

---

## ⚙️ BƯỚC 3: CẤU HÌNH ENVIRONMENT VARIABLES

1. Click vào **PHP service** (tên repo của bạn)
2. Vào tab **"Variables"**
3. Click **"+ New Variable"** và thêm:

```
DB_HOST=<MYSQL_HOST từ bước 2>
DB_PORT=<MYSQL_PORT từ bước 2>
DB_NAME=<MYSQL_DATABASE từ bước 2>
DB_USER=<MYSQL_USER từ bước 2>
DB_PASS=<MYSQL_PASSWORD từ bước 2>
```

**Ví dụ:**
```
DB_HOST=containers-us-west-123.railway.app
DB_PORT=6379
DB_NAME=railway
DB_USER=root
DB_PASS=AbCd1234XyZ
```

4. Click **"Add"** cho mỗi biến

---

## 🔧 BƯỚC 4: CẬP NHẬT CODE DATABASE CONNECTION

1. Mở file `includes/DatabaseConnection.php` trong VSCode
2. Thay thế nội dung bằng:

```php
<?php
// Railway Database Configuration
$db_host = getenv('DB_HOST') ?: 'localhost';
$db_port = getenv('DB_PORT') ?: '3306';
$db_name = getenv('DB_NAME') ?: 'final_cw';
$db_user = getenv('DB_USER') ?: 'root';
$db_pass = getenv('DB_PASS') ?: '';

try {
    $pdo = new PDO("mysql:host=$db_host;port=$db_port;dbname=$db_name;charset=utf8mb4", $db_user, $db_pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Could not connect to the database: " . $e->getMessage());
}
```

3. Commit và push:
```bash
git add .
git commit -m "Update database config for Railway deployment"
git push
```

4. Railway sẽ **tự động redeploy** khi detect commit mới

---

## 💾 BƯỚC 5: IMPORT DATABASE

### Cách 1: Sử dụng Railway CLI (Khuyến nghị)

1. **Cài Railway CLI:**
```bash
# Windows (PowerShell)
iwr https://railway.app/install.ps1 | iex
```

2. **Login Railway:**
```bash
railway login
```

3. **Link project:**
```bash
cd C:\xampp\htdocs\COMP1841-demo
railway link
```
(Chọn project devTrek-Platform từ list)

4. **Kết nối MySQL và import:**
```bash
railway run mysql -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < Database/final_cw.sql
```

### Cách 2: Sử dụng phpMyAdmin (Railway Plugin)

1. Trong Railway project, click **"+ New"**
2. Chọn **"Template"** → Tìm **"phpMyAdmin"**
3. Deploy phpMyAdmin
4. Click vào phpMyAdmin service → **"Settings"** → Copy **URL**
5. Truy cập URL đó
6. Login bằng credentials từ MySQL Variables
7. Import file `Database/final_cw.sql`

### Cách 3: MySQL Workbench (Local)

1. Mở MySQL Workbench
2. Tạo connection mới với thông tin từ Railway MySQL Variables
3. Connect và import file `Database/final_cw.sql`

---

## 🌐 BƯỚC 6: TRUY CẬP WEBSITE

1. Quay lại Railway dashboard
2. Click vào **PHP service**
3. Vào tab **"Settings"**
4. Scroll xuống **"Networking"**
5. Click **"Generate Domain"**
6. Railway sẽ tạo domain dạng: `your-project.up.railway.app`
7. Copy URL và truy cập! 🎉

---

## 🔍 TROUBLESHOOTING

### Lỗi "Could not connect to database"
- ✅ Kiểm tra Environment Variables đã đúng chưa
- ✅ Đảm bảo MySQL service đang chạy (có icon xanh)
- ✅ Kiểm tra code `DatabaseConnection.php` đã update chưa

### Lỗi "500 Internal Server Error"
1. Click vào PHP service
2. Vào tab **"Deployments"**
3. Click deployment mới nhất
4. Xem **"Deploy Logs"** để tìm lỗi
5. Kiểm tra **"Build Logs"** nếu build fail

### Website bị timeout
- Railway free tier có giới hạn 500 giờ/tháng
- Website sẽ sleep sau không hoạt động, cần 1-2s để wake up

### Database import fail
- Kiểm tra file SQL không có lỗi syntax
- Đảm bảo đã xóa TRIGGER (đã làm ở bước chuẩn bị)
- Thử import từng phần nếu file quá lớn

---

## 📊 GIỚI HẠN FREE TIER

Railway miễn phí cung cấp:
- ✅ **$5 credit/tháng** (khoảng 500 giờ runtime)
- ✅ **Unlimited deployments**
- ✅ **SSL/HTTPS tự động**
- ✅ **Custom domain** (nếu có)
- ✅ **Automatic deployments từ GitHub**

**Lưu ý:**
- Website sleep sau 15 phút không hoạt động
- Wake up time: ~2-3 giây khi có request mới
- Sau khi hết credit, service sẽ bị pause

---

## 🎯 NEXT STEPS

### 1. Setup Custom Domain (Optional)
1. Mua domain hoặc dùng domain có sẵn
2. Vào Railway → Settings → Networking
3. Thêm custom domain
4. Cập nhật DNS records theo hướng dẫn

### 2. Enable Auto-Deploy từ GitHub
- ✅ Đã tự động setup khi deploy từ GitHub
- Mỗi lần push code mới → Railway tự động deploy

### 3. Monitoring & Logs
- Vào tab **"Metrics"** để xem CPU, RAM usage
- Vào tab **"Deployments"** để xem logs realtime

### 4. Backup Database
```bash
railway run mysqldump -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE > backup.sql
```

---

## 🎉 HOÀN TẤT!

Website của bạn đã live tại: **https://your-project.up.railway.app**

**Checklist:**
- ✅ GitHub repo pushed
- ✅ Railway project created
- ✅ MySQL database setup
- ✅ Environment variables configured
- ✅ Database imported
- ✅ Domain generated
- ✅ Website accessible

---

## 📚 TÀI LIỆU THAM KHẢO

- Railway Docs: https://docs.railway.app/
- Railway Discord: https://discord.gg/railway
- Railway Status: https://status.railway.app/

---

**Chúc mừng bạn đã deploy thành công! 🚀🎊**

Nếu gặp vấn đề, check logs trong Railway dashboard hoặc hỏi trực tiếp!
