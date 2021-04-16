FROM golang:1.15.11-buster

WORKDIR /src

COPY main.go /src/
RUN go build -o /bin/myserver

ENTRYPOINT ["/bin/myserver"]