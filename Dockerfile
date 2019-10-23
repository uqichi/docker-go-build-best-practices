FROM golang:1.13.2-alpine as builder

WORKDIR /go/src/app
ENV GO111MODULE=on
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /go/bin/app -ldflags="-s -w" .

FROM alpine:latest

COPY --from=builder /go/bin/app /app
EXPOSE 5555
ENTRYPOINT ["/app"]