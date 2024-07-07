classdef Shape < matlab.mixin.Heterogeneous
    %Shape superclass

    properties
        Name
        Area
    end

    methods
        function obj = Shape(nameArg)
             if nargin == 0
                obj.Name
                obj.Area
             else
                 obj.Name = nameArg;
                 obj.Area 
             end
        end

        function Display(obj)
            fprintf("Name: %s \n Area: %d\n",obj.Name,obj.Area)

        end
      
    end
    methods (Static)
        function CalculateStatistics(arr)
        areas = [arr.Area];
        fprintf("Mean:%d\n",mean(areas))
        fprintf("Median:%d\n",median(areas))
        fprintf("Standard Deviation:%d\n",std(areas))
        end 
    end 
end