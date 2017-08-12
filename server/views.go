package server

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

// Filter items based on callbackk
func Filter(vs []Item, f func(Item) bool) []Item {
	vsf := make([]Item, 0)
	for _, v := range vs {
		if f(v) {
			vsf = append(vsf, v)
		}
	}
	return vsf
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

// CategoryInventory view fetches items for given category
func CategoryInventory(c *gin.Context) {
	// parse URL param
	categoryID := CategoryMap[c.Param("category")]

	// get config variables from context
	config := c.MustGet("config").(Config)

	// construct api request url
	itemsURL := "%s/merchants/%s/categories/%s/items?access_token=%s&expand=itemStock&limit=1000"
	requestURL := fmt.Sprintf(itemsURL, config.BaseURL, config.MerchantID,
		categoryID, config.AccessToken)
	jsonResp := cloverRequest(requestURL)

	resp := CloverResponse{
		Elements: Filter(jsonResp.Elements, func(i Item) bool {
			return i.ItemStock.StockCount > 0
		}),
		Href: jsonResp.Href,
	}

	// return response
	c.JSON(http.StatusOK, resp)
}

// SearchInventory performs a string search of item name for provided query
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
