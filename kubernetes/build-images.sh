#!/bin/bash

cd ..

mvn package -DskipTests -Djar

cd kubernetes

echo "copy auth-service file"
cp ../auth-service/target/eshop_k8s_auth_service.jar auth-service/
cp ../auth-service/src/main/resources/application.yml auth-service/

docker build -t gcr.io/app/eshop-auth-image auth-service/

echo "copy product-service file"
cp ../product-service/target/eshop_k8s_product-service.jar product-service/
cp ../product-service/src/main/resources/application.yml product-service/

docker build -t gcr.io/app/eshop-product-image product-service/

echo "copy cart-service file"
cp ../cart-service/target/eshop_k8s_cart-service.jar  cart-service/
cp ../cart-service/src/main/resources/application.yml cart-service/

docker build -t gcr.io/app/eshop-cart-image cart-service/

echo "copy cart-service file"
cp ../eshop-web/target/eshop_k8s_eshop_web.jar  eshop-web/
cp ../eshop-web/src/main/resources/application.yml eshop-web/

docker build -t gcr.io/app/eshop-web eshop-web/



