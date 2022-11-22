FROM adoptopenjdk:16.0.1_9-jdk-hotspot-focal

EXPOSE 8080
ADD target/springboot-k8s-ingress-rest.jar springboot-k8s-ingress-rest.jar
ENTRYPOINT ["java", "-jar", "/springboot-k8s-ingress-rest.jar"]