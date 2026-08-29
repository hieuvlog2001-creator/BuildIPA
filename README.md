# NovaBank — VPS API + GitHub Build IPA

Bản sửa lỗi build: đã bổ sung thư mục `NovaBank/Resources` chứa toàn bộ web resources để Xcode không còn lỗi `No such file or directory .../NovaBank/Resources`.

App iOS và Admin Web gọi API VPS:
`https://misamod.site/bank/api/`

Không dùng Node.js/npm/MySQL/SQLite.

## VPS
- Upload `api/` + `data/` vào `/bank/`.
- Trang Admin: `/bank/admin/`
- API health check: `/bank/api/`
- Bật HTTPS.
- Đổi `CHANGE_THIS_ADMIN_TOKEN` trước khi public.

## GitHub
Upload toàn bộ project lên GitHub → Actions → **Build IPA** → Run workflow.
Workflow dùng GitHub macOS runner; máy của bạn không cần Xcode/Node/npm.

Workflow tạo IPA unsigned. Muốn IPA cài được trên iPhone thông thường cần signing bằng Apple Developer certificate/provisioning profile.

Demo: khách `10000001 / 123456`, admin `admin / admin123`.

Đây là Banking Demo/sandbox, không kết nối ngân hàng thật và không xử lý tiền thật.
