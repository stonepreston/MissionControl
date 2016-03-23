clear
clc

testCase = TestLauncher;
res = run(testCase)

testCase = TestLaunchSimulation;
res = run(testCase)

%testCase = TestGuiHelpers;
%res = run(testCase)

testCase = TestMissionControlModel;
res = run(testCase)

testCase = TestMissionControlView;
res = run(testCase)

testCase = TestMissionControlController;
res = run(testCase)

testCase = TestExportModel;
res = run(testCase)