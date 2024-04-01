#!/bin/bash
#this will extract the string of the ProjectLocation

#shell script will take in the first argument
proloc=$(xmllint --xpath 'string(//Project/@ProjectLocation)' $1)    #/path/.../
#p2=$(xmllint --xpath '//PalettesLocation/text()' $2)
#a contains the string of the ProjectLocation
a='n:\utilities\cad\adt projects\4273\'
number=$(echo $1 | sed 's/[^0-9]*//g')
valid='\\ou\arm\om\utilities\cad\adt projects\'$number'\'
#echo 'This is the valid string for the file: ' $valid 
echo
#take in the file number 
#use grep command to check if the second char is equal to colon 
#if it is then, update the whole phrase with given template
echo -e "ProjectLocation: $proloc"
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
palloc=$(xmllint --xpath '//PalettesLocation/text()' $1)
echo "PalettesLocation: $palloc"
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
conloc=$(xmllint --xpath '//ConstructLocation/text()' $1)
valid3=$valid'Constructs\'
echo "ConstructLocation:  $conloc"
if [ "$s_char" = : ] 
then 
  echo 'ConstructLocation string is invalid'
  c=1
  echo "correct path: $valid3"
  echo
else
  echo 'it is correct'
  c=0
  echo
fi

#<ElementLocation>n:\utilities\cad\adt projects\3303\Elements\</ElementLocation>
eleloc=$(xmllint --xpath '//ElementLocation/text()' $1)
valid4=$valid'Elements\'
echo "ElementLocation: $eleloc"
if [ "$s_char" = : ] 
then 
  echo 'ElementLocation string is invalid'
  echo "correct path: $valid4"
  f=1
  echo
else
  echo 'it is correct'
  f=0
  echo
fi

#<ViewLocation>n:\utilities\cad\adt projects\3303\Views\</ViewLocation>
viewloc=$(xmllint --xpath '//ViewLocation/text()' $1) 
valid5=$valid'Views\'
echo "ViewLocation:  $viewloc"
if [ "$s_char" = : ] 
then 
  echo 'ViewLocation string is invalid'
  d=1
  echo "correct path: $Views5"
  echo
else
  echo 'it is correct'
  d=0
  echo
fi

#<SheetLocation>n:\utilities\cad\adt projects\3303\Sheet\</SheetLocation>
palloc=$(xmllint --xpath '//SheetLocation/text()' $1)
valid6=$valid'Sheets\'
echo "SheetLocation:  $palloc"
if [ "$s_char" = : ]
then
  echo 'SheetLocation string is invalid'
  e=1
  echo "correct path: $valid6"
  echo
else
  echo 'it is correct'
  e=0
  echo
fi

count=$(( $a + $b + $c + $d + $e +$f))
echo "$1 displayed errors: [ $count ]"

#==================================================================================================
proloc=$(xmllint --xpath '//PalettesLocation/text()' $2)
#a contains the string of the ProjectLocation
a='n:\utilities\cad\adt projects\4273\'
number=$(echo $1 | sed 's/[^0-9]*//g')
valid='\\ou\arm\om\utilities\cad\adt projects\'$number'\'
#echo 'This is the valid string for the file: ' $valid
echo
#take in the file number
#use grep command to check if the second char is equal to colon
#if it is then, update the whole phrase with given template
echo -e "ProjectLocation: $proloc"
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
palloc=$(xmllint --xpath '//PalettesLocation/text()' $2)
echo "PalettesLocation: $palloc"
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
conloc=$(xmllint --xpath '//ConstructLocation/text()' $2)
valid3=$valid'Constructs\'
echo "ConstructLocation:  $conloc"
if [ "$s_char" = : ]
then
  echo 'ConstructLocation string is invalid'
  c=1
  echo "correct path: $valid3"
  echo
else
  echo 'it is correct'
  c=0
  echo
fi

#<ElementLocation>n:\utilities\cad\adt projects\3303\Elements\</ElementLocation>
eleloc=$(xmllint --xpath '//ElementLocation/text()' $2)
valid4=$valid'Elements\'
echo "ElementLocation: $eleloc"
if [ "$s_char" = : ]
then
  echo 'ElementLocation string is invalid'
  echo "correct path: $valid4"
  f=1
  echo
else
  echo 'it is correct'
  f=0
  echo
fi

#<ViewLocation>n:\utilities\cad\adt projects\3303\Views\</ViewLocation>
viewloc=$(xmllint --xpath '//ViewLocation/text()' $2)
valid5=$valid'Views\'
echo "ViewLocation:  $viewloc"
if [ "$s_char" = : ]
then
  echo 'ViewLocation string is invalid'
  d=1
  echo "correct path: $Views5"
  echo
else
  echo 'it is correct'
  d=0
  echo
fi

#<SheetLocation>n:\utilities\cad\adt projects\3303\Sheet\</SheetLocation>
palloc=$(xmllint --xpath '//SheetLocation/text()' $2)
valid6=$valid'Sheets\'
echo "SheetLocation:  $palloc"
if [ "$s_char" = : ]
then
  echo 'SheetLocation string is invalid'
  e=1
  echo "correct path: $valid6"
  echo
else
  echo 'it is correct'
  e=0
  echo
fi

count=$(( $a + $b + $c + $d + $e + $f))
echo "$2 displayed errors: [ $count ]"

