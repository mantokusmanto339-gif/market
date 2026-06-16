import express from 'express';

const router = express.Router();

router.post('/', (req, res) => {
  res.json({ message: 'Create order - To be implemented' });
});

export default router;
