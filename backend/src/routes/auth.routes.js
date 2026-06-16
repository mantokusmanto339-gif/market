import express from 'express';

const router = express.Router();

router.post('/register', (req, res) => {
  res.json({ message: 'Register endpoint - To be implemented' });
});

router.post('/login', (req, res) => {
  res.json({ message: 'Login endpoint - To be implemented' });
});

export default router;
