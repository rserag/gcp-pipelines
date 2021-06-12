FROM golang:1.15 as builder
WORKDIR /go/src/github.com/gcp-pipelines
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -v -o app

FROM alpine
RUN apk update && apk add --no-cache ca-certificates
COPY --from=builder /go/src/github.com/gcp-pipelines/app /app
CMD ["/app"]