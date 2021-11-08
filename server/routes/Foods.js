const express = require("express");
const router = express.Router();
const { Foods, Likes } = require("../models");

const { validateToken } = require("../middlewares/AuthMiddleware");

router.get("/", validateToken, async (req, res) => {
  const listOfFoods = await Foods.findAndCountAll({ include: [Likes], order:[['updatedAt', 'DESC']] }); // offset:0, limit:5,
  const likedFoods = await Likes.findAll({ where: { UserId: req.user.id} });
  res.json({listOfFoods: listOfFoods, likedFoods: likedFoods });
});

router.get("/byId/:id", async (req, res) => {
  const id = req.params.id;
  const food = await Foods.findByPk(id);
  res.json(food);
});

router.get("/byuserId/:id", async (req, res) => {
  const id = req.params.id;
  const listOfFoods = await Foods.findAll({
    where: { UserId: id },
    include: [Likes],
  });
  res.json(listOfFoods);
});

router.post("/", validateToken, async (req, res) => {
  const food = req.body;
  food.username = req.user.username;
  food.UserId = req.user.id;
  await Foods.create(food);
  res.json(food);
});

router.put("/title", validateToken, async (req, res) => {
  const { newTitle, id } = req.body;
  await Foods.update({ title: newTitle }, { where: { id: id } });
  res.json(newTitle);
});

router.put("/foodText", validateToken, async (req, res) => {
  const { newText, id } = req.body;
  await Foods.update({ foodText: newText }, { where: { id: id } });
  res.json(newText);
});

router.delete("/:foodId", validateToken, async (req, res) => {
  const foodId = req.params.foodId;
  await Foods.destroy({
    where: {
      id: foodId,
    },
  });

  res.json("DELETED SUCCESSFULLY");
});

module.exports = router;
