classdef ColorMixin

    properties
       color
    end

    methods
        function obj = ColorMixin(c)
                obj.color = c;
        end
        function method = getColor(obj)
           method = obj.color;
        end

        function obj = setColor(obj,c)
            obj.color = c;
        end
    end
end