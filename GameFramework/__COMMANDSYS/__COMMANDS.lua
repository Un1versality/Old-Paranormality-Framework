return {
    ["echo"] = {
        Params = {
            [1] = "Text";
        };

        Run = function(Args)
            print(Args[1])
        end
    }
}
