const { Model, DataTypes } = require('sequelize');
const sequelize = require('../config/connection');

class Departments extends Model {}

Departments.init(
  {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    department: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    employees: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    budget: {
      type: DataTypes.INTEGER,
      defaultValue: 0
    },
    manager: {
      type: DataTypes.STRING,
      allowNull: false
    },
  },
  {
    sequelize,
    timestamps: false,
    freezeTableName: true,
    underscored: true,
    modelName: 'department'
  }
);

module.exports = Departments;