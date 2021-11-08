module.exports = (sequelize, DataTypes) => {
  const Foods = sequelize.define("Foods", {
    title: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    foodText: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    username: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  });

  Foods.associate = (models) => {
    Foods.hasMany(models.Likes, {
      onDelete: "cascade",
    });
  };
  return Foods;
};
