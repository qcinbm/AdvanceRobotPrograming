% initial position.
global center L1 L2 Length Width Rootpoint Endpoint angle_set Midpoint;

center = [0, 0, 10];
L1 = 38;
L2 = 60;
Length = 90;
Width = 30;

array_axis = [-80 100 -100  200 -10 80];

axis(array_axis);
Rootpoint =     [center + [-Width/2, Length/2,0];
                center + [Width/2, Length/2,0];
                center + [-Width/2, 0,0];
                center + [Width/2, 0,0];
                center + [-Width/2, -Length/2,0];
                center + [Width/2, -Length/2,0]];


Endpoint =      [[Rootpoint(1,1) - 40, Rootpoint(1,2), 0];
                [Rootpoint(2,1)+ 40, Rootpoint(2,2), 0];
                [Rootpoint(3,1) - 40, Rootpoint(3,2), 0];
                [Rootpoint(4,1)+ 40, Rootpoint(4,2), 0];
                [Rootpoint(5,1) - 40, Rootpoint(5,2), 0];
                [Rootpoint(6,1)+ 40, Rootpoint(6,2), 0]];


update();

for t = 0:1.5:120
    Rootpoint = [center + [-Width/2, Length/2,0];
                center + [Width/2, Length/2,0];
                center + [-Width/2, 0,0];
                center + [Width/2, 0,0];
                center + [-Width/2, -Length/2,0];
                center + [Width/2, -Length/2,0]];
    
    update();
    % Calculate midpoint

    y_diff =    [abs(Rootpoint(1,2) - Endpoint(1,2)),
                abs(Rootpoint(2,2) - Endpoint(2,2)),
                abs(Rootpoint(3,2) - Endpoint(3,2)),
                abs(Rootpoint(4,2) - Endpoint(4,2)),
                abs(Rootpoint(5,2) - Endpoint(5,2)),
                abs(Rootpoint(6,2) - Endpoint(6,2))];
    % plot rootpoints
    plot3([Rootpoint(1, 1) Rootpoint(2, 1)], [Rootpoint(1, 2) Rootpoint(2, 2)], [Rootpoint(1, 3) Rootpoint(2, 3)], 'color', 'r');
    hold on
    grid on
    plot3([Rootpoint(2, 1) Rootpoint(6, 1)], [Rootpoint(2, 2) Rootpoint(6, 2)], [Rootpoint(2, 3) Rootpoint(6, 3)], 'color', 'r');
    hold on
    grid on
    plot3([Rootpoint(6, 1) Rootpoint(5, 1)], [Rootpoint(6, 2) Rootpoint(5, 2)], [Rootpoint(6, 3) Rootpoint(5, 3)], 'color', 'r');
    hold on
    grid on
    plot3([Rootpoint(5, 1) Rootpoint(1, 1)], [Rootpoint(5, 2) Rootpoint(1, 2)], [Rootpoint(5, 3) Rootpoint(1, 3)], 'color', 'r');
    hold on
    grid on
    axis(array_axis)
    % Plot 6 legs
    for i = 1:6
        plot_leg(Rootpoint(i, :), Midpoint(i, :), Endpoint(i,:), 'b');
    end

    axis(array_axis);

    pause(0.05)


    % Set 1 of legs.
    if (y_diff(1) > 15)
        plot_leg(Rootpoint(1, :), Midpoint(1, :), Endpoint(1,:), 'w');
        plot_leg(Rootpoint(4, :), Midpoint(4, :), Endpoint(4,:), 'w');
        plot_leg(Rootpoint(5, :), Midpoint(5, :), Endpoint(5,:), 'w');
        for j = 1:6
            Endpoint(1,3) = Endpoint(1,3) + 0.5;
            Endpoint(4,3) = Endpoint(4,3) + 0.5;
            Endpoint(5,3) = Endpoint(5,3) + 0.5;
            update();
            
            o1 = plot_leg(Rootpoint(1, :), Midpoint(1, :), Endpoint(1,:), 'b');
            o2 = plot_leg(Rootpoint(4, :), Midpoint(4, :), Endpoint(4,:), 'b');
            o3 = plot_leg(Rootpoint(5, :), Midpoint(5, :), Endpoint(5,:), 'b');
            %grid on
            axis(array_axis)
            pause(0.05)

            delete(o1);
            delete(o2);
            delete(o3);
        end

        for i = 1:20
            Endpoint(1,2) = Endpoint(1,2) + 0.5;
            Endpoint(4,2) = Endpoint(4,2) + 0.5;
            Endpoint(5,2) = Endpoint(5,2) + 0.5;
            update();
            o1 = plot_leg(Rootpoint(1, :), Midpoint(1, :), Endpoint(1,:), 'b');
            o2 = plot_leg(Rootpoint(4, :), Midpoint(4, :), Endpoint(4,:), 'b');
            o3 = plot_leg(Rootpoint(5, :), Midpoint(5, :), Endpoint(5,:), 'b');
            axis(array_axis)
            pause(0.05)

            delete(o1);
            delete(o2);
            delete(o3);
        end

        for j = 1:6
            Endpoint(1,3) = Endpoint(1,3) - 0.5;
            Endpoint(4,3) = Endpoint(4,3) - 0.5;
            Endpoint(5,3) = Endpoint(5,3) - 0.5;
            update();
            o1 = plot_leg(Rootpoint(1, :), Midpoint(1, :), Endpoint(1,:), 'b');
            o2 = plot_leg(Rootpoint(4, :), Midpoint(4, :), Endpoint(4,:), 'b');
            o3 = plot_leg(Rootpoint(5, :), Midpoint(5, :), Endpoint(5,:), 'b');
            axis(array_axis)
            pause(0.05)

            delete(o1);
            delete(o2);
            delete(o3);            
        end

    % Set 2 of legs.
    elseif(y_diff(2) > 10)
        plot_leg(Rootpoint(2, :), Midpoint(2, :), Endpoint(2,:), 'w');
        plot_leg(Rootpoint(3, :), Midpoint(3, :), Endpoint(3,:), 'w');
        plot_leg(Rootpoint(6, :), Midpoint(6, :), Endpoint(6,:), 'w');
        for j = 1:6
            Endpoint(2,3) = Endpoint(2,3) + 0.5;
            Endpoint(3,3) = Endpoint(3,3) + 0.5;
            Endpoint(6,3) = Endpoint(6,3) + 0.5;
            update();
            
            o4 = plot_leg(Rootpoint(2, :), Midpoint(2, :), Endpoint(2,:), 'b');
            o5 = plot_leg(Rootpoint(3, :), Midpoint(3, :), Endpoint(3,:), 'b');
            o6 = plot_leg(Rootpoint(6, :), Midpoint(6, :), Endpoint(6,:), 'b');
            grid on
            axis(array_axis)
            pause(0.05);
            delete(o4);
            delete(o5);
            delete(o6);
        end

        for i = 1:20
            Endpoint(2,2) = Endpoint(2,2) + 0.5;
            Endpoint(3,2) = Endpoint(3,2) + 0.5;
            Endpoint(6,2) = Endpoint(6,2) + 0.5;
            update();
            
            o4 = plot_leg(Rootpoint(2, :), Midpoint(2, :), Endpoint(2,:), 'b');
            o5 = plot_leg(Rootpoint(3, :), Midpoint(3, :), Endpoint(3,:), 'b');
            o6 = plot_leg(Rootpoint(6, :), Midpoint(6, :), Endpoint(6,:), 'b');
            axis(array_axis)
            grid on
            pause(0.05);
            delete(o4);
            delete(o5);
            delete(o6);
        end

        for j = 1:6
            Endpoint(2,3) = Endpoint(2,3) - 0.5;
            Endpoint(3,3) = Endpoint(3,3) - 0.5;
            Endpoint(6,3) = Endpoint(6,3) - 0.5;
            update();

            o4 = plot_leg(Rootpoint(2, :), Midpoint(2, :), Endpoint(2,:), 'b');
            o5 = plot_leg(Rootpoint(3, :), Midpoint(3, :), Endpoint(3,:), 'b');
            o6 = plot_leg(Rootpoint(6, :), Midpoint(6, :), Endpoint(6,:), 'b');
            grid on
            axis(array_axis)
            pause(0.05);
            delete(o4);
            delete(o5);
            delete(o6);
        end
    end
    

    pause(0.05)
    
    plot3([Rootpoint(1, 1) Rootpoint(2, 1)], [Rootpoint(1, 2) Rootpoint(2, 2)], [Rootpoint(1, 3) Rootpoint(2, 3)], 'color', 'w');
    hold on
    plot3([Rootpoint(2, 1) Rootpoint(6, 1)], [Rootpoint(2, 2) Rootpoint(6, 2)], [Rootpoint(2, 3) Rootpoint(6, 3)], 'color', 'w');
    hold on
    plot3([Rootpoint(6, 1) Rootpoint(5, 1)], [Rootpoint(6, 2) Rootpoint(5, 2)], [Rootpoint(6, 3) Rootpoint(5, 3)], 'color', 'w');
    hold on
    plot3([Rootpoint(5, 1) Rootpoint(1, 1)], [Rootpoint(5, 2) Rootpoint(1, 2)], [Rootpoint(5, 3) Rootpoint(1, 3)], 'color', 'w');
    hold on
    
    for i = 1:6
        plot_leg(Rootpoint(i, :), Midpoint(i, :), Endpoint(i,:), 'w');
    end
    axis(array_axis)

    center = [0, t, 10];
    
    hold off
