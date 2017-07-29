package main

import (
	"github.com/gin-gonic/gin"
)

func main() {

	r := gin.Default()
	r.Use(EnvConfig())
	r.Use(CorsMiddleware())

	// Static routes for serving front end
	static := r.Group("")
	{
		static.StaticFile("/", "index.html")
		static.StaticFile("/main.dart.js", "main.dart.js")
		static.StaticFile("/pwa.dart.js", "pwa.dart.js")
		static.StaticFile("/manifest.json", "manifest.json")
		static.StaticFile("/favicon.png", "favicon.png")
		static.Static("/css", "css")
		static.Static("/img", "img")
		static.Static("/packages", "packages")
	}

	// Routes for backend api server
	apiV1 := r.Group("/api/v1")
	{
		apiV1.GET("/inventory/search", SearchInventory)
		apiV1.GET("/inventory/category/:category", CategoryInventory)
	}
	r.Run(":9000") // listen and serve on 0.0.0.0:9000
}
