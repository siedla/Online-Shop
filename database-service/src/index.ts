import * as pg from 'pg';
import express from 'express';
import morgan from 'morgan';
import cors from 'cors';
import * as jwt from 'jsonwebtoken';
import fs from 'fs';
import { StatusCodes } from 'http-status-codes';

const port = process.env.PORT || 3000;

const client = new pg.Client({
    host: 'tai.db.elephantsql.com',
    port: 5432,
    user: 'oeqenakg',
    password: 'APomSIdivnJc_mlPGqegxU9X-0ofVFPh',
    database: 'oeqenakg',
});

(async () => await client.connect())();
console.log('[database-service] connected to database')

const privateKey = fs.readFileSync('private.key');
const publicKey = fs.readFileSync('public.key');

const appCors = cors({ origin: 'http://localhost:4200' });
const app = express();

app.use(appCors);
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded());

const authorize = async (
    req: express.Request,
    res: express.Response,
    next: express.NextFunction
) => {
    const auth = req.headers.authorization;

    if (auth === undefined) {
        res.sendStatus(StatusCodes.UNAUTHORIZED);
        return;
    }

    const token = auth.split(/ /)[1] || undefined;

    if (token === undefined) {
        res.sendStatus(StatusCodes.BAD_REQUEST);
        return;
    }

    try {
        const user = jwt.verify(token, publicKey, {
            algorithms: ['RS256'],
        }) as any;

        const result = await client.query(
            `SELECT * FROM "Customer" WHERE "customerId" = $1 AND "mail" = $2`,
            [user.id, user.email]
        );

        if (result.rowCount === 0) {
            res.sendStatus(StatusCodes.UNAUTHORIZED);
            return;
        }

        (req as any).user = result.rows[0];
        next();
    } catch (err) {
        res.sendStatus(StatusCodes.UNPROCESSABLE_ENTITY);
        return;
    }
};

app.get('/api/user', authorize, async (req, res) => {
    // @ts-ignore
    const user = req.user;
    delete user.customerId;

    res.statusCode = StatusCodes.OK;
    res.json(user);
});

app.put('/api/user/basket', authorize, async (req, res) => {
    // @ts-ignore
    const user = req.user;

    try {
        await client.query(
            'UPDATE public."Customer" SET "basket" = $1::jsonb WHERE "customerId" = $2;',
            [req.body.basket, user.customerId]
        );

        res.sendStatus(StatusCodes.OK);
    } catch (err) {
        res.sendStatus(StatusCodes.INTERNAL_SERVER_ERROR);
    }
});

app.put('/api/user/observed', authorize, async (req, res) => {
    // @ts-ignore
    const user = req.user;

    try {
        await client.query(
            'UPDATE public."Customer" SET "observed" = $1::jsonb WHERE "customerId" = $2',
            [req.body.observed, user.customerId]
        );

        res.sendStatus(StatusCodes.OK);
    } catch (err) {
        res.sendStatus(StatusCodes.INTERNAL_SERVER_ERROR);
    }
});

app.put('/api/user/buy/basket', authorize, async (req, res) => {
    // @ts-ignore
    const user = req.user;

    try {
        await client.query('Select public."buyitemsfrombasket"($1);', [
            user.customerId,
        ]);
        res.sendStatus(StatusCodes.OK);
    } catch (err) {
        res.sendStatus(StatusCodes.INTERNAL_SERVER_ERROR);
    }
});

app.get('/api/user/observed', authorize, async (req, res) => {
    // @ts-ignore
    const user = req.user;

    try {
        const result = await client.query(
            'SELECT public."getUserObservedProducts"($1);',
            [user.customerId]
        );

        if (result.rowCount === 0) {
            res.sendStatus(StatusCodes.NOT_FOUND);
            return;
        }
        res.json(result.rows);
    } catch (err) {
        res.sendStatus(StatusCodes.INTERNAL_SERVER_ERROR);
    }
});

app.get('/api/user/basket', authorize, async (req, res) => {
    // @ts-ignore
    const user = req.user;

    try {
        const result = await client.query(
            'SELECT public."getUserBasketProducts"($1);',
            [user.customerId]
        );
    
        
        if (result.rowCount === 0) {
            res.sendStatus(StatusCodes.NOT_FOUND);
            return;
        }

        res.json(result.rows);
    } catch (err) {
        res.sendStatus(StatusCodes.INTERNAL_SERVER_ERROR);
    }
});

app.get('/api/user/history', authorize, async (req, res) => {
    // @ts-ignore
    const user = req.user;

    try {
        const result = await client.query(
            'SELECT * FROM customerhistory($1);',
            [user.customerId]
        );

        res.json(result.rows);
    } catch (err) {
        res.sendStatus(StatusCodes.INTERNAL_SERVER_ERROR);
    }
});

