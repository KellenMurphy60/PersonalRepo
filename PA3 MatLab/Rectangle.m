classdef Rectangle < Shape & ColorMixin
    %Subclass

    properties
        Length
        Width
    end

    methods
        function obj = Rectangle(l,w,c)
         obj@Shape('Rectangle');
         obj@ColorMixin(c)
            if nargin == 0
                obj.Area
                obj.Length
                obj.Width
             else
             
                 obj.Length = l;
                 obj.Width = w;
                 obj.Area = CalculateArea(obj);

             end
        end

         function method = CalculateArea(obj)
                 method = obj.Length * obj.Width;
         end 
          function Display(obj)
            fprintf("Name: %s \n Length: %d \n Width: %d\n Area: %d\nColor: %s\n",obj.Name,obj.Length,obj.Width,obj.Area,obj.color)
          end
          function Draw(obj)
           hold off
            pos = [0,0,(obj.Length),(obj.Width)];
            rectangle('Position',pos,'FaceColor',obj.color)
            title("Rectangle")
            xlabel(['Width: ',num2str(obj.Width),' Length: ',num2str(obj.Length),' Area: ',num2str(obj.Area)]);
        end 
    end
end