FROM golang:1.20.2-alpine3.17 as builder
WORKDIR /app
COPY hello.go /app
RUN go mod init anderson-pids.com/hello && \
    go build
FROM scratch
WORKDIR /app
COPY --from=builder /app ./
CMD [ "./hello" ]