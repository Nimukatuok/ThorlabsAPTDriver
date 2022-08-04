close all;clear;clc;

SN = 27004239;

fig = figure('Position', [25, 50, 1850, 900], 'Resize', 'off');

APT = APT_Motor('f', self.fig, 'x', 900, 'y', 375, 'w', 375, 'h', 250, ...
                    'MotorProps', Motor_Properties('SN', SN));
APT.Motor_Identify;
APT.Motor_Set_VelParams;

APT.Motor_Home;
pause(0.5);

APT.Motor_MoveAbs(120);
pause(0.5);

APT.Motor_Home;
pause(0.5);