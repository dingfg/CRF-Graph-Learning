#coding:utf-8
import sys
import re
import matplotlib.pyplot as plt
import numpy as np

in_log_path='./fcn_2017-10-17_21-47-13.txt'  #输入日志文件的位置
out_fig_path='./log.jpg' #输出图片的位置
f=open(in_log_path,'r')
loss=[]
#train_loss=[]
#test_loss=[]

max_iter=0
test_iter=0
test_interval=20
display=0
#target_str=['accuracy = ','Test net output #1: loss = ','Train net output #0: loss = ',
#            'max_iter: ','test_iter: ','test_interval: ','display: ']
target_str=[', loss = ']
while True:
    line=f.readline()
    # print len(line),line
    if len(line)<1:
        break
    for i in range(len(target_str)):
        str=target_str[i]
        idx = line.find(str)
        if idx != -1:
            num=float(line[idx + len(str):idx + len(str) + 6])
            if(i==0):
                loss.append(num)
            else:
                pass
f.close()
# print test_iter
# print max_iter
# print test_interval
# print len(accuracy),len(test_loss),len(train_loss)

_,ax1=plt.subplots()
#ax2=ax1.twinx()

#绘制accuracy曲线图像，颜色为红色'r'
ax1.plot(test_interval*np.arange(len(loss)),loss,color='r',label='loss',linestyle='-')

#ax1.legend(loc=(0.7,0.8))  #使用二元组(0.7,0.8)定义标签位置
#ax2.legend(loc=(0.7,0.72))
ax1.set_xlabel('iteration')#设置X轴标签
ax1.set_ylabel('loss')     #设置Y1轴标签

plt.savefig(out_fig_path,dpi=100) #将图像保存到out_fig_path路径中，分辨率为100
plt.show()                 #显示图片
