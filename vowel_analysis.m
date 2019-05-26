lab_files = dir('Here goes trnscription files path');
wav_files = dir('Here goes audio files path ');

lpc_koef_num = 24; %Excessive number can cause longer processing time
index_lpc = ones(1,6);  
counter = zeros(1,6);
pass = 0;   %A counter of rejected vowels


for index_file = 1:size(lab_files, 1)
    
    lab_name = strcat('Files in directory goes here', lab_files(index_file).name);
    label=readtable(lab_name, 'FileType', 'text', 'Format', '%u%u%s',...
        'ReadVariableNames', false);
    
    for index_label = 1:size(label, 1)
        vowel = label.Var3(index_label);
        if strcmp(vowel, 'a')
            counter(1) = counter(1) + 1;          
        elseif strcmp(vowel, 'e')
            counter(2) = counter(2) + 1;            
        elseif strcmp(vowel, 'i')
            counter(3) = counter(3) + 1;            
        elseif strcmp(vowel, 'o')
            counter(4) = counter(4) + 1;           
        elseif strcmp(vowel, 'u')
            counter(5) = counter(5) + 1;            
        elseif strcmp(vowel, 'y')
            counter(6) = counter(6) + 1;           
        end
    end
end
counter = counter*10;
a = zeros(counter(1), lpc_koef_num + 1);
e = zeros(counter(2), lpc_koef_num + 1);
i = zeros(counter(3), lpc_koef_num + 1);
o = zeros(counter(4), lpc_koef_num + 1);
u = zeros(counter(5), lpc_koef_num + 1);
y = zeros(counter(6), lpc_koef_num + 1);

for index_file = 1:size(lab_files, 1)
    
    lab_name = strcat('Files in directory goes here', lab_files(index_file).name);
    wav_name = strrep(lab_name, 'lab', 'wav');
    label=readtable(lab_name, 'FileType', 'text', 'Format', '%u%u%s',...
        'ReadVariableNames', false);
    
    [samples, Fs] = audioread(wav_name);
    hamming_width = 'Set the parameters depending on the frequency'; 
    time_factor = 'Set the parameters depending on the frequency';
    window_width = 'Set the parameters depending on the frequency';
    window = hamming(hamming_width); 
    
    for index_label = 1:size(label, 1)
        vowel = label.Var3(index_label);
        if strcmp(vowel, 'a') || ...
                strcmp(vowel, 'e') || ...
                strcmp(vowel, 'i') || ...
                strcmp(vowel, 'o') || ...
                strcmp(vowel, 'u') || ...
                strcmp(vowel, 'y')
            start_s = label.Var1(index_label)*time_factor;
            stop_s = label.Var2(index_label)*time_factor;
            delta = stop_s-start_s;
            
            if delta >= window_width
                idivison = idivide(delta, hamming_width);
                remain = rem(delta, hamming_width);
                iter = idivison - 2;
                
                for index_sample = 0:iter
                    start = start_s + index_sample * hamming_width;
                    stop = start + hamming_width - 1;
                    [lpc_koef, error] = lpc(samples(start:stop).*window, lpc_koef_num);
                    
                    if strcmp(vowel, 'a')
                        a(index_lpc(1), :) = lpc_koef;
                        index_lpc(1) = index_lpc(1) + 1;
                    elseif strcmp(vowel, 'e')
                        e(index_lpc(2), :) = lpc_koef;
                        index_lpc(2) = index_lpc(2) + 1;                       
                    elseif strcmp(vowel, 'i')
                        i(index_lpc(3), :) = lpc_koef;
                        index_lpc(3) = index_lpc(3) + 1;                        
                    elseif strcmp(vowel, 'o')
                        o(index_lpc(4), :) = lpc_koef;
                        index_lpc(4) = index_lpc(4) + 1;                        
                    elseif strcmp(vowel, 'u')
                        u(index_lpc(5), :) = lpc_koef;
                        index_lpc(5) = index_lpc(5) + 1;                        
                    elseif strcmp(vowel, 'a:')
                        y(index_lpc(6), :) = lpc_koef;
                        index_lpc(6) = index_lpc(6) + 1;                        
                    end
                end
                
                if remain > 0 
                  [lpc_koef, error] = lpc(samples(start + remain:stop + remain).*window, lpc_koef_num);
                  if strcmp(vowel, 'a')
                        a(index_lpc(1), :) = lpc_koef;
                        index_lpc(1) = index_lpc(1) + 1;                        
                    elseif strcmp(vowel, 'e')
                        e(index_lpc(2), :) = lpc_koef;
                        index_lpc(2) = index_lpc(2) + 1;                       
                    elseif strcmp(vowel, 'i')
                        i(index_lpc(3), :) = lpc_koef;
                        index_lpc(3) = index_lpc(3) + 1;                        
                    elseif strcmp(vowel, 'o')
                        o(index_lpc(4), :) = lpc_koef;
                        index_lpc(4) = index_lpc(4) + 1;                        
                    elseif strcmp(vowel, 'u')
                        u(index_lpc(5), :) = lpc_koef;
                        index_lpc(5) = index_lpc(5) + 1;                        
                    elseif strcmp(vowel, 'y')
                        y(index_lpc(6), :) = lpc_koef;
                        index_lpc(6) = index_lpc(6) + 1;                       
                   end
                end
            else
                pass=pass + 1;
            end  
       end
   end
end

a = a(1:index_lpc(1) - 1, :);
e = e(1:index_lpc(2) - 1, :);
i = i(1:index_lpc(3) - 1, :);
o = o(1:index_lpc(4) - 1, :);
u = u(1:index_lpc(5) - 1, :);
y = y(1:index_lpc(6) - 1, :);

save('Select save directory', 'a', 'e', 'i', 'o', 'u','y','FS')




