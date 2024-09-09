local channel = require('nchan.channel')

channel.nchan.host = 'http://localhost'
channel.nchan.endpoint = 'pub'

result,msg = channel.status()
print(result)
print(msg.messages)
print(msg.requested)
print(msg.subscribers)
print(msg.last_message_id)

result,msg = channel.publish('test')
print(result)
print(channel.nchan.info.messages)
print(channel.nchan.info.requested)
print(channel.nchan.info.subscribers)
print(channel.nchan.info.last_message_id)

