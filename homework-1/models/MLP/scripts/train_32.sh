#!/bin/bash
#BSUB -n 1
#BSUB -W 12:00
#BSUB -q gpu
#BSUB -gpu "num=1"
#BSUB -J sec3task1n32
#BSUB -o /share/csc591s25/bkbhayan/GenAI-for-Systems-Gym/homework-1/models/MLP/logs/out_32.%J
#BSUB -e /share/csc591s25/bkbhayan/GenAI-for-Systems-Gym/homework-1/models/MLP/logs/err_32.%J

source ~/.bashrc
conda activate /share/$GROUP/conda_env/new_env
cd /share/$GROUP/$USER/GenAI-for-Systems-Gym/homework-1/models/MLP

python3 -m cache_replacement.policy_learning.cache_model.main \
  --experiment_base_dir=/share/$GROUP/$USER/GenAI-for-Systems-Gym/homework-1/models/MLP/experiments \
  --experiment_name=sec3task1n32 \
  --cache_configs=cache_replacement/policy_learning/cache/configs/default.json \
  --model_bindings="loss=[\"log_likelihood\"]" \
  --model_bindings="address_embedder.max_vocab_size=5000" \
  --model_bindings="lstm_hidden_size=32" \
  --train_memtrace=/share/$GROUP/traces/astar_313B_train.csv \
  --valid_memtrace=/share/$GROUP/traces/astar_313B_valid.csv
