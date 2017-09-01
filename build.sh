 docker build --tag $1 \
    --build-arg KEY=6WVFVETYX6O6510PVEFR \
    --build-arg SECRET=qIODO88fggVozW/uvFJ5Us4BGoLBXMHwi5yawaNC \
    --build-arg MINIO_PATH=songs \
    --build-arg SERVER_URL=http://172.17.0.1:9000 \
    .
