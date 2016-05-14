package main

import (
	"log"
	"net/http"
)

func main() {
	router := NewRouter()

	log.Println("Running on http://localhost:8080")
	log.Fatal(http.ListenAndServe(":8080", router))
}
