# 🎯 Clove Backend - Setup & Development Guide

## 📋 Prerequisites

- Node.js v16+
- PostgreSQL v12+
- npm atau yarn
- Git

## 🚀 Quick Start

### 1. Setup Backend

```bash
# Clone repository
git clone https://github.com/mantokusmanto339-gif/market.git
cd market/backend

# Install dependencies
npm install

# Setup environment
cp .env.example .env
# Edit .env dengan konfigurasi lokal Anda
```

### 2. Setup PostgreSQL Database

```bash
# Create database
psql -U postgres
CREATE DATABASE clove_db;
\q

# Run migrations
npm run migrate

# (Optional) Seed database dengan data sample
npm run seed
```

### 3. Start Development Server

```bash
npm run dev
```

Server akan berjalan di `http://localhost:3000`

## 📁 Folder Structure

```
backend/
├── src/
│   ├── server.js                 # Entry point
│   ├── config/                   # Configuration files
│   ├── controllers/              # Request handlers
│   ├── routes/                   # Route definitions
│   ├── middleware/               # Custom middleware
│   ├── models/                   # Database models
│   ├── utils/                    # Utility functions
│   ├── validators/               # Input validators
│   └── database/
│       ├── connection.js         # Database connection
│       ├── migrations/           # Database migrations
│       ├── seeders/              # Data seeders
│       └── schema.sql            # Database schema
├── package.json
├── .env.example
└── docs/
    ├── SETUP.md                  # Setup guide
    ├── API.md                    # API documentation
    └── DATABASE_SETUP.md         # Database guide
```

## 🔐 Authentication Flow

```
User Registration/Login → Generate JWT Token → Store in Client
  ↓
API Request → Include Token in Authorization Header
  ↓
Verify Token Middleware → Check Token Validity
  ↓
Route Handler → Process Request
```

## 🛣️ API Routes Structure

```
/api/v1/
├── /auth
│   ├── POST /register       # User registration
│   ├── POST /login          # User login
│   ├── POST /refresh        # Refresh token
│   └── POST /logout         # User logout
├── /users
│   ├── GET /:id             # Get user profile
│   ├── PUT /:id             # Update user
│   └── GET /                # List users (admin only)
├── /products
│   ├── GET /                # List products
│   ├── GET /:id             # Get product details
│   ├── POST /               # Create product (seller only)
│   ├── PUT /:id             # Update product
│   └── DELETE /:id          # Delete product
└── /orders
    ├── POST /               # Create order
    ├── GET /                # List orders
    ├── GET /:id             # Get order details
    ├── PUT /:id/status      # Update order status
    └── POST /:id/cancel     # Cancel order
```

## 🧪 Testing

```bash
# Run tests
npm test

# Run tests with watch mode
npm run test:watch

# Check linting
npm run lint

# Fix linting issues
npm run lint:fix
```

## 📚 API Documentation

Lihat file [API.md](./docs/API.md) untuk dokumentasi lengkap endpoint API.

## 🗄️ Database Documentation

Lihat file [DATABASE_SETUP.md](./docs/DATABASE_SETUP.md) untuk setup dan informasi database.

## 🔧 Environment Variables

Lihat file [.env.example](./.env.example) untuk semua konfigurasi yang tersedia.

## 📝 Common Tasks

### Reset Database
```bash
dropdb clove_db
createdb clove_db
npm run migrate
npm run seed
```

### View Database
```bash
psql -U postgres -d clove_db
\dt              # List all tables
\d users         # Describe users table
```

## 🐛 Debugging

### Enable Debug Logging
```bash
LOG_LEVEL=debug npm run dev
```

### View Server Logs
Check console output atau gunakan `npm run dev` untuk real-time logs.

## 📦 Dependencies

- **express** - Web framework
- **pg** - PostgreSQL client
- **jsonwebtoken** - JWT authentication
- **bcryptjs** - Password hashing
- **joi** - Input validation
- **dotenv** - Environment variables
- **cors** - Cross-Origin Resource Sharing
- **helmet** - Security headers

## 🚨 Troubleshooting

### Connection Refused
- Pastikan PostgreSQL running: `brew services list` (macOS) atau `sudo service postgresql status` (Ubuntu)
- Check database URL di `.env`

### Port Already in Use
- Change PORT di `.env` atau kill process: `lsof -i :3000` dan `kill -9 <PID>`

### Migration Failed
- Cek format SQL di migrations
- Pastikan database connection bekerja

## 🤝 Contributing

1. Create feature branch dari `develop`
2. Make changes
3. Test thoroughly
4. Create Pull Request

## 📞 Support

Jika ada pertanyaan atau issues, buka GitHub issue atau hubungi maintainer.
