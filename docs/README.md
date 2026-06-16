# 📚 Project Documentation

## Struktur Dokumentasi

- [Backend Setup Guide](./BACKEND_SETUP.md) - Setup dan development guide
- [API Documentation](./API.md) - Endpoint API dan usage
- [Database Setup](./DATABASE_SETUP.md) - Database configuration

## Quick Links

### Getting Started
1. [Backend Setup](./BACKEND_SETUP.md#quick-start)
2. [Database Setup](./DATABASE_SETUP.md#setup-postgresql)
3. [API Overview](./API.md)

### Development
- [Environment Variables](./BACKEND_SETUP.md#environment-variables)
- [Common Tasks](./BACKEND_SETUP.md#common-tasks)
- [Testing](./BACKEND_SETUP.md#testing)

### Troubleshooting
- [Troubleshooting Guide](./BACKEND_SETUP.md#troubleshooting)
- [Database Issues](./DATABASE_SETUP.md#backup--restore)

## Architecture Overview

```
┌─────────────────┐
│   Flutter App   │
│   (Frontend)    │
└────────┬────────┘
         │ HTTP
         ▼
┌─────────────────────────────┐
│   Express.js Server         │
│  - Authentication           │
│  - Validation               │
│  - Business Logic           │
└────────┬────────────────────┘
         │ SQL
         ▼
┌──────────────────────┐
│  PostgreSQL Database │
│  - Users             │
│  - Products          │
│  - Orders            │
│  - Payments (Escrow) │
│  - Commissions       │
└──────────────────────┘
```

## Tech Stack

### Backend
- **Framework**: Express.js
- **Database**: PostgreSQL
- **Authentication**: JWT
- **Validation**: Joi
- **Password Hashing**: bcryptjs

### Frontend
- **Framework**: Flutter
- **State Management**: Provider/Riverpod
- **API Client**: Dio/http

### External Services
- **Payment**: Midtrans
- **Logistics**: RajaOngkir
- **Notifications**: Firebase Cloud Messaging

## Development Workflow

1. Create feature branch from `develop`
2. Make changes
3. Test thoroughly
4. Create Pull Request
5. Code review
6. Merge to `develop`
7. Deploy to staging
8. Merge to `main` for production

## File Structure

```
market/
├── backend/
│   ├── src/
│   ├── docs/
│   ├── package.json
│   └── .env.example
├── frontend/
│   ├── lib/
│   ├── pubspec.yaml
│   └── ...
├── docs/
│   ├── BACKEND_SETUP.md
│   ├── API.md
│   └── DATABASE_SETUP.md
└── README.md
```

## Key Features

### Phase 1 (MVP)
- ✅ User authentication (buyer, seller, admin)
- ✅ Product catalog with search & filter
- ✅ Shopping cart
- ✅ Order management
- ✅ Payment processing (escrow)
- ✅ Commission calculation

### Phase 2
- [ ] Real-time notifications
- [ ] Product reviews & ratings
- [ ] Seller analytics dashboard
- [ ] Promotional tools (vouchers, discounts)
- [ ] Advanced search with AI recommendations

### Phase 3
- [ ] Mobile app optimization
- [ ] Performance improvements
- [ ] Advanced analytics
- [ ] Fraud detection system

## Contributing

Silakan baca [Contributing Guide](../CONTRIBUTING.md) untuk guidelines.

## Support

Jika ada pertanyaan atau issues:
1. Check existing GitHub issues
2. Create new issue with clear description
3. Contact maintainer

---

**Last Updated**: June 2024
