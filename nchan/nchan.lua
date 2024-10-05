
-- Simple nchan lua client

local json = require ('cjson')
local http = require('socket.http')
local mime = require("mime")

http.TIMEOUT = 15

local _M = {}

_M.host = 'http://127.0.0.1' --Nchan host
_M.port = nil --Nchan port
_M.endpoint = 'pub' -- Nchan publisher endpoint
_M.token = nil
_M.login = nil
_M.password = nil
_M.info = {}

_M.method = 'POST'

-- http status codes with info

_M.codes = {
	[200] = 'SUCCESS (channel existed or deleted)',
	[201] = 'CREATED (at least 1 subscriber presented)',
	[202] = 'ACCEPTED (no subscribers are present)'
} 

function _M.request(message) 
	local source = ltn12.source.empty()	
	local endpoint = _M.host..'/'.._M.endpoint
	local respbody = {}
	local headers = {
		['Content-type'] = 'application/x-www-form-urlencoded',	
		['Accept'] = 'text/json'			
	}
	if message then 
		headers['content-length'] = tostring(#message) 
		if (type(message) == 'table') then 
			source = ltn12.source.cat(message)
		else 
			source = ltn12.source.string(message) 
		end		
	end
	if _M.token then 
		headers["Authorization"] = 'Bearer '.._M.token 
	end
	if _M.login and _M.password then
		headers["Authorization"] = 'Basic '..(mime.b64(_M.login..":".. _M.password))
	end
	if _M.port then 
		endpoint = _M.host..':'.._M.port..'/'.._M.endpoint
	end

	local result, respcode, respheaders, respstatus = http.request {
		method = _M.method,
		headers = headers,
		url = endpoint,
		source = source,	
		sink = ltn12.sink.table(respbody)
	}			
	if not _M.codes[respcode] then 
		return false, 'Request error. Code: '..respcode
	end
	if respbody then
		respbody = table.concat(respbody)		
		ok,err = pcall(json.decode,respbody)
		if not ok then 
			return false, 'Invalid nchan response'
		end		
		_M.info = json.decode(respbody)
	end
	return true, _M.codes[respcode]	
end

return _M
