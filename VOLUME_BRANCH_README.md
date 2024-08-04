This branch contains an implementation in which the Docker container uses a volume to interact with the host file system, and allows changes to persist.

**Run Commands to setup container:**
`docker build --platform linux/amd64 -t my-ubuntu-image .`

`docker run -it --name <container-name> -v <path to project on machine>:/AutoIG my-ubuntu-image /bin/bash`

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
