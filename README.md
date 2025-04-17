🚀 Project: Async Price Tracker & Notifier
Goal:
Build a backend service that pulls product prices from multiple e-commerce APIs, caches the results, queues tasks for refreshing price data, and sends notifications if prices drop.

---

🧱 Core Features
📡 API Integration (Async)
Fetch product prices from public APIs (like FakeStoreAPI, Best Buy API, or mock your own).
Use httpx or aiohttp to call APIs asynchronously.

📬 Queuing
Use asyncio.Queue or Redis with a worker setup (like FastAPI + Celery).
Queue background tasks like:
Refreshing price data.
Sending notifications.

🚀 Async API Backend
Build with FastAPI.
Endpoints:
GET /products: List cached product info.
POST /track: Add a new product to watch.
GET /price-history/{product_id}

🧠 Caching
Use Redis to cache:
Recently fetched prices.
Results of expensive API calls.
Set expiration on stale data.

🔔 Notification Logic
Send email or log alerts when a price drops.
Store basic user alert subscriptions.

---

🛠️ Tech Stack
| Feature | Tool |
|--------|------|
| API Framework | FastAPI (fully async) |
| HTTP Client | httpx or aiohttp |
| Queue System | asyncio.Queue (basic) or Celery/RQ + Redis |
| Caching | Redis (aioredis) |
| Background Workers | asyncio.create_task() or Celery |
| Persistence | PostgreSQL (via databases or SQLModel) or SQLite for simplicity |
