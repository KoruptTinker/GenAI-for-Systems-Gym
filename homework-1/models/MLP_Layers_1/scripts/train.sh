#!/bin/bash
#BSUB -n 1
#BSUB -W 12:00
#BSUB -q gpu
#BSUB -gpu "num=1"
#BSUB -J mlp_layers_1
#BSUB -o /share/csc591s25/bkbhayan/GenAI-for-Systems-Gym/homework-1/models/MLP_Layers_1/logs/out_mlp_layers_1.%J
#BSUB -e /share/csc591s25/bkbhayan/GenAI-for-Systems-Gym/homework-1/models/MLP_Layers_1/logs/err_mlp_layers_1.%J

source ~/.bashrc
conda activate /share/$GROUP/conda_env/new_env
cd /share/$GROUP/$USER/GenAI-for-Systems-Gym/homework-1/models/MLP_Layers_1

python3 -m cache_replacement.policy_learning.cache_model.main \
  --experiment_base_dir=/share/$GROUP/$USER/GenAI-for-Systems-Gym/homework-1/models/MLP_Layers_1/experiments \
  --experiment_name=mlp_layers_1 \
  --cache_configs=cache_replacement/policy_learning/cache/configs/default.json \
  --model_bindings="loss=[\"log_likelihood\"]" \
  --model_bindings="address_embedder.max_vocab_size=5000" \
  --train_memtrace=/share/$GROUP/traces/astar_313B_train.csv \
  --valid_memtrace=/share/$GROUP/traces/astar_313B_valid.csv
