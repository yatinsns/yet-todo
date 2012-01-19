BEGIN {
FS=":"
}
{
print "-----------------"
if ($1 == "TODO")
{
  print NR "  *  \033[01;31mTODO\033[0m    *   " $2
}
else 
{
  print NR "  *  \033[01;32mDONE\033[0m    *   " $2	
}
print "-----------------"
}
