#!/bin/env lua

-- get the library
require "curlua"

-- get html from example.com
html = curlua:get("https://example.com")

-- print the html recieved
-- nil if connection error or empty response
print(html)
