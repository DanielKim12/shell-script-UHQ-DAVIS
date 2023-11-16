#!/bin/bash

for i in "$@" 
do 
proloc=$(xmllint --xpath '//PalettesLocation/text()' $i)
#a contains the string of the ProjectLocation
a='n:\utilities\cad\adt projects\4273\'
number=$(echo $1 | sed 's/[^0-9]*//g')
valid='\\ou\arm\om\utilities\cad\adt projects\'$number'\'
#echo 'This is the valid string for the file: ' $valid
echo
#take in the file number
#use grep command to check if the second char is equal to colon
#if it is then, update the whole phrase with given template
#command to fetch the second char
s_char=$(echo $proloc | grep -o . | sed -n 2p)
#echo $s_char
if [ "$s_char" = : ]
then
  #echo sed $proloc | sed 's/\\/\//g'
  #just have to update the old string into new string.
  #sed -i -e $proloc -e $valid $proloc                 #this causes problem that "unterminated substitue" -this causes the expression is too long.
  echo 'ProjectLocation string is invalid'
  a=1
  echo "correct path: $valid"
  temp=$proloc | sed  's/\\/\//g'
  #sed -i -e $proloc 's/\\/\//g'
  #echo $proloc
  new=$valid | sed 's/\\/\//g' #this changes the \ to /.
  #sed -i "s\@$temp@$new@g" issue is that the file isnt being updated with this character, so it cannot update nor find it.
  echo
else
  echo 'it is correct'
  a=0
  echo
fi

#<PropertySetLocation></PropertySetLocation><PalettesLocation>n:\utilities\cad\adt projects\3303\</PalettesLocation>
palloc=$(xmllint --xpath '//PalettesLocation/text()' $i)
if [ "$s_char" = : ]
then
  echo 'PalletesLocation string is invalid'
  b=1
  echo "correct path: $valid"
  echo
else
  echo 'it is correct'
  b=0
  echo
fi

#<ConstructLocation>n:\utilities\cad\adt projects\3303\Constructs\</ConstructLocation>
conloc=$(xmllint --xpath '//ConstructLocation/text()' $i)
if [ "$conloc" = 'Constructs\']
then
  echo 'it is correct'
  c=0
  echo
else
  echo 'ConstructLocation string is invalid'
  c=1
  echo 'correct path: Constructs\'
  echo
fi

#<ElementLocation>n:\utilities\cad\adt projects\3303\Elements\</ElementLocation>
eleloc=$(xmllint --xpath '//ElementLocation/text()' $i)
if [ "$eleloc" = 'Elements\' ]
then
  echo 'it is correct'
  f=0
  echo
else 
  echo 'ElementLocation string is invalid'
  echo 'correct path: Elements\'
  f=1
  echo
fi

#<ViewLocation>n:\utilities\cad\adt projects\3303\Views\</ViewLocation>
viewloc=$(xmllint --xpath '//ViewLocation/text()' $i)
if [ "$viewloc" = 'Views\' ]
then
  echo 'it is correct'
  d=0
  echo
else 
  echo 'ViewLocation string is invalid'
  d=1
  echo 'correct path: Views\'
  echo
fi

#<SheetLocation>n:\utilities\cad\adt projects\3303\Sheet\</SheetLocation>
palloc=$(xmllint --xpath '//SheetLocation/text()' $i)
if [ "$palloc" = 'Sheets\' ]
then
  echo 'it is correct'
  e=0
  echo
else 
  echo 'SheetLocation string is invalid'
  e=1
  echo 'correct path: Sheets\'
  echo
fi

count=$(( $a + $b + $c + $d + $e + $f))
echo "$i displayed errors: [ $count ]"
done 
