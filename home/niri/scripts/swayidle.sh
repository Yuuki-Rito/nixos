#!/usr/bin/env bash

# 5分钟锁屏，10分钟熄屏，20分钟休眠
swayidle -w \
    timeout 600  'noctalia-shell ipc call lockScreen lock' \
    timeout 601  'niri msg action power-off-monitors' \
    resume       'niri msg action power-on-monitors' \
    timeout 1800 'noctalia-shell ipc call sessionMenu lockAndSuspend'
