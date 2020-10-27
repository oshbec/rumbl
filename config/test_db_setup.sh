docker run --name rumbl_test_db \
-e POSTGRES_PASSWORD="9df61cf2-8e76-4f35-aaf6-4ec4fee7e65d" \
-e POSTGRES_USER=rumbl_test \
-p 5441:5432 \
-d postgres:13
