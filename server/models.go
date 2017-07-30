package main

const BEER = "beer"
const WINE = "wine"
const SPIRITS = "spirits"

var CategoryMap = map[string]string{
	BEER:    "6M2MA7RSTK48G",
	WINE:    "ENZ9NW2HMH6X4",
	SPIRITS: "T44GTM66YP2Y6",
}

// Item is a Clover inventory item
type Item struct {
	ID              string `json:"id"`
	Hidden          bool   `json:"hidden"`
	Name            string `json:"name"`
	Code            string `json:"code"`
	Price           int32  `json:"price"`
	PriceType       string `json:"priceType"`
	DefaultTaxRates bool   `json:"defaultTaxRates"`
	Cost            int32  `json:"cost"`
	IsRevenue       bool   `json:"isRevenue"`
	StockCount      int32  `json:"stockCount"`
	ModifiedTime    int64  `json:"modifiedTime"`
}
