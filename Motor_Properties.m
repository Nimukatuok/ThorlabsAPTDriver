% Class for Motor
% 2022-05-06 XT

classdef Motor_Properties < handle
    properties(Access = public)
        SN int32
        MinVel int32
        MaxVel int32
        MaxAccel int32
    end
    
    methods
        function self = Motor_Properties(MotorProps)
            arguments
                MotorProps.SN int32 = 114514
                MotorProps.MinVel int32 = 0
                MotorProps.MaxVel int32 = 25
                MotorProps.MaxAccel int32 = 25
            end
            self.SN = MotorProps.SN;
            self.MinVel = MotorProps.MinVel;
            self.MaxVel = MotorProps.MaxVel;
            self.MaxAccel = MotorProps.MaxAccel;
        end
        
        function self = Motor_Set_Properties(self, MotorProps)
            arguments
                self
                MotorProps.SN int32 = self.SN
                MotorProps.MinVel int32 = self.MinVel
                MotorProps.MaxVel int32 = self.MaxVel
                MotorProps.MaxAccel int32 = self.MaxAccel
            end
            self.SN = MotorProps.SN;
            self.MinVel = MotorProps.MinVel;
            self.MaxVel = MotorProps.MaxVel;
            self.MaxAccel = MotorProps.MaxAccel;
        end
        
        function [SN, MinVel, MaxVel, MaxAccel] = ...
                Motor_Get_Properties(self)
            SN = self.SN;
            MinVel = self.MinVel;
            MaxVel = self.MaxVel;
            MaxAccel = self.MaxAccel;
        end
    end
end