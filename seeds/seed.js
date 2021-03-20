const sequelize = require('../config/connection');
const { Reader, Book, LibraryCard } = require('../models');

const employeeSeedData = require('./employeeseed.json');
const managerSeedData = require('./managerseed.json');
const departmentSeedData = require('./departmentseed.json');

const seedDatabase = async () => {
  await sequelize.sync({ force: true });

  const employees = await Employees.bulkCreate(employeeSeedData, {
    individualHooks: true,
    returning: true,
  });
  const departments = await Departments.bulkCreate(dapartmentSeedData, {
    individualHooks: true,
    returning: true,
  });
  const managers = await Managers.bulkCreate(managerSeedData, {
    individualHooks: true,
    returning: true,
  });


  process.exit(0);
};

seedDatabase();