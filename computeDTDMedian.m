
load('firmList.mat');
H=firmList(:,2);
J=find(H==10008);% extract financial companies
load('firmSpecific.mat');
K=firmSpecific;
L=K(:,6,:);
L(isnan(L))=0;
M=L(:,:,J);
DTD_median_Fin=median(M,'all');% calculate the median for all financial companies
N=find(H~=10008);% extract nonfinancial companies
O=L(:,:,N);
DTD_median_nonFin=median(O,'all');% calculate the median for all nonfinancial companies
P=NaN(365,2,35);% create a now 3D matrix(365*2*35) which contains 2 new  NaN variables.
newdata=[K,P];% merge the new matrix with the original one
newdata(:,13,J)=DTD_median_Fin;%change the value of the 13th variable of all financial companies to the DTD_median_Fin
newdata(:,14,N)=DTD_median_nonFin;%change the value of the 14th variable of all nonfinancial companies to the DTD_median_nonFin




