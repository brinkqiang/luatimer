local module = require("luatimer")

local timer = module.luatimer.new()
local count = 0

timer:settimer(1, 1000, function()
        count=count+1;
        print("hello wolrd\n");
        if count >= 10 then
            timer:killtimer(1);
            timer:killall();
            timer:stop();
        end
    end
)

timer:run()