#========================================================================================================
#shell script will take in the first argument
proloc=$(xmllint --xpath 'string(//Project/@ProjectLocation)' $3)    #/path/.../
#p2=$(xmllint --xpath '//PalettesLocation/text()' $2)
#a contains the string of the ProjectLocation
a='n:\utilities\cad\adt projects\4273\'
number=$(echo $1 | sed 's/[^0-9]*//g')
valid='\\ou\arm\om\utilities\cad\adt projects\'$number'\'
#echo 'This is the valid string for the file: ' $valid
echo
#take in the file number
#use grep command to check if the second char is equal to colon
#if it is then, update the whole phrase with given template
echo -e "ProjectLocation: $proloc"
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
palloc=$(xmllint --xpath '//PalettesLocation/text()' $3)
echo "PalettesLocation: $palloc"
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
conloc=$(xmllint --xpath '//ConstructLocation/text()' $3)
valid3=$valid'Constructs\'
echo "ConstructLocation:  $conloc"
if [ "$s_char" = : ]
then
  echo 'ConstructLocation string is invalid'
  c=1
  echo "correct path: $valid3"
  echo
else
  echo 'it is correct'
  c=0
  echo
fi

#<ElementLocation>n:\utilities\cad\adt projects\3303\Elements\</ElementLocation>
eleloc=$(xmllint --xpath '//ElementLocation/text()' $3)
valid4=$valid'Elements\'
echo "ElementLocation: $eleloc"
if [ "$s_char" = : ]
then
  echo 'ElementLocation string is invalid'
  echo "correct path: $valid4"
  f=1
  echo
else
  echo 'it is correct'
  f=0
  echo
fi

#<ViewLocation>n:\utilities\cad\adt projects\3303\Views\</ViewLocation>
viewloc=$(xmllint --xpath '//ViewLocation/text()' $3)
valid5=$valid'Views\'
echo "ViewLocation:  $viewloc"
if [ "$s_char" = : ]
then
  echo 'ViewLocation string is invalid'
  d=1
  echo "correct path: $Views5"
  echo
else
  echo 'it is correct'
  d=0
  echo
fi

#<SheetLocation>n:\utilities\cad\adt projects\3303\Sheet\</SheetLocation>
palloc=$(xmllint --xpath '//SheetLocation/text()' $3)
valid6=$valid'Sheets\'
echo "SheetLocation:  $palloc"
if [ "$s_char" = : ]
then
  echo 'SheetLocation string is invalid'
  e=1
  echo "correct path: $valid6"
  echo
else
  echo 'it is correct'
  e=0
  echo
fi

count=$(( $a + $b + $c + $d + $e +$f))
echo "$1 displayed errors: [ $count ]"

#==================================================================================================
proloc=$(xmllint --xpath '//PalettesLocation/text()' $4)
#a contains the string of the ProjectLocation
a='n:\utilities\cad\adt projects\4273\'
number=$(echo $1 | sed 's/[^0-9]*//g')
valid='\\ou\arm\om\utilities\cad\adt projects\'$number'\'
#echo 'This is the valid string for the file: ' $valid
echo
#take in the file number
#use grep command to check if the second char is equal to colon
#if it is then, update the whole phrase with given template
echo -e "ProjectLocation: $proloc"
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
palloc=$(xmllint --xpath '//PalettesLocation/text()' $4)
echo "PalettesLocation: $palloc"
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
conloc=$(xmllint --xpath '//ConstructLocation/text()' $4)
valid3=$valid'Constructs\'
echo "ConstructLocation:  $conloc"
if [ "$s_char" = : ]
then
  echo 'ConstructLocation string is invalid'
  c=1
  echo "correct path: $valid3"
  echo
else
  echo 'it is correct'
  c=0
  echo
fi

#<ElementLocation>n:\utilities\cad\adt projects\3303\Elements\</ElementLocation>
eleloc=$(xmllint --xpath '//ElementLocation/text()' $4)
valid4=$valid'Elements\'
echo "ElementLocation: $eleloc"
if [ "$s_char" = : ]
then
  echo 'ElementLocation string is invalid'
  echo "correct path: $valid4"
  f=1
  echo
else
  echo 'it is correct'
  f=0
  echo
fi

#<ViewLocation>n:\utilities\cad\adt projects\3303\Views\</ViewLocation>
viewloc=$(xmllint --xpath '//ViewLocation/text()' $4)
valid5=$valid'Views\'
echo "ViewLocation:  $viewloc"
if [ "$s_char" = : ]
then
  echo 'ViewLocation string is invalid'
  d=1
  echo "correct path: $Views5"
  echo
else
  echo 'it is correct'
  d=0
  echo
fi

#<SheetLocation>n:\utilities\cad\adt projects\3303\Sheet\</SheetLocation>
palloc=$(xmllint --xpath '//SheetLocation/text()' $4)
valid6=$valid'Sheets\'
echo "SheetLocation:  $palloc"
if [ "$s_char" = : ]
then
  echo 'SheetLocation string is invalid'
  e=1
  echo "correct path: $valid6"
  echo
else
  echo 'it is correct'
  e=0
  echo
fi

count=$(( $a + $b + $c + $d + $e + $f))
echo "$2 displayed errors: [ $count ]"
