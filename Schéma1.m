pkg load control ; 
pkg load specfun ;
clear all ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % some functions :
    function Y = dirac_function(X)
      %DIRAC  Delta function.
      %    DIRAC(X) is zero for all X, except X == 0 where it is infinite.
      %    more comments
      Y = zeros(size(X));%
      Y(X == 0) = 1;
      endfunction;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure('Name','Schéma N° 01','NumberTitle','off');% the window title
sys = tf([0 1],[1 10^-3]); % Transfer function of an RC circuit with RC = 1 ms
t = -2:0.001:10;%le temp
ht = exp(-t).*(t>=0); % System impulse response
%ht = impulse(sys, t); % System impulse response

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %  1: le signal indicielle (échelon unité)
    subplot(5,2,1);
    unitstep = t>=0; % the Step function // échelon unité
    plot(t,unitstep);
    title('La représentation graphique du signal indicielle');
    %sgtitle('Subplot Grid Title')
    ylabel('x(t)');
    box off;
    xlim([min(t) max(t)]);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    %  2: La réponse indicielle (échelon unité)
    subplot(5,2,2);
    y = lsim(sys,unitstep,t); % Simulate the output of the system
    plot(t,ht,'g',t,y,'r');
    %plot(t,ht,'g');
    legend('h(t) : La réponse impulsionnelle','y(t): La sortie du système');
    title('La réponse indicielle');
    ylabel('y(t)');
    box off;
    xlim([min(t) max(t)]);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %  3: Le Dirac
    subplot(5,2,3);
    plot(t,dirac_function(t));
    title('La représentation graphique du Dirac');
    ylabel('x(t)');
    box off;
    xlim([min(t) max(t)]);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %  4: La réponse au Dirac
    subplot(5,2,4);
    z = (t>0 & t<0.1)/0.1;
    y = lsim(sys,z,t); % Simulate the output of the system
    plot(t,ht,'g',t,y,'r');
    legend('h(t) : La réponse impulsionnelle','y(t): La sortie du système');
    title('La réponse au Dirac');
    ylabel('y(t)');
    box off;
    xlim([min(t) max(t)]);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %  5: le signal rampe 
    subplot(5,2,5);
    ramp = t.*unitstep; % the Ramp function 
    plot(t,ramp)
    title('La représentation graphique du signal rampe');
    ylabel('x(t)');
    box off;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    %  6: La réponse à une rampe 
    subplot(5,2,6);
    y = lsim(sys,ramp,t); % Simulate the output of the system
    plot(t,ht,'g',t,y,'r');
    legend('h(t) : La réponse impulsionnelle','y(t): La sortie du système');
    title('La réponse à une rampe');
    ylabel('y(t)');
    box off;
    xlim([min(t) max(t)]);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %  7: le signal parabole 
    subplot(5,2,7);
    quad = t.^2.*unitstep;% the Quad function (le signal parabole) 
    plot(t,quad);
    title('La représentation graphique du parabole');
    ylabel('x(t)');
    box off;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    %  8: La réponse à une parabole 
    subplot(5,2,8);
    y = lsim(sys,quad,t); % Simulate the output of the system
    plot(t,ht,'g',t,y,'r');
    legend('h(t) : La réponse impulsionnelle','y(t): La sortie du système');
    title('La réponse à une parabole');
    ylabel('y(t)');
    box off;
    xlim([min(t) max(t)]);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %  9: le signal sinusoidal 
    subplot(5,2,9);
    sinus = sin(t).*(t>=0);% la fonction sin(x) 
    plot(t,sinus);
    title('La représentation graphique du signal sinusoidal');
    ylabel('x(t)');
    box off;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    %  10: La réponse à une sinusoide
    subplot(5,2,10);
    y = lsim(sys,sinus,t); % Simulate the output of the system
    plot(t,ht,'g',t,y,'r');
    legend('h(t) : La réponse impulsionnelle','y(t): La sortie du système');
    title('La réponse à une sinusoide');
    ylabel('y(t)');
    box off;
    xlim([min(t) max(t)]);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    
    
    
    
    
    
    
    
    
    
    