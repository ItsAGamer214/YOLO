#!/bin/bash
#SBATCH --job-name=sttran
#SBATCH --nodes=1                  # Number of nodes
#SBATCH --time=04:00:00            # Time limit (4 hours)
#SBATCH --partition=normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=axa230262@utdallas.edu # Email address to send notifications
#SBATCH --output=%x-%j.out
#SBATCH --error=%x-%j.err

# Print job info
echo "Job started at: $(date)"
echo "Running on node: $(hostname)"

# Load necessary modules (customize for your environment)
module load miniconda

#make sure conda is loaded
source ~/.bashrc

# Activate conda environment (if using)
source activate sttran

# Run your commands
echo "Starting application..."
cd ~/scratch/STTran/ActionGenome
python tools/dump_frames.py

# Job completion info
echo "Job completed at: $(date)"
