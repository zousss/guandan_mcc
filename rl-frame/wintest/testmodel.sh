#!/bin/bash
nohup /home/luyd/guandan/wintest/guandan 1000 >/dev/null 2>&1 &
sleep 0.5s
nohup /root/miniconda3/envs/guandan/bin/python /home/luyd/guandan/wintest/ai2/client0.py >/dev/null 2>&1 &
# /root/miniconda3/envs/guandan/bin/python /home/luyd/guandan/wintest/random_clien0.py 2>&1 &
sleep 0.5s
nohup /root/miniconda3/envs/guandan/bin/python /home/luyd/guandan/wintest/newversion/my/client1.py --resfile res$1v2.log >/dev/null 2>&1 &
# /root/miniconda3/envs/guandan/bin/python /home/luyd/guandan/wintest/newversion/my/client1.py --resfile res$1v9.log 2>&1 &
sleep 0.5s
nohup /root/miniconda3/envs/guandan/bin/python /home/luyd/guandan/wintest/ai2/client2.py >/dev/null 2>&1 &
sleep 0.5s
nohup /root/miniconda3/envs/guandan/bin/python /home/luyd/guandan/wintest/newversion/my/client3.py >/dev/null 2>&1 &
sleep 0.5s
nohup /root/miniconda3/envs/guandan/bin/python /home/luyd/guandan/wintest/newversion/my/actor.py --model $1 >/dev/null 2>&1 &
# /root/miniconda3/envs/guandan/bin/python /home/luyd/guandan/wintest/newversion/my/actor.py --model $1 2>&1 &
echo $1
