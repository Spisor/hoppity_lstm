data_name="test"
cooked_root="/mnt/d/ZeroOneDiff/only_test/"
save_dir="/mnt/d/saved_dir_lstm/"
target_model="/mnt/d/saved_dir_lstm/epoch-70.ckpt"

export CUDA_VISIBLE_DEVICES=0

python eval.py \
	-target_model $target_model \
	-data_root $cooked_root \
	-data_name "test" \
	-save_dir "/mnt/d/saved_dir_lstm/" \
	-eval_dump_folder "/mnt/d/eval_dump_folder" \
	-iters_per_val 100 \
	-rnn_cell "lstm" \
	-beam_size 3 \
	-batch_size 256 \
	-topk 3 \
	-gnn_type 's2v_multi' \
	-max_lv 4 \
	-max_modify_steps 1 \
	-gpu 0 \
	-resampling True \
	-comp_method "mlp" \
	-bug_type True \
	-loc_acc True \
	-val_acc True \
	-op_acc True \
	-type_acc True \
	-output_all True \
	$@
