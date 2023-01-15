load('Na.mat');
 load('discharge.mat')
j=1;msilc02=[];
 while length(msilc02)<20
     i=1; X6=[];Y6=[];
 while (length(Y6)<1)
 

 option=optimset('Algorithm','active-set','MaxFunEvals',100000,'MaxIter',10000);
k=rand(43,1)*2-1;
kk=diag(k);
ss0=kk*s60;
 
[X6(:,i),fval]=fmincon(@fun3,x60+ss0,[],[],[],[],Alb6,Aub6,@noncon6,option);

XR6(:,i)=X6(:,i)-(x60+ss0);
Y6(i)=fval;
if Y6(i)>0.0001
    i=i;
else i=i+1;
end

length(X6)
i
 end
 silc02=X6(5,:).*(2*X6(22,:)+2*X6(16,:)+1+X6(28))*Na(1)*discharge(1)*3600*24*365/1000000000/1000;
msilc02(j)=mean(silc02);
j=j+1;
 end
