
-- Simple nchan lua client

local _M = {}

_M.nchan = require ('nchan')

_M.nchan.codes = {
	[200] = 'SUCCESS (group existed)',
	[201] = 'CREATED (limits sets)',
	[202] = 'ACCEPTED'
} 


function _M.limits(limits) 
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

return _M
