FROM --platform=${BUILDPLATFORM:-linux/amd64} golang:1.21 as builder

ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG TARGETOS
ARG TARGETARCH

WORKDIR /app/
ADD ./app .
RUN  GOPROXY=direct GOSUMDB=off CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -o main main.go

FROM --platform=${TARGETPLATFORM:-linux/amd64} scratch
WORKDIR /app/
COPY --from=builder /app/main /app/main
ENTRYPOINT ["/app/main"]
