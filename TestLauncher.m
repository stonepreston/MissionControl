classdef TestLauncher < matlab.unittest.TestCase
    
    properties
        launcher
    end

    methods(TestClassSetup)
        
        function setup(testCase)
            
            % Create a launcher with spring constant: 15 N/m, projectile mass:
            % .1 kg, launch velocity: 20 m/s, and launch angle: 45 deg
            testCase.launcher = Launcher(15, .1, 20, 45);
            
        end
        
    end
    
    methods(TestClassTeardown)
        
        function teardown(testCase)
            
            % Delete the launcher
            delete(testCase.launcher);
            
        end
        
    end
    
    methods (Test)
        
        function testConstructor(testCase)
            
            launcher = Launcher(15, .1, 20, 45);
            testCase.verifyEqual(launcher.springConstant, 15, ...
                'Constructor failed to correctly set springConstant');
            testCase.verifyEqual(launcher.projectileMass, .1, ...
                'Constructor failed to correctly set projectileMass');
            testCase.verifyEqual(launcher.launchVelocity, 20, ...
                'Constructor failed to correctly set launchVelocity');
            testCase.verifyEqual(launcher.launchAngle, 45, ...
                'Constructor failed to correctly set launchAngle');
        end
       
        function testSpringDisplacement(testCase)
            actSolution = testCase.launcher.springDisplacement;
            expSolution = 20 / sqrt(15 / .1);
            testCase.verifyEqual(actSolution,expSolution);
        end
    end

end