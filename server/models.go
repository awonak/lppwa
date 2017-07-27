package main

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
