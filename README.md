# Simple lua nchan publisher

## Install

```
luarocks install nchan
```

## Usage

### Channels

***Publish message in channel***

```
local channel = require('nchan.channel')

channel.nchan.host = 'http://localhost'
channel.nchan.endpoint = 'pub'

result,msg = channel.publish('test')

```


***Connect with Basic auth***

```
	local channel = require('nchan.channel')

	channel.nchan.host = 'http://localhost'
	channel.nchan.endpoint = 'pub'
	
	channel.nchan.login = 'test'
	channel.nchan.password = 'test'

	result,msg = channel.publish('test')

```

***Connect with Bearer auth***

```
	local channel = require('nchan.channel')

	channel.nchan.host = 'http://localhost'
	channel.nchan.endpoint = 'pub'
	
	channel.nchan.token = 'token'

	result,msg = channel.publish('test')

```

***Delete channel***

```
local channel = require('nchan.channel')
channel.nchan.host = 'http://localhost'
channel.nchan.endpoint = 'pub'

result,msg = channel.delete()

```

***Get channel info***

```
local channel = require('nchan.channel')
channel.nchan.host = 'http://localhost'
channel.nchan.endpoint = 'pub'

result,msg = channel.status()

print(result)
print(msg.messages)
print(msg.requested)
print(msg.subscribers)
print(msg.last_message_id)

```

Channel info also available after publishing:

```
local channel = require('nchan.channel')

channel.nchan.host = 'http://localhost'
channel.nchan.endpoint = 'pub'

result,msg = channel.publish('test')

print(result)
print(channel.nchan.info.messages)
print(channel.nchan.info.requested)
print(channel.nchan.info.subscribers)
print(channel.nchan.info.last_message_id)

```

### Groups

***Get group info***

```
local channel = require('nchan.group')
channel.nchan.host = 'http://localhost'
channel.nchan.endpoint = 'pub'

result,msg = group.status()

print(result)
print(msg.messages)
print(msg.requested)
print(msg.subscribers)
print(msg.last_message_id)

```
***Set group limits***

```
local channel = require('nchan.group')
channel.nchan.host = 'http://localhost'
channel.nchan.endpoint = 'pub'

result,msg = group.limits({
	['max_channels']=15,
	['max_subs']=1000
})

```
