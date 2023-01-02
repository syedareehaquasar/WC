clc; 
r(1)= 1;
r(2)= 0;
r(3)= 1;
r(4)= 0;
R = [r(1) r(2) r(3) r(4)]; 
PN = [];
len = length(r); 
disp('lemgth of input',len);
disp('initial bit pattern of flip flops',R); 

for i=1:1:((2^len)-1)
    temp1 = r(1); 
    temp2 = r(2); 
    temp3 = r(3); 
    temp4 = r(4); 
    PN = [PN r(4)];
    temp1 = bitxor(temp3,temp4); 
    r(4) = r(3);
    r(3) = r(2);
    r(2) = r(1);
    r(1) = temp1;
    R = [r(1) r(2) r(3) r(4)];
    disp('current bit pattern of flip flops',R);
end
disp('15 bit pattern',PN); 

for i=1:1:((2^len)-1)
    if(PN(i)==0)
        PN(i) = -1;
    end
end
disp('After replacing 0 with -1 the 15 bit pattern',PN);

info = [1 -1 -1 1];
leninfo = length(info);
disp("length of data ",length(info));

spread = [];
for i=1:1:leninfo
for j=1:1:length(PN)
x = info(1,i)*PN(1,j); spread = [spread x];
end
end
disp("spread ",spread); len_spread = length(spread);
disp("length of spreaded data", len_spread); PN = [PN PN PN PN];
disp("Updated PN : ",PN); despread = [];
 
for i=1:1:length(spread)
    x = spread(1,i)*PN(1,i); 
    despread = [despread x];
end

disp("multiplied output",despread);
sum_col = [sum(despread(1:15)) sum(despread(16:30)) sum(despread(31:45)) sum(despread(46:60))]; 
disp("sum total",sum_col);

received_signal = [];
for i=1:1:length(sum_col)
    received_signal =[received_signal sum_col(i)/15];
end
disp("received signal”,received_signal);
