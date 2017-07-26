package main

import (
	"github.com/gin-gonic/gin"
)

func main() {

	r := gin.Default()
	r.Use(EnvConfig())

	v1 := r.Group("/api/v1")
	{
		v1.GET("/inventory/search", getInventorySearch)
		v1.GET("/inventory/category/:category", getInventoryCategory)
	}
	r.Run(":9000") // listen and serve on 0.0.0.0:9000
}
