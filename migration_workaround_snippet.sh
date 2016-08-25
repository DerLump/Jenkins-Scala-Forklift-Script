#!/bin/bash

handledMigrations=$(find /opt/app/deploy/scala-forklift-project-1.0/db/migrations/src/main/scala/migrations -type l | wc -l)
unhandledMigrations=$(find /opt/app/deploy/scala-forklift-project-1.0/db/migrations/src_migrations/main/scala -type f | wc -l)


while [ "$handledMigrations" -lt "$unhandledMigrations" ]
do
        cd /opt/app/deploy/scala-forklift-project-1.0/db
        /opt/sbt/bin/sbt 'mg update' 'mg apply';
        handledMigrations=$(find /opt/app/deploy/scala-forklift-project-1.0/db/migrations/src/main/scala/migrations -type l | wc -l)
        unhandledMigrations=$(find /opt/app/deploy/scala-forklift-project-1.0/db/migrations/src_migrations/main/scala -type f | wc -l)
done
