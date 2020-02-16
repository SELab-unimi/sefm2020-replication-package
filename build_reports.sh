#!/bin/bash
# Create the final report for each %uncertainty value and rectangle distance

# args
log_prefix=$1
u_values=(u25 u50 u75 u100)
rectangles=(001 002 004 008 012)
# -----------------------------------------------------------------------------

single_report() {
  distance=$1
  echo tests category
  for u in ${u_values[*]}
  do
    for d in `ls | grep $log_prefix`
    do
      tests=$(grep 'test:' $d/safehome_${u}-rectangles_${distance} | cut -d'#' -f2 | cut -d':' -f2 | awk '{count=count+$NF}END{print count}')
      category=$(echo ${u} | cut -d'u' -f2)
      echo $tests $category
    done
  done
}

# execution
for r in ${rectangles[*]}
do
  echo -e "$( single_report $r )" > report${r}
done
