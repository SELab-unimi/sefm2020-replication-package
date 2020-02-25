#!/bin/bash
# Execute multiple times the experiments declared in run_all_config

# args

# number of executions (i.e., for loop $from $to indexes)
from=$1
to=$2
# -----------------------------------------------------------------------------

# execution

for i in `seq $from $to`
do
  out_dir=zlogs$i
  mkdir -p $out_dir
  ./run_all.sh $out_dir
done
