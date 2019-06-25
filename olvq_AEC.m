function olvq_AEC(itr_no,alpha_threshold)
% This code is implementation of IJCNN 2011 paper "Pattern Classifiers with
%   Adaptive Distances".
% This function classify input data based on Optimized Learning Vector
%   Quantization with Adaptive Distances. These data sets can be found
%   in the UCI machine site => http://archive.ics.uci.edu/ml/datasets.html
% This function accept this value for training set :
%   1-Iris
%   3-Glass
%   4-Heart
%   5-Pima
%   6-Wine
%   7-Image Segmentation
%   8-liver-disorders
%   9-Haberman’s survival
%   10-Magic gamma telescope
%   11-Seed
%   12-Artificila Dataset1
%   13-Artificila Dataset2
%   14-Tae
%   15-Banana
%   16-Balance
%   17-Ecoli
%   18-Penbased
% The defulat value for alpha threshold is 0.0005.

clc
close all
if nargin == 0
    alpha_threshold = 0.0005;
    itr_no = 5;
elseif nargin ~= 0 && nargin ~=2
    error('Not Enough Argument!')
end
text{2,1} = 'Iris';
text{2,2} = '....';
text{2,3} = 'Glass';
text{2,4} = 'Heart';
text{2,5} = 'Pima';
text{2,6} = 'Wine';
text{2,7} = 'Image Segmentation';
text{2,8} = 'Liver-disorders';
text{2,9} = 'Haberman';
text{2,10} = 'Magic';
text{2,11} = 'Seed';
text{2,12} = 'Artificial 1';
text{2,13} = 'Artificial 2';
text{2,14} = 'Tae';
text{2,15} = 'Banana';
text{2,16} = 'Balance';
text{2,17} = 'Ecoli';
text{2,18} = 'Penbased';

for i = 1:18
    text{1,i} = i;
end
disp(text)
training_set = input('Select Dataset for training (1-18)');

