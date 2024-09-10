package = "Nchan"
version = "1.0-1"
source = {
   url = "git://github.com/Zoviet/nchan.git",
}
description = {
   summary = "Simple Lua nchan publisher and group manager",
   detailed = [[
      Message publishing, channel info, channels delete, groups info and groups limits setter.
   ]],
   homepage = "https://github.com/Zoviet/nchan",
   license = "MIT/X11"
}
dependencies = {
   "lua >= 5.1, < 5.4",
   "luasocket >= 2.0",
   "json4lua >= 0.1",
   "mimetypes >= 1.0"
}
external_dependencies = {

}
build = {
   type = "builtin",
   modules = {
     ["nchan"] = "nchan/connect.lua",
     ["nchan.channel"] = "nchan/channel.lua",
     ["nchan.group"] = "nchan/group.lua"
   }
}
