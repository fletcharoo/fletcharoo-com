FROM golang:latest AS builder
WORKDIR /app
RUN apt update && apt install -y git
RUN git clone https://github.com/fletcharoo/mfwebsite .
WORKDIR /app/cmd/mfwebsite
RUN go build -o /app/mfwebsite

FROM debian:latest
COPY --from=builder /app/mfwebsite /usr/local/bin/mfwebsite
COPY markdown /app
ENTRYPOINT ["mfwebsite"]
