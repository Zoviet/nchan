
-- Simple nchan lua client

local _M = {}

_M.nchan = require ('nchan.nchan')


function _M.publish(message) 
	_M.nchan.method = 'POST'
	return _M.nchan.request(message)	
end

function _M.status()
	_M.nchan.method = 'GET'
	local result, msg  = _M.nchan.request()
	if result then	
		return true, _M.nchan.info
	end
	return false, msg
end

function _M.delete()
	_M.nchan.method = 'DELETE'
	return _M.nchan.request()
end

return _M