app.get('/api/product', async (req, res) => {
    const limit = parseInt(req.query.limit as string) || 50;
    const page = parseInt(req.query.page as string) || 0;
    
    const categories = req.query.categories === undefined 
        ? null
        : (req.query.categories as string).split(',');

    const categoriesQuery = categories === null
        ? ''
        : 'AND c."name" = ANY ($3)';

    if (Number.isNaN(limit) || Number.isNaN(page)) {
        res.sendStatus(StatusCodes.BAD_REQUEST);
        return;
    }

    try {
        const result = await client.query(
            `SELECT p."productId", p."name" AS "name", p."price", p."thumbnails", p."description", 
                p."photos", p."categoryID", p."quantity", c."name" AS "categoryName"
                FROM "Product" AS p 
                JOIN "Category" AS c ON c."categoryId" = p."categoryID" 
                WHERE p."quantity" > 0 ${categoriesQuery}
                LIMIT $1 OFFSET $2;`,
            [limit, limit * page, categories].filter(x => x !== null)
        );
    
        if (result.rowCount === 0) {
            res.sendStatus(StatusCodes.NOT_FOUND);
            return;
        }

        res.status(StatusCodes.OK).json(result.rows);
    } catch (err) {
        res.sendStatus(StatusCodes.INTERNAL_SERVER_ERROR);
    }
});

app.get('/api/product/:id', async (req, res) => {
    const id = req.params.id;

    // new mod: 2117404477
    // new mul: 5852724
    // new div: 102421293
    // id -> mmi -> Base64 -> safeurl
    // const productId = Number.parseInt(
    //     Buffer.from(id, 'base64url').toString('ascii')
    // );

    // if (Number.isNaN(productId)) {
    //     res.sendStatus(StatusCodes.NOT_ACCEPTABLE);
    //     return;
    // }

    try {
        const result = await client.query(
            'SELECT * FROM "Product" WHERE "productId" = $1', // mmiDecode($1::INT8);',
            [parseInt(id)]
        );

        if (result.rowCount === 0) {
            res.sendStatus(StatusCodes.NOT_FOUND);
            return;
        }

        res.statusCode = StatusCodes.OK;
        res.json(result.rows[0]);
    } catch (err) {
        res.sendStatus(StatusCodes.INTERNAL_SERVER_ERROR);
    }
});

app.get('/api/category', async (req, res) => {
    try {
        const result = await client.query('SELECT * FROM "Category";');

        res.json(result.rows);
    } catch (err) {
        res.sendStatus(StatusCodes.INTERNAL_SERVER_ERROR);
    }
});

app.get('/api/category/:id', async (req, res) => {
    try {
        const result = await client.query(
            'SELECT name FROM "Category" WHERE "categoryId" = $1;',
            [req.params.id]
        );

        if (result.rowCount === 0) {
            res.sendStatus(StatusCodes.NOT_FOUND);
            return;
        }

        res.status(StatusCodes.OK).json(result.rows);
    } catch (err) {
        res.sendStatus(StatusCodes.INTERNAL_SERVER_ERROR);
    }
});

app.post('/api/product', async (req, res) => {
    try {
        const result = await client.query(
            'SELECT "categoryId" FROM "Category" WHERE "name" = $1;',
            [req.body.category]
        );

        if (result.rowCount === 0) {
            res.sendStatus(StatusCodes.NOT_FOUND);
            return;
        }

        await client.query(
            `
            INSERT INTO public."Product" ("categoryID", "name", "price", "quantity", "thumbnails", "description")
            VALUES ($1, $2, $3, $4, $5, $6);`,
            [
                result.rows[0].categoryId,
                req.body.product.name,
                req.body.product.price,
                req.body.product.quantity,
                req.body.product.thumbnails,
                req.body.product.description,
            ]
        );

        res.sendStatus(StatusCodes.CREATED);
    } catch (err) {
        res.sendStatus(StatusCodes.INTERNAL_SERVER_ERROR);
    }
});

app.post('/api/category', async (req, res) => {
    try {
        await client.query('CALL public."insertcategory"($1);', [
            req.body.category,
        ]);

        res.sendStatus(StatusCodes.CREATED);
    } catch (err) {
        res.sendStatus(StatusCodes.INTERNAL_SERVER_ERROR);
    }
});

