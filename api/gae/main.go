package api

import (
	"net/http"
	"fmt"
	"google.golang.org/appengine"
	"google.golang.org/appengine/log"
)

func init() {
	http.HandleFunc("/", handler)
}

func handler(w http.ResponseWriter, r *http.Request)  {
	fmt.Fprint(w, "Hello Root!")

	ctx := appengine.NewContext(r)
	log.Infof(ctx, "Hello Doggy!")
}
