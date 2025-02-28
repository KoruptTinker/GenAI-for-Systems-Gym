#!/bin/bash
#BSUB -n 1
#BSUB -W 12:00
#BSUB -q gpu
#BSUB -gpu "num=1"
#BSUB -J mlp_tanh
#BSUB -o /share/csc591s25/bkbhayan/GenAI-for-Systems-Gym/homework-1/models/MLP_Tanh/logs/out_mlp_tanh.%J
#BSUB -e /share/csc591s25/bkbhayan/GenAI-for-Systems-Gym/homework-1/models/MLP_Tanh/logs/err_mlp_tanh.%J

source ~/.bashrc
conda activate /share/$GROUP/conda_env/new_env
cd /share/$GROUP/$USER/GenAI-for-Systems-Gym/homework-1/models/MLP_Tanh

python3 -m cache_replacement.policy_learning.cache_model.main \
  --experiment_base_dir=/share/$GROUP/$USER/GenAI-for-Systems-Gym/homework-1/models/MLP_Tanh/experiments \
  --experiment_name=mlp_tanh \
  --cache_configs=cache_replacement/policy_learning/cache/configs/default.json \
  --model_bindings="loss=[\"log_likelihood\"]" \
  --model_bindings="address_embedder.max_vocab_size=5000" \
  --train_memtrace=/share/$GROUP/traces/astar_313B_train.csv \
  --valid_memtrace=/share/$GROUP/traces/astar_313B_valid.csv
