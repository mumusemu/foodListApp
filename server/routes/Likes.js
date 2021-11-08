const express = require("express");
const router = express.Router();
const { Likes } = require("../models");
const { validateToken } = require("../middlewares/AuthMiddleware");

router.post("/", validateToken, async (req, res) => {
  const { foodId } = req.body;
  const UserId = req.user.id;

  const found = await Likes.findOne({
    where: { foodId: foodId, UserId: UserId },
  });
  if (!found) {
    await Likes.create({ foodId: foodId, UserId: UserId });
    res.json({ liked: true });
  } else {
    await Likes.destroy({
      where: { foodId: foodId, UserId: UserId },
    });
    res.json({ liked: false });
  }
});

module.exports = router;
