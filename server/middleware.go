package main

import (
	"log"

	"github.com/gin-gonic/gin"
	"github.com/kelseyhightower/envconfig"
)

// configuration specification  struct
type Config struct {
	AccessToken string
	MerchantID  string
	BaseURL     string
	AllowOrigin string
}

// EnvConfig middleware for configuration variables
func EnvConfig() gin.HandlerFunc {
	return func(c *gin.Context) {

		var config Config
		err := envconfig.Process("LPPWA", &config)
		if err != nil {
			log.Fatal(err.Error())
		}

		// Add config var to context
		c.Set("config", config)

		c.Next()
	}
}

func CorsMiddleware() gin.HandlerFunc {
  // Set out header value for each response
  return func(c *gin.Context) {
		// get config variables from context
		config := c.MustGet("config").(Config)

		// Declare allowed origin
    c.Writer.Header().Set("Access-Control-Allow-Origin", config.AllowOrigin)
    c.Next()
  }
}
