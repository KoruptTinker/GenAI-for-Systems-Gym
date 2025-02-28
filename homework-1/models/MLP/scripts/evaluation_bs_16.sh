#!/bin/bash
#BSUB -n 1
#BSUB -W 1:00
#BSUB -J evaluation_phase_bs_16
#BSUB -o /share/csc591s25/bkbhayan/GenAI-for-Systems-Gym/homework-1/models/MLP/logs/out_bs_16_eval.%J
#BSUB -e /share/csc591s25/bkbhayan/GenAI-for-Systems-Gym/homework-1/models/MLP/logs/err_bs_16_eval.%J

source ~/.bashrc
conda activate /share/$GROUP/conda_env/new_env
cd /share/$GROUP/$USER/GenAI-for-Systems-Gym/homework-1/models/MLP

python3 -m cache_replacement.policy_learning.cache.main \
  --experiment_base_dir=/share/$GROUP/$USER/GenAI-for-Systems-Gym/homework-1/models/MLP/experiments\
  --experiment_name=evaluation_phase_bs_16 \
  --cache_configs="cache_replacement/policy_learning/cache/configs/default.json" \
  --cache_configs="cache_replacement/policy_learning/cache/configs/eviction_policy/learned.json" \
  --memtrace_file="/share/csc591s25/traces/astar_313B_test.csv" \
  --config_bindings="associativity=16" \
  --config_bindings="capacity=2097152" \
  --config_bindings="eviction_policy.scorer.checkpoint=\"/share/csc591s25/bkbhayan/GenAI-for-Systems-Gym/homework-1/models/MLP/experiments/train_bs_16/checkpoints/20000.ckpt\"" \
  --config_bindings="eviction_policy.scorer.config_path=\"/share/csc591s25/bkbhayan/GenAI-for-Systems-Gym/homework-1/models/MLP/experiments/train_bs_16/model_config.json\"" \
  --warmup_period=0