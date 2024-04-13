cooked_root="/mnt/d/ZeroOneDiff/cooked-no-op-fmt-shift_node/"
data_name="test"

save_dir="/mnt/d/saved_dir_lstm/"

python main_gtrans.py \
	-data_root $cooked_root \
	-data_name $data_name \
	-save_dir $save_dir \
	-gnn_type 's2v_multi' \
	-gpu 0 \
	-max_lv 4 \
	-max_modify_steps 1 \
	-resampling True \
	-comp_method "mlp" \
	-rnn_cell "lstm" \
	-batch_size 200 \
	$@
