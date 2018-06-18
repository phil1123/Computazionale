function qms1d
% QMS1D Quantum Mechanics Simulator in 1 Dimension (QMS1D).
% Version 1.0 
% CONVENTIONS
% m = h = c = 1

% CREATE THE INTERFACE OF THE PROGRAM -------------------------------------
qms1d_int = figure('Name', 'QMS1D v1.0', ...        % Name
                   'IntegerHandle', 'off', ...
                   'MenuBar' , 'none', ...          % Disable the MenuBar
                   'Visible', 'off', ...             % Disable the Resize of the window
                   'Position',[800,200,900,700]);   % Set the position
               
% Construct the bottoms of the program
% INFO PROGRAM ------------------------------------------------------------
qms1d_info = uicontrol('Style', 'Text', ...
                       'String', 'QMS1D v1.0', ...
                       'FontSize', 20, ...
                       'Position', [20, 640, 80, 45]);

% POTENTIAL CONTROL -------------------------------------------------------
qms1d_text_potential = uicontrol('Style', 'text', ...
                                 'String', 'Potential V(x)', ...
                                 'FontSize', 12, ...
                                 'FontWeight', 'bold', ...
                                 'Position', [20, 600, 90, 25]);
                             
% Set the infromation buttons for the potential
% Set Max and Min of the axis
qms1d_potential_m = uicontrol('Style', 'edit', ...
                              'Position', [45, 587, 30, 20], ...
                              'Callback', @set_min_Callback);
qms1d_text_p_max_min = uicontrol('Style', 'text', ...
                                 'String', ' < x < ', ...
                                 'FontSize', 10, ...
                                 'Position', [40, 580, 40, 25]);                          
qms1d_potential_M = uicontrol('Style', 'edit', ...
                              'Position', [115, 587, 30, 20], ...
                              'Callback', @set_max_Callback);
                          
% Set the formula
qms1d_potential_formula = uicontrol('Style', 'text', ...
                                    'String', 'Formula', ...
                                    'FontSize', 10, ...
                                    'Position', [20, 555, 70, 25]);
qms1d_potential = uicontrol('Style', 'edit', ...
                            'Position', [40, 545, 120, 20], ...
                            'Callback', @set_potential_Callback);
% Scale factor
qms1d_potential_scale = uicontrol('Style', 'text', ...
                                 'String', 'Scale factor K: 1', ...
                                 'FontSize', 10, ...
                                 'Position', [20, 498, 150, 45]);
qms1d_potential_info = uicontrol('Style', 'text', ...
                                 'String', {'IMPORTANT', 'See potential.txt for infomation.'}, ...
                                 'FontSize', 10, ...
                                 'Position', [20, 483, 100, 45]);
                             
% PSI CONTROL -------------------------------------------------------------
qms1d_text_psi = uicontrol('Style', 'text', ...
                           'String', 'Psi(x)', ...
                           'FontSize', 12, ...
                           'FontWeight', 'bold', ...
                           'Position', [20, 450, 90, 25]);
% Set the traslation x0
qms1d_psi_x0_text = uicontrol('Style', 'text', ...
                         'String', 'Translate psi by:', ...
                         'Position', [20, 438, 120, 20]);
                     
qms1d_psi_x0 = uicontrol('Style', 'edit', ...
                         'Position', [125, 440, 25, 20], ...
                         'Callback', @set_psi_x0_Callback);
