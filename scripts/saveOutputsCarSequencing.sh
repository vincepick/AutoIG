#!/bin/bash

# Reading output folder name
read -p "Enter the output folder name: " folder_name

current_date=$(date +%F)
withDate="${folder_name}_${current_date}"

# Setting output path
output_path="$AUTOIG/experiments/command-outputs/car-sequencing/$withDate"

# Create output directory if doesnt already exist
mkdir -p "$output_path"

# python $AUTOIG/scripts/setup.py \
#     --generatorModel $AUTOIG/data/models/tinyEssence/tiny_gen.essence \
#     --problemModel $AUTOIG/data/models/tinyEssence/tinyProb.essence \
#     --instanceSetting graded \
#     --minSolverTime 0 \
#     --maxSolverTime 5 \
#     --solver chuffed \
#     --solverFlags="-f" \
#     --maxEvaluations 180 \
#     --genSolverTimeLimit 5 >"$output_path/setup.txt" 2>&1

python $AUTOIG/scripts/setup.py \
    --generatorModel $AUTOIG/data/models/car-sequencing/generator.essence \
    --problemModel $AUTOIG/data/models//car-sequencing/problem.essence \
    --instanceSetting graded \
    --minSolverTime 0 \
    --maxSolverTime 5 \
    --solver chuffed \
    --solverFlags="-f" \
    --maxEvaluations 300 \
    --genSolverTimeLimit 5 >"$output_path/setup.txt" 2>&1

bash run.sh >"$output_path/run.txt" 2>&1

echo "echo setup and run output to $output_path"