%% Select Training set
switch training_set
    
    case 1
        input_data = load('dataset\iris.data');
        x = input_data(:,1:size(input_data,2)-1)';x_temp=x;
        t = input_data(:,end)';t_temp=t;
        title_text = 'Iris';
        
    case 2
        error('This Dataset does not exist!')
        
    case 3
        input_data = load('dataset\glass.data');
        x = input_data(:,1:size(input_data,2)-1)';x_temp = x;
        t = input_data(:,end)';t_temp = t;
        title_text = 'Glass';
        
    case 4
        input_data = load('dataset\Heart.dat');
        x = input_data(:,1:size(input_data,2)-1)';x_temp = x;
        t = input_data(:,end)';t_temp = t;
        title_text = 'Heart';
        
    case 5
        input_data = load('dataset\pima-indians-diabetes.data');
        input_data(:,9) = input_data(:,9)+1;
        x = input_data(:,1:size(input_data,2)-1)';x_temp=x;
        t = input_data(:,end)';t_temp=t;
        title_text = 'Pima';
        
    case 6
        input_data = load('dataset\wine.data');
        x = input_data(:,2:end)';x_temp=x;
        t = (input_data(:,1)');t_temp=t;
        title_text = 'Wine';
        
    case 7
        location_data = ('dataset\segmentation.data');
        data = importfile(location_data);
        x = data';
        x_temp = x;
        t2 = 31; t3 = 61; t4 = 91; t5 = 121; t6 = 151; t7 = 181;
        t = ones(1,size(x,2));t(1,t2:60)=2;t(1,t3:90)=3;
        t(1,t4:120)=4;t(1,t5:150)=5;t(1,t6:180)=6;t(1,t7:210)=7;
        t_temp = t;
        title_text = 'Image Segmentation';
        
    case 8
        input_data = load('dataset\liver-disorders.data');
        x = input_data(:,1:size(input_data,2)-1)';x_temp=x;
        t = (input_data(:,end)');t_temp=t;
        title_text = 'Liver-disorders';
        
    case 9
        input_data = load('dataset\haberman.data');
        x = input_data(:,1:size(input_data,2)-1)';x_temp=x;
        t = (input_data(:,end)');t_temp=t;
        title_text = 'Haberman';
        
    case 10
        input_data = load('dataset\magic04.data');
        x = input_data(:,1:size(input_data,2)-1)';x_temp = x;
        t = input_data(:,end)';t_temp = t;
        title_text = 'Magic';
        
    case 11
        input_data = load('dataset\seed.txt');
        x = input_data(:,1:size(input_data,2)-1)';x_temp = x;
        t = input_data(:,end)';t_temp = t;
        title_text = 'Seed';
        
    case 12
        input_data = olvq_art_dataset(1);
        x = input_data(1:size(input_data,1)-1,:);x_temp = x;
        t = input_data(end,:);t_temp = t;
        title_text = 'Artificial 1';
        
    case 13
        input_data = olvq_art_dataset(2);
        x = input_data(1:size(input_data,1)-1,:);x_temp = x;
        t = input_data(end,:);t_temp = t;
        title_text = 'Artificial 2';
        
    case 14
        input_data = load('dataset\tae.data');
        x = input_data(:,1:size(input_data,2)-1)';x_temp = x;
        t = input_data(:,end)';t_temp = t;
        title_text = 'Tae';
        
    case 15
        newData = importdata('dataset\banana.dat');
        input_data = newData.data;
        x = input_data(:,1:size(input_data,2)-1)';x_temp = x;
        t = input_data(:,end)';t=((t+1)/2)+1;t_temp = t;
        title_text = 'Banana';
        
    case 16
        input_data = importdata('dataset\balance.dat');
        x = input_data(:,1:size(input_data,2)-1)';x_temp = x;
        t = input_data(:,end)';t_temp = t;
        title_text = 'Balance';
        
    case 17
        input_data = importdata('dataset\ecoli.dat');
        x = input_data(:,1:size(input_data,2)-1)';x_temp = x;
        t = input_data(:,end)';t_temp = t;
        title_text = 'Ecoli';
        
    case 18
        newData = importdata('dataset\penbased.dat');
        input_data=newData.data;
        x = input_data(:,1:size(input_data,2)-1)';x_temp = x;
        t = input_data(:,end)';t_temp = t;
        title_text = 'Penbased';
        
end
%% Error Condition
if size(t,2)~= size(x,2)
    error('size of input and target vectors does not match')
end
tic
for iteration_no=1:itr_no
    %% Initialization
    % Automatic Code Book Selection:
    class_num = max(t);
    for w = 1:class_num
        r = 0;
        while(r == 0)
            r = round(rand(1) * size(t,2));
            if r ~= 0
                if w ~= t(r)
                    r = 0;
                end
            end
        end
        selective = [x(:,r) ; t(r)];
        code_book_landa(:,w) = selective;
        code_book(:,w) = selective;
    end
    code_book_landa_temp = code_book_landa;
    landa = (code_book_landa(1:size(code_book_landa,1)-1,:) * 0) + 1;
    delta = landa * 0;
    alpha0 = 0.3; alpha_landa = alpha0;alpha = alpha0;
    itr = 0;
    temp = [];
    % number of element of feature vectors
    p = size(x,1);
    % counter for count the correct classified vector
    n = zeros(1,max(t));
    cnt = 0; cnt_threshold = 25000;
    random_selection = [];
    
    %% Training Process
    clc
    numb = 0;
    dataset_data{1,1} = 'Dataset';
    dataset_data{1,2} = 'Stage Counter';
    dataset_data{1,3} = 'Learning Rate limit';
    
    dataset_data{2,1} = title_text;
    dataset_data{2,2} = sprintf('%d of %d',iteration_no,itr_no);
    dataset_data{2,3} = alpha_threshold;
    disp(dataset_data)
    
    % Std_x = cov(x_temp')';
    % Mu_x = mean(x_temp')';
    
    while(alpha_landa >  alpha_threshold && cnt < cnt_threshold)
        
        numb = numb+1;
        
        %     i --> random variable to select a pattern randomly for training
        i = 0;
        while(i==0)
            i = round(rand(1)*size(x_temp,2));
        end
        random_selection = [random_selection i];
        %      j --> index to compute distance between selected pattern & all of
        %            code_books.
        for j = 1:size(code_book_landa,2)
            %             dis_vector_landa = landa(1:size(code_book_landa,1)-1,j) .* abs((x_temp(:,i) - code_book_landa(1:size(code_book_landa,1)-1,j)));
            dis_vector_landa = landa(1:size(code_book_landa,1)-1,j) .* (x_temp(:,i) - code_book_landa(1:size(code_book_landa,1)-1,j)).^2;
            %             dis_vector_landa = landa(1:size(code_book_landa,1)-1,j) .* (((x_temp(:,i)-Mu_x) - code_book_landa(1:size(code_book_landa,1)-1,j))' * inv(Std_x) * ((x_temp(:,i)-Mu_x) - code_book_landa(1:size(code_book_landa,1)-1,j)));
            dis_landa(j) = sum(dis_vector_landa);
            %             A = (landa(1:size(code_book_landa,1)-1,j) .* x_temp(:,i))';
            %             B = (landa(1:size(code_book_landa,1)-1,j) .* code_book_landa(1:size(code_book_landa,1)-1,j))';
            %             dis_landa(j) = pdist2(A,B,'chebychev');
        end
        [~, idx_landa] = min(dis_landa);
        if t_temp(:,i) == code_book_landa(size(code_book_landa,1),idx_landa)
            win_class = t_temp(:,i);
            code_book_landa( 1:size(code_book_landa,1)-1 , idx_landa ) = ...
                code_book_landa( 1:size(code_book_landa,1)-1 , idx_landa ) + alpha_landa * ...
                (x_temp(:,i) - code_book_landa( 1:size(code_book_landa,1)-1 , idx_landa ));
            %               counter for allocating new vectors to new location
            n(1,win_class) = n(1,win_class) + 1;
            %               Set the correct classified vectors to their category
            classified_vector{1,win_class}(:,n(1,win_class)) = x_temp(:,i);
            
            %           Insted of use 2 loops for computing difference between each
            %           vectors of same class and their code book, I used other
            %           method that efficient and faster than 2 slow loops.
            %           First, I create a new matrix that all of elements are One and
            %           it's dimension as same as correct classified vectors,Then i
            %           multiply each column of this matrix with it's code book.Finally
            %           subtract the elements of this matrix with correct classified
            %           vectors and compute new delta variale for this class.
            temp_matrix = repmat(code_book_landa(1:size(code_book_landa,1)-1 , idx_landa ), ...
            1,size(classified_vector{win_class},2));
            delta_temp = ((temp_matrix-classified_vector{1,win_class}).^2);
            delta(:,win_class) = sum(delta_temp, 2)';
            for z = 1:size(delta(:,win_class),1)
                if delta(z,win_class)==0
                    delta(z,win_class) = 1;
                end
            end
            num_co = (prod(delta(:,win_class)))^(1/p);
            for k = 1:size(code_book_landa,1)-1
                landa(k,win_class) = (num_co) / delta(k,win_class);
            end
            alpha_landa = alpha_landa / (1 + alpha_landa);
        else
            code_book_landa(1:size(code_book_landa,1)-1,idx_landa) = ...
                code_book_landa(1:size(code_book_landa,1)-1,idx_landa) - alpha_landa*...
                (x_temp(:,i) - code_book_landa(1:size(code_book_landa,1)-1,idx_landa));
            alpha_landa = alpha_landa / ( 1 - alpha_landa);
            %                 alpha_landa = -1/log(alpha_landa);
            if alpha_landa > alpha0
                
                cnt = cnt + 1;
                alpha_landa = alpha0;
                if rem(cnt, 1000) == 0
                    fprintf('#%d iteration passed. (MAX iteration is %d)\n', cnt, cnt_threshold)
                end
            end
        end
        temp = [temp alpha_landa];
        itr = itr + 1;
    end
    
    while(alpha >  alpha_threshold)
        %     i --> random variable to select a pattern randomly for training
        i = 0;
        while(i==0)
            i = round(rand(1)*size(x_temp,2));
        end
        for j = 1:size(code_book,2)
            dis_vector = (x_temp(:,i) - code_book(1:size(code_book,1)-1,j)).^2;
            dis(j) = sum(dis_vector);
            %             dis(j) = pdist2(x_temp(:,i)',code_book(1:size(code_book,1)-1,j)','cityblock');
        end
        [~, idx] = min(dis);
        if t_temp(:,i) == code_book(size(code_book,1),idx)
            code_book( 1:size(code_book,1)-1 , idx ) = ...
                code_book( 1:size(code_book,1)-1 , idx ) + alpha * ...
                (x_temp(:,i) - code_book( 1:size(code_book,1)-1 , idx ));
            alpha = alpha / (1 + alpha);
        else
            code_book_(1:size(code_book,1)-1,idx) = ...
                code_book(1:size(code_book,1)-1,idx) - alpha*...
                (x_temp(:,i) - code_book(1:size(code_book,1)-1,idx));
            alpha = alpha / ( 1 - alpha);
            if alpha > alpha0
                alpha = alpha0;
            end
        end
    end
    
    %% Error Condition!
    % if the times that training reach to upper limitation of training
    % coefficient (Alpha) the training process faild!
    if cnt >= cnt_threshold
        warning('Faild to converge!')
    end
    
    %% Test Process
    result0 = [];
    result1 = [];
    % Method denote the use of landa parameter in testing or not
    
    for n = 1:size(x,2)
        clc
        fprintf('%d out of %d',n,size(x,2))
        %     out = olvq_test(x(:,n),n,code_book_landa,code_book,t,landa);
        out = olvq_test(x(:,n),n,code_book_landa,code_book,t,landa);
        
        result0 = [result0 out(1,:)'];
        result1 = [result1 out(2,:)'];
    end
    
    % plot(temp);grid on;title('training rate');
    % false_num = size(result0,2)-sum((result0(1,:)-result0(2,:))==0);
    
    o2 = sprintf('%d (%.2f%%) correct matches out of %d', ...
        sum((result0(1,:)-result0(2,:))==0), ...
        100*sum((result0(1,:)-result0(2,:))==0)/size(result0,2), ...
        size(result0,2));
    o3 = sprintf('%d (%.2f%%) correct matches out of %d', ...
        sum((result1(1,:)-result1(2,:))==0), ...
        100*sum((result1(1,:)-result1(2,:))==0)/size(result1,2), ...
        size(result1,2));
    
    output{1,1} = 'Training Set.........................:';output{1,2} = title_text;
    output{2,1} = 'No. Of Iterations....................:';output{2,2} = itr;
    output{3,1} = 'Result with use of LANDA parameter:';output{3,2} = o2;
    output{4,1} = 'Result without use of LANDA parameter...:';output{4,2} = o3;
    
    simulation(iteration_no) = 100*sum((result1(1,:)-result1(2,:))==0)/size(result1,2);
    
    simulation0(iteration_no) = 100*sum((result0(1,:)-result0(2,:))==0)/size(result0,2);
    if cnt >= cnt_threshold
        simulation0(iteration_no) = nan;
    end
    clear data textdata ans
end
tElapsed = toc;
output_temp = nanmean(simulation);
output_temp0 = nanmean(simulation0);
final_result{1,1}='OLVQ-ED';
final_result{1,2}='OLVQ-AEDC';
final_result{2,1} = sprintf('%0.2f %%', 100 - output_temp);
final_result{2,2} = sprintf('%0.2f %%', 100 - output_temp0);
clc
disp('---------Simulation Result---------')
disp('---------   Error rates   ---------')
disp(final_result)

end