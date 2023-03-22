l1=5; l2=5; range= 3; step=1; xg1=10; xg2=7; t=1;
while true
    for a = -range:step:range
        mx1=[0 5*sin(atan(a/8)+acos(sqrt(a*a+64)/10))];
        my1=[0 5*cos(atan(a/8)+acos(sqrt(a*a+64)/10))];
        leg1=plot(mx1,my1);
        hold on
        mx2=[5*sin(atan(a/8)+acos(sqrt(a*a+64)/10)),a];
        my2=[5*cos(atan(a/8)+acos(sqrt(a*a+64)/10)),8];
        leg1_2=plot(mx2,my2);
        hold on
        mx3=[-5 -5+5*sin(atan(a/8)-acos(sqrt(a*a+64)/10))];
        my3=[0 5*cos(atan(a/8)-acos(sqrt(a*a+64)/10))];
        leg2=plot(mx3,my3);
        hold on
        mx4=[-5+5*sin(atan(a/8)-acos(sqrt(a*a+64)/10)),a-5];
        my4=[5*cos(atan(a/8)-acos(sqrt(a*a+64)/10)),8];
        leg2_2=plot(mx4,my4);
        hold on
        
        
        body=rectangle('Position',[a-5 8 5 10]);
        hold on
        head=rectangle('Position',[a-5 20 5 6],'Curvature',[1 1]);
        hold on
        neck=rectangle('Position',[a-2.5 18 1 2]); 
        hold on

        
        mx7=[a a+5*sin(atan(a/8)+acos(sqrt(a*a+64)/10))];
        my7=[18 18+5*cos(atan(a/8)+acos(sqrt(a*a+64)/10))];
        hand1=plot(mx7,my7);
        hold on
        mx8=[a+5*sin(atan(a/8)+acos(sqrt(a*a+64)/10)),0];
        my8=[18+5*cos(atan(a/8)+acos(sqrt(a*a+64)/10)),17];
        hand1_2=plot(mx8,my8);
        hold on
        
        mx9=[a-5 a-5+5*sin(atan(a/8)-acos(sqrt(a*a+64)/10))];
        my9=[18 18+5*cos(atan(a/8)-acos(sqrt(a*a+64)/10))];
        hand2_1=plot(mx9,my9);
        hold on
        mx10=[a-5+5*sin(atan(a/8)-acos(sqrt(a*a+64)/10)),-5];
        my10=[18+5*cos(atan(a/8)-acos(sqrt(a*a+64)/10)),17];
        hand2_2=plot(mx10,my10);
        
       
      
        axis([-15 10 -2 35]);
        pause(0.05);
        
        
        delete(leg1);
        delete(leg1_2);
        delete(leg2);
        delete(leg2_2);
       
        delete(head);
        delete(body);
        delete(neck);
        
        delete(hand1);
        delete(hand1_2);
        delete(hand2_1);
        delete(hand2_2);

    end
    xg1=5-xg1;
    xg2=5-xg2;
    range=-range;
    step=-step;
    t=-t;
end