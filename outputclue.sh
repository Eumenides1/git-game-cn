#!/bin/bash
if [ -z $1 ]; then 
  echo "well, someone didn't want to run the script with a file...";
  exit;
fi

file=$1
bug=7c85d987a917c2a555d1391426978f05
mesg="Level 7: \n Linus 来过了... \nI 我喜欢捉弄这些业余程序员！！\n如果你想要一些真正的乐趣，那么你应该尝试解决这个分支（tree）和 code4life 之间的冲突。\n我引入了一个小错误，你应该在冲突中修复它。>:)\n>:) 在你合并这两个文件之后，你应该再次运行 shell 脚本!!\n\n祝你好运!!!\n\n Hint: https://help.github.com/articles/resolving-a-merge-conflict-from-the-command-line/ "
merges=$(git log --format=%h --merges | head -1)
csum="md5sum"
if [ $(echo "$OSTYPE" | grep darwin) ];then
    csum="md5"
fi

if [ "$file" = "nextclue_input.cpp" ];then 
  if [ ${merges} ]; then 
    while read p; do 
      for w in $p;do 
        if [ `echo $w | $csum | awk '{print $1}'` = $bug ];then 
          echo -e $mesg; 
          exit; 
        fi; 
      done;
    done < $file ;
    echo -e "哇哦, 恭喜你!! 你解决了我留下的冲突!!\n如果你还想继续,那你就切换到 $(echo 90mP8ouQHsNe | tr -d '0-9A-Z') 分支吧!!\n" ;
   else 
     echo -e $mesg; 
     exit;
   fi; 
else 
  echo "Looks like you passed in the wrong file";
fi