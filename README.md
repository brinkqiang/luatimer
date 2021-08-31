# luatimer

Copyright (c) 2013-2018 brinkqiang (brink.qiang@gmail.com)

[![luatimer](https://img.shields.io/badge/brinkqiang-luatimer-blue.svg?style=flat-square)](https://github.com/brinkqiang/luatimer)
[![License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/brinkqiang/luatimer/blob/master/LICENSE)
[![blog](https://img.shields.io/badge/Author-Blog-7AD6FD.svg)](https://brinkqiang.github.io/)
[![Open Source Love](https://badges.frapsoft.com/os/v3/open-source.png)](https://github.com/brinkqiang)
[![GitHub stars](https://img.shields.io/github/stars/brinkqiang/luatimer.svg?label=Stars)](https://github.com/brinkqiang/luatimer) 
[![GitHub forks](https://img.shields.io/github/forks/brinkqiang/luatimer.svg?label=Fork)](https://github.com/brinkqiang/luatimer)

## Build status
| [Linux][lin-link] | [Mac][mac-link] | [Windows][win-link] |
| :---------------: | :----------------: | :-----------------: |
| ![lin-badge]      | ![mac-badge]       | ![win-badge]        |

[lin-badge]: https://github.com/brinkqiang/luatimer/workflows/linux/badge.svg "linux build status"
[lin-link]:  https://github.com/brinkqiang/luatimer/actions/workflows/linux.yml "linux build status"
[mac-badge]: https://github.com/brinkqiang/luatimer/workflows/mac/badge.svg "mac build status"
[mac-link]:  https://github.com/brinkqiang/luatimer/actions/workflows/mac.yml "mac build status"
[win-badge]: https://github.com/brinkqiang/luatimer/workflows/win/badge.svg "win build status"
[win-link]:  https://github.com/brinkqiang/luatimer/actions/workflows/win.yml "win build status"

## env
install cmake

## Intro
luatimer
```lua
local luatimer = require("luatimer");

local timer = luatimer.timer.new();
local count = 0;
local test = "this is test";

function main_idle()
    print("hello main_idle");
end

timer:settimer(1001, 1, function(id)
    timer:killtimer(id);
    main_idle();
end
)

timer:settimer(1002, 1000, function(id)
        count=count+1;
        print("hello wolrd " .. count);
        if count >= 10 then
            timer:killtimer(id);
            timer:killall();
            timer:stop();
        end
    end
)

timer:run();
```
## Contacts
[![Join the chat](https://badges.gitter.im/brinkqiang/luatimer/Lobby.svg)](https://gitter.im/brinkqiang/luatimer)

## Thanks
