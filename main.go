package main

import (
	"fmt"
	"net/http"
	"os"
)

func handler(w http.ResponseWriter, _ *http.Request) {
	fmt.Println("app handler")
	n, _ := os.LookupEnv("SRVNAME")
	_, _ = fmt.Fprintf(w, "Hello %s\n", n)
}

func healthz(w http.ResponseWriter, _ *http.Request) {
	fmt.Println("health handler")
	_, _ = fmt.Fprintf(w, "OK")
}

func main() {
	http.HandleFunc("/healthz", healthz)
	http.HandleFunc("/app", handler)
	_ = http.ListenAndServe(":80", nil)
}
