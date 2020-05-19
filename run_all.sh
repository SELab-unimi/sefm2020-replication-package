#!/bin/bash
# Execute all the experiments declared in run_all_config and collect results

# args

# output folder
log_dir=$1

# config

# edit this part with your own setting
# MBT module directory
mbt_module_dir=/Users/myUser/tools/mbt-module

# do not edit the following lines
res_dir=$mbt_module_dir/src/main/resources
handler_dir=$mbt_module_dir/src/main/java/it/unimi/di/se/monitor/
# -----------------------------------------------------------------------------

# execution

while read args; do
  source_dir=$(echo $args | cut -d' ' -f1)
  rectangles=$(echo $args | cut -d' ' -f2)
  target_dir=$(echo $args | cut -d' ' -f3)
  target_name=$source_dir-"${rectangles##*/}"
  mdp=$source_dir/*.mdp
  jmdp=$source_dir/*.jmdp
  handler=$source_dir/*.aj
  tmp=$(ls -d $mdp)
  mdp_name="${tmp##*/}"
  tmp=$(ls -d $jmdp)
  jmdp_name="${tmp##*/}"
  handler_name="${handler##*/}"

  echo copying...
  echo $mdp $jmdp into $res_dir
  cp $mdp $res_dir
  cp $jmdp $res_dir
  echo $rectangles into $res_dir/rectangles
  cp $rectangles $res_dir/rectangles
  echo $handler into $handler_dir
  cp $handler $handler_dir

  pushd $mbt_module_dir > /dev/null
  echo building...
  ./gradlew --no-daemon clean build 1>&2
  echo executing...
  ./gradlew --no-daemon run -PappArgs='['"'-i', 'src/main/resources/"$jmdp_name"'"']' 1>&2
  echo cleanup...
  rm src/main/resources/$mdp_name
  echo src/main/resources/$mdp_name
  rm src/main/resources/$jmdp_name
  echo src/main/resources/$jmdp_name
  rm src/main/resources/rectangles
  echo src/main/resources/rectangles
  popd > /dev/null
  echo copying results...
  cp $mbt_module_dir/mylogs.log $log_dir/$target_name
  echo $log_dir/$target_name
  rm $mbt_module_dir/mylogs.log

done <run_all_config
