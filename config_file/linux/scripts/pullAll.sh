#!/bin/bash

set -e

baseDir=$(pwd)
echo -e "baseDir is: $baseDir\n"

cd $baseDir/njudii/blog/
git pull
echo "  njudii/blog/"

cd $baseDir/njudii/gitee/blog/
git pull
echo "  njudii/gitee/blog/"

cd $baseDir/me/BachelorThesis/
git pull
echo "  me/BachelorThesis/"

cd $baseDir/me/MendeleyBackup/
git pull
echo "  me/MendeleyBackup/"

cd $baseDir/me/about/
git pull
echo "  me/about/"

cd $baseDir/me/blogFiles/
git pull
echo "  me/blogFiles/"

cd $baseDir/me/hugo-theme-next-site/themes/hugo-theme-next/
git pull
echo "  me/hugo-theme-next-site/"

cd $baseDir/me/maupassant-hugo-site/themes/maupassant-hugo/
git pull
echo "  me/maupassant-hugo-site/"

cd $baseDir/me/myPyFiles/
git pull
echo "  me/myPyFiles/"

cd $baseDir/me/my-documents/
git pull
echo "  me/my-documents/"
