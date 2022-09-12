const express = require('express');
const createError = require('http-errors');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const helmet = require('helmet');
// import express from 'express';
// import createError from 'http-errors';
// import cookieParser from 'cookie-parser';
// import logger from 'morgan';
// import helmet from 'helmet';

const db = require('./db');

// Database connection
db.connect()
  .then(async () => {
    console.log("DB connected")
  })
  .catch(err => console.log("Erreur: DB non connectée"))



const clientsRouter = require('./routes/clients');

const errorHandler = require('./middleware/errorHandler');

const app = express();

app.use(helmet()); // https://expressjs.com/en/advanced/best-practice-security.html#use-helmet
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

app.use('/clients', clientsRouter);

// catch 404 and forward to error handler
app.use((req, res, next) => {
  next(createError.NotFound());
});

// pass any unhandled errors to the error handler
app.use(errorHandler);

module.exports = app;
// export default app