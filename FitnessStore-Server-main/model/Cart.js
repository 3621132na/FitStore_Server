const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('Cart', {
    product_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'Product',
        key: 'id'
      }
    },
    account_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    number: {
      type: DataTypes.INTEGER,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'Cart',
    schema: 'dbo',
    timestamps: false,
    indexes: [
      {
        name: "PK_Cart",
        unique: true,
        fields: [
          { name: "product_id" },
          { name: "account_id" },
        ]
      },
    ]
  });
};
