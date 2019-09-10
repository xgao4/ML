proc import out=First_Reg
datafile="C:\Users\xgao4\OneDrive - IQVIA\Documents\Holland Training\Practices\First R Regression\_first_reg.csv";
getnames=yes;
run;

proc reg data = first_reg;
model POD = rx cu lg_rx lg2_rx lg3_rx lg4_rx;
run;
