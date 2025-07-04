# 🧑‍💻 userclone

ابزاری ساده برای انتقال کاربران لینوکس از یک سرور به سرور دیگر، بدون انتقال دیتا یا home.

## 🛠 نصب (در هر دو سرور):

```bash
bash <(curl -s https://raw.githubusercontent.com/ermia81/userclone/main/install.sh)
```

## 📤 در سرور مبدا:

```bash
export_users
```

## 📦 انتقال فایل:

```bash
scp -P 22 /tmp/user_export/users_backup.tar.gz user@NEW_SERVER_IP:/tmp/
```

## 📥 در سرور مقصد:

```bash
import_users
```

## 🧹 پاکسازی:

```bash
rm -rf /tmp/user_export /tmp/user_import /tmp/users_backup.tar.gz
```

## 📄 مجوز

MIT
