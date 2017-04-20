---
layout: post
title: "车辆跟驰模型仿真"
category: 读学观
tags: 读学观
keywords: 
description: 
---


```
#!/usr/bin/env python
# coding=utf-8
"""
车辆跟驰模型仿真
一键修改同质，异质
一键修改线性，非线性
专注于模型，算法
解决骤减速，骤问题
"""

import numpy as np
import matplotlib.pyplot as plt
import csv
import random

# 全局变量
## 车数（头车+跟驰车）
car_cnt = 50
## 初始车距
car_dis_init = 60
## 初始车速
speed_init = 100.0
## 最大加速度
## 参考 http://www.autohome.com.cn/channel2/bestauto/list.aspx?type=1
max_acc = 3
## 最小加速度（负值）
min_acc = -8
## 正常减速度
norm_dec = -8

min_speed = 60.0

# 安全车距
# saft_dis = 0.2
# saft_dis = 10.0
saft_dis = 20.0
# saft_dis = 30.0
# saft_dis = 40.0
# saft_dis = 50.0

# 干扰/触发条件
## 500m处开始减速
## 2500m处开始加速
## 5000m处截止
m_start_acc = 500
m_start_dec = 2500
m_stop_line = 5000

# 每0.1更新一次仿真结果
_t_factor = 10.0
delta_t = 1.0 / _t_factor
t = [0.0]
start_time = round(m_start_acc*_t_factor / (speed_init/3.6))


def safe_acc(in_acc):
    ret = in_acc
    if in_acc > max_acc:
        ret = max_acc
    if in_acc < min_acc:
        ret = min_acc
    return ret

# 专为头车设计的类
class FirstCar:
    _abs_pos_list = []
    _abs_speed_list = []
    _abs_acc_list = []

    def __init__(self, abs_pos=0.0, abs_speed=speed_init,
                 abs_acc=0.0,rel_dis_next=car_dis_init):
        self._abs_pos = abs_pos
        self._abs_speed = abs_speed
        self._abs_acc = abs_acc
        self._abs_pos_list = []
        self._abs_speed_list = []
        self._abs_acc_list = []
        self._rel_dis_next = rel_dis_next

        self._C = 0.5
        self._tao = 1.0

    def set_acc(self, acc):
        self._abs_acc = acc

    def set_speed(self, speed):
        self._abs_speed = speed

    def get_pos(self):
        return self._abs_pos

    def get_speed(self):
        return self._abs_speed

    def update(self):
        last_acc = self._abs_acc
        last_speed = self._abs_speed

        delta_speed = last_acc * delta_t
        self._abs_speed = self._abs_speed + delta_speed
        if self._abs_speed < 0:
            self._abs_speed = 0.0

        # Attention: (last_speed/3.6)
        delta_pos = 0.5*(last_acc * delta_t**2) + ((last_speed/3.6) * delta_t)
        self._abs_pos = self._abs_pos + delta_pos

        self._abs_acc_list.append(self._abs_acc)
        self._abs_speed_list.append(self._abs_speed)
        self._abs_pos_list.append(self._abs_pos)
        print("--->[1]<---", self._abs_acc, self._abs_speed, self._abs_pos)

    def get_pos_list(self):
        return self._abs_pos_list

    def get_xva_list(self):
        return [self._abs_pos_list, self._abs_speed_list, self._abs_acc_list]

# 跟驰车的类
class Car:

    def __init__(self, abs_pos=0.0, abs_speed=speed_init,
                 abs_acc=0.0, rel_dis_pre=car_dis_init, rel_dis_next=car_dis_init,
                 heter=False, nonlinear=False):
        self._abs_pos = abs_pos
        self._abs_speed = abs_speed
        self._abs_acc = abs_acc
        self._abs_pos_list = []
        self._abs_speed_list = []
        self._abs_acc_list = []

        self._rel_dis_pre = rel_dis_pre
        self._rel_dis_next = rel_dis_next

        self._C = 0.5
        self._tao = 1.0

        self._use_nonlinear = nonlinear
        if heter:
            self._C += random.random()

    def set_acc(self, acc):
        self._abs_acc = safe_acc(acc)

    def set_speed(self, speed):
        self._abs_speed = speed

    def get_pos(self):
        return self._abs_pos

    def get_speed(self):
        return self._abs_speed

    def set_para(self, new_C, new_tao):
        self._C = new_C
        self._tao = new_tao

    def change_para(self, new_C, new_tao):
        self._C += new_C
        self._tao += new_tao

    def update(self, pre_car):
        last_acc = self._abs_acc
        last_speed = self._abs_speed

        if self._use_nonlinear:

            # self._abs_acc = safe_acc((self._C/self._tao) * (pre_car._abs_speed - self._abs_speed) / ((pre_car._abs_pos - self._abs_pos)*0.001))
            self._abs_acc = safe_acc((self._C/self._tao) * (pre_car._abs_speed - self._abs_speed) / ((pre_car._abs_pos - self._abs_pos)*0.001)**2)
        else:
            self._abs_acc = safe_acc((self._C/self._tao) * (pre_car._abs_speed - self._abs_speed))

        delta_speed = last_acc * delta_t
        self._abs_speed = self._abs_speed + delta_speed
        # 不能倒车
        if self._abs_speed < 0:
            self._abs_speed = 0.0

        self._rel_dis_pre = pre_car._abs_pos - self._abs_pos
        if self._rel_dis_pre <= saft_dis:
            self._abs_acc = 0.0
            self._abs_speed = 0.0

        # Attention: (last_speed/3.6)
        delta_pos = 0.5*(last_acc * delta_t**2) + ((last_speed/3.6) * delta_t)
        if delta_pos < 0:
            delta_pos = 0.0
        self._abs_pos = self._abs_pos + delta_pos

        self._abs_acc_list.append(self._abs_acc)
        self._abs_speed_list.append(self._abs_speed)
        self._abs_pos_list.append(self._abs_pos)

    def get_pos_list(self):
        return self._abs_pos_list

    def get_xva_list(self):
        return [self._abs_pos_list, self._abs_speed_list, self._abs_acc_list]


# 初始化车的位置, 采用“发车”形式，未出发车辆位置为负数
cars = []
first_car = FirstCar()
for i in range(car_cnt-1):
    cars.append(Car(abs_pos=0.0-(i+1)*car_dis_init, heter=False))
    # cars.append(Car(abs_pos=0.0-(i+1)*car_dis_init, heter=True))

    # cars.append(Car(abs_pos=0.0-(i+1)*car_dis_init, heter=False, nonlinear=True))

# 仿真主循环
while True:
    # 设置变速条件
    if m_start_acc < first_car.get_pos() < m_start_dec:
        first_car.set_acc(norm_dec)
        if first_car.get_speed() < min_speed:
            first_car.set_acc(0.0)
    if m_start_dec < first_car.get_pos() < m_stop_line:
        first_car.set_acc(max_acc)
        if first_car.get_speed() > speed_init:
            first_car.set_acc(0.0)
    if cars[-1].get_pos() > m_stop_line:
        break

    t.append(t[-1]+0.1)
    print(len(t))

    first_car.update()
    cars[0].update(first_car)
    for car_idx in range(len(cars)):
        if car_idx == 0: continue
        cars[car_idx].update(cars[car_idx-1])


# 绘制时空图
t.pop(0)
print("Match Size:",len(t),len(first_car.get_pos_list()))
plt.plot(t, first_car.get_pos_list(), label="Car1")
for car_idx, this_car in enumerate(cars):
    plt.plot(t, this_car.get_pos_list(), label=("Car%d" % (car_idx + 2)))

# 添加辅助线
plt.hlines(0, 0, t[-1], hold=None, label="0m", color="black", linestyle="--")
plt.hlines(m_start_acc, 0, t[-1], hold=None, label=str(m_start_acc)+"m", color="black",
           linestyle="--")
plt.hlines(m_start_dec, 0, t[-1], hold=None, label=str(m_start_acc)+"m", color="black",
           linestyle="--")
plt.hlines(m_stop_line, 0, t[-1], hold=None, label=str(m_start_acc)+"m", color="black",
           linestyle="--")

# 添加标注
plt.xlabel("Time(s)")
plt.ylabel("Space(m)")
plt.xlim(t[0], t[-1])
plt.title("Time-Space Graph" + "(" + str(saft_dis) + "m gap" + ")")
plt.legend(loc=2, prop={"size": 6}, ncol=3, fancybox=True, shadow=True)

# 显示图片
img_name = str(saft_dis)
fig = plt.gcf() # "get current figure"
fig.savefig(img_name+".eps", format="eps", dpi=1000)
fig.savefig(img_name+".png", format="png", dpi=200)

plt.show()



#
database = []
database.append(first_car.get_xva_list())
for car in cars:
    database.append(car.get_xva_list())

data = []
for i in range(len(t)):
    row = []
    for item in database:
        row.append(float("%.1f" % item[0][i]))
        row.append(float("%.1f" % item[1][i]))
        row.append(float("%.1f" % item[2][i]))
    data.append(row)


# csv文件格式： 共有3500行，每行为0.1s车辆速度，共有50x3=150列，为每辆车的x, v, a
output_csv = str(saft_dis) + ".csv"
with open(output_csv, "wb") as csvfile:
    csvfile = csv.writer(csvfile, delimiter=",")
    for row in data:
        csvfile.writerow(row)

# 完成
print("All Done!")
```


