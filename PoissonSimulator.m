%% Readme
% In this script, the system starts in state 0. At each time step, it waits
% for an exponentially distributed time interval (which is determined by
% the current state's arrival rate), and then transitions to the other
% state with a certain probability. This process is performed until the
% total time exceeds the specified simulation time T. The resulting times
% and states are stored in the arrays times and states, which are then
% plotted using the stairs function. The parameters lambda1, lambda2, and p
% can be adjusted to change the arrival rates and transition probabilities.
% Here is a simple MATLAB code to simulate a two-state Poisson process:

%% MATLAB code
close all
clear

% parameters
lambda1 = 5;  % arrival rate in state 1
lambda2 = 10;  % arrival rate in state 2
p = 0.5;  % probability of transitioning from state 1 to state 2
T = 100;  % simulation time

% initialize
time = 0;
state = 0;
times = [0];
states = [0];

% generate Poisson process
while time < T
    if state == 0
        interval = exprnd(1/lambda1);
        time = time + interval;
        if rand < p
            state = 1;
        end
    else  % state == 1
        interval = exprnd(1/lambda2);
        time = time + interval;
        if rand < (1 - p)
            state = 0;
        end
    end
    times = [times; time];
    states = [states; state];
end

% plot
figure;
stairs(times, states);
title('Two-State Poisson Process');
xlabel('Time');
ylabel('State');
ylim([-1 2]);
xlim([0 10]);
grid on;

