clc;
w = [0 0;0 1];
disp('original walsh code matrix = ',w); 

function [w_inv]=compliment(w)
    for i=1:1:length(w(1,:))
        for j=1:1:length(w(1,:)) 
            if
                w(i,j)== 0 w_inv(i,j)=1; 
            else w_inv(i,j)=0; 
            end
        end 
    end 
endfunction

comp = compliment(w); 
disp('compliment of walsh code',comp); 
w = [w w; w comp]; 
disp("New Matrix",w);
len=length(w(2,:));
disp("Length of new matrix :",len); 

zeeshaan_input1 = [1 0 0 1 0];
zeeshaan_input2 = [0 1 1 1 0];
zeeshaan_input3 = [1 0 1 1 0]; 

disp("input1",input1); 
disp("input2",input2); 
disp("input3",input3); 

Wcode1 = w(2,:);
Wcode2 = w(3,:);
Wcode3 = w(4,:);

spread = [] spread1 = [] spread2 = [] spread3 = []
for i=1:1:length(input1)
    for j=1:1:length(Wcode1)
        variable_xor1 = bitxor(input1(1,i),Wcode1(1,j)); 
        spread1 = [spread1 variable_xor1];
    end 
end

disp("Code1 Spread",spread1); 

for i=1:1:length(input2)
    for j=1:1:length(Wcode2)
        variable_xor2 = bitxor(input2(1,i),Wcode2(1,j)); 
        spread2 = [spread2 variable_xor2];
    end
end

disp("Code2 Spread",spread2); 

for i=1:1:length(input3)
    for j=1:1:length(Wcode3)
        variable_xor3 = bitxor(input3(1,i),Wcode3(1,j)); 
        spread3 = [spread3 variable_xor3];
    end 
end

disp("Code3 Spread",spread3); 
spread = [spread1;spread2;spread3]; 
disp("Final Spread Code”,spread);
