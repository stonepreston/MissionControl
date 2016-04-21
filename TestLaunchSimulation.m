classdef TestLaunchSimulation < matlab.unittest.TestCase

     properties
        launcher
        simulation
    end

    methods(TestClassSetup)
        
        function createSimulation(testCase)
            
            % Create a launcher with spring constant: 15 N/m, projectile mass:
            % .1 kg, launch velocity: 20 m/s, and launch angle: 45 deg
            testCase.launcher = Launcher(15, .1, 20, 45);
            testCase.simulation = LaunchSimulation(testCase.launcher);
            
        end
        
    end
    
    methods(TestClassTeardown)
        
        function deleteSimulation(testCase)
            
            % Delete the simulation
            delete(testCase.simulation);
            
        end
        
    end
    
    methods (Test)
        
        function testConstructor(testCase)
            
            launcher = Launcher(15, .1, 20, 45);
            simulation = LaunchSimulation(launcher);
            
            testCase.verifyEqual(simulation.launcher, launcher, ...
                'Constructor failed to correctly set launcher');
            
        end
       
        function testHorizontalRange(testCase)
            
            actSolution = testCase.simulation.horizontalRange;
            expSolution = ((20)^2 * sind(2 * 45)) / 9.81;
            testCase.verifyEqual(actSolution,expSolution);
            
        end
        
        function testVerticalRange(testCase)
            
            actSolution = testCase.simulation.verticalRange;
            expSolution = ((20^2) * sind(45)^2) / (2 * 9.81);
            testCase.verifyEqual(actSolution,expSolution);
            
        end
        
        function testTimeOfFlight(testCase)
            
            actSolution = testCase.simulation.timeOfFlight;
            expSolution = ((2 * 20) * sind(45)) / 9.81;
            testCase.verifyEqual(actSolution,expSolution);
            
        end
        
        function testComputeAngleData(testCase)
            
            actSolution = testCase.simulation.computeAngleData(20);
            angles = [0 15 30 45 60 75 90];
            hranges = [0 20.3874 35.3119 40.7747 35.3119 20.3874 0];
            vranges = [0 1.3657 5.0968 10.1937 15.2905 19.0217 20.3874];
            flightTimes = [0 1.0553 2.0387 2.8832 3.5312 3.9385 4.0775];
            expSolution = [angles' hranges' vranges' flightTimes'];
            testCase.verifyEqual(actSolution, expSolution, 'RelTol', .1);
            
        end
        
        function testComputePredictionData(testCase)
            
            actSolution = testCase.simulation.computePredictionData(20);
            angles = [0 15 30 45 60 75 90];
            velocities = [Inf 19.8091 15.0517 14.0071 15.0517 19.8091 Inf];
            expSolution = [angles' velocities'];
            testCase.verifyEqual(actSolution, expSolution, 'RelTol', .1);
            
        end
            
    end

end