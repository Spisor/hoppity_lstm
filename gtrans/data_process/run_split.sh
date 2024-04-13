#!/bin/bash

save_dir=/mnt/d/ZeroOneDiff/cooked-no-op-fmt-shift_node/

python split_train_test.py \
    -save_dir $save_dir \
    $@
