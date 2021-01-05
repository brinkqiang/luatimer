local module = require("luatimer")

local timer = module.luatimer.new()
local count = 0
local test = "this is test"

function main_idle()

end

timer:settimer(0, 1, function(test)
    main_idle()
end
)

timer:settimer(1, 1000, function(test)
        count=count+1;
        print("hello wolrd " .. count .. test);
        if count >= 10 then
            timer:killtimer(1);
            timer:killall();
            timer:stop();
        end
    end, 10
)

timer:run()