end

function output = angle_calculator(rootpoint, endpoint)
    global L1 L2;
    Px = endpoint(1);
    Py = endpoint(2);
    Pz = endpoint(3);
    
    x = rootpoint(1);
    y = rootpoint(2);
    z = rootpoint(3);
    
    t1 = atan2(Py - y, Px -x);
    
    A = (Px - x)/cos(t1);
    B = Pz - z;
    c3 = (A^2 + B^2 - L1 - L2)/(2*L1*L2);
    s3 = sqrt(abs(1 - c3^2));
    t3 = atan2(s3, c3);
    
    s2 = -A*(L2*sin(t3)) - B*(L1 + L2*cos(t3));
    c2 = A*(L1 + L2*cos(t3)) - B*(L2*sin(t3));
    t2 = atan2(s2, c2);
    output = [t1, t2, t3];
end

function out = plot_leg(start_point, mid_point, end_point, color)
    a = plot3([start_point(1) mid_point(1)], [start_point(2) mid_point(2)], [start_point(3) mid_point(3)], 'color', color);
    hold on
    grid on
    b = plot3([mid_point(1) end_point(1)], [mid_point(2) end_point(2)], [mid_point(3) end_point(3)], 'color', color);
    hold on
    grid on
    out = [a b];
end

function update(~)
    global angle_set Midpoint Rootpoint Endpoint L1;
    angle_set =     [[angle_calculator(Rootpoint(1, :), Endpoint(1, :))];
                    [angle_calculator(Rootpoint(2, :), Endpoint(2, :))];
                    [angle_calculator(Rootpoint(3, :), Endpoint(3, :))];
                    [angle_calculator(Rootpoint(4, :), Endpoint(4, :))];
                    [angle_calculator(Rootpoint(5, :), Endpoint(5, :))];
                    [angle_calculator(Rootpoint(6, :), Endpoint(6, :))]];


    Midpoint =      [[Rootpoint(1,1) + L1*cos(angle_set(1,1))*cos(angle_set(1,2)), Rootpoint(1,2) + L1*sin(angle_set(1,1))*cos(angle_set(1,2)), Rootpoint(1,3) - L1*sin(angle_set(1,2))];
    [Rootpoint(2,1) + L1*cos(angle_set(2,1))*cos(angle_set(2,2)), Rootpoint(2,2) + L1*sin(angle_set(2,1))*cos(angle_set(2,2)),Rootpoint(2,3) - L1*sin(angle_set(2,2))];
    [Rootpoint(3,1) + L1*cos(angle_set(3,1))*cos(angle_set(3,2)),Rootpoint(3,2) + L1*sin(angle_set(3,1))*cos(angle_set(3,2)),Rootpoint(3,3) - L1*sin(angle_set(3,2))];
    [Rootpoint(4,1) + L1*cos(angle_set(4,1))*cos(angle_set(4,2)),Rootpoint(4,2) + L1*sin(angle_set(4,1))*cos(angle_set(4,2)),Rootpoint(4,3) - L1*sin(angle_set(4,2))];
    [Rootpoint(5,1) + L1*cos(angle_set(5,1))*cos(angle_set(5,2)),Rootpoint(5,2) + L1*sin(angle_set(5,1))*cos(angle_set(5,2)),Rootpoint(5,3) - L1*sin(angle_set(5,2))];
    [Rootpoint(6,1) + L1*cos(angle_set(6,1))*cos(angle_set(6,2)),Rootpoint(6,2) + L1*sin(angle_set(6,1))*cos(angle_set(6,2)),Rootpoint(6,3) - L1*sin(angle_set(6,2))]];
end