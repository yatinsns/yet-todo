BEGIN {
FS=":"
OFS=":"
}
{
if (NR==line)
{
$1=status
}
print $0
}
