BEGIN {
FS=":"
}
{
if ($1=="TODO")
{
	print $0
}
}
