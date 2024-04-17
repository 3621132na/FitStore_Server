const Sequelize = require('sequelize');
const sequelize = new Sequelize('FitStoreDB', 'user', '123$', {
  host: 'localhost',
  port:1433,
  dialect: 'mssql',
  logging: false,
  dialectOptions: {
    options: {
      trustServerCertificate: true
    }
  }
});
module.exports = sequelize