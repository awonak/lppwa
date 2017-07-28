package main

import (
	"github.com/gin-gonic/gin"
)

func main() {

	r := gin.Default()
	r.Use(EnvConfig())
	r.Use(CorsMiddleware())

	v1 := r.Group("/api/v1")
	{
		v1.GET("/inventory/search", SearchInventory)
		v1.GET("/inventory/category/:category", CategoryInventory)
	}
	r.Run(":9000") // listen and serve on 0.0.0.0:9000
}
