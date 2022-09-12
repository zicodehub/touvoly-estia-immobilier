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
const facturesRouter = require('./routes/facture');
const logementsRouter = require('./routes/logement');
const paiementsRouter = require('./routes/paiement');
const proprietairesRouter = require('./routes/proprietaire');
const reservationsRouter = require('./routes/reservation');
const visitesRouter = require('./routes/visite');

const errorHandler = require('./middleware/errorHandler');

const app = express();

app.use(helmet()); // https://expressjs.com/en/advanced/best-practice-security.html#use-helmet
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

app.use('/clients', clientsRouter);
app.use('/factures', facturesRouter);
app.use('/logements', logementsRouter);
app.use('/paiements', paiementsRouter);
app.use('/proprietaires', proprietairesRouter);
app.use('/reservations', reservationsRouter);
app.use('/visites', visitesRouter);

// catch 404 and forward to error handler
app.use((req, res, next) => {
  next(createError.NotFound());
});

// pass any unhandled errors to the error handler
app.use(errorHandler);

module.exports = app;
// export default app