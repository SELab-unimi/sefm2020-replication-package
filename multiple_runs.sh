#!/bin/bash
# Execute multiple times the experiments declared in run_all_config

# args

# number of executions
times=$1
# -----------------------------------------------------------------------------

# execution

for i in `seq 1 $times`
do
  out_dir=zlogs$i
  mkdir -p $out_dir
  ./run_all.sh $out_dir
done
