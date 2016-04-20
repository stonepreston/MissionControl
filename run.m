clc
clear
close all

missionControlModel = MissionControlModel();
missionControlView = MissionControlView(missionControlModel);
missionControlController = MissionControlController(missionControlModel, missionControlView);

% Spring Constant = 583.196
% Projectile Mass = .0617