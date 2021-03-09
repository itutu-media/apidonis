# Tested
```bash
1. nodejs v14.15.4
2. npm v6.14.10
3. adonis v4.1.0
4. mariadb v10.4.11
```

# Adonis API application

This is the boilerplate for creating an API server in AdonisJs, it comes pre-configured with.

1. Bodyparser
2. Authentication
3. CORS
4. Lucid ORM
5. Migrations and seeds

## Setup

Use the adonis command to install the blueprint

```bash
adonis new yardstick --api-only
```

or manually clone the repo and then run `npm install`.


### Migrations

Run the following command to run startup migrations.

```js
adonis migration:run
```


### Seed

Run the following command to insert dummy.

```js
adonis seed
```
