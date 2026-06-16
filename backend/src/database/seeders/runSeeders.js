import { query } from '../connection.js';
import { v4 as uuidv4 } from 'uuid';
import bcrypt from 'bcryptjs';

const runSeeders = async () => {
  try {
    console.log('🌱 Seeding database...');
    
    // Create admin user
    const adminId = uuidv4();
    const adminPassword = await bcrypt.hash('admin123', 10);
    
    await query(
      `INSERT INTO users (id, email, phone, password_hash, first_name, last_name, role, status, email_verified, phone_verified)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)`,
      [adminId, 'admin@clove.app', '081234567890', adminPassword, 'Admin', 'Clove', 'admin', 'active', true, true]
    );
    
    // Create sample categories
    const categories = [
      { name: 'Electronics', slug: 'electronics' },
      { name: 'Fashion', slug: 'fashion' },
      { name: 'Home & Living', slug: 'home-living' },
      { name: 'Beauty & Health', slug: 'beauty-health' },
      { name: 'Sports & Outdoors', slug: 'sports-outdoors' }
    ];
    
    for (const cat of categories) {
      await query(
        `INSERT INTO categories (name, slug, is_active) VALUES ($1, $2, $3)`,
        [cat.name, cat.slug, true]
      );
    }
    
    // Create sample seller
    const sellerId = uuidv4();
    const shopId = uuidv4();
    const sellerPassword = await bcrypt.hash('seller123', 10);
    
    await query(
      `INSERT INTO users (id, email, phone, password_hash, first_name, last_name, role, status, email_verified, phone_verified)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)`,
      [sellerId, 'seller@clove.app', '082345678901', sellerPassword, 'Sample', 'Seller', 'seller', 'active', true, true]
    );
    
    await query(
      `INSERT INTO shops (id, user_id, shop_name, shop_slug, shop_description, status, verification_status, verified_at, commission_percentage)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)`,
      [shopId, sellerId, 'Sample Shop', 'sample-shop', 'A sample online shop', 'active', 'verified', new Date(), 10]
    );
    
    console.log('✅ Database seeded successfully');
    console.log('\n📝 Default Credentials:');
    console.log('Admin Email: admin@clove.app / Password: admin123');
    console.log('Seller Email: seller@clove.app / Password: seller123');
  } catch (error) {
    console.error('❌ Seeding failed:', error);
    process.exit(1);
  }
};

runSeeders();
