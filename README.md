# Notes project

## Requirements
- Python3
- Postgres

## How to run

### Setup virtual environment

#### Create venv
```
python -m venv ./venv
```

#### Install requirements
```
python -m pip install -r requirements.txt
```

#### Activate venv
```
source ./venv/bin/activate
```

### Setup database
1. Create an instance of postgres database
2. Make migrations
    ```
    python manage.py makemigrations
    ```
3. Migrate
    ```
    python manage.py migrate
    ```

### Create an admin
```
python manage.py createsuperuser
```

## Important end-points
```
users/login/ --> login a user
users/me/ --> get information of logged-in user
users/create/ --> create a user
users/<id>/delete/ --> delete a user
notes/ --> list all notes of current user
notes/<id>/ --> get details of a note
notes/create/ --> create a note
notes/<id>/delete/ --> delete a note
```
### وظایف Dockerfile، Image و Container

#### Dockerfile
- **تعریف:** یک فایل متنی ساده که شامل دستورات لازم برای ساخت یک Docker image است.
- **وظایف:**
  - تعیین پایه‌ای‌ترین سیستم‌عامل (مثلاً `FROM ubuntu:latest`).
  - نصب نرم‌افزارها و بسته‌های مورد نیاز (مثلاً `RUN apt-get update && apt-get install -y python`).
  - کپی فایل‌ها و پوشه‌ها به داخل ایمیج (مثلاً `COPY . /app`).
  - تعریف متغیرهای محیطی و پورت‌های مورد استفاده.
  - تعیین نقطه شروع اجرای برنامه (مثلاً `CMD ["python", "app.py"]`).

#### Image
- **تعریف:** یک بسته قابل حمل و فقط خواندنی که شامل تمام اجزای لازم برای اجرای یک برنامه است.
- **وظایف:**
  - محیط اجرایی برنامه را فراهم می‌کند.
  - شامل فایل سیستم، کد، کتابخانه‌ها و وابستگی‌های مورد نیاز برنامه است.
  - به عنوان پایه برای ساخت کانتینرها استفاده می‌شود.

#### Container
- **تعریف:** یک نمونه اجرایی از یک Docker image است.
- **وظایف:**
  - اجرای برنامه‌ها در محیط‌های ایزوله و سبک وزن.
  - استفاده از منابع سیستم‌عامل به صورت مشترک با دیگر کانتینرها.
  - فراهم کردن محیط اجرایی جداگانه برای هر برنامه.

### Kubernetes
#### وظایف Kubernetes
- **مدیریت و ارکستراسیون کانتینرها:** شامل زمان‌بندی، مقیاس‌پذیری و اجرای کانتینرها.
- **مقیاس‌پذیری خودکار:** مقیاس‌بندی خودکار تعداد کانتینرها بر اساس نیاز بار کاری.
- **خوددرمانی:** شناسایی و جایگزینی کانتینرهای خراب و از کار افتاده.
- **تنظیم شبکه و بارگذاری:** توزیع بار ترافیک بین کانتینرها و فراهم کردن شبکه‌های مجازی.
- **مدیریت پیکربندی و اسرار:** مدیریت پیکربندی برنامه‌ها و اطلاعات حساس مانند کلیدهای API.

#### رابطه Kubernetes با Docker
- **اجرا و مدیریت کانتینرها:** Docker برای ساخت و اجرای کانتینرها استفاده می‌شود، در حالی که Kubernetes برای مدیریت و ارکستراسیون کانتینرها استفاده می‌شود.
- **هماهنگی:** Kubernetes از Docker به عنوان موتور اجرای کانتینر استفاده می‌کند تا کانتینرها را در کلاسترهای بزرگ مدیریت کند.
- **تکمیل‌کننده:** Docker محیطی برای ایجاد و آزمایش کانتینرها فراهم می‌کند، در حالی که Kubernetes این کانتینرها را در مقیاس بزرگ مدیریت و هماهنگ می‌کند.

این ترکیب از Docker و Kubernetes به توسعه‌دهندگان و مدیران سیستم‌ها امکان می‌دهد تا برنامه‌های خود را به صورت موثر و کارآمد در محیط‌های مختلف اجرا و مدیریت کنند.
