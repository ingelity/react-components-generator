#!/bin/bash

# callable like:
# . grc.sh componentType componentName optionalPath
# componentType: hoc, full, pure

projectDir=$(pwd)
componentDir=/client/components

# spaces needed between [] or shell will misinterpret it
if [ $1 = hoc ]
then
  type=GenericReactHOC
  componentDir=/client/controllers
elif [ $1 = pure ]
then type=GenericReactPure
else type=GenericReactComponent
fi

if [ $3 ]
then
  componentDir=$3
  # -p flag creates all the necessary parent directories
  mkdir -p ./$componentDir
fi

srcDir=~/webDevelopment/playground/GenericReact/$type
destDir=${projectDir}${componentDir}
echo $destDir
# recursively copy all files from the first directory to the second one
cp -r $srcDir $destDir

cd $destDir

mv $type $2

cd $2

mv $type.jsx $2.jsx
mv ${type}Styles.scss $2Styles.scss

# find and replace in all files
sed -i -e "s/$type/$2/g" *

cd $projectDir
