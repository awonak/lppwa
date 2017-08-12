# LPPWA Server

This is the backend server for all server side requests related to the Liquor
Park PWA.


## Configure

The server relies on a set of sensitive variables that are defined as
environment variables. The recommended pattern is to create a `.env` file
locally and run `source .env` to set the environment variables.

Here is a sample `.env` file:

```
export LPPWA_ACCESSTOKEN=aaaa-bb-cc-dddd
export LPPWA_BASEURL=https://api.example.com/v2
export LPPWA_MERCHANTID=0123456709ABCDEF
```

## Build

```$ go build```

## Run

```$ ./server```
