clear
clc

testCase = TestLauncher;
res = run(testCase)

testCase = TestLaunchSimulation;
res = run(testCase)

testCase = TestGuiHelpers;
res = run(testCase)