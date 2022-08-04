classdef APT_Motor < handle
    properties(Access = private)
        MotorProperties Motor_Properties
    end

    properties(Access = private)
        actxcontroler
    end

    methods
        function self = APT_Motor(APT_MotorProps)
            arguments
                APT_MotorProps.f 
                APT_MotorProps.x 
                APT_MotorProps.y 
                APT_MotorProps.w 
                APT_MotorProps.h 
                APT_MotorProps.MotorProps Motor_Properties
            end

            self.actxcontroler = actxcontrol('MGMOTOR.MGMotorCtrl.1', ...
                [APT_MotorProps.x, APT_MotorProps.y, APT_MotorProps.w, APT_MotorProps.h], APT_MotorProps.f);
            self.MotorProperties = APT_MotorProps.MotorProps;
        end

        function self = Motor_Identify(self)
            [SN, ~, ~, ~] = self.MotorProperties.Motor_Get_Properties;
            self.actxcontroler.StartCtrl;
            self.actxcontroler.HWSerialNum = SN;
            self.actxcontroler.Identify;
            pause(2);
        end

        function self = Motor_Set_VelParams(self)
            [~, MinVel, MaxVel, MaxAccel] = self.MotorProperties.Motor_Get_Properties;
            self.actxcontroler.SetVelParams(0, MinVel, MaxAccel, MaxVel);
        end

        function self = Motor_Home(self)
            self.actxcontroler.MoveHome(0, true);
            self.Motor_Wait;
        end

        function self = Motor_MoveAbs(self, AbsPos)
            self.actxcontroler.SetAbsMovePos(0, AbsPos);
            self.actxcontroler.MoveAbsolute(0, true);
            self.Motor_Wait;
        end

        function r = Motor_Wait(self)
            while(true)
                s = int32(self.actxcontroler.GetStatusBits_Bits(1));
                r = bitget(abs(s), 5) || bitget(abs(s), 6);
                pause(0.1);
                if(r == 0)
                    break;
                end
            end
        end    
    end
end

