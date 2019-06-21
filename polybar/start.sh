#!/bin/bash
source ~/.cache/wal/colors.sh
export color0_alpha="#aa${color0/'#'}"
nohup polybar bar > /dev/null 2>&1&