app.put('/api/product/:id', async (req, res) => {
    try {
        const result = await client.query(
            'SELECT "categoryId" FROM "Category" WHERE "name" = $1;',
            [req.body.category]
        );

        if (result.rowCount === 0) {
            res.sendStatus(StatusCodes.NOT_FOUND);
            return;
        }

        const values = [
            result.rows[0].categoryId,
            req.body.product.name,
            req.body.product.price,
            req.body.product.quantity,
            req.body.product.thumbnails,
            req.body.product.description,
            req.params.id,
        ];

        await client.query(
            `
            UPDATE public."Product"
                SET "categoryID" = $1, "name" = $2, "price" = $3, "quantity" = $4, "thumbnails" = $5, "description" = $6
            WHERE "productId" = $7`,
            values
        );

        res.sendStatus(StatusCodes.OK);
    } catch (err) {
        res.sendStatus(StatusCodes.INTERNAL_SERVER_ERROR);
    }
});

app.get('/api/category/:id', async (req, res) => {
    try {
        const result = await client.query(
            'SELECT name FROM "Category" WHERE "categoryId" = $1;',
            [req.params.id]
        );

        if (result.rowCount === 0) {
            res.sendStatus(StatusCodes.NOT_FOUND);
            return;
        }

        res.status(StatusCodes.OK).json(result.rows);
    } catch (err) {
        res.sendStatus(StatusCodes.INTERNAL_SERVER_ERROR);
    }
});

app.post('/api/authorize', async (req, res) => {
    const email = req.body.email;
    const password = req.body.password;

    if (!email || !password) {
        res.sendStatus(StatusCodes.BAD_REQUEST);
        return;
    }

    try {
        const result = await client.query(
            'SELECT * FROM public."Customer" WHERE mail = $1 AND "customerPassword" = md5($2)',
            [email, password]
        );

        if (result.rowCount === 0) {
            res.sendStatus(StatusCodes.NOT_ACCEPTABLE);
            return;
        }

        const user = result.rows.shift();
        
        const token = jwt.sign(
            { id: user.customerId, email: user.mail },
            privateKey,
            { algorithm: 'RS256' }
        );

        delete user.customerId;
        delete user.customerPassword;

        res.statusCode = StatusCodes.OK;
        res.json({ token: token, user: user });
    } catch (err) {
        res.sendStatus(StatusCodes.INTERNAL_SERVER_ERROR);
    }
});

const validateEmail = (email: string) => {
    const re =
        /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
};

app.post('/api/register', async (req, res) => {
    const { email, customerPassword, birthDate, username, fullName } = req.body;

    if (
        email === undefined ||
        customerPassword === undefined ||
        birthDate === undefined ||
        username === undefined ||
        fullName === undefined
    ) {
        res.sendStatus(StatusCodes.BAD_REQUEST);
        return;
    }

    if (!validateEmail(email)) {
        res.sendStatus(StatusCodes.BAD_REQUEST);
        return;
    }

    try {
        const exists = await client.query(
            'SELECT COUNT(*) AS "count" FROM "Customer" WHERE mail = $1 OR username = $2',
            [email, username]
        );

        if (parseInt(exists.rows[0].count) !== 0) {
            res.sendStatus(StatusCodes.NOT_ACCEPTABLE);
            return;
        }
    } catch (err) {
        res.sendStatus(StatusCodes.INTERNAL_SERVER_ERROR);
        return;
    }

    const values = [customerPassword, username, email, fullName, birthDate];

    try {
        const userInserted = await client.query(
            `INSERT INTO "Customer" 
                ("customerPassword", "username", "mail", "fullName", "birthDate", "basket", "observed", "isEmployee")
            VALUES 
                (md5($1), $2, $3, $4, $5, '[]'::jsonb, '[]'::jsonb, FALSE)
            RETURNING *;`,
            values
        );

        if (userInserted.rowCount === 0) {
            res.sendStatus(StatusCodes.NOT_ACCEPTABLE);
            return;
        }

        const user = userInserted.rows[0];

        const token = jwt.sign(
            { id: user.customerId, email: user.mail },
            privateKey,
            { algorithm: 'RS256' }
        );

        delete user.customerId;
        
        res.status(StatusCodes.CREATED).json({ token: token, user: user });
    } catch (err) {
        res.sendStatus(StatusCodes.INTERNAL_SERVER_ERROR);
    }
});

app.delete('/api/product/:id', authorize, async (req, res) => {
    // @ts-ignore
    const user = req.user;

    if (!user.isEmployee) {
        res.sendStatus(StatusCodes.FORBIDDEN);
        return;
    }

    try {
        const result = await client.query('DELETE FROM "Product" WHERE "productId" = $1;', [
            req.params.id,
        ]);

        if (result.rowCount === 0) {
            res.sendStatus(StatusCodes.NOT_FOUND);
            return;
        }

        res.sendStatus(StatusCodes.OK);
    } catch (err) {
        res.sendStatus(StatusCodes.INTERNAL_SERVER_ERROR);
    }
});

app.listen(port, () => {
    console.log(`[database-service] listening on port: ${port}`);
});
