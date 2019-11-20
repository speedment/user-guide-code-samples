#!/bin/bash
SPEEDMENT_VERSION=3.2.2-SNAPSHOT
JDBC_VERSION=8.0.18
OUTPUT=customjre
echo "Building $OUTPUT..."
MODULEPATH=$(find ~/.m2/repository/com/speedment/runtime -name "*.jar" \
| grep $SPEEDMENT_VERSION.jar | xargs echo | tr ' ' ':')
MODULEPATH=$MODULEPATH:$(find ~/.m2/repository/com/speedment/common -name "*.jar" \
| grep $SPEEDMENT_VERSION.jar | xargs echo | tr ' ' ':')
MODULEPATH=$MODULEPATH:$(find . -name "*.jar" | xargs echo | tr ' ' ':')

$JAVA_HOME/bin/jlink \
--no-header-files \
--no-man-pages \
--compress=2 \
--strip-debug \
--module-path "$JAVA_HOME\jmods:$MODULEPATH" \
--add-modules microservice.jlink,java.management,java.naming,java.rmi,java.transaction.xa \
--output $OUTPUT
echo "Done! Start you application with:"
echo "$OUTPUT/bin/java --class-path ~/.m2/repository/mysql/mysql-connector-java/$JDBC_VERSION/mysql-connector-java-$JDBC_VERSION.jar -m microservice.jlink/com.speedment.example.microservices.jlink.Main"