FROM golang:1.22.3-alpine3.20 as builder

WORKDIR /app

COPY gator.go go.mod go.sum ./
RUN go build -o main ./

####################
FROM alpine:3.20.0

WORKDIR /app

COPY --from=builder /app/main .

ENTRYPOINT ["/app/main"]
