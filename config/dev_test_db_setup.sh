docker run --name rumbl_dev_test_db \
-e POSTGRES_PASSWORD="b1aac842-f913-4339-8c08-5ab9e6f8e89c" \
-e POSTGRES_USER=rumbl \
-p 5440:5432 \
-d postgres:13
