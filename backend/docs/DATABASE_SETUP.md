# Database Configuration

## Setup PostgreSQL

### 1. Install PostgreSQL
- **macOS**: `brew install postgresql`
- **Ubuntu**: `sudo apt-get install postgresql postgresql-contrib`
- **Windows**: Download from [postgresql.org](https://www.postgresql.org/download/windows/)

### 2. Create Database

```bash
# Connect to PostgreSQL
psql -U postgres

# Create database
CREATE DATABASE clove_db;

# Connect to the database
\c clove_db

# Exit
\q
```

### 3. Run Migrations

```bash
cd backend
npm install
npm run migrate
```

### 4. Seed Database (Optional)

```bash
npm run seed
```

## Database Schema Overview

### Core Tables:
1. **users** - Buyer, Seller, Admin users
2. **shops** - Seller/vendor store information
3. **categories** - Product categories
4. **products** - Product catalog
5. **product_variants** - Product variations (size, color, etc.)
6. **carts** - Shopping cart items
7. **orders** - Order records
8. **order_items** - Items in an order
9. **payments** - Payment records with escrow
10. **commissions** - Commission tracking
11. **reviews** - Customer reviews and ratings
12. **vouchers** - Discount codes
13. **seller_payouts** - Seller payout records

## Database Relationships

```
users (1) --- (n) shops
users (1) --- (n) carts
users (1) --- (n) orders
users (1) --- (n) reviews

shops (1) --- (n) products
shops (1) --- (n) orders
shops (1) --- (n) commissions

categories (1) --- (n) products

products (1) --- (n) product_variants
products (1) --- (n) product_images
products (1) --- (n) reviews

orders (1) --- (n) order_items
orders (1) --- (1) payments
orders (1) --- (1) commissions
```

## Backup & Restore

### Backup Database
```bash
pg_dump clove_db > backup.sql
```

### Restore Database
```bash
psql clove_db < backup.sql
```
