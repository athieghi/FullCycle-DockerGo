FROM golang:alpine AS builder

WORKDIR /go/src/app
COPY . .
RUN CGO_ENABLED=0  go build -a -installsuffix cgo -o  /app main.go


FROM scratch
WORKDIR /

COPY --from=builder /app /app 

EXPOSE 8080


ENTRYPOINT [ "/app" ] 