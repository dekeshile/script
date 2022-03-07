# python /home/wurp/workspace/antibody/coefficient.py
import pandas as pd
import math
import numpy as np
import matplotlib.pyplot as plt
from sklearn import linear_model
from sklearn.metrics import r2_score

# pdbIdArr=("7DEU" "7JVB" "7CM4" "7R7N" "7DET" "7RAL" "6ZER" "7DEO" "7MLZ" "7C01" "7B3O" "7LRS" "6YMO" "7JMW" "7JVB" "6W41")
#aff_old = [0.001,0.0104,0.027,0.05,0.0507,0.08,2,2.33,2.55,4.49,6.5,7.3,19,46,115]

#pdbIdArr=("6W41" "6YMO" "6ZER" "7B3O" "7C01" "7CM4"  "7DEO" "7DET" "7DEU" "7JMW" "7JVB" "7LRS" "7MLZ" "7R7N" "7RAL")
# aff_old = [0.001,0.0104,0.027,0.05,0.0507,0.08,2,2.33,2.55,4.49,6.5,7.3,19,46,115]
# GEXP = [-16.355,-14.968,-14.404,-14.039,-14.031,-13.761,-11.856,-11.765,-11.712,-11.377,-11.158,-11.089,-10.523,-10.000,-9.457] 

# restrain = [-22.321,-20.182,-20.579,-28.704,-24.683,-20.541,-20.049,-30.673,-11.020,-20.448,-4.230,-19.748,-21.387,-31.698,-20.750]

# no_restrain = [-19.813,12.168,6.238,-25.416,17.027,-14.765,-12.232,-15.193,-18.708,-14.330,-2.614,-19.052,-10.155,-15.221,-15.544]
# mostFre = [-25.073,-19.248,-15.603,-36.175,-18.247,-24.258,-32.414,-19.840,-25.464,-27.528,-12.759,-20.955,-19.219,-18.653,-12.750]
# mostFre_with10nsTdS = [-17.114,12.128,0.842,-30.399,16.730,-12.813,-12.594,-16.726,-18.690,-12.084,-3.669,-14.794,-14.225,-9.419,-11.639]

# nearAverage = [-22.554,-19.115,-26.109,-30.216,25.354,-25.112,-9.026,-15.819,-25.340,-21.973,-14.330,-7.832,-7.858,-30.141,-16.641]

# nearAverage_with10nsTdS = [-16.359,10.588,0.719,-22.004,19.590,-16.722,-10.490,-20.103,-15.938,-9.642,-6.200,-16.722,-10.696,-23.818,-11.651]

#pdbIdArr=("7CH4" "7E23" "7CH5" "7BWJ" "7B27" "6ZBP" "7JMP" "7K8M" "6YZ5" "7JMO")
aff_old = [0.18,0.698,0.78,5.14,8.23,12,20.9,27,39,39.6]
#water_restrian = [-2.709,-35.366,-20.248,-16.207,-10.441,-21.222,49.812,-8.346,-19.076,-24.417]
water_restrian_pro4 = [-4.511,-24.674,3.744,-15.248,15.508,-29.001,78.372,-11.628,-15.949,-16.514]

#aff = log(aff_old,base=e)

aff = list(np.log(aff_old))

# print("\n--------------- aff_old VS GEXP----------------------------------------")

# data = pd.DataFrame({'affinity':aff,'free energy':GEXP})
# print('pearson',data.corr(method='pearson'))
# print('pearman',data.corr(method='spearman'))

# print("\n--------------- aff_old VS restrain----------------------------------------")

# data = pd.DataFrame({'affinity':aff,'free energy':restrain})
# print('pearson',data.corr(method='pearson'))
# print('pearman',data.corr(method='spearman'))

# print("\n--------------- aff_old VS no_restrain----------------------------------------")

# data = pd.DataFrame({'affinity':aff,'free energy':no_restrain})
# print('pearson',data.corr(method='pearson'))
# print('pearman',data.corr(method='spearman'))

# print("\n--------------- aff_old VS mostFre----------------------------------------")

# data = pd.DataFrame({'affinity':aff,'free energy':mostFre})
# print('pearson',data.corr(method='pearson'))
# print('pearman',data.corr(method='spearman'))

# print("\n--------------- aff_old VS mostFre_with10nsTdS----------------------------------------")

# data = pd.DataFrame({'affinity':aff,'free energy':mostFre_with10nsTdS})
# print('pearson',data.corr(method='pearson'))
# print('pearman',data.corr(method='spearman'))

# print("\n--------------- aff_old VS nearAverage----------------------------------------")

# data = pd.DataFrame({'affinity':aff,'free energy':nearAverage})
# print('pearson',data.corr(method='pearson'))
# print('pearman',data.corr(method='spearman'))

# print("\n--------------- aff_old VS nearAverage_with10nsTdS----------------------------------------")

# data = pd.DataFrame({'affinity':aff,'free energy':nearAverage_with10nsTdS})
# print('pearson',data.corr(method='pearson'))
# print('pearman',data.corr(method='spearman'))

print("\n--------------- aff_old VS water_restrian_pro4----------------------------------------")

data = pd.DataFrame({'affinity':aff,'free energy':water_restrian_pro4})
print('pearson',data.corr(method='pearson'))
print('pearman',data.corr(method='spearman'))


# GEXP = [-10.098,-10.795,-11.018,-11.297,-12.413,-12.479,-10.088,-10.315] 
# LIE_restrain = [-9.180,-9.321,-15.981,-9.923,-18.304,-16.000,-14.219,-6.445]
# aff_old = [39,12,8.23,5.14,0.78,0.698,39.6,27]
# aff = list(np.log(aff_old))

# data = pd.DataFrame({'affinity':aff,'free energy':LIE_restrain})
# print('pearson',data.corr(method='pearson'))
# print('pearman',data.corr(method='spearman'))


# plt.scatter(GEXP,LIE_restrain,color = 'red')

# parameter = np.polyfit(GEXP,LIE_restrain,1)
# p = np.poly1d(parameter)
# print(p)
# plt.plot(GEXP,p(GEXP),color='g')
# plt.show()


# ---------------------------------线性回归模型，计算LIE的系数-------------------------------------

# x = [[-134.518,-126.7],[-1037.66,-238.3],[-992.795,203.4],[-2663.83,192.1],[-2587.88,-583.2],\
# [-2596.68,-216.9],[-1728.71,477.4],[2651.81,-174.9],[-2694.98,-344.9],[-2526.53,-298.2]]

# y = GEXP

# method = linear_model.LinearRegression()
# getmodel = method.fit(x,y)

# # print(clf.coef_)
# # print(clf.intercept_)

# print('回归模型的系数为：{},截距为：{}'.format(getmodel.coef_,getmodel.intercept_))

# predictY = getmodel.predict(x)
# R_square = r2_score(y,predictY)
# print('R_square is :',R_square)

# p  = plt.plot(x,y,'rx')
# p = plt.plot(x,getmodel.coef_ * x + getmodel.intercept_)

# plt.show()


# python3 /home/wurp/workspace/antibody/coefficient.py