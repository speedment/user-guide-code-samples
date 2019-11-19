jdeps --multi-release 9 \
--module-path \
~/.m2/repository/com/speedment/runtime/runtime-application/3.2.2-SNAPSHOT/runtime-application-3.2.2-SNAPSHOT.jar:\
~/.m2/repository/com/speedment/runtime/connector-mysql/3.2.2-SNAPSHOT/connector-mysql-3.2.2-SNAPSHOT.jar:\
target/microservice-jlink-3.2.2-SNAPSHOT.jar \
-m microservice.jlink \
--list-deps

