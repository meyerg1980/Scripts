# \w matches word characters \won matches ron, don,and ton
# \W macthes non word characters whitespace and punctuation
# \d matches and digit from 0 - 9 inclusive
# \D matches any nondigit
# \s matches any whitespace character, including tab, space or carriage return
# \S matches any nonwhitespace character
# . (period) stands for any single character
# [abcde] matches any character in that set. The regex c[aeiou]r would match -
# car and cur , but not caun or coir .

# [a-z] matches one or more characters in that range. You can specify multiple -
# ranges as comma-separated lists, such as [a-f,m-z]

# [^abcde] matches one or more characters that are not in that set, meaning the-
# regex d[^aeiou] would match dns but not don .

# ? follows another literal or special character and matches exactly one instance
# of that character. So, the regex ca?r would match car but would not match
# coir . It would also match ca because ? can also match zero instances of the pre-
# ceding character.

# * matches any number of instances of the preceding character. The regex ca*r
# would match both cair and car . It would also match ca because * also matches
# zero instances of the preceding character.

# + matches one or more instances of the preceding character. You’ll see this used
# a lot with parentheses, which create a sort of subexpression. For example, the
# regex (ca)+r would match cacacacar because it matches repeating instances
# of the ca subexpression.

# \ (backslash) is the regex escape character. Use it in front of a character that
# normally has special meaning in the regex syntax, to make that character a lit-
# eral. For example, the regex \. would match a literal period character, rather
# than allowing the period to stand in for any single character, as it normally
# does. To match a literal backslash, escape it with a backslash: \\

#{2} matches exactly that many instances of the preceding character. For exam-
# ple, \d{1} matches exactly one digit. Use {2,} to match two or more, and use
# {1,3} to match at least one, but no more than three.

# ^ matches the beginning of the string. For example, the regex c.r would match
# car as well as pteranocar . But the regex ^c.r would match car but would not
# match pteranocar because the ^ makes the matching occur at the beginning of
# the string. This is a different use of ^ than in the previous example, where it was
# used with square brackets, [] , to indicate a negative match.

# $ matches the end of the string. For example, the regex .icks would match
# hicks and sticks (the match would technically be on ticks in that example),
# and would also match Dickson . But the regex .icks$ would not match Dickson
# because the $ indicates that the string should reach its end after the s .

# \d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3} matches the pattern of an IPv4
# address, although it’ll accept illegal data like 432.567.875.000 , as well as legal
# data like 192.169.15.12 .

# \\\\\w+(\\\w+)+ matches a Universal Naming Convention (UNC) path. All
# the backslashes make that regex hard to read—which is one reason it’s import-
# ant to test and tweak your regular expressions before you rely on them in a pro-
# duction task.

# \w{1}\.\w+@company\.com matches a specific type of email address: first initial,
# a period, last name, and then @company.com . For example, sam.smith@company
# .com would be a valid match. You do have to be a bit careful with these. For
# example, Samuel.smith@company.com.org or Smith@company.com.net would
# also be a valid match. The regex is fine with there being extra text before and
# after the matched portion. That’s where the ^ and $ anchors come into play in
# many situations.

"car" -match "c[aeiou]r"
"caaar" -match "c[aeiou]r"
"caaar" -match "c[aeiou]+r"
"cjinr" -match "c[aeiou]+r"
"cear" -match "c[aeiou]r"

get-childitem -filter *.log -recurse |
select-string -pattern "\s40[0-9]\s" |
format-table Filename,LineNumber,Line -wrap

get-eventlog -LogName security | where { $_.eventid -eq 4624 } |
select -ExpandProperty message | select-string -pattern `
"WIN[\W\w]+TM[234][0-9]\$"

get-eventlog -LogName security | where { $_.eventid -eq 4624 -and 
$_.message -match "WIN[\W\w]+TM[234][0-9]\$"