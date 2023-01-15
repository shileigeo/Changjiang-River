clear all;
load('SrMgCaratios.mat');
load('t.mat');
tmax=max(max(t));
tmin=0.9/0.95;
jjj=1;
initialCaMg=[];
while length(initialCaMg)<20
    sol=[];j=1;
while size(sol)<10000
CaMgNJr=normrnd(CaMgNJ,CaMgNJ*0.035);
CaSrNJr=normrnd(CaSrNJ,CaSrNJ*0.035);
A=polyfit(CaSrNJr,CaMgNJr,1);
RSrtoMg=0.0071;
B1=A(1)/RSrtoMg;B2=-A(2)/(B1-1);
if B1>tmin && B1<tmax && B2>0&& B2<14
sol(1,j)=B1;
sol(2,j)=B2;
j=j+1;
end
size(sol);
end
N=numel(sol);  
[n C]=hist3(sol', [200 200]);
p=n/N;        
% calculate probility desity 
[E F]=hist(sol(2,:),200);xlim([0,10]);
% subplot(2,1,1);plot(F,E/sum(E));xlim([0,10]);
% subplot(2,1,2);contourf(C{2},C{1},p);xlim([0,10]);ylim([1 1.6]);
 [x]=find(E==max(E));
 if F(x)==0
     G=E;
     H=F;
 end
 if length(F(x))==1
   
 initialCaMg(jjj)=F(x);
 jjj=jjj+1;
 end
 jjj
end

