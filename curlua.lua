-- [[ curlua.lua ]]
-- a simple curl interface for lua
-- requires curl
-- made by martinmimi

-- default no cookie
-- assigned to prevent nil
curlua = { cookie = "/dev/null" }

-- creates and returns a session
-- same cookie is used in same session
function curlua:session()
  local instance = setmetatable({}, self)
  self.__index = self
  instance.cookie = os.tmpname()
  local cookie_file = io.open(instance.cookie, "w+")
  cookie_file:close()
  return instance
end

-- executes curl for url
-- flag is added to command
-- avoid if possible
function curlua:send(flag, url)
  -- get response
  local request = io.popen("curl -fs "..flag.." -c "..self.cookie.." -b "..self.cookie.." "..url, "r")
  local body = request:read("*a")
  request:close()

  -- check if response is empty
  if (string.len(body) == 0) then
    return nil
  else
    return body
  end
end

-- sends a get request to url
-- returns body, nil if empty or error
function curlua:get(url)
  return self:send("-G", url)
end

-- sends a post request to url along with data
-- returns body, nil if empty or error
function curlua:post(data, url)
  return self:send("-d "..data, url)
end

-- close session
-- removes cookie file
function curlua:close()
  os.remove(self.cookie)
  self.cookie = nil
end

return curlua
