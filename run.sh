docker run --rm \
           -v $(pwd):/app \
           liumiaocn/gcc:alpine9.2.0 \
           /bin/sh -c \
           "gcc -o /app/demo /app/main.c && /app/demo && rm -f /app/demo"
