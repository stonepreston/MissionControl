clc
clear

missionControlModel = MissionControlModel();
missionControlView = MissionControlView(missionControlModel);
missionControlController = MissionControlController(missionControlModel, missionControlView);