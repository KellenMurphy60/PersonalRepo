classdef Circle < Shape & ColorMixin
    %circle Subclass

    properties
        Radius
    end

    methods
        function obj = Circle(r,c)
            obj@Shape('Circle');
            obj@ColorMixin(c);
            if nargin == 0
                obj.Radius
                obj.Area
            else
                obj.Radius = r;
                obj.Area = CalculateArea(obj);
            end
        end

        function method = CalculateArea(obj)
            method = obj.Radius.^2 * pi;

        end
        function Display(obj)
            fprintf("Name: %s \n Radius: %d\n Area: %d\n Color: %s\n",obj.Name,obj.Radius,obj.Area,obj.color)
        end
        function Draw(obj)
            pos = [15,15,(obj.Radius),(obj.Radius)*2];
            rectangle('Position',pos,'Curvature',[1 1],'FaceColor',obj.color)
            title("Circle")
            xlabel(['Radius: ',num2str(obj.Radius),' Area: ',num2str(obj.Area)]);

        end 

    end
end