% Set the psi view (Re(psi), Im(psi) os ||psi||^2 so the probability
qms1d_psi_view_text = uicontrol('Style', 'text', ...
                                'String', 'Psi View', ...
                                'FontSize', 12, ...
                                'Position', [20, 418, 120, 20]);
qms1d_psi_view = uicontrol('Style', 'popupmenu', ...
                           'String', {'Probability', 'Real Part','Img Part'}, ...
                           'Position', [20, 400, 120, 20], ...
                           'Callback', @set_psi_view);

% SIMULATION CONTROLS -----------------------------------------------------
qms1d_text_sim = uicontrol('Style', 'text', ...
                           'String', 'Simulation', ...
                           'FontSize', 12, ...
                           'FontWeight', 'bold', ...
                           'Position', [20, 360, 90, 25]);
qms1d_sim_start_stop = uicontrol('Style', 'togglebutton', ...
                                 'String', 'Start', ...
                                 'Position' , [20, 345, 120, 20], ...
                                 'Callback', @start_stop_sim);
% Reset to initial value the psi so it put psi(t) = psi(0)                             
qms1d_sim_reset = uicontrol('Style', 'pushbutton', ...
                              'String', 'Reset', ...
                              'Position' , [20, 320, 120, 20], ...
                              'Callback', @reset_sim);                             
qms1d_time = uicontrol('Style', 'text', ...
                       'String', 'Time t = 0 s', ...
                       'FontSize', 12, ...
                       'Position', [20, 290, 90, 25]);                             

% EIGENVALUES AND EIGENFUNCTIONS CONTROLS (EAE) ---------------------------
qms1d_text_eae = uicontrol('Style', 'text', ...
                           'String', 'Eigenvalues and Eigenfunctions', ...
                           'FontSize', 12, ...
                           'FontWeight', 'bold', ...
                           'Position', [20, 265, 120, 25]);
% Active the eae evaluation
qms1d_aea_evaluate = uicontrol('Style', 'togglebutton', ...
                               'String', 'Evaluate', ...
                               'Position' , [20, 240, 120, 20], ...
                               'Callback', @evaluate_eae);
% Control to swich the eigenvalues
qms1d_eigv_text = uicontrol('Style', 'text', ...
                            'String', 'E(n):', ...
                            'FontSize', 12, ...
                            'Position', [30, 205, 30, 25]);
qms1d_eigv_prev = uicontrol('Style', 'pushbutton', ...
                            'String', ' < ', ...
                            'Enable', 'off', ... % by default must be off
                            'Position' , [65, 212, 30, 20], ...
                            'Callback', @eigv_prev);
qms1d_eigv_num = uicontrol('Style', 'text', ...
                           'Visible', 'off', ...
                           'String', '1', ...
                           'HorizontalAlignment', 'center', ...
                           'FontSize', 12, ...
                           'Position', [100, 205, 25, 25]);
qms1d_eigv_next = uicontrol('Style', 'pushbutton', ...
                            'String', ' > ', ...
                            'Enable', 'off', ... % by default must be off
                            'Position' , [130, 212, 30, 20], ...
                            'Callback', @eigv_next);
% Set the scale factor for the psi_e
qms1d_psie_scale_text = uicontrol('Style', 'text', ...
                                  'String', {'Scale factor for', 'Psi_n(x)'}, ...
                                  'FontSize', 10, ...
                                  'Position', [20, 180, 100, 25]);
qms1d_psie_scale = uicontrol('Style', 'edit', ...
                             'String', '1', ...
                             'Enable', 'off', ... % by default must be off
                             'Position', [120, 180, 30, 25], ...
                             'Callback', @psie_scale);
% Set PLOT TYPE (Eigv or Eigf)
qms1d_aea_plot_text = uicontrol('Style', 'text', ...
                                'String', 'Plot Type', ...
                                'FontSize', 12, ...
                                'Position', [30, 150, 100, 25]);
qms1d_aea_plot = uicontrol('Style', 'togglebutton', ...
                           'String', 'Eigenvalues', ...
                           'Enable', 'off', ... % by default must be off
                           'Value', 0, ...      % eigf plot
                           'Position' , [20, 137, 120, 20], ...
                           'Callback', @aea_plot_Callback);

% PLOT --------------------------------------------------------------------
qms1d_axes = axes('Units', 'pixels', ...            
                  'XGrid', 'on', ...            % Display the x-grids
                  'YGrid', 'on', ...            % Display the y-grids
                  'Position',[200,60,680,590]); 
                                         
% Align the bottons                             
align([qms1d_info, ...
       qms1d_text_potential, ...
       qms1d_text_p_max_min, ...
       qms1d_potential_formula, ...
       qms1d_potential, ...
       qms1d_potential_scale, ...
       qms1d_text_psi, ...
       qms1d_psi_view_text, ...
       qms1d_psi_view, ...
       qms1d_text_sim, ...
       qms1d_sim_start_stop, ...
       qms1d_sim_reset, ...
       qms1d_time, ...
       qms1d_text_eae, ...
       qms1d_aea_evaluate, ...
       qms1d_aea_plot_text, ...
       qms1d_aea_plot, ...
       qms1d_potential_info],'Center','None');

% Make the uicontrols resize when resize the window
qms1d_int.Units = 'normalized';
qms1d_info.Units = 'normalized';
qms1d_text_potential.Units = 'normalized';
qms1d_potential_m.Units = 'normalized';
qms1d_text_p_max_min.Units = 'normalized';
qms1d_potential_M.Units = 'normalized';
qms1d_potential_formula.Units = 'normalized';
qms1d_potential.Units = 'normalized';
qms1d_potential_scale.Units = 'normalized';
qms1d_potential_info.Units = 'normalized';
qms1d_text_psi.Units = 'normalized';
qms1d_psi_x0_text.Units = 'normalized';
qms1d_psi_x0.Units = 'normalized';
qms1d_psi_view_text.Units = 'normalized';
qms1d_psi_view.Units = 'normalized';
qms1d_text_sim.Units = 'normalized';
qms1d_sim_start_stop.Units = 'normalized';
qms1d_sim_reset.Units = 'normalized';
qms1d_time.Units = 'normalized';
qms1d_text_eae.Units = 'normalized';
qms1d_aea_evaluate.Units = 'normalized';
qms1d_eigv_text.Units = 'normalized';
qms1d_eigv_prev.Units = 'normalized';
qms1d_eigv_num.Units = 'normalized';
qms1d_eigv_next.Units = 'normalized';
qms1d_psie_scale_text.Units = 'normalized';
qms1d_psie_scale.Units = 'normalized';
qms1d_aea_plot_text.Units = 'normalized';
qms1d_aea_plot.Units = 'normalized';
qms1d_axes.Units = 'normalized';

% DEFINE DEFAULT INFROMATION OF THE PROGRAM -------------------------------
N = 2048;   % By default 2048
% NOTE 1
% N is the number of subinterval in which the program will divide the
% interval [MIN MAX], it is very important to set N to be a power of a
% small prime, for example 2048 or 1048. Because the program will use
% the finite fourier transform and to get the best efficenty it must be a
% power of a small prime.
% NOTE 2
% See error_eigv.m form information about the error of the eigenvalues.
tau = 0.01;
t_ = 0;     % Time
% Set the tau in the simpletic alghoritm, by default it is set to 0.01 but
% it can be changed to another value that it is small.

% SET POTENTIAL -----------------------------------------------------------
% By default the program will plot the HARMONIC OSCILLATOR in 1D
% Important values that indicate the ends of the interval
MIN = -8;
MAX = 8;
% Grid in which the interval is divided
x = linspace(MIN, MAX, N);
% Set  the space between two consecutive points
a = x(2) - x(1);
% Define the potential (by default is x.^2/2)
% NOTE : The potential is a hendle function.
V = @(x) x.^2/2;
% Define the plot of the potential in QMS1D and plot it
qms1d_potential_plot = plot(qms1d_axes, x, V(x), '--r');
% Set the title and the axis' name
title(qms1d_axes, 'Plot the evolution of a wavepocket in time');
xlabel(qms1d_axes, 'x');
% Active the grid and hold on
grid(qms1d_axes, 'on');
hold on

% SET WAVEPOCKET ----------------------------------------------------------
% Define the wavepocket
% CONVENTION: the program use a GAUSSIAN wavepocket
x0 = 1;     % Translate the function by x0
psi = psi_wp(x, x0, a);
% Define the CURRENT VIEW OPTION of psi, it can be ONLY 'real', 'img', 'prob'
CURRENT_VIEW = 'prob';  % By default the program plot the probability
% Define the plot for the psi in QMS1D and plot it
qms1d_psi_plot = plot(qms1d_axes, x, psi_view(psi, CURRENT_VIEW));

% SET THE DEFALUT INFORMARTION IN THE BOTTONS -----------------------------
qms1d_potential_m.String = num2str(MIN);
qms1d_potential_M.String = num2str(MAX);
qms1d_potential.String = 'x.^2/2';
qms1d_psi_x0.String = num2str(x0);

% SET EIGENFUNCTION AND EIGENVALUES VARIABLE (AEA) ------------------------
psi_E = eye(N);     % Eigenfunctions container.
E = eye(N);         % Eigenvalues container.
CURRENT_E = 1;      % Set by default to 1 and it indicate the value of the 
                    % eigenvalue to visualize in the program.
PSIE_SCALE = 1;     % By Default it is set to 1.

% Define the plot of the eigenvalues in the eigenfunctions plot
qms1d_E_plot = plot(qms1d_axes, [x(1) x(end)], [0 0], '-.', 'Color', [1 0.6 0.2]);
set(qms1d_E_plot, 'Visible', 'off');    % Disable it for the simulation

% Set if the AEA MODE is on or off
AEA_MODE = 0;   % 0 = off, 1 = on.

% Set the plot type (Eigv or Eigf)
% By DEFAULT when click on Evaluate Botton plot the Eigenfunctions plot 
AEA_PLOT = 0;   % 0 = eigenfunction, 1 = eigenfunction

% Define the plot of eigenvalue (n, E(n))
qms1d_NvsE_plot = plot(qms1d_axes, 0, 0, '.', 'MarkerSize', 20);
set(qms1d_NvsE_plot, 'Visible', 'off');    % Disable it for the simulation

% Set the legend of the program
qms1d_legend = legend(qms1d_axes, 'V(x)', '\psi(x)','');
qms1d_legend.FontSize = 15;

% Make all visible
qms1d_int.Visible = 'on';

% DEFINE THE PROGRAM FUNCTIONS --------------------------------------------
    function set_min_Callback(data, eventdata)
        % Set the MIN value
        MIN_ = str2double(get(data,'String'));
        
        % Check if MIN_ is NOT MAX < MIN_, the program doesn't change
        % anything if MAX < MIN_
        if MIN_ < MAX   % So can be used
            % Check if the potential can be used in the algorithm with the new MIN,
            % if is not the program doesn't change the MIN
            % (Watch the function check_V to see when the potential can't be used in the program)
            if check_V(V, MIN_, MAX, N, tau)
                MIN = MIN_;
            end
        end 
        
        % Replot with new MIN
        x = linspace(MIN, MAX, N);
        % Reset a and psi
        a = x(2) - x(1);
        psi = psi_wp(x, x0, a);
        % Replot and reset the axes
        xlim(qms1d_axes, [MIN MAX]);
        set(qms1d_potential_plot, 'XData', x, 'YData', V(x));
        set(qms1d_psi_plot, 'XData', x, 'YData', psi_view(psi, CURRENT_VIEW));
    end

    function set_max_Callback(data, eventdata)
        % Set the MAX value
        MAX_ = str2double(get(data,'String'));
        
        % Check if MAX_ is NOT MAX_ < MIN, the program doesn't change
        % anything if MAX_ < MIN
        if MAX_ > MIN
            % Check if the potential can be used in the algorithm with the new MAX,
            % if is not the program doesn't change the MAX
            % (Watch the function check_V to see when the potential can't be used in the program)
            if check_V(V, MIN, MAX_, N, tau)
                MAX = MAX_;
            end
        end 
        
        % Replot with new MAX
        x = linspace(MIN, MAX, N);
        % Reset a and psi
        a = x(2) - x(1);
        psi = psi_wp(x, x0, a);
        % Replot and reset the axes
        xlim(qms1d_axes, [MIN MAX]);
        set(qms1d_potential_plot, 'XData', x, 'YData', V(x));
        set(qms1d_psi_plot, 'XData', x, 'YData', psi_view(psi, CURRENT_VIEW));
    end

    function set_potential_Callback(data, eventdata)
        % Set a NEW POTENTIAL
        p_ = get(data, 'String');
        % Check if the potential is write with x variable otherwise it
        % doesen't change
        if ~isempty(strfind(p_, 'x'))
            p_ = strcat('@(x) ', p_);
            V = str2func(p_);
        end
        
        % Check if the potential can be used in the algorithm, if is not
        % the program doesn't change the potential
        % (Watch the function check_V to see when the potential can't be used in the program) 
        if check_V(V, MIN, MAX, N, tau)
            set(qms1d_potential_plot, 'YData', V(x));
        end
    end

    function set_psi_x0_Callback(data, eventdata)
        % Set the x0 value to translate the function psi
        x0_ = str2double(get(data,'String'));
        % Check if x0 is in the interval [MIN MAX], if it is not x0
        % doesen't change.
        if x0_ < MAX && x0_ > MIN
            x0 = x0_;
            % Recreate and replot psi
            psi = psi_wp(x, x0, a);
            set(qms1d_psi_plot, 'YData', psi_view(psi, CURRENT_VIEW));
        end
    end

    function set_psi_view(data ,eventdata)
        % Change the view of the psi and plot it
        view_ = data.String;
        n = data.Value;
        
        % Set the view
        switch view_{n}
            case 'Probability'
                % According to the Quantum Mechanics, the interpretation of
                % the wavepocket is that its mudulo squared is the
                % probability to find the particle in that point.
                CURRENT_VIEW = 'prob';
            case 'Real Part'
                CURRENT_VIEW = 'real';
            case 'Img Part'
                CURRENT_VIEW = 'img';
        end
        
        % Replot it and check if the aea mode is on
        if AEA_MODE
        	set(qms1d_psi_plot, 'YData', psi_view(psi, CURRENT_VIEW) + E(CURRENT_E));
        else
        	set(qms1d_psi_plot, 'YData', psi_view(psi, CURRENT_VIEW));
        end
    end

    function start_stop_sim(data ,eventdata)
        % SIMULATION FUNCTION
        % Generate the time evolution of psi in a potential V
        % Create the psi(t) and use psi(0) = psi
        psi_t = psi;
        
        % Disable all the bottons during the simulation
        qms1d_potential_m.Enable = 'off';
        qms1d_potential_M.Enable = 'off';
        qms1d_potential.Enable = 'off';
        qms1d_psi_x0.Enable = 'off';
        qms1d_psi_view.Enable = 'off';
        qms1d_sim_reset.Enable = 'off';
        qms1d_aea_evaluate.Enable = 'off';
        
        % Start and Stop botton in simulation
        if get(qms1d_sim_start_stop, 'Value')
            qms1d_sim_start_stop.String = 'Stop';
        else
            qms1d_sim_start_stop.String = 'Start';
        end
        
        k = (2/a)*sin(pi/N*(0:N-1));
        % Set the eigenvalues of the laplacian matrix writes in 1D as a tridiagonal
        % matrix, with the Diriclet boundary contition.
        
        while get(qms1d_sim_start_stop, 'Value') == 1
            % Until the Stop button is pressed the cycle continues
            
            % Evaluate the evolution of psi in the time t + tau
            psi_t = exp(-1i*tau*V(x)/2).*psi_t;
            % To minimize the computing time, note that in the Fourier
            % space the Laplacian matrix is diagonal because its
            % eigenfuntions are the exp(i*k), and the elements on the
            % diagonal are the values 'k' which are the eigenvalues, so the
            % program take the fourier transform of psi_t and evaluate the
            % product exp(-1i*tau*k.^2/2).*fft(psi_t) and finally returns
            % in the space of x usinf the inversion formula.
            psi_t = ifft( exp(-1i*tau*k.^2/2).*fft(psi_t) );
            psi_t = exp(-1i*tau*V(x)/2).*psi_t; 
            
            % Plot it
            set(qms1d_psi_plot, 'YData', psi_view(psi_t, CURRENT_VIEW));
            % Encrese the time and change it in the window
            t_ = t_ + tau;
            qms1d_time.String = strcat('Time t = ', num2str(t_), ' s');
            pause(0.005);
        end
        
        psi = psi_t;
        
        % Enable the bottons
        qms1d_potential_m.Enable = 'on';
        qms1d_potential_M.Enable = 'on';
        qms1d_potential.Enable = 'on';
        qms1d_psi_x0.Enable = 'on';
        qms1d_psi_view.Enable = 'on';
        qms1d_sim_reset.Enable = 'on';
        qms1d_aea_evaluate.Enable = 'on';
    end

    function reset_sim(data ,eventdata)
        % Reset the wave pocket to the initial condition, so at t = 0.
        psi = psi_wp(x, x0, a);
        % Set time to 0
        t_ = 0;
        qms1d_time.String = strcat('Time t = ', num2str(t_), ' s');
        % Replot the psi
        set(qms1d_psi_plot, 'YData', psi_view(psi, CURRENT_VIEW));
    end

    function evaluate_eae(data ,eventdata)
        % Enter in the eae mode, so analyze the eigenvalues and the
        % eigenfunctions of a given V
        
        if get(qms1d_aea_evaluate, 'Value')
            % ENTER IN THE AEA MODE
            AEA_MODE = 1;
            qms1d_aea_evaluate.String = 'Return to Simulation';
            
            % Disable the simulation bottons
            qms1d_potential_m.Enable = 'off';
            qms1d_potential_M.Enable = 'off';
            qms1d_potential.Enable = 'off';
            qms1d_psi_x0.Enable = 'off';
            qms1d_sim_start_stop.Enable = 'off';
            qms1d_sim_reset.Enable = 'off';
            
            % Active the eae bottons
            qms1d_eigv_next.Enable = 'on'; % Only next because n = 1 by default
            qms1d_eigv_num.Visible = 'on';
            qms1d_psie_scale.Enable = 'on';
            qms1d_aea_plot.Enable = 'on';
            
            % Create the Hamiltonian and find its aigenvalues and
            % eigenfunctions, H is sparse
            H = -lap1D(N, a)/2 + sparse(diag(V(x)));
            % Set the option for the eigs function
            opts.tol = 1e-6;    % By default set the precision to 1e-6
            opts.isreal = 1;    % H is a real matrix
            opts.issym = 1;     % H is a symmetric matrix
            Num_Eig = 50;       % By DEFAULT the programm request to eigs
                                % function to compute 50 eigenvalues.
            [psi_E, E] = eigs(H, Num_Eig, 'SA', opts);
            E = diag(E);
            % Check if the eigv are sorted
            if ~issorted(E)
                [E,I] = sort(E);
                psi_E = psi_E(:,I);
            end
            
            % Set by DEFAULT to che eigenfunction 1
            % The program have to call eigv_prev function and automatically
            % it set all the options if CURRENT_E = 2
            CURRENT_E = 2;
            eigv_prev;
            % Active the E plot
            set(qms1d_E_plot, 'Visible', 'on')
            
            % Change title
            title(qms1d_axes, 'Plot of Eigenfunction at various E(n)');
        else
            qms1d_aea_evaluate.String = 'Evaluate';
            % EXIT FROM THE EVALUATE MODE
            AEA_MODE = 0;
            
            % Disable the eae bottons
            qms1d_eigv_next.Enable = 'off';
            qms1d_eigv_prev.Enable = 'off';
            qms1d_psie_scale.Enable = 'off';
            qms1d_psie_scale.String = '1';
            qms1d_eigv_num.String = '1';
            qms1d_eigv_num.Visible = 'off';
            qms1d_aea_plot.Enable = 'off';
            qms1d_aea_plot.Value = 0;
            qms1d_aea_plot.String = 'Eigenvalues';
            % Reset to n = 1 and scale to 1 and plot option
            CURRENT_E = 1;
            PSIE_SCALE = 1;
            AEA_PLOT = 0;
            
            % Anable the simulation bottons
            qms1d_potential_m.Enable = 'on';
            qms1d_potential_M.Enable = 'on';
            qms1d_potential.Enable = 'on';
            qms1d_psi_x0.Enable = 'on';
            qms1d_sim_start_stop.Enable = 'on';
            qms1d_sim_reset.Enable = 'on';
            
            % Reset to psi_0 and replot it
            reset_sim
            % Disable the eigenvalue plot
            set(qms1d_E_plot, 'Visible', 'off')
            % Reset the legend
            qms1d_legend.String = {'V(x)', '\psi(x)',''};
            % Reset title
            title(qms1d_axes, 'Plot the evolution of a wavepocket in time');
        end
        
    end

    function eigv_prev(data ,eventdata)
        % If pushed change to the eigenvalue n-1 and plot the eigenfunction
        % corrisponding to that eigenvalue.
        
        % If the program is on n = 2, the previous button must be disable.
        if CURRENT_E == 2
            qms1d_eigv_prev.Enable = 'off';
        end
        % Update the aigenvalue
        CURRENT_E = CURRENT_E - 1;
        qms1d_eigv_num.String = num2str(CURRENT_E);
        
        if ~AEA_PLOT
            % Eigenfuntions plot is ON
            % Plot the corrisponding eigenfunction
            psi = psi_E(:,CURRENT_E);
            set(qms1d_psi_plot, 'YData', psi_view(psi, CURRENT_VIEW) + E(CURRENT_E));
            % Display the eigenvalue on the plot
            set(qms1d_E_plot, 'YData', [E(CURRENT_E) E(CURRENT_E)]);
            % Reset the legend
            qms1d_legend.String = {'V(x)', strcat('\psi_{', num2str(CURRENT_E - 1), '}(x)'), ...
                                   strcat('E_{', num2str(CURRENT_E), '} = ', num2str(E(CURRENT_E)))};
        else
            % Eigenvalue plot is ON
            set(qms1d_NvsE_plot, 'XData', 1:CURRENT_E, 'YData', E(1:CURRENT_E));
            % Set axes
            xlim(qms1d_axes, [0 CURRENT_E+1]);
        end
    end

    function eigv_next(data ,eventdata)
        % If pushed change to the eigenvalue n+1 and plot the eigenfunction
        % corrisponding to that eigenvalue.
        
        % If is pushed when the program is visualizing n = 1, it enable the
        % previous eigenvalue botton
        if CURRENT_E == 1
            qms1d_eigv_prev.Enable = 'on';
        end
        % Update the aigenvalue
        CURRENT_E = CURRENT_E + 1;
        qms1d_eigv_num.String = num2str(CURRENT_E);
        
        if ~AEA_PLOT
            % Eigenfuntions plot is ON
            % Plot the corrisponging eigenfunction
            psi = psi_E(:,CURRENT_E);
            set(qms1d_psi_plot, 'YData', psi_view(psi, CURRENT_VIEW) + E(CURRENT_E));
            % Display the eigenvalue on the plot
            set(qms1d_E_plot, 'YData', [E(CURRENT_E) E(CURRENT_E)]);
            % Reset the legend
            qms1d_legend.String = {'V(x)', strcat('\psi_{', num2str(CURRENT_E - 1), '}(x)'), ...
                                   strcat('E_{', num2str(CURRENT_E), '} = ', num2str(E(CURRENT_E)))};
        else
            % Eigenvalue plot is ON
            set(qms1d_NvsE_plot, 'XData', 1:CURRENT_E, 'YData', E(1:CURRENT_E));
            % Set axes
            xlim(qms1d_axes, [0 CURRENT_E+1]);
        end
            
    end

    function psie_scale(data ,eventdata)
        % Set the Scale factor for the psi_E
        PSIE_SCALE_ = str2double(get(data,'String'));
        
        % Set a scale factor for every psi_e, so one don't rescale psi_e
        % every time, note that if there is a previous scale factor the
        % function has to remove it and use the new, so:
        K = PSIE_SCALE_/PSIE_SCALE;
        psi_E = K*psi_E;
        
        % Replot the current psi_e
        psi = K*psi;
        set(qms1d_psi_plot, 'YData', psi_view(psi, CURRENT_VIEW) + E(CURRENT_E));
        
        
        % Set the new scale factor
        PSIE_SCALE = PSIE_SCALE_;
    end

    function aea_plot_Callback(data, eventdata)
        % Swich from Eigenfuntions plot to Eigenvalues plot
        if get(qms1d_aea_plot, 'Value')
            qms1d_aea_plot.String = 'Eigenfunctions';
            % ENTER IN THE EIGENVALUES PLOT
            AEA_PLOT = 1;
            
            % Disable the potential and psi plot and the legend
            qms1d_potential_plot.Visible = 'off';
            qms1d_psi_plot.Visible = 'off';
            qms1d_E_plot.Visible = 'off';
            qms1d_legend.Visible = 'off';
            qms1d_psi_view.Enable = 'off';
            qms1d_psie_scale.Enable = 'off';
            qms1d_aea_evaluate.Enable = 'off';
            % Anable the NvsEn plot
            qms1d_NvsE_plot.Visible = 'on';
            % Change the title and the x,y axes
            title(qms1d_axes, 'Plot of Eigenvalues vs n');
            xlabel(qms1d_axes, 'n');
            ylabel(qms1d_axes, 'E(n)');
            
            % Set the DEFAULT plot of E(1)
            % The program have to call eigv_prev function and automatically
            % it set all the options if CURRENT_E = 2
            CURRENT_E = 2;
            eigv_prev;
        else
            qms1d_aea_plot.String = 'Eigenvalues';
            % ENTER IN THE EIGENFUNCTIONS PLOT
            AEA_PLOT = 0;
            
            % Disable the NvsEn plot
            qms1d_NvsE_plot.Visible = 'off';
            % Anable the potential and psi plot and the legend
            qms1d_potential_plot.Visible = 'on';
            qms1d_psi_plot.Visible = 'on';
            qms1d_E_plot.Visible = 'on';
            qms1d_legend.Visible = 'on';
            qms1d_psi_view.Enable = 'on';
            qms1d_psie_scale.Enable = 'on';
            qms1d_aea_evaluate.Enable = 'on';
            % Change the title and the x,y axes
            title(qms1d_axes, 'Plot of Eigenfunction at various E(n)');
            xlabel(qms1d_axes, 'x');
            ylabel(qms1d_axes, '');
            xlim(qms1d_axes, [MIN MAX]);
            
            % Set the DEFAULT plot of Psi_1
            % The program have to call eigv_prev function and automatically
            % it set all the options if CURRENT_E = 2
            CURRENT_E = 2;
            eigv_prev;
        end
    end
end

