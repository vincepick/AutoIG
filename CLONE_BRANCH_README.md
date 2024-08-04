This branch implements a Docker which clones a fresh copy of the AutoIG git repository each time it is built. This takes longer, but also ensures that the version being used is up to date. However, changes in the directory must be pushed to the AutoIG git directly because there is no volume used and storage will not persist. 

**Run Commands to setup container:**
`docker build --platform linux/amd64 -t conjure_clone_image .`

`docker run -it --name <my-interactive-conjure-app> conjure_clone_image /bin/bash`

**Once the container has been created, run the following commands to finish setting up**

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


**To run quick example**

mkdir -p experiments/macc-graded/

cd experiments/macc-graded/

python $AUTOIG/scripts/setup.py --generatorModel $AUTOIG/data/models/macc/generator-small.essence --problemModel $AUTOIG/data/models/macc/problem.mzn --instanceSetting graded --minSolverTime 0 --maxSolverTime 5 --solver chuffed --solverFlags="-f" --maxEvaluations 180 --genSolverTimeLimit 5

bash run.sh
