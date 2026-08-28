# NovaBank — GitHub Build IPA

Bản này được chuẩn bị để đưa thẳng lên GitHub và chạy **Actions → Build IPA**.
Không cần cài Node.js/npm trên máy của bạn.

## Cách dùng
1. Tạo repository GitHub mới.
2. Upload toàn bộ file/thư mục trong project này.
3. Commit & push lên `main`.
4. Vào tab **Actions** → **Build IPA** → **Run workflow**.
5. Khi build xong, vào phần **Artifacts** tải `NovaBank-IPA`.

### Lưu ý ký IPA
Workflow mặc định tạo **IPA unsigned** để không cần Apple certificate.
IPA unsigned không cài trực tiếp được trên iPhone thông thường.

Nếu bạn có Apple Developer certificate/provisioning profile, có thể thêm bước signing vào GitHub Actions để tạo IPA đã ký.

Demo:
- Khách: 10000001 / 123456
- Admin: admin / admin123

Đây là Banking Demo offline, không kết nối ngân hàng thật và không xử lý tiền thật.
