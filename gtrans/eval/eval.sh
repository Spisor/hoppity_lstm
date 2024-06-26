data_name="test"
cooked_root="/mnt/d/ZeroOneDiff/cooked-no-op-fmt-shift_node/"
save_dir="/mnt/d/saved_dir/"
target_model="/mnt/d/no-diff.ckpt"

export CUDA_VISIBLE_DEVICES=0

python eval.py \
	-target_model "/mnt/d/no-diff.ckpt" \
	-data_root $cooked_root \
	-data_name "test" \
	-save_dir "/mnt/d/saved_dir/" \
	-eval_dump_folder "/mnt/d/eval_dump_folder" \
	-iters_per_val 100 \
	-beam_size 3 \
	-batch_size 20 \
	-topk 3 \
	-gnn_type 's2v_multi' \
	-max_lv 4 \
	-max_modify_steps 1 \
	-gpu 0 \
	-resampling True \
	-comp_method "bilinear" \
	-bug_type True \
	-loc_acc True \
	-val_acc True \
	-op_acc True \
	-type_acc True \
	-output_all True \
	$@
