# Minecraft Bedrock Server on Railway

سيرفر ماين كرافت بيدروك يعمل على منصة Railway.

---

## 🇸🇦 التعليمات بالعربية

### النشر على Railway

1. ادخل إلى [railway.app](https://railway.app) وسجّل الدخول.
2. اضغط **New Project** ثم **Deploy from GitLab repo** واختر هذا المستودع.
3. سيتم اكتشاف ملف `Dockerfile` و `railway.json` تلقائياً وبدء البناء.
4. من تبويب **Variables** أضف/عدّل المتغيرات التالية حسب الحاجة:

| المتغير | الافتراضي | الوصف |
|---|---|---|
| `EULA` | `TRUE` | الموافقة على اتفاقية ماين كرافت (إجباري) |
| `VERSION` | `LATEST` | إصدار السيرفر (مثال: `1.21.62.01`) |
| `SERVER_NAME` | `X APP Bedrock Server` | اسم السيرفر |
| `GAMEMODE` | `survival` | نمط اللعب (`survival` / `creative` / `adventure`) |
| `DIFFICULTY` | `normal` | الصعوبة (`peaceful` / `easy` / `normal` / `hard`) |
| `MAX_PLAYERS` | `10` | أقصى عدد لاعبين |
| `ALLOW_CHEATS` | `false` | السماح بالأوامر/الغش |
| `ONLINE_MODE` | `true` | التحقق من حسابات Xbox |

> **ملاحظة عن الإصدار:** الإصدار المطلوب `1.26.23.1` غير موجود ضمن إصدارات Bedrock الرسمية. استخدم `VERSION=LATEST` لأحدث إصدار، أو حدّد إصداراً رسمياً صحيحاً مثل `1.21.62.01`.

### ⚠️ تنبيه مهم بخصوص UDP

سيرفر Bedrock يعمل عبر بروتوكول **UDP (منفذ 19132)**، بينما خاصية TCP Proxy في Railway تدعم **TCP فقط**. إذا لم يتمكن اللاعبون من الاتصال مباشرة، استخدم أحد الحلول التالية:

- استخدام نفق UDP مثل [playit.gg](https://playit.gg) لتمرير المنفذ.
- استضافة بديلة تدعم UDP بشكل مباشر.

### اتصال اللاعبين

في اللعبة: **Play → Servers → Add Server** ثم أدخل عنوان السيرفر والمنفذ `19132`.

---

## 🇬🇧 English Instructions

### Deploy on Railway

1. Go to [railway.app](https://railway.app) and sign in.
2. Click **New Project** → **Deploy from GitLab repo** and select this repository.
3. Railway detects the `Dockerfile` and `railway.json` automatically and starts the build.
4. In the **Variables** tab, set/override the environment variables listed in the table above (`EULA=TRUE` is required).

> **Version note:** `1.26.23.1` is not an official Bedrock release. Use `VERSION=LATEST` or a valid official version such as `1.21.62.01`.

### ⚠️ UDP limitation

Bedrock servers require **UDP port 19132**, while Railway's public TCP proxy only supports **TCP**. If players cannot connect directly, use a UDP tunnel such as [playit.gg](https://playit.gg), or a host with native UDP support.

### Connecting

In Minecraft: **Play → Servers → Add Server**, enter the server address and port `19132`.

### Persistence

World data is stored in `/data` inside the container. Attach a **Railway Volume** mounted at `/data` to keep your world between deployments.
