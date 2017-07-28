package main

import (
	"encoding/json"
	"io/ioutil"
	"log"
	"net/http"
	"net/url"

	"fmt"

	"github.com/gin-gonic/gin"
)

// CloverResponse is the json struct for a Clover API response
type CloverResponse struct {
	Elements []Item `json:"elements"`
	Href     string `json:"href"`
}

func cloverRequest(endpoint string) CloverResponse {
	log.Println(endpoint)

	// make api request
	resp, err := http.Get(endpoint)
	if err != nil {
		log.Fatal(err)
	}
	defer resp.Body.Close()

	// parse response body into json
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Fatal(err)
	}
	var jsonResp CloverResponse
	_ = json.Unmarshal(body, &jsonResp)

	return jsonResp
}

func CategoryInventory(c *gin.Context) {
	// parse URL param
	category := c.Param("category")

	// get config variables from context
	config := c.MustGet("config").(Config)

	// construct api request url
	itemsURL := "%s/merchants/%s/categories/%s/items?access_token=%s"
	requestURL := fmt.Sprintf(itemsURL, config.BaseURL, config.MerchantID,
	                          category, config.AccessToken)
	jsonResp := cloverRequest(requestURL)

	// return response
	c.JSON(http.StatusOK, jsonResp)
}

func SearchInventory(c *gin.Context) {
	// parse GET param
	query := url.QueryEscape(c.Query("q"))

	// get config variables from context
	config := c.MustGet("config").(Config)

	// construct api request url
	searchURL := "%s/merchants/%s/items?filter=name+LIKE%%25%s%%25&access_token=%s"
	requestURL := fmt.Sprintf(searchURL, config.BaseURL, config.MerchantID,
	                          query, config.AccessToken)
	jsonResp := cloverRequest(requestURL)

	// return response
	c.JSON(http.StatusOK, jsonResp)
}
