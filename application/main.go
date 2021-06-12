package main

import {
    "fmt"
    "log"
    "net/http"
}

func IndexServer(x http.ResponseWriter, r *http.Request) {
    fmt.Fprint(w, "Automate goooo server")
}

func main() {
    handler := http.HandlerFunc(IndexServer)
    log.Fatal(http.ListenAndServer(":8080", handler))
}