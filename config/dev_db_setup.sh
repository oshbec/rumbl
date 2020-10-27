docker run --name rumbl \
-e POSTGRES_PASSWORD="b1aac842-f913-4339-8c08-5ab9e6f8e89c" \
-e POSTGRES_USER=rumbl \
-e POSTGRES_DB=rumbl_dev \
-p 5440:5432 \
-d postgres:13
