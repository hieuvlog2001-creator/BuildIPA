# NovaBank VPS + GitHub Build IPA

App iOS và Admin Web đã được đổi sang gọi API VPS `https://misamod.site/bank/api/`.

Không dùng Node.js/npm/MySQL/SQLite.

## VPS
Upload `api/` + `data/` vào `/bank/`, sau đó xem `VPS_SETUP.md`.

## GitHub
Upload project lên GitHub → Actions → **Build IPA** → Run workflow. GitHub dùng macOS runner để build; máy của bạn không cần Xcode/Node.

Workflow mặc định tạo IPA unsigned. Muốn IPA cài được trên iPhone cần ký bằng Apple Developer certificate/provisioning profile.

Demo: khách `10000001 / 123456`, admin `admin / admin123` (hãy đổi admin trước khi public).
