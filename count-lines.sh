#!/bin/bash


mkdir tmp
cd tmp

for repo in $(less ../github-repos.txt); do
  echo
  echo "Clonning $repo..."
  echo
  git clone "https://github.com/mateusfg7/$repo"
  echo

  echo "Count lines on $repo..."
  cd $repo
  git ls-files | xargs -n1 git blame --line-porcelain | sed -n 's/^author //p' | sort -f | uniq -ic | sort -nr | awk '/Mateus/ || /mateusfg7/ {print $1}' >> ../lines
  echo
  
  echo "Return to parent repo..."
  cd ../
  echo

  echo "Deleting $repo..."
  rm -rf $repo
  echo

  echo "------------------------------------------------------"
done

let n_of_lines=0

for n in $(<lines); do
  let n_of_lines+=$n
done


clear
echo
echo "$n_of_lines lines of code writed on github"
echo

cd ../
rm -rf tmp
