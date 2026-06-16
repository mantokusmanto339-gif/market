import express from 'express';

const router = express.Router();

router.get('/:id', (req, res) => {
  res.json({ message: 'Get user by ID - To be implemented' });
});

export default router;
