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
