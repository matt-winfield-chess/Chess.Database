# Chess.Database

This database project uses Flyway Community Edition to handle database migrations.

## Installation
Install Flyway 7.0.0 at https://flywaydb.org/download/#downloads. Place all the files in the flyway-7.0.0 folder, but do **not** replace the SQL folder (which contains the migrations for this project).

## Deployment
Configure Flyway to target the database in the `/conf/flyway.conf` file, for example
```
flyway.url=jdbc:h2:file:./foobardb
flyway.user=SA
flyway.password=
```
The url should be a JDBC url.

Then deploy using `flyway migrate`

## Flyway documentation

You can find getting started guides and reference documentation at https://flywaydb.org


## Flyway License
Copyright (C) 2010-2020 Boxfuse GmbH

Flyway Community Edition    : https://flywaydb.org/licenses/flyway-community

Flyway is a registered trademark of Boxfuse GmbH.