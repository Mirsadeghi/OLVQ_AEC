function output = olvq_art_dataset(n)
% OLVQ Artificial dataset1
% This dataset generates acording to IJCNN 2011 papers with
% title "Pattern Classifiers with Adaptive Distances"
% Written by S.Ehsan Mirsadeghi
% Date: 7 February 2013
switch n
    case 1
%     class1
    Region1_c1_x = normrnd(139,sqrt(256),1,25);
    Region1_c1_y = normrnd(98,sqrt(900),1,25);
    
    Region2_c1_x = normrnd(132,sqrt(16),1,20);
    Region2_c1_y = normrnd(-43,sqrt(256),1,20);
    
    Region3_c1_x = normrnd(47,sqrt(900),1,30);
    Region3_c1_y = normrnd(35,sqrt(256),1,30);
    

    class1_temp = [Region1_c1_x Region2_c1_x Region3_c1_x;
                   Region1_c1_y Region2_c1_y Region3_c1_y];
    class1 = [class1_temp;ones(1,size(class1_temp,2))];      
%     class2
    Region1_c2_x = normrnd(291,sqrt(256),1,35);
    Region1_c2_y = normrnd(161,sqrt(256),1,35);
    
    Region2_c2_x = normrnd(185,sqrt(576),1,15);
    Region2_c2_y = normrnd(231,sqrt(484),1,15);
    
    Region3_c2_x = normrnd(402,sqrt(361),1,25);
    Region3_c2_y = normrnd(173,sqrt(625),1,25);
    
    class2_temp = [Region1_c2_x Region2_c2_x Region3_c2_x;
                   Region1_c2_y Region2_c2_y Region3_c2_y];
    class2 = [class2_temp;ones(1,size(class2_temp,2))+1];      
%     class3
    Region1_c3_x = normrnd(170,sqrt(784),1,40);
    Region1_c3_y = normrnd(-70,sqrt(289),1,40);
    
    Region2_c3_x = normrnd(450,sqrt(441),1,35);
    Region2_c3_y = normrnd(-10,sqrt(16),1,35);
    
    Region3_c3_x = normrnd(300,sqrt(576),1,30);
    Region3_c3_y = normrnd(173,sqrt(625),1,30);

    Region4_c3_x = normrnd(389,sqrt(81),1,25);
    Region4_c3_y = normrnd(-70,sqrt(900),1,25);
    
    class3_temp = [Region1_c3_x Region2_c3_x Region3_c3_x Region4_c3_x;
                   Region1_c3_y Region2_c3_y Region3_c3_y Region4_c3_y];
    class3 = [class3_temp;ones(1,size(class3_temp,2))+2];                     
   
%     class4
    Region1_c4_x = normrnd(360,sqrt(529),1,45);
    Region1_c4_y = normrnd(0,sqrt(1225),1,45);
    
    Region2_c4_x = normrnd(228,sqrt(1521),1,40);
    Region2_c4_y = normrnd(23,sqrt(144),1,40);
    
    Region3_c4_x = normrnd(421,sqrt(484),1,50);
    Region3_c4_y = normrnd(124,sqrt(361),1,50);

    Region4_c4_x = normrnd(304,sqrt(729),1,40);
    Region4_c4_y = normrnd(116,sqrt(16),1,40);
    
    Region5_c4_x = normrnd(200,sqrt(256),1,30);
    Region5_c4_y = normrnd(127,sqrt(1521),1,30);

    class4_temp = [Region1_c4_x Region2_c4_x Region3_c4_x Region4_c4_x Region5_c4_x;
                   Region1_c4_y Region2_c4_y Region3_c4_y Region4_c4_y Region5_c4_y];
    class4 = [class4_temp;ones(1,size(class4_temp,2))+3];                     

    output = [class1 class2 class3 class4];
    
    case 2
%     class1
    Region1_c1_x = normrnd(139,sqrt(256),1,25);
    Region1_c1_y = normrnd(98,sqrt(900),1,25);
    
    Region2_c1_x = normrnd(132,sqrt(16),1,20);
    Region2_c1_y = normrnd(-43,sqrt(256),1,20);
    
    Region3_c1_x = normrnd(525,sqrt(900),1,30);
    Region3_c1_y = normrnd(50,sqrt(256),1,30);
    

    class1_temp = [Region1_c1_x Region2_c1_x Region3_c1_x;
                   Region1_c1_y Region2_c1_y Region3_c1_y];
    class1 = [class1_temp;ones(1,size(class1_temp,2))];      
%     class2
    Region1_c2_x = normrnd(291,sqrt(256),1,35);
    Region1_c2_y = normrnd(161,sqrt(256),1,35);
    
    Region2_c2_x = normrnd(185,sqrt(576),1,15);
    Region2_c2_y = normrnd(231,sqrt(484),1,15);
    
    Region3_c2_x = normrnd(402,sqrt(361),1,25);
    Region3_c2_y = normrnd(133,sqrt(625),1,25);
    
    class2_temp = [Region1_c2_x Region2_c2_x Region3_c2_x;
                   Region1_c2_y Region2_c2_y Region3_c2_y];
    class2 = [class2_temp;ones(1,size(class2_temp,2))+1];      
%     class3
    Region1_c3_x = normrnd(170,sqrt(784),1,40);
    Region1_c3_y = normrnd(-70,sqrt(289),1,40);
    
    Region2_c3_x = normrnd(380,sqrt(441),1,35);
    Region2_c3_y = normrnd(-10,sqrt(484),1,35);
    
    Region3_c3_x = normrnd(300,sqrt(576),1,30);
    Region3_c3_y = normrnd(-50,sqrt(16),1,30);

    Region4_c3_x = normrnd(389,sqrt(81),1,25);
    Region4_c3_y = normrnd(-70,sqrt(900),1,25);
    
    class3_temp = [Region1_c3_x Region2_c3_x Region3_c3_x Region4_c3_x;
                   Region1_c3_y Region2_c3_y Region3_c3_y Region4_c3_y];
    class3 = [class3_temp;ones(1,size(class3_temp,2))+2];                     
   
%     class4
    Region1_c4_x = normrnd(360,sqrt(529),1,45);
    Region1_c4_y = normrnd(0,sqrt(1225),1,45);
    
    Region2_c4_x = normrnd(228,sqrt(1521),1,40);
    Region2_c4_y = normrnd(23,sqrt(144),1,40);
    
    Region3_c4_x = normrnd(421,sqrt(484),1,50);
    Region3_c4_y = normrnd(124,sqrt(361),1,50);

    Region4_c4_x = normrnd(304,sqrt(729),1,40);
    Region4_c4_y = normrnd(116,sqrt(16),1,40);
    
    Region5_c4_x = normrnd(160,sqrt(256),1,30);
    Region5_c4_y = normrnd(157,sqrt(1521),1,30);

    class4_temp = [Region1_c4_x Region2_c4_x Region3_c4_x Region4_c4_x Region5_c4_x;
                   Region1_c4_y Region2_c4_y Region3_c4_y Region4_c4_y Region5_c4_y];
    class4 = [class4_temp;ones(1,size(class4_temp,2))+3];                     

    output = [class1 class2 class3 class4];        
end