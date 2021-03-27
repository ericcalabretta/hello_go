FROM golang:1.16-alpine

WORKDIR /src/
COPY hello_go.go go.* /src/
RUN CGO_ENABLED=0 go build -o /bin/demo

FROM alpine:latest
COPY --from=0 /bin/demo /bin/demo
ENTRYPOINT ["/bin/demo"]