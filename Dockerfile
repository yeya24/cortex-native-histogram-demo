FROM alpine
COPY ./app/main /app/main
WORKDIR /app
ENTRYPOINT ["./main"]
