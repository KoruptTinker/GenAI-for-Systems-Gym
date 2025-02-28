#!/bin/bash
#BSUB -n 1
#BSUB -W 48:00
#BSUB -J evaluation_phase_layers_4
#BSUB -o /share/csc591s25/bkbhayan/GenAI-for-Systems-Gym/homework-1/models/MLP_Layers_4/logs/out_layers_4_eval.%J
#BSUB -e /share/csc591s25/bkbhayan/GenAI-for-Systems-Gym/homework-1/models/MLP_Layers_4/logs/err_layers_4_eval.%J

source ~/.bashrc
conda activate /share/$GROUP/conda_env/new_env
cd /share/$GROUP/$USER/GenAI-for-Systems-Gym/homework-1/models/MLP_Layers_4

python3 -m cache_replacement.policy_learning.cache.main \
  --experiment_base_dir=/share/$GROUP/$USER/GenAI-for-Systems-Gym/homework-1/models/MLP_Layers_4/experiments\
  --experiment_name=evaluation_phase_layers_4 \
  --cache_configs="cache_replacement/policy_learning/cache/configs/default.json" \
  --cache_configs="cache_replacement/policy_learning/cache/configs/eviction_policy/learned.json" \
  --memtrace_file="/share/csc591s25/traces/astar_313B_test.csv" \
  --config_bindings="associativity=16" \
  --config_bindings="capacity=2097152" \
  --config_bindings="eviction_policy.scorer.checkpoint=\"/share/csc591s25/bkbhayan/GenAI-for-Systems-Gym/homework-1/models/MLP_Layers_4/experiments/mlp_layers_4/checkpoints/20000.ckpt\"" \
  --config_bindings="eviction_policy.scorer.config_path=\"/share/csc591s25/bkbhayan/GenAI-for-Systems-Gym/homework-1/models/MLP_Layers_4/experiments/mlp_layers_4/model_config.json\"" \
  --warmup_period=0