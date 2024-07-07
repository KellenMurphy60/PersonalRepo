classdef Square < Rectangle & ColorMixin
   
    properties
       SideLength 
    end

    methods
        function obj = Square(l,c)
           
            obj@Rectangle(l,l,c)
            obj@ColorMixin(c)
            obj.Name = "Square";
            obj.SideLength = l;
           
        end

        function Display(obj)
            fprintf("Name: %s \n Sidelength: %d \nArea: %d\nColor: %s\n",obj.Name,obj.SideLength,obj.Area,obj.color)
        end
        function Draw(obj)
            hold off
            pos = [10,0,(obj.SideLength),(obj.SideLength)];
            rectangle('Position',pos,'FaceColor',obj.color)
            title("Square")
            xlabel(['SideLength: ',num2str(obj.SideLength),' Area: ',num2str(obj.Area)]);
        end 
    end
end