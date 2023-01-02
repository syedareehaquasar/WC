r = input("Enter the radius ")
n = input("Enter the number of cells in a cluster ")
d = r*sqrt(3*n)
q = d/r
disp("The frequency reuse distance is ",d) 
disp("the frequency reuse ratio is ",q) 
z=1/n 
disp('frequency reuse factor is',z)
p = input('Enter the total number of channels in the cluster ') 
n = input('enter the no. of clusters in the system ')
c = p*n
disp('The total capacity of the system ',c) 
x = input('enter path loss component ')
o = input('the total no. of cochannel cell exist in the first tier ') 
w = (q^x)/o
disp('the signal to interference ratio is ', w)
