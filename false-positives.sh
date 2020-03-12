#!/bin/bash
# Create the final report for each %uncertainty value and rectangle distance

# args
log_prefix=$1
u_values=(u25 u50 u75 u100)
rectangles=(001 002 004 008 016)
bounds001=(0.0 0.94 0.05 1.0 0.11 1.0 0.0 0.89 0.03 1.0 0.41 1.0)
bounds002=(0.0 0.93 0.06 1.0 0.12 1.0 0.0 0.88 0.04 1.0 0.42 1.0)
bounds004=(0.0 0.91 0.08 1.0 0.14 1.0 0.0 0.86 0.06 1.0 0.44 1.0)
bounds008=(0.0 0.87 0.12 1.0 0.18 1.0 0.0 0.82 0.10 1.0 0.48 1.0)
bounds016=(0.0 0.79 0.20 1.0 0.26 1.0 0.0 0.74 0.18 1.0 0.56 1.0)
# -----------------------------------------------------------------------------

false_positives() {
  distance=$1

  bounds=()
  if [[ $distance == "001" ]]
  then
    bounds=(${bounds001[*]})
  elif [[ $distance == "002" ]]
  then
    bounds=(${bounds002[*]})
  elif [[ $distance == "004" ]]
  then
    bounds=(${bounds004[*]})
  elif [[ $distance == "008" ]]
  then
    bounds=(${bounds008[*]})
  elif [[ $distance == "016" ]]
  then
    bounds=(${bounds016[*]})
  fi

  for u in ${u_values[*]}
  do
    detect=0
    ndetect=0
    uncertainty=$(echo ${u} | cut -d'u' -f2)
    for d in `ls | grep $log_prefix`
    do
      regions=$(grep 'region:' $d/safehome_${u}-rectangles_${distance} | cut -d':' -f5)
      while read -r line
      do
        n=$(echo $line | wc -w)
        hdr=($line)
        for j in `seq 0 2 $((n-4))`
        do
          hdr_l=$(echo ${hdr[$j]} | sed 's/[][,]//g')
          hdr_u=$(echo ${hdr[$((j+1))]} | sed 's/[][,]//g')
          rect_l=$(echo ${bounds[$j]} | sed 's/[][,]//g')
          rect_u=$(echo ${bounds[$((j+1))]} | sed 's/[][,]//g')
          if [ $(echo "$hdr_l>$rect_u" | bc) -eq 1 ] || [ $(echo "$hdr_u<$rect_l" | bc) -eq 1 ]
          then
            detect=$((detect+1))
          else
            ndetect=$((ndetect+1))
          fi
        done
      done <<< "$regions"
    done
    echo $distance $uncertainty $detect $ndetect
  done
}

# execution

echo Computing false positives...
for r in ${rectangles[*]}
do
  echo -e "$( false_positives $r )"
done
