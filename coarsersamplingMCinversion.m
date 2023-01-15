clear all;
 load('elementisotopedata.mat')
 CaMg=fig2(:,2)./fig2(:,4);
CaSr=fig2(:,2)./fig2(:,7);
erroeCaSr=CaSr*0.07;
erroeCaMg=CaMg*0.07;
 load('figure1v2.mat')
 load('datongelementdata.mat')
  T=[];indexsaved=[];
  for jj=1:20
 for i=1:19
     times=0;true=0;j=0;
     while times<100000
      index=fix(5+19*rand(1,i));
      if length(unique(index))==i
          times=times+1
         CaMgres=CaMg(index);
         CaSrres=CaSr(index);
         if max(CaMgres)*0.93>min(CaMgres)*1.07 && max(CaSrres)*0.93>min(CaSrres)*1.07
            true=true+1; 

         end
      
      end
         
     end
     T(i)=true/times;
     i  
     
     
 end
 T=T'
 TT(:,jj)=T;
  end