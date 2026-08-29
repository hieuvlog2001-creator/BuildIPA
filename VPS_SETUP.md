# NovaBank VPS API

Upload `api/` and `data/` vào `/bank/` trên VPS. API app dùng: `https://misamod.site/bank/api/`.

Yêu cầu PHP 8.x + Apache/Nginx. Bật HTTPS.

**Quan trọng:** đổi `CHANGE_THIS_ADMIN_TOKEN` trong `api/config.php` và `api/login.php` thành token bí mật dài trước khi triển khai. Tài khoản admin demo mặc định là `admin/admin123`, nên hãy đổi trong code trước khi public.

`data/` phải không được web truy cập trực tiếp. Apache dùng `.htaccess`; Nginx cần rule chặn `/bank/data/`.

Hệ thống này là Banking Demo/sandbox. File JSON phù hợp demo nhỏ, không nên dùng cho tiền thật/production vì chưa có transaction locking, audit log, rate limiting, CSRF strategy và database ACID.
