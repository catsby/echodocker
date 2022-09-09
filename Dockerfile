# Go Shrls
FROM golang:1.16-alpine AS builder
RUN apk --no-cache add ca-certificates
WORKDIR /app

COPY ./go.mod ./
# COPY ./go.sum ./
RUN go mod download

COPY ./*.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags "-s" -a --installsuffix cgo -o echodocker

FROM hashicorp/waypoint:latest AS waypoint

# Final Artifact
# FROM scratch
FROM alpine:3.14
COPY --from=builder /app/echodocker ./
COPY --from=waypoint /usr/bin/waypoint-entrypoint /waypoint-entrypoint


ENTRYPOINT ["/waypoint-entrypoint"]
CMD ["./echodocker"]
