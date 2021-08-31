# luatimer

Copyright (c) 2013-2018 brinkqiang (brink.qiang@gmail.com)

[![luatimer](https://img.shields.io/badge/brinkqiang-luatimer-blue.svg?style=flat-square)](https://github.com/brinkqiang/luatimer)
[![License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/brinkqiang/luatimer/blob/master/LICENSE)
[![blog](https://img.shields.io/badge/Author-Blog-7AD6FD.svg)](https://brinkqiang.github.io/)
[![Open Source Love](https://badges.frapsoft.com/os/v3/open-source.png)](https://github.com/brinkqiang)
[![GitHub stars](https://img.shields.io/github/stars/brinkqiang/luatimer.svg?label=Stars)](https://github.com/brinkqiang/luatimer) 
[![GitHub forks](https://img.shields.io/github/forks/brinkqiang/luatimer.svg?label=Fork)](https://github.com/brinkqiang/luatimer)

## Build status
| [Linux][lin-link] | [MacOSX][osx-link] | [Windows][win-link] |
| :---------------: | :----------------: | :-----------------: |
| ![lin-badge]      | ![osx-badge]       | ![win-badge]        |

[lin-badge]: https://travis-ci.org/brinkqiang/luatimer.svg?branch=master "Travis build status"
[lin-link]:  https://travis-ci.org/brinkqiang/luatimer "Travis build status"
[osx-badge]: https://travis-ci.org/brinkqiang/luatimer.svg?branch=master "Travis build status"
[osx-link]:  https://travis-ci.org/brinkqiang/luatimer "Travis build status"
[win-badge]: https://ci.appveyor.com/api/projects/status/github/brinkqiang/luatimer?branch=master&svg=true "AppVeyor build status"
[win-link]:  https://ci.appveyor.com/project/brinkqiang/luatimer "AppVeyor build status"

## env
install cmake

## Intro
luatimer
```lua
local module = require("luatimer");

local timer = module.timer.new();
local count = 0;
local test = "this is test";

function main_idle()
    print("hello main_idle");
end

timer:settimer(1, 1000, function(id)
    timer:killtimer(id);
    main_idle();
end
)

print(module.gettime())

-- warning: sleepms bind IDEvent=0
timer:sleepms(2000, function()
    print("sleepms 2000 " .. module.gettime());

    timer:settimer(2, 1000, function(id)
        count=count+1;
        print("hello wolrd " .. count);
        if count >= 10 then
            timer:killtimer(id);
            timer:killall();
            module.stop();
        end
    end)
end)

module.run();
```
## Contacts
[![Join the chat](https://badges.gitter.im/brinkqiang/luatimer/Lobby.svg)](https://gitter.im/brinkqiang/luatimer)

## Thanks
