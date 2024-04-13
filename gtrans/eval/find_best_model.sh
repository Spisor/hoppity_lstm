data_name="test"

cooked_root="/mnt/d/ZeroOneDiff/cooked-no-op-fmt-shift_node/"
save_dir="/mnt/d/saved_dir_lstm/"

loss_file="loss_file.txt"
max_num_diffs=1

export CUDA_VISIBLE_DEVICES=0

python find_best_model.py \
               -data_root $cooked_root \
               -data_name $data_name \
               -save_dir $save_dir \
               -gnn_type 's2v_multi' \
               -loss_file $loss_file \
               -max_lv 4 \
               -max_modify_steps $max_num_diffs \
               -resampling True \
               -rnn_cell "lstm" \
               -comp_method mlp \
               $@

