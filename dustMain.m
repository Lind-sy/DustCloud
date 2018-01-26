[dust, dustspeed] = createDustCloud(100);%Create dust cloud
[t,dx,dv] = euler_method_system(dust, dustspeed, 0.1 ,100000000);%Show movement