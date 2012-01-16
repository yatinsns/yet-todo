{
if ($1 == "TODO")
{
  print "\033[01;31mTODO\033[0m " $2
}
else 
{
  print "\033[01;32mDONE\033[0m " $2	
}
}
