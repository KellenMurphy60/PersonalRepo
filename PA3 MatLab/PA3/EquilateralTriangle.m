classdef EquilateralTriangle < Triangle & ColorMixin    


    properties
        SideLength
    end

    methods
        function obj = EquilateralTriangle(l,c)
            h = (1/2) * sqrt(3) * l;
            obj@Triangle(l,h,c)
            obj@ColorMixin(c)
            obj.Name = "Equilateral Triangle";
            obj.SideLength = l;
            
            end 
     

            function Display(obj)
            fprintf("Name: %s \n SideLength %d\n Area: %d\nColor: %s\n",obj.Name,obj.SideLength,obj.Area,obj.color)
            end
            function Draw(obj)
            x = [0 (1/2)*obj.SideLength obj.SideLength];
            y = [0 sqrt(3)*(1/2)*obj.SideLength 0];
            plot(x,y,obj.color);
            hold on
            title("EquilateralTriangle")
            xlabel(['SideLength: ',num2str(obj.SideLength),' Area: ',num2str(obj.Area)]);

            area(x,y,'Facecolor',obj.color);
            end 
    end
end