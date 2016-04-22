clc
clear
close all

missionControlModel = MissionControlModel();
missionControlView = MissionControlView(missionControlModel);
missionControlController = MissionControlController(missionControlModel, missionControlView);

% Spring Constant = 619.3697613
% Projectile Mass = .0617