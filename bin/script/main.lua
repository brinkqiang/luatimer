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
