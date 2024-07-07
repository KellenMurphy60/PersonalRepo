classdef Triangle < Shape & ColorMixin
    %Subclass
    properties
        Base
        Height
    end
    methods
        function obj = Triangle(b,h,c)
            obj@Shape('Triangle');
            obj@ColorMixin(c)
            if nargin == 0
                obj.Height
                obj.Base
                obj.Area
                
             else
                obj.Base = b;
                obj.Height = h;
                obj.Area = CalculateArea(obj);
             end
        end

        function method = CalculateArea(obj)
                 method = (obj.Base * obj.Height) * (1/2);
        end 
         function Display(obj)
            fprintf("Name: %s \n Base: %d \n Height: %d\n Area: %d\nColor: %s\n",obj.Name,obj.Base,obj.Height,obj.Area,obj.color)
         end
         function Draw(obj)
         clc
         clear plot
         x = [0 (1/2)*obj.Base obj.Base];
         y = [0 obj.Height,0];
         plot(x,y,obj.color);
         title('Triangle')
         xlabel(['Base: ',num2str(obj.Base),' Height: ',num2str(obj.Height),' Area: ',num2str(obj.Area)]);
         hold on
         area(x,y,'Facecolor',obj.color);
         hold off
         end 
    end

end