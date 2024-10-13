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

python $AUTOIG/scripts/setup.py --generatorModel $AUTOIG/data/models/macc/generator-small.essence --problemModel $AUTOIG/data/models/macc/problem.mzn --instanceSetting graded --minSolverTime 0 --maxSolverTime 5 --solver chuffed --solverFlags="-f" --maxEvaluations 180 --genSolverTimeLimit 5

### Specifically for running tinyProb.essence essence probelm

mkdir -p experiments/tinyEssence/

cd experiments/tinyEssence/

python $AUTOIG/scripts/setup.py --generatorModel $AUTOIG/data/models/tiny/tiny_gen.essence --problemModel $AUTOIG/data/models/tiny/tinyProb.essence --instanceSetting graded --minSolverTime 0 --maxSolverTime 5 --solver chuffed --solverFlags="-f" --maxEvaluations 180 --genSolverTimeLimit 5

### Specifically for running car-sequencing.essence essence problem

mkdir -p experiments/car-sequencing/

cd experiments/car-sequencing/

python $AUTOIG/scripts/setup.py --generatorModel $AUTOIG/data/models/car-sequencing/generator.essence --problemModel $AUTOIG/data/models/car-sequencing/problem.essence --instanceSetting graded --minSolverTime 0 --maxSolverTime 5 --solver chuffed --solverFlags="-f" --maxEvaluations 180 --genSolverTimeLimit 5

## run command

bash run.sh
