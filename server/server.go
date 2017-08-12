package server

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

// Start will run the gin server
func Start() {

	r := gin.Default()
	r.Use(EnvConfig())

	// Static routes for serving front end
	static := r.Group("")
	{
		static.StaticFile("/", "build/web/index.html")
		static.StaticFile("/main.dart.js", "build/web/main.dart.js")
		static.StaticFile("/pwa.dart.js", "build/web/pwa.dart.js")
		static.StaticFile("/manifest.json", "build/web/manifest.json")
		static.StaticFile("/favicon.png", "build/web/favicon.png")
		static.Static("/css", "build/web/css")
		static.Static("/img", "build/web/img")
		static.Static("/packages", "build/web/packages")
	}

	apiV1 := r.Group("/api/v1")
	{
		apiV1.GET("/inventory/search", SearchInventory)
		apiV1.GET("/inventory/category/:category", CategoryInventory)
	}

	// Everything else redirect to index.html
	r.LoadHTMLFiles("build/web/index.html")
	r.NoRoute(func(c *gin.Context) {
		c.HTML(http.StatusOK, "index.html", gin.H{})
	})

	r.Run(":8080") // listen and serve on 0.0.0.0:8080
}
