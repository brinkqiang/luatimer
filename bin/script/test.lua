local module = require("luatimer");

local timer = module.timer.new();
local count = 0;
local test = "this is test";

function main_idle()
    print("hello main_idle");
end

timer:settimer(0, 1, function(id)
    timer:killtimer(id);
    main_idle();
end
)

print(timer:gettime())

timer:sleepms(2000, function()
    print("sleepms 2000 " .. timer:gettime());

    timer:settimer(1, 1000, function(id, str, num)
        count=count+1;
        print("hello wolrd " .. count);
        if count >= 10 then
            timer:killtimer(id);
            timer:killall();
            timer:stop();
        end
    end)
end)


timer:run();
