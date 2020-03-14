require('dotenv/config');
const express = require('express');

const db = require('./database');
const ClientError = require('./client-error');
const staticMiddleware = require('./static-middleware');
const sessionMiddleware = require('./session-middleware');

const app = express();

app.use(staticMiddleware);
app.use(sessionMiddleware);

app.use(express.json());

app.get('/api/products', (req, res, next) => {
  const sql = `
    select "productId",
           "name",
           "price",
           "image",
           "shortDescription"
      from "products";
  `;
  db.query(sql)
    .then(result => res.json(result.rows))
    .catch(err => next(err));
});

app.get('/api/products/:productId', (req, res, next) => {
  const { productId } = req.params;
  if (!parseInt(productId, 10)) {
    return res.status(400).json({
      error: '"productId" must be a positive integer'
    });
  }
  const sql = `
    select "productId",
           "name",
           "price",
           "image",
           "shortDescription",
           "longDescription"
      from "products"
      where "productId" = $1;
  `;
  const params = [productId];
  db.query(sql, params)
    .then(result => {
      if (!result.rows[0]) {
        res.status(404).json({
          error: `cannot find product with"productId ${productId}`
        });
      } else res.json(result.rows[0]);
    })
    .catch(err => next(err));
});

app.get('/api/cart', (req, res, next) => {
  const sql = `
    select "cartItemId",
           "cartId",
           "productId",
           "price"
      from "cartItems";
  `;
  const sqlAlt = `
    select "c"."cartItemId",
           "c"."price",
           "p"."productId",
           "p"."image",
           "p"."name",
           "p"."shortDescription"
      from "cartItems" as "c"
      join "products" as "p" using("productId")
     where "c"."cartId" = $1
    `;
  if (!req.session.cartId) {
    db.query(sql)
      .then(result => res.json([]))
      .catch(err => next(err));
  } else {
    db.query(sqlAlt, [req.session.cartId])
      .then(result => res.json(result.rows))
      .catch(err => next(err));
  }
});

app.post('/api/cart/:productId', (req, res, next) => {
  const { productId } = req.params;
  if (productId <= 0) {
    res.status(400).json({
      error: 'productId must be a positive integer'
    });
  } else {
    const getPrice = `
      select "price"
        from "products"
       where "productId" = $1
      `;
    db.query(getPrice, [productId])
      .then(priceResult => {
        if (priceResult.rowCount === 0) throw new ClientError('Not found', 400);
        if ('cartId' in req.session) {
          return ({
            cartId: req.session.cartId,
            price: priceResult.rows[0].price
          });
        }
        const insertSql = `
          insert into "carts" ("cartId", "createdAt")
          values (default, default)
          returning "cartId"
          `;
        return db.query(insertSql)
          .then(cartInsertResult => {
            return Object.assign(cartInsertResult.rows[0], priceResult.rows[0]);
          });
      })
      .then(cartAndPrice => {
        const { productId } = req.params;
        const insertSql2 = `
          insert into "cartItems" ("cartId", "productId", "price")
          values ($1, $2, $3)
          returning "cartItemId"
          `;
        req.session.cartId = cartAndPrice.cartId;
        req.session.price = cartAndPrice.price;
        req.session.productId = productId;
        return db.query(insertSql2, [req.session.cartId, req.session.productId, req.session.price])
          .then(getMatch => {
            return getMatch.rows[0].cartItemId;
          });
      })
      .then(cartItemId => {
        const selectSql = `
          select "c"."cartItemId",
                 "c"."price",
                 "p"."productId",
                 "p"."image",
                 "p"."name",
                 "p"."shortDescription"
            from "cartItems" as "c"
            join "products" as "p" using ("productId")
           where "c"."cartItemId" = $1
           `;
        return db.query(selectSql, [cartItemId])
          .then(shoppingCart => {
            res.status(201).json(shoppingCart.rows[0]);
          });
      })
      .catch(err => next(err));
  }
});

app.use('/api', (req, res, next) => {
  next(new ClientError(`cannot ${req.method} ${req.originalUrl}`, 404));
});

app.use((err, req, res, next) => {
  if (err instanceof ClientError) {
    res.status(err.status).json({ error: err.message });
  } else {
    console.error(err);
    res.status(500).json({
      error: 'an unexpected error occurred'
    });
  }
});

app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log('Listening on port', process.env.PORT);
});
