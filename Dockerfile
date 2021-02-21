FROM golang:alpine AS builder

WORKDIR /go/src/app
COPY app.go .
RUN go env -w GO111MODULE=on
RUN go env -w CGO_ENABLED=1
RUN go build -o /app app.go

FROM scratch

COPY --from=builder /app /app

CMD ["/app"]