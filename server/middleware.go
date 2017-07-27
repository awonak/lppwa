package main

import (
	"log"

	"github.com/gin-gonic/gin"
	"github.com/kelseyhightower/envconfig"
)

// Specification configuration struct
type Specification struct {
	AccessToken string
	MerchantID  string
	BaseURL     string
}

// EnvConfig middleware for configuration variables
func EnvConfig() gin.HandlerFunc {
	return func(c *gin.Context) {

		var s Specification
		err := envconfig.Process("lppwa", &s)
		if err != nil {
			log.Fatal(err.Error())
		}

		c.Set("baseURL", s.BaseURL)
		c.Set("merchantID", s.MerchantID)
		c.Set("accessToken", s.AccessToken)

		c.Next()
	}
}
