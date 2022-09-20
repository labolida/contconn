#FROM ubuntu
FROM openjdk:8u332-oracle

COPY ./target/contconn-1.0.jar ./contconn-1.0.jar
COPY ./startup.sh ./startup.sh

EXPOSE 8321

CMD ["java", "-jar" , "contconn-1.0.jar"]

# docker build -t lmldocker/reverse-proxy-spring-boot:1.0 .
# docker run -it --rm -p 8328:8321 lmldocker/reverse-proxy-spring-boot:1.0
# see: test.lml.md
