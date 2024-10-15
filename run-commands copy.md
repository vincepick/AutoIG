## Docker

This document contains partial instructions for running AutoIG in a Docker Volume

docker build --platform linux/amd64 -t autoig_volume .

docker run -it --name autoig_container -v <your path>/AutoIG:/AutoIG autoig_volume /bin/bash

## Commands

mv conjure AutoIG/bin

cd AutoIG

bin/install-savilerow.sh
bin/install-mininzinc.sh
bin/install-irace.sh
bin/install-runsolver.sh
bin/install-ortools.sh
bin/install-yuck.sh
bin/install-picat.sh

. bin/set-path.sh

AUTOIG=$(pwd)

### Specifically for running macc-graded mzn problem

mkdir -p experiments/macc-graded/

cd experiments/macc-graded/

python $AUTOIG/scripts/setup.py --generatorModel $AUTOIG/data/models/simple_e/simple_gen.essence --problemModel $AUTOIG/data/models/simple_e/simple.essence --instanceSetting graded --minSolverTime 0 --maxSolverTime 5 --solver chuffed --solverFlags="-f" --maxEvaluations 180 --genSolverTimeLimit 5

### Specifically for running tiny.mzn mzn probelm

mkdir -p experiments/tinymzn/

cd experiments/tinymzn/

python $AUTOIG/scripts/setup.py --generatorModel $AUTOIG/data/models/tiny/tiny_gen.essence --problemModel $AUTOIG/data/models/tiny/tiny.mzn --instanceSetting graded --minSolverTime 0 --maxSolverTime 5 --solver chuffed --solverFlags="-f" --maxEvaluations 180 --genSolverTimeLimit 5

### Specifically for running tinyProb.essence essence probelm

mkdir -p experiments/tiny-essence/

cd experiments/tiny-essence/

python $AUTOIG/scripts/setup.py --generatorModel $AUTOIG/data/models/tinyEssence/tiny_gen.essence --problemModel $AUTOIG/data/models/tinyEssence/tinyProb.essence --instanceSetting graded --minSolverTime 0 --maxSolverTime 5 --solver chuffed --solverFlags="-f" --maxEvaluations 180 --genSolverTimeLimit 5

### Specifically for running car-sequencing.essence essence problem

mkdir -p experiments/car-sequencing/

cd experiments/car-sequencing/

python $AUTOIG/scripts/setup.py --generatorModel $AUTOIG/data/models/car-sequencing/generator.essence --problemModel $AUTOIG/data/models/car-sequencing/problem.essence --instanceSetting graded --minSolverTime 0 --maxSolverTime 5 --solver chuffed --solverFlags="-f" --maxEvaluations 180 --genSolverTimeLimit 5

## Addition to specify outputting to created `command-outputs` folder to save command outputs

> $AUTOIG/experiments/command-outputs/setup/initialSetupOutputOct11th.txt 2>&1

> $AUTOIG/experiments/command-outputs/running/initialRnuOutputOct11th.txt 2>&1

## run command

bash run.sh

# Script Command

Navigate to corresponding experiment directory

`bash $AUTOIG/scripts/saveOutputsMzn.sh`

`bash $AUTOIG/scripts/saveOutputsEssence.sh`
`bash $AUTOIG/scripts/saveOutputsCarSequencing.sh`
