#!/bin/bash
SPEEDMENT_VERSION=3.2.2-SNAPSHOT
JDBC_VERSION=5.1.48
MODULEPATH=$(find ~/.m2/repository/com/speedment/runtime -name "*.jar" | grep $SPEEDMENT_VERSION.jar | xargs echo | tr ' ' ':')
MODULEPATH=$MODULEPATH:$(find ~/.m2/repository/com/speedment/common -name "*.jar" | grep $SPEEDMENT_VERSION.jar | xargs echo | tr ' ' ':')
MODULEPATH=$MODULEPATH:$(find .. -name "*.jar" | xargs echo | tr ' ' ':')
#MODULEPATH=$MODULEPATH:~/.m2/repository/mysql/mysql-connector-java/$JDBC_VERSION/mysql-connector-java-$JDBC_VERSION.jar
#echo $MODULEPATH

$JAVA_HOME/bin/jlink --launcher customjrelauncher=microservice.jlink/com.speedment.example.microservices.jlink.Main --module-path "$JAVA_HOME\jmods:$MODULEPATH" --add-modules microservice.jlink,java.management,java.naming,java.rmi,java.transaction.xa --output customjre

# ./java --class-path ~/.m2/repository/mysql/mysql-connector-java/5.1.48/mysql-connector-java-5.1.48.jar -m microservice.jlink/com.speedment.example.microservices.jlink.Main