clc; 
n=10000; 
data_stream=grand(1,n,"uin",0,1); 
bpsk_stream=2*data_stream-1; 
snr=1:20; 
l=length(snr);
s_AWGN=0;
s_AWGN_Ray=0; 
biterror_AWGN=[]; 
biterror_AWGN_Rayleigh=[]; 
for k=1:1:l
    h=1/sqrt(2)*(rand(1,n,'normal')+%i*(rand(1,n,'normal'))); 
    noise=1/sqrt(2)*(10^(-(k/20)))*(rand(1,length(bpsk_stream),'normal')+%i*(rand(1,length(bpsk_stream),'normal'))); 
    s_AWGN=s_AWGN+noise;
    s_AWGN_RAY=s_AWGN.*h+noise; 
    received_signal=conj(h).*s_AWGN_RAY; recdata_AWGN=[]; 
    recdata_AWGN_Rayleigh=[]; 
    for i=1:1:n
        if (real(s_AWGN(i))>=0) output_AWGN=1;
        else
            output_AWGN=0; 
        end 
        recdata_AWGN(i) = output_AWGN; 
    end
    for i=1:1:n
        if (real(s_AWGN_RAY(i))>=0) output_AWGN_Rayleigh=1;
        else
            output_AWGN_Rayleigh=0; 
        end 
        recdata_AWGN_Rayleigh(i) = output_AWGN_Rayleigh;
     end
    err_AWGN = 0; 
    err_AWGN_Rayleigh = 0; 
    for i=1:1:n
        if recdata_AWGN[i] ~= bpsk_stream(i) err_AWGN = err_AWGN + 1;
        end
    end
    for i=1:1:n
        if recdata_AWGN_Rayleigh(i) ~= bpsk_stream(i) err_AWGN_Rayleigh = err_AWGN_Rayleigh + 1;
        end
    end
    biterror_AWGN(k) = err_AWGN/n; 
    biterror_AWGN_Rayleigh(k) = err_AWGN_Rayleigh/n;
end 
subplot(2,1,1); 
plot(snr,biterror_AWGN); 
xgrid() subplot(2,1,2); 
plot(snr,biterror_AWGN_Rayleigh); 
xgrid()
