#!/bin/bash
# Create the final report for each %uncertainty value and rectangle distance

# args
log_prefix=$1
u_values=(u25 u50 u75 u100)
rectangles=(001 002 004 008 016)
# -----------------------------------------------------------------------------

distance_report() {
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

uncertainty_report() {
  u_value=$1
  echo tests distance
  for d in ${rectangles[*]}
  do
    for tests in $(grep ${u_value} report${d} | cut -d' ' -f1)
    do
      echo $tests $d
    done
  done
}

# execution

echo Creating tests_by_distance reports...
for r in ${rectangles[*]}
do
  echo Creating report${r}
  echo -e "$( distance_report $r )" > report${r}
done

echo Creating tests_by_uncertainty_degree reports...
for u in ${u_values[*]}
do
  category=$(echo ${u} | cut -d'u' -f2)
  echo Creating report${category}
  echo -e "$( uncertainty_report $category )" > report${category}
done
