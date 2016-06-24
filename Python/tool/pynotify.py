#coding:utf-8 

import pynotify  
  
pynotify.init ("Bubble@Linux")  
bubble_notify = pynotify.Notification ("Linux上的泡泡提示", "看，比Windows上实现方便多了！")  
bubble_notify.show () 