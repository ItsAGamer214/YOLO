#!/bin/bash
#SBATCH --job-name=train
#SBATCH --nodes=1                  # Number of nodes
#SBATCH --time=08:00:00            # Time limit (4 hours)
#SBATCH --partition=normal          # GPU partition (modify according to your cluster)
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

# Activate conda environment (if using)
source activate sttran

# Run your commands
echo "Starting application..."
cd ~/scratch/STTran

python ActionGenome/tools/dump_frames.py

# Job completion info
echo "Job completed at: $(date)"
