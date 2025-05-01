#!/bin/bash
#SBATCH --job-name=train
#SBATCH --nodes=1                  # Number of nodes
#SBATCH --time=2-00:00:00            # Time limit (4 hours)
#SBATCH --partition=a30          # GPU partition (modify according to your cluster)
#SBATCH --mail-type=ALL            # Send email on all events (BEGIN, END, FAIL, REQUEUE, etc.)
#SBATCH --mail-user=axa230262@utdallas.edu # Email address to send notifications
#SBATCH --output=%x-%j.out         # Standard output file (%x=job name, %j=job ID)
#SBATCH --error=%x-%j.err          # Standard error file

# Print job info
echo "Job started at: $(date)"
echo "Running on node: $(hostname)"
echo "Allocated GPUs: $CUDA_VISIBLE_DEVICES"

# Load necessary modules (customize for your environment)
module load miniconda

#make sure conda is loaded
source ~/.bashrc

conda init
conda activate g_retriever 

# Run your commands
echo "Starting application..."
cd ~/scratch/G-Retriever

python inference.py --dataset scene_graphs --model_name inference_llm --llm_model_name 7b_chat

# Job completion info
echo "Job completed at: $(date)"
