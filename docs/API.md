# 📡 Clove Backend - API Documentation

## Base URL

```
http://localhost:3000/api/v1
```

## Authentication

Semua endpoint (kecuali `/auth/register` dan `/auth/login`) memerlukan JWT token di header:

```
Authorization: Bearer <token>
```

## Response Format

### Success Response
```json
{
  "success": true,
  "data": { /* response data */ },
  "message": "Operation successful"
}
```

### Error Response
```json
{
  "success": false,
  "message": "Error description",
  "errors": [] // optional validation errors
}
```

---

## 🔐 Authentication Endpoints

### Register User
```http
POST /auth/register
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123",
  "first_name": "John",
  "last_name": "Doe",
  "role": "buyer" // buyer, seller, admin
}

Response: 201
{
  "success": true,
  "data": {
    "id": "uuid",
    "email": "user@example.com",
    "token": "jwt_token"
  }
}
```

### Login User
```http
POST /auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123"
}

Response: 200
{
  "success": true,
  "data": {
    "user": { /* user data */ },
    "token": "jwt_token",
    "refreshToken": "refresh_token"
  }
}
```

---

## 👥 User Endpoints

### Get User Profile
```http
GET /users/:id
Authorization: Bearer <token>

Response: 200
{
  "success": true,
  "data": {
    "id": "uuid",
    "email": "user@example.com",
    "first_name": "John",
    "last_name": "Doe",
    "role": "buyer",
    "created_at": "2024-01-15T10:30:00Z"
  }
}
```

### Update User Profile
```http
PUT /users/:id
Authorization: Bearer <token>
Content-Type: application/json

{
  "first_name": "Jane",
  "last_name": "Smith",
  "phone": "081234567890",
  "avatar_url": "https://example.com/avatar.jpg"
}

Response: 200
```

---

## 📦 Product Endpoints

### List All Products
```http
GET /products?page=1&limit=20&category=electronics&sort=newest

Query Parameters:
  - page: number (default: 1)
  - limit: number (default: 20)
  - category: string (filter by category slug)
  - search: string (search by name)
  - sort: string (newest, popular, cheapest, expensive)
  - min_price: number
  - max_price: number

Response: 200
{
  "success": true,
  "data": [
    {
      "id": "uuid",
      "name": "Product Name",
      "price": 99999,
      "discount_percentage": 10,
      "final_price": 89999,
      "rating": 4.5,
      "total_sold": 150,
      "shop": { /* shop info */ }
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 500
  }
}
```

### Get Product Details
```http
GET /products/:id

Response: 200
{
  "success": true,
  "data": {
    "id": "uuid",
    "name": "Product Name",
    "description": "Product description",
    "price": 99999,
    "stock": 50,
    "images": [],
    "variants": [],
    "reviews": [],
    "shop": { /* shop info */ }
  }
}
```

### Create Product (Seller Only)
```http
POST /products
Authorization: Bearer <seller_token>
Content-Type: application/json

{
  "name": "New Product",
  "description": "Product description",
  "category_id": "uuid",
  "price": 99999,
  "discount_percentage": 10,
  "stock": 100,
  "sku": "SKU123",
  "weight": 1.5,
  "images": [
    { "url": "https://example.com/image1.jpg", "is_primary": true }
  ],
  "variants": [
    {
      "variant_name": "Color",
      "options": ["Red", "Blue", "Green"]
    }
  ]
}

Response: 201
{
  "success": true,
  "data": { /* created product */ }
}
```

---

## 🛒 Order Endpoints

### Create Order
```http
POST /orders
Authorization: Bearer <buyer_token>
Content-Type: application/json

{
  "items": [
    {
      "product_id": "uuid",
      "variant_id": "uuid", // optional
      "quantity": 2
    }
  ],
  "shipping_address": "123 Main St, City, Country",
  "payment_method": "credit_card", // credit_card, bank_transfer, e_wallet
  "notes": "Please wrap as gift"
}

Response: 201
{
  "success": true,
  "data": {
    "order_id": "uuid",
    "order_number": "ORD-20240115-001",
    "total_amount": 199998,
    "payment_status": "pending",
    "payment_url": "https://payment.gateway.com/..." // if applicable
  }
}
```

### Get User Orders
```http
GET /orders/user/:userId?status=pending&page=1
Authorization: Bearer <token>

Response: 200
{
  "success": true,
  "data": [ /* orders array */ ],
  "pagination": { /* pagination info */ }
}
```

### Get Order Details
```http
GET /orders/:id
Authorization: Bearer <token>

Response: 200
{
  "success": true,
  "data": {
    "order_id": "uuid",
    "order_number": "ORD-20240115-001",
    "items": [],
    "total_amount": 199998,
    "payment_status": "completed",
    "order_status": "shipped",
    "tracking_number": "ABC123456",
    "created_at": "2024-01-15T10:30:00Z"
  }
}
```

### Update Order Status (Seller Only)
```http
PUT /orders/:id/status
Authorization: Bearer <seller_token>
Content-Type: application/json

{
  "status": "shipped", // pending, processing, shipped, delivered, cancelled
  "tracking_number": "ABC123456",
  "courier": "JNE",
  "notes": "Order has been shipped"
}

Response: 200
```

---

## 🔄 Error Codes

| Code | Meaning |
|------|----------|
| 200 | OK |
| 201 | Created |
| 400 | Bad Request |
| 401 | Unauthorized |
| 403 | Forbidden |
| 404 | Not Found |
| 409 | Conflict |
| 500 | Internal Server Error |

## 📝 Rate Limiting

- 100 requests per minute per IP
- Rate limit info in response headers:
  ```
  X-RateLimit-Limit: 100
  X-RateLimit-Remaining: 95
  X-RateLimit-Reset: 1234567890
  ```

## 🔒 Security

- All passwords are hashed with bcryptjs
- JWT tokens expire after 7 days
- Refresh tokens available for token renewal
- HTTPS required in production
- CORS enabled for frontend origins
