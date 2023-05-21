ARG BASE_IMAGE="golang:1.18"
FROM $BASE_IMAGE as builder

WORKDIR /workspace
COPY main.go .
ENV GOOS=linux
RUN go build -o hello-world main.go

FROM ubuntu

USER 65532
COPY --from=builder /workspace/hello-world /

ENTRYPOINT ["/hello-world"]