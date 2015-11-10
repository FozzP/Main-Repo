#lindex - Retrieve an element from a list
#
#The lindex command accepts a parameter, list, which it treats as a Tcl list. 
#It also accepts zero or more indices into the list. The indices may be presented 
#either consecutively on the command line, or grouped in a Tcl list and presented 
#as a single argument.
#
#If no indices are presented, the command takes the form:
#
#lindex list
#
#or
#
#lindex list{}
#
#In this case the return value of lindex is simply the value of the list parameter
#
#When presented with a single index, the lindex command treats list as a Tcl list 
#and returns the indx'th element from it (0 refers to the first element of the list).
#In extracting the element, lindex observes the same rules concerning braces and 
#quotes and backslashes as the Tcl command interpreter; however, variable substitution
#and command substitution do not occur. If index is negative or greater than or equal to 
#the number of elements in "value", then an empty string is returned. If index has the value
#"end", it refers to the last element in the list, and end-integer refers to the last element 
#in the list minus the specified integer offset.
#
#If additional index arguments are supplied, then each argument is used in turn to select 
#an element from the previous indexing operation, allowing the script to select elements 
#from sublists. The command,
#
#lindex $a 1 2 3
#
#or
#
#lindex $a {1 2 3}
#
#is synonymous with
#
#lindex [lindex [lindex $a1 1] 2] 3
#
#Examples

lindex {a b c}
# => a b c 
lindex {a b c} {}
# => a b c
lindex {a b c} 0 
# => a
lindex {a b c} 2
# => c 
lindex {a b c} end
# => c
lindex {a b c} end-1
# => b
lindex {{a b c} {d e f} {g h i}} 2 1
# => h
lindex {{a b c} {d e f} {g h i}} {2 1}
# => h
lindex {{{a b} {c d}} {{e f} {g h}}} 1 1 0 
# => g
lindex {{{a b} {c d}} {{e f} {g h}}} {1 1 0} 
# => g