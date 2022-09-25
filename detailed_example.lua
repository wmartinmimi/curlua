#!/bin/env lua

-- import curlua as web
local web = require "curlua"

-- create new browsing session
local session = web:session()

-- send a POST request with data "test" to example.com
local data = session:post("test", "https://example.com")

-- send another GET request in same session
session:get("https://example.com")

-- close the browsing session
session:close()

-- check for data
if (data == nil) then
  -- no data received (empty response)
  -- potential error (no network/404)
  print("request unsuccessful")
else
  -- data recieved
  -- print the data
  print(data)
end
