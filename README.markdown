# Learn Enough Perl To Be Dangerous. 
# Covers Perl Functionality and Pattern Matching

# #!/usr/local/bin/perl –w
- perl file type is `.pl`
- Give it executable permissions
	- `chmod ug+x hello.pl
- Run it by typing:
	- `./hello.pl` or `perl hello.pl'
- The first line `#!/usr/local/bin/perl` tells UNIX where to find Perl
- `-w` switches on warnings 

# String example programs
```Perl
$var1 = "oscar"; 
$var2 = "henry";
$var3 = "diana"; 

print ucfirst($var1); # prints Oscar
print uc($var2); # prints HENRY
print lcfirst($var3); # prints dIANA 
```

# Perl types
- Perl has three types of variables.
	- scalar (strings or numeric)
	- arrays
	- hashes

```Perl
# Scalars, arrays, and hashes

$s1 = "hello";
$s2 = "world";
# concatenate scalars as follows: 
$s3 = $s1.$s2; 
$s4 = $s1." ".$s2; 

print "$s1 \n"; 
print "$s2 \n"; 
print "$s3; \n";
print "$s4; \n";

#---
hello

world

helloworld;

hello world;
```

# simple Perl Script
```Perl
#!/usr/bin/perl

print “what is your name? “;
chomp($name = <STDIN>); # Program waits for user input from keyboard
print “Welcome, $name, are your ready to learn Perl now? “;
chomp($response = <STDIN>);
$response=lc($response); # response is converted to lowercase
if ($response eq “yes” or $response eq “y”){
print “Great! Let’s get started learning Perl by example.\n”;
}
else {
print “O.K. Try again later.\n”;
}
$now = localtime; # Use a Perl function to get the date and time
print “$name, you ran this script on $now.\n”;
```

## How is Perl compiled?
- Trick question, perl is not compiled but interpreted and partially compiled for errors. 
- Perl interpreter is found in unix system by typing `where perl`
	- ... which may return `/usr/local/bin/perl` or `/usr/bin/perl`
		- This is why giving the path (`#!/usr/local/bin/perl`) of a Perl interpreter as boiler plate code is "required."


# print vs printf vs. sprintf
In summary, if you just want to output simple strings to the console, you can use `print`. If you need to output formatted text with placeholders for variables, use `printf`.

Parentheses are not required around the argument list
```Perl
#print function
print "Hello, world!\n";

#printf function 
my $name = "John";
my $age = 30;
printf "My name is %s and I am %d years old.\n", $name, $age;
```

`sprintf` is similar to `printf`, except that `printf` outputs the formatted string to the console, while `sprintf` returns the formatted string as a value that can be stored in a variable or used as a value for some other purpose.
```Perl
print "Hello, world\n";

print "Hello, ", " world\n";

print ("Its such a perfect day!\n"); # Parentheses optional

print "The date and time are: ", localtime(), "\n";

printf("Meet %s: Age %5d : Salary $%10.2f\n", "John", 40, 55000);

$string = sprintf("The name is: %10s\nThe number is: %8.2f\n", "Ellie", 33);

print $string; # sprintf allows you to assign the formatted string to a variable
```
```PlainText OUTPUT
Hello, world

Hello,  world

Its such a perfect day!

The date and time are: 1836231221230701

Meet John: Age    40 : Salary 010.2f

The name is:      Ellie

The number is:    33.00
```

# Numeric Literals
| Name                      | Number Representation |
| ------------------------- | --------------------- |
| Integer                   | 6                     |
| Floating point            | 12.6                  |
| Scientific Notation       | 1e10                  |
| Scientific Notation       | 6.4E-33               |
| Long Numbers (underscore) | 4_348_348             |


## Data Types and Variables 
- data types literally only include **scalars, arrays, and associative arrays (hashes)***
- Perl variables do not need to be declared.
- **Scalar** data types only hold *single* values (strings, numbers, "value").
- **Array** data types are denoted with `@` and elements are indexed starting at 0. 
	- To print the entire array, use @nameOfArray. Add a double quote to add spaces between. 
	- To add a new element to an array, you can expand an array by simply assigning a value to a new index. 
	**- Notice when we're accessing single values, we use the scalar ($) symbol even though the variable "type" is an array.** 
```Perl
my @names = ("Jessica", "Michelle", "Linda");

#Prints the array with elements seperated by a space;
print "@names"; print "\n";

#Print Jessica and Linda only.
print $names[0] and $names[2]; print "\n";

#Print Linda only using negative index
print $names[-1];   print "\n";

#Assign a 4th element, Nicole, to the @names array
#You can add new indexes to arrays in Perl, unlike in C++. 
$names[3] = "Nicole";
print "@names\n";

#What happens if we remove the double quotes? 
print @names;


#---
Jessica Michelle Linda

Jessica

Linda

Jessica Michelle Linda Nicole

JessicaMichelleLindaNicole
```

# Categories of Variables (Hash)
Hash variable : Unordered list of key/value pairs, indexed by string (key)
- Hash variables are denoted by `%` symbol.
```Perl
# One method for declaring hash k-v ... Pros: readability 
%employee = (
	"Name"     => "Jessica Savage",
	"Phone"    => "(212)-111-2223",
	"Position" => "CEO"
);

#print a the employee's name
print $employee{"Name"};

#assign a new key-value pair in %employee (SSN = 999-333-1234)
$employee{"SSN"} = "999-333-1234";

print "\n";
print $employee{"SSN"};
```
```Output
Jessica Savage

999-333-1234
````

# Perl Variable Characteristics
- **Variables do NOT need to be declared**. 
```Perl
#declare 'a' as "int"
$a = 5;

#'a' is now a string 
$a = "perl"; 
```

# Operators on Scalar Variables
Numeric and Logic Operators
- mostly the same as C++, only exponentiation is `**`

String Operators 
- Concatenation: `.` -- similiar to strcat() in C
```Perl
$first_name = "Larry";
$last_name = "Wall";
$full_name = $first_name . " " . $last_name;

print $full_name; 
```
```OUTPUT
Larry Wall
```

# Equality Operators for Strings
- **Do not use `==` or `!=` for string comparisons.**

In Perl, `eq` and `ne` are used to test for string equality and inequality, respectively.
- `eq` is used to test if two strings are equal to each other. For example:
```Perl
my $str1 = "Hello";
my $str2 = "World";

#WRONG
#if ($str1 == "Hello") { }

if ($str1 eq $str2) {
    print "The strings are equal\n" 
}

if  ($str1 ne $str2) {
    print "The strings are not equal\n";
}
```
```OUTPUT
The strings are not equal
```

It's important to note that `eq` and `ne` are case-sensitive.
- Use `lc` or `uc` to convert string to lowercase or upper case, respectively. 

```Perl
if (lc($str1) eq lc($str2)) {
    print "The strings are equal (case-insensitive)\n";
}
```

## Relational Operators for Strings
| Operation                | Numeric        | String |
|--------------------------|----------------|--------|
| Equal to                 | ==             | eq     |
| Not equal to             | !=             | ne     |
| Greater than             | >              | gt     |
| Greater than or equal to | >=             | ge     |
| Less than                | <              | lt     |
| Less than or equal to    | <=             | le     |

# Operator Precedence and Associativity
- Refer back to ppt4, slide 25. 

# String Functions
| Operation                             | Syntax                   |
|---------------------------------------|--------------------------|
| Convert to upper case                 | `$name = uc($name)`       |
| Convert only the first char to upper case | `$name = ucfirst($name)` |
| Convert to lower case                 | `$name = lc($name)`       |
| Convert only the first char to lower case | `$name = lcfirst($name)` |


## Variables (cont.)
# Find length of Array $#array + 1
```Perl
$x = 45.67;
$var = 'cost'; 
print "$var is $x";

@A = ('guna', 'me', 'cmu', 'pgh');
$i = 1; 
$A[$i] = 'guna';

#Assigning variables using other scalars as index
print "\n";
print $A[$i]; 

#How do we find the length of array 'A'? 
#Method 1 -- use $# operator 
$len = $#A + 1; # array index begins at 0, so this returns the last index + 1 for size. 
print "\n$len";

#Method 2 -- call it array without quotes
$len = @A; 
print "\n$len";

#However, calling @A in "" will print the entire array contents
print "\n@A";
```
```OUTPUT
cost is 45.67
guna
4
4
guna guna cmu pgh
```

# Resizing an Array & other print functionality
- The **# operator refers to array index.** 
```Perl
#Declare another array called 'array'
@array = (10, 12, 45); 
$#array = 1;  # sets last index to 1

#What is the @array size?

print "The array contains @array \n" ;

$arraySize = @array; #notice how @array used like this return its size, but print @array returns the entire array 
print "The array size is: "; print $arraySize; 

#Furthermore, notice the use of \ to negate the \@array in a double quoted print
print "\nThe array \@array used in a print statement returns this instead: "; print @array;
```
```OUTPUT
The array contains 10 12 
The array size is: 2
The array @array used in a print statement returns this instead: 1012
```
`$#array = 1;` sets the index of the last element in the `@array` to `1`. 
This means that the last element of the array is now the one at index 1. Since the array initially had three elements, setting the index of the last element to 1 effectively removes the element with value 45 from the array.

# Variable Substitution 
- Variables inside strings are replaced with their value in double quotes. 
- Variable substitution does not occur for single quotes.
```Perl
#Variable substitution -- double quote
$stooge = "Larry";
print "$stooge is one of the three stooges.\n";

#single quote -- no substitution
print '$stooge is one of the three stooges.\n';
```
```OUTPUT
Larry is one of the three stooges.
$stooge is one of the three stooges.\n
```

# Character Escapes
| Character | Escape Sequence |
| ---------| ---------------|
| Newline   | \n             |
| Tab       | \t             |
| Carriage return | \r       |

# Numbers and Strings are Interchangeable!
If a scalar variable looks like a number and Perl needs a number, it will use the variable as a number!

```Perl
# a number
$a = 4;

# prints 22
print $a + 18;

# $b is a string but.. 
$b = "50";

# will print 40
print $b - 10;
```

# if ... else ... statements
Similar to C/C++ - except that **scope braces are REQUIRED**!!

```Perl
if ($os eq "Linux") {
    print "Sweet!\n";
}
elsif ($os eq "Windows") { # no e!!!
    print "Time to move to Linux, buddy!\n";
}
else {
    print "Hmm...!\n";
}

```

# unless statement 
```Perl
unless ($condition) {
    # execute this block if $condition is false
}
else {
    # execute this block if $condition is true
}
```

Note that you can also use the if statement with an inverted condition to achieve the same effect as an unless statement. For example, the following code is equivalent to the first example above:

```Perl
if (! $condition) {
    # execute this block if $condition is false
}
```

# while Loop

While loop: Similar to C/C++ but again the braces are required!!
```Perl
$i = 0;
while ($i <= 1000) {
    print "$i\n";
    $i++;
}
```

# until Loop

The until function evaluates an expression repeatedly until a specific condition is met.
- Basically, executes if the condition is false. Stops when true. Opposite of while. 
```Perl
my $i = 1;
until ($i > 10) {
    print "$i\n";
    $i++;
}
```
```OUTPUT
1
2
3
4
5
6
7
8
9
10
```
the variable $i to 1, and then repeatedly prints the value of $i and increments it by 1 until $i is greater than 10. At that point, the loop terminates and the script continues executing the next statement after the loop.


# for loops
- Like C++, notice how the scarlar is used 

```Perl
for ($i = 0; $i < 10; $i++) {
    print "$i\n"; 
}
```

## for loops 2.0 
**- This one INCLUDES 10. So 0..10.** 
```Perl
for $i (0..10) {
	print "$i\n"
}
```
```OUTPUT
0
1
2
3
4
5
6
7
8
9
10
```

# Control Inside a Loop
Where you would use continue in C, use **next**
- The **next** statement is used to skip the current iteration of a loop and proceed to the next iteration.
Where you would use break in C, use last
- The last statement is used to exit a loop prematurely. For 


• What is the output for the following?
```Perl
for ($i = 0; $i < 10; $i++) {
    if ($i == 1 || $i == 3) { next; }

    if ($i == 5) { last; }

    print "$i\n"; 
}
```
```OUTPUT
0
2
4
```

## Other loops
### do {} while () 
**Note that the do block is always executed at least once,** regardless of whether the condition is true or false. This is because the condition is checked at the end of the block, after the code has been executed.
```Perl
my $i = 0;
do {
    print "$i\n";
    $i++;
} while ($i < 10);

```

### foreach 
In Perl, foreach is a looping construct used to iterate over elements of an array or a list. Here's the basic syntax:
```Perl
foreach my $element (@array) {
    # do something with $element
}
```
In this code, @array is an array variable containing a list of elements, and **$element is a loop variable that takes on each value in the array, one at a time.** **Inside the loop block, you can perform some action using the current value of $element.** For example, you might print the value of $element:
```Perl
my @fruits = ("apple", "banana", "orange");
foreach my $fruit (@fruits) {
    print "$fruit\n";
}
```

Note that the loop variable $element is a copy of the corresponding element in the array or list, so modifying $element inside the loop block does not affect the original array or list.

foreach can also be used with a list of values instead of an array:
```Perl
foreach my $value (1, 2, 3, 4, 5) {
    print "$value\n";
}
```

#### What does the following foreach code output?
```Perl
@range1 = (1..5);
@range2 = (10,15..20);

foreach $i (@range1, @range2) {
    print $i; print " ";
}
```
```OUTPUT
1 2 3 4 5 10 15 16 17 18 19 20
```

## Bubble Sort on an Array of Strings
```Perl
for ($i = 0; $i < n; $i++) {
    for ($j = 0; $j < n - $i; $j++) {
        if ($arr[$j] gt $arr[$j+1]) {
            $tmp = $arr[$j];
            $arr[$j] = $arr[$j+1];
            $arr[$j+1] = $tmp; 
        }
    }
}
```

Not really much to say about this... why doesn't `n` require a scalar declaration? 
Also, note that `gt` is used to compare strings. 


### Arrays 

Array variables are denoted by `@`
`@names = ("Larry", "Curly", "Moe"); 

To access array, use array variable.
### What is the difference between the two array prints?
```Perl
@names = ("Larry", "Curly", "Moe"); 

print @names; 

print "\n"; 

print "@names"; 
```
```OUTPUT
LarryCurlyMoe
Larry Curly Moe
```

### You do not need to loop through the array to print it -- Perl does this for you. 
```Perl
print "The elements of \@names are @names\n"; 
```

# Accessing Array Elements 

## To access one element of the array, use $ 
```Perl
@names = ("Larry", "Curly", "Moe"); 

print "$names[0]"; # prints Larry 
```
```OUTPUT
Larry
```
### What happens if we access an index not initialized? 
Undefined behavior.

### How to access the index of the LAST element?
- Keep in mind this is not the same as size. 
```Perl
@names = ("Larry", "Curly", "Moe"); 

print $#names;
```
```OUTPUT
2
```

### How to find the number of elements in an array (not index)?
How do we store an array into a scalar variable? We don't. Instead, in this case, it'll return the number of array elements. 
```Perl
@names = ("Larry", "Curly", "Moe"); 

$array_size = @names;
# recall another way is $array_size = $#names + 1

print $array_size;
```
```OUTPUT
3
```


### Array Elements and Print functionality
```Perl
print "Enter the number of the element you wish to view: ";
chomp ($x=<STDIN>);
@names=("Muriel","Gavin","Susanne","Sarah","Anna","Paul","Simon");

#We can use multiple indexes seperated by commas 
print "The first two elements are @names[0,1]\n";

#We can enter a range, which are inclusive. 
print "The first three elements are @names[0..2]\n"; 

#Notice that we use the scalar symbol even though names is an array because we are accessing one element only.
print "You requested element $x who is $names[$x - 1]\n"; #starts at 0, if we enter 0, it'll show "simon"

print "The element before and after are @names[$x-2, $x]\n"; 

#We can combine range with indexes. 
print "The first, second, third, and fifth elements are @names[0..2,4]\n";

#Recall $#names returns the last index number 
print "a) The last element is $names[$#names]\n";

#Another method of accessing last index
print "b) The last element is $names[-1]";
```
```OUTPUT
Enter the number of the element you wish to view: 3
The first two elements are Muriel Gavin
The first three elements are Muriel Gavin Susanne
You requested element 3 who is Susanne
The element before and after are Gavin Sarah
The first, second, third, and fifth elements are Muriel Gavin Susanne Anna
a) The last element is Simon
b) The last element is Simon
```

### $myVar and @myVar 
The two variables $myvar and @myvar are not, in any way, related.

```Perl
#scalar string
$myVar = "scalar variable";

@myVar = ("clone", "element", "of", "an", "array", "called", "myVar"); 

# refers to the contents of the scalar 
print $myVar . "\n";

# refers to array, 2nd element
print $myVar[1] . "\n"; 

#------------------------------
# refers to all elements in the array (just the amount)
print @myVar . "\n"; 

#prints outs the entire array elements 
print "@myVar";
```
```OUTPUT
scalar variable
element
7
clone element of an array called myVar  
```

# Changing & Adding Array Elements
### Access an array element and assign it as a new value
```Perl

@browser = ("NS","IE","Opera");
print "@browser\n";

#This changes the value of the element with the third list element 
$browser[2] = "Mosaic";
print "@browser\n";
```
```OUTPUT
NS IE Opera
NS IE Mosaic
```

### Add a new element to the array's last position (like push_back)
```Perl
@browser = ("NS","IE","Opera");
print "@browser\n";

$browser[3] = "FireFox";
print "@browser\n";
```
```OUTPUT
NS IE Opera
NS IE Opera FireFox
```

# Splice Function 
- Using the splice() function, you can DELETE or REPLACE elements within the array. 
	- argument of **splice DELETE** takes three parameters...
	- **splice(arrayName, startingIndex, numElementsSplice)**
```Perl
@browser = ("NS","IE","Opera");
print "@browser\n";

splice(@browser, 1, 1);
print "@browser";
```
```OUTPUT
NS IE Opera
NS Opera   
```

- If you want to delete more than one element, change that third number to the number of elements you wish to delete.
- Try deleting the first two elements instead. 
```Perl
@browser = ("NS","IE","Opera");
print "@browser\n";

splice(@browser, 0, 2);
print "@browser";
```
```OUTPUT
NS IE Opera
Opera
```

## Splice Function (Continued)--replacing elements 
- You can use splice to replace elements using the following parameters
	- 	- splice(arrayName, startingIndex, numElementsSplice, "element1", "element2"); 
```Perl
@browser = ("NS","IE","Opera");
print "@browser\n";

#starts at "IE", replaces IE and Opera
splice(@browser, 1, 2, "NeoPlanet", "Mosaic");
print "@browser\n";
```
```OUTPUT
NS IE Opera
NS NeoPlanet Mosaic
```

## Splice Function (Continued)--adding elements 
- If we set the third parameter to 0, we can simply add elements.
```Perl
@browser = ("NS","IE","Opera");
print "@browser\n";

#starts at "IE", replaces IE and Opera
splice(@browser, 1, 0, "NeoPlanet", "Mosaic");
print "@browser\n";
```
```OUTPUT
NS IE Opera
NS NeoPlanet Mosaic IE Opera
```

### Splice cont. (Splice returns elements removed) 
**Splice returns the elements removed from the array**
	- **NOTICE WE USED `qw` HERE...ANOTHER WAY OF INITIALIZING ARRAYS**
```Perl
@dwarfs = qw(Doc Grumpy Happy Sleepy Sneezy); 
print "@dwarfs\n\n";

@who = splice(@dwarfs, 3, 2, "NeoPlanet", "Mosaic");

print "The \@who array holds the returned spliced values:\n@who\n\n"; 

print "The \@dwarfs has been adjusted as follows:\n@dwarfs"; 
```
```OUTPUT
Doc Grumpy Happy Sleepy Sneezy

The @who array holds the returned spliced values:
Sleepy Sneezy

The @dwarfs has been adjusted as follows:
Doc Grumpy Happy NeoPlanet Mosaic
```

### Splice Function (Continued) -- using negative offsets in splice 
https://perldoc.perl.org/functions/splice
- **Using a negative offset removes everything up to, but not including the index referenced by the offset.**
```Perl
@browser = ("NS","IE","Opera", "Safari");
print "@browser\n";

#If the offset (2nd arguement) is negative, it'll begin at that point. 
#If the length (3rd argument) is negative, then it'll remove everything up to BUT NOT INCLUDING. 
@new = splice(@browser, 1, -1);
print "@new\n";

##The following is equivalent to above
@browser = ("NS","IE","Opera", "Safari");
@new = splice(@browser, -3, 2); # IE and Opera removed 
print "@new\n"; 

```
```OUTPUT
NS IE Opera Safari
IE Opera
IE Opera
```

### Splice Function (What is the difference between the following codes?
```Perl
@fruits = (“apples”, “bananas”, “tomatoes”, “pineapples”);
$fruits[1] = “”;

## versus

splice (@fruits, 1, 1);
```
```OUTPUT

```
- The first code replaces the first index with a "null character." Size remains the same.
- The splice function removes the entry, which means size decreases.

# Unshift/Shift (adds/removes left side
- **SHIFT: delete an element from the left side.**

```Perl
@browser = ("NS","IE","Opera");
shift(@browser); 
print "@browser";
```
```OUTPUT
IE Opera
```
- **UNSHIFT**: adds element to the LEFT side. 
```Perl
@browser = ("NS","IE","Opera");
unshift(@browser, "Mosaic"); 
```
```OUTPUT

```

- You can keep the value you deleted from the array by assigning the shift function to a variable
```Perl
@browser = ("NS","IE","Opera");
$old_first_element= shift(@browser);
print $old_first_element;
``` 
```OUTPUT
NS
```

# Push/Pop (adds/remove to right side) 
```Perl
@browser = ("NS","IE","Opera");

print "@browser\n";

push(@browser, "Mosaic");

print "@browser\n";

push(@browser, "Safari", @browser[1..2]);

print "@browser\n";

#Pop Function 
$last_element = pop(@browser);

print "@browser\n";

print $last_element;

```
```OUTPUT
NS IE Opera
NS IE Opera Mosaic
NS IE Opera Mosaic Safari IE Opera
NS IE Opera Mosaic Safari IE
Opera
```

# Chop & Chomp 
- **Chop** is used to take off the last character of EACH element. 

```Perl
@browser = ("NS4", "IE5", "Opera3");
print "Before chop: @browser\n";

chop(@browser);
print "After chop:  @browser";
```
```OUTPUT
Before chop: NS4 IE5 Opera3
After chop:  NS IE Opera
```

- **Chomp** removes only new line characters. 
	- The chomp function is much safer than the chop function, as it will not remove the last character if it is not \n 
```Perl
@browser = ("NS4\n", "IE5\n", "Opera3\n");
print "Before chomp: @browser\n"; 

chomp(@browser);

print "After chomp: @browser"; 
```
```OUTPUT
Before chomp: NS4
 IE5
 Opera3

After chomp: NS4 IE5 Opera3
```

## Chop and Chomp (cont). Guess what will happen? 

```Perl
print "Please tell me your name: "; 
$name = <STDIN>; # input also takes in new line character. 
print "Thanks for making me happy, $name!\n"; 
```
```OUTPUT
Thanks for making me happy, Mill
!
```
- How can we correct this? 

```Perl
print "Please tell me your name: "; 
$name = <STDIN>; 
chomp($name); #correction 
print "Thanks for making me happy, $name!\n"; 
```
```OUTPUT
Thanks for making me happy, Mill!
```

# Sort 
You can sort in ascending or descending order with numbers or strings.
**- Numbers will go by the size of the number, strings will go in alphabetical order**
	- **By default the sort() function, sorts in "ascending order"** 
- The sort() function has three different syntaxes:
	- sort List
	- sort block, List
	- sort Subroutine, List 
- **The code below shows a subroutine.** 
	- If SUBNAME or BLOCK is omitted, sorts in standard string comparison order. If SUBNAME is specified, it gives the name of a subroutine that returns an integer less than, equal to, or greater than 0, depending on how the elements of the list are to be ordered. (The <=> and cmp operators are extremely useful in such routines.)
	- https://perldoc.perl.org/functions/sort

```Perl
@browser = ("NS", "IE", "Opera");

@sortedBrowser = sort (@browser);

print "@sortedBrowser\n";

sub ascend { $a cmp $b }; ## returns -1 if a < b, 0 if a == b, 1 a > b
```
```OUTPUT
IE NS Opera
```

# Built-in Sorting of Arrays (using sort() and <=>)
**- default sort: sorts in a standard string comparisons order** 
	- `sort LIST`
- **usersub**: create your own subroutine that returns an integer less than, equal to or greater than 0. 
	- sort USERSUB LIST
		- The `<=>` and `cmp` operators make creating sorting subroutines very easy.
			- If you are comparing numbers, your comparisons operator should contain non-alphas, if you are comparing strings, the operator should contain alphas only. 
## Sorting Numerically
The sort function compares two variables, $a and $b
The result is
–  1 if $a is greater than $b
–  -1 if $b is greater than $a
–  0 if $a and $b are equal

### Sorting Example (Numeric) 
The sort function is a built-in Perl function that sorts a list of elements. **By default, it sorts elements in lexicographic (dictionary) order.** **However, you can provide a custom comparison function, as demonstrated in the code with {$a <=> $b}, to change the sorting behavior.**

**<=> is the spaceship operator in Perl. It is a numerical comparison operator that returns -1 if the left operand is less than the right operand, 0 if they are equal, and 1 if the left operand is greater than the right operand.** It is often used in custom sorting functions.

```Perl
#/usr/local/bin/perl

@unsortedArray = (3,10,76,23,1,54);
@sortedArray = sort numeric @unsortedArray; 

print "@unsortedArray\n"; #prints 3,10,76,23,1,54
print "@sortedArray\n";   #prints in ascending order 


sub numeric {$a <=> $b }; 
```
```OUTPUT
3 10 76 23 1 54
1 3 10 23 54 76
```
### What if we wanted to swap to descending order? 
- **swap #$a and $b**
```Perl
#/usr/local/bin/perl

@unsortedArray = (3,10,76,23,1,54);
@sortedArray = sort numeric @unsortedArray; 

print "@unsortedArray\n"; #prints 3,10,76,23,1,54
print "@sortedArray\n";   #prints in ascending order 


sub numeric {$b <=> $a }; 
```
```OUTPUT
3 10 76 23 1 54
76 54 23 10 3 1
```

## Sorting Example (Continued)

```Perl
#initalize hash 
%countries= ('976', 'Mongolia', '52', 'Mexico', '212', 'Morroco', '64', 'New Zealand', '33', 'France');

# keys %countries, gets the keys 
#The $countries{$_} expression retrieves the value associated with the current key from the %countries hash.
foreach (sort {$a <=> $b} keys %countries) {
    print "$_ $countries{$_} \n";

}

# values %countries, gets the values 
foreach (sort values %countries) {
    print "$_ \n";
}

# sort by country name -- not too sure about this 
foreach (sort {$countries{$a} cmp $countries{$b} } keys %countries) {
    print "$_ $countries{$_}\n";
}

```
```OUTPUT
33 France 
52 Mexico      
64 New Zealand 
212 Morroco    
976 Mongolia   
France
Mexico
Mongolia
Morroco
New Zealand
33 France
52 Mexico
976 Mongolia
212 Morroco
64 New Zealand
```

## sort several lists at the same time

```Perl
#initalize hash 
%countries=('976', 'Mongolia', '52', 'Mexico', '212', 'Morocco',
'64', 'New Zealand', '33', 'France');

#curly word, another way to initialize 
@nations = qw(China Hungary Japan Canda Fiji);


# This sorts @nations and the VALUES from %countries into a new array
@sorted = sort values %countries, @nations; 

foreach (@sorted) {
    print "$_\n";
}
```
```Canda
China
Fiji
France
Hungary
Japan
Mexico
Mongolia
Morocco
New Zealand
```


## foreach 

```Perl
#iterates each member of @array and assigns each memeber in turn to the variable $element 
foreach $element (@array) {
    print "$element\n"; 
}

#this is similiar to above
for ($i = 0; $i <= $#array; $i++) {
	print "$array[$i]\n;
}
```
```OUTPUT

```

### $_ : Default Input and Searching Variable
- The previous foreach example can be much shorter with $_

```Perl
@array = qw(Hello Two Three Four);

@array = qw(Hello Two Three Four);

# using a hold variable
foreach $element (@array) {
    print "$element"; 
}

print "\n";

# no holding variable, uses default $_ instead 
foreach (@array) {
    print "$_";
}
```
```OUTPUT
HelloTwoThreeFour
HelloTwoThreeFour
```

# Sorting with foreach
```Perl
#sorting() with foreach()
#sort function returns the items in a sorted order

# not in lexiographic order
@array = ("Larry", "Curly", "Moe");

# sorts in lexiographic order by default (as per sort())
foreach $element (sort @array) { 
    print "$element\n";
}
```
```OUTPUT
Curly
Larry
Moe
```

# reverse / join 


```Perl
#reverse / join
# you can reverse the order of array elements using reverse()

@browser = ("NS", "IE", "Opera"); 
@r_browser = reverse(@browser);

```
```OUTPUT

```

#### ?

```Perl
#create a flat database from the array w/  the join function 
#(useful for reading and writing from files)

$result = join $glue, @pieces; 
@browser = ("NS", "IE", "Opera"); 
$browser_string =(join":", @browser);

print $browser_string;
```
```OUTPUT

```

# Arrays to Strings – join (Example)


```Perl
@array = ("Larry", "Curly", "Moe");
print "@array\n";

$string = join( " ", @array);
    #string = "Larry Curly Moe"
print "$string"
```
```OUTPUT
Larry Curly Moe 
Larry Curly Moe 
```

# Array of characters to string
```Perl
#array of characters to string
@stooge = ("c", "u", "r", "l", "y");
$string = join("", @stooge); # no space char was used here 

print "$string"; 
```
```OUTPUT
curly
```

# split
- split allows you to create an array of elements by splitting a string every time a certain delimiter (a character of your choice) shows up within the string. 
- - **a delimiter** is any kind of grammar sequence... (comma, space, tab, colon, semicolon, pipe, underscore, etc)
- - Notice in the **split** function that you place your delimiter between two forward slashes
- - You then place the string you want to split as the second argument
- `#@fields = split /separator/, $string; `
```Perl
#split, delimiter
#@fields = split /separator/, $string; 
$browser_list = "NS:IE:Opera";
@browser = split(/:/, $browser_list);

print @browser;
```
```OUTPUT
NSIEOpera
```

### another split example
```Perl
$string = "apple,orange,banana"; 
@fields = split /,/ $string; 
print "@fields\n";
```
```OUTPUT
apple orange banana
```

### string to arrays



```Perl
#split a string into words and put it into an array 
@array = split(/ /, "Larry Curly Moe"); # creates @array ("Larry", "Curly", "Moe")
print "@array\n";


#split any non-space character 
@stooge = split(//, "curly"); # creates array @stooge with 5 elements: c, u, r, l, y
print "@stooge\n";

#standard split on any character
@array = split(/:/, "10:20:30:40"); # array has 4 elements: 10, 20, 30, 40
print "@array\n";
```
```OUTPUT
Larry Curly Moe
c u r l y
10 20 30 40
```
### string to array (cont.) use of \s+ 
Multiple white space characters: use **``\s+``**
```Perl
#split on multiple white space 
#\s+ specifies one or more whitespace characters
@array = split(/\s+/, "this     is    a  \t    test"); 
#array has 4 elements: this, is, a, test

print @array; # thisisatest
```
```OUTPUT
thisisatest
```
Question: What if we just use s+? 
Answer:  just s+, it would match one or more occurrences of the letter 's', not whitespace characters. Simply will use the char `s` as a delimiter. Result will be...
```Perl
@array = split(/s+/, "this     is    a  \t    test"); 
#creates @array = ("thi", "     i", "    a  \t    te", "t")

print "@array\n";
```
```OUTPUT
thi      i     a            te t
```

### default split() behavior
- `split` without any arguements in Perl defaults to splitting the `$_` variable on whitespace. This is equivalent to using `split(/\s+/, $_)`. 
- For example, 
```Perl
my $input_string = "this   is   an  example   string";

# Using the default behavior of split:
{
    local $_ = $input_string;
    my @fields_default = split;
    print "Using default split behavior:\n";
    print join(", ", @fields_default), "\n";
}

# Using explicit pattern and string for split:
my @fields_explicit = split(/\s+/, $input_string);
print "Using explicit pattern and string:\n";
print join(", ", @fields_explicit), "\n";
```
```OUTPUT
Using default split behavior:
this, is, an, example, string
Using explicit pattern and string:
this, is, an, example, string
```

## Quick Review of 'local'
In Perl, the local keyword is used to create a temporary local value for a global variable within a limited scope (usually within a block or a subroutine). This local value is only used within that specific scope, and once the control leaves that scope, the global variable is restored to its previous value.
```Perl
{
    local $_ = $input_string;
    my @fields_default = split;
    print "Using default split behavior:\n";
    print join(", ", @fields_default), "\n";
}
```
The local $_ = $input_string; line temporarily assigns the value of $input_string to the global $_ variable within the block enclosed by {}. The split function, when used without arguments, operates on the $_ variable, which now contains the value of $input_string. **After the block is executed, the original value of $_ (if any) is restored.**

The purpose of using local here is to avoid modifying the global $_ variable outside of the block, ensuring that any changes made within the block do not affect the variable's value in other parts of the program. 

## Quick Review of 'my' keyword
In Perl, the my keyword is used to declare a lexically scoped variable. A lexically scoped variable is only accessible within the block or subroutine it is declared in, and it is not visible or accessible outside of that scope.

Using the my keyword helps you create more modular and maintainable code by preventing accidental modification of variables from other parts of your code. It also allows you to reuse variable names without conflicts.

Here's an example to demonstrate the usage of the my keyword:
```Perl
sub some_function {
    my $local_var = "Hello, World";
    print "Inside the function: $local_var\n"; 
}

#prints fine
some_function(); 

# This will cause an error/will not print, as $local_var is not accessible 
print "Outside the function: $local_var\n";
```
```OUTPUT
Inside the function: Hello, World
Outside the function:
```


# Perl Associative Arrays (Hashes) 
- Why use hashes?
	- When you want to look something up by a keyword.
		- Supposed we wanted to create  a program which returns the name of the country when given a country code.
		- We'd input ES, and the program would output Spain. 
- **With a hash, perl reorders elements for quick access**
- Associative arrays are created with key/value pairs. 
	- Key is a text string used to access the value.
	- A **value** is the *value* of the variable stored. 
- Each key must be unique. **If you define a certain key twice, the second value overwrites the first**
- Values can be duplicated. 
```Perl
my %family_name = (
                    "fred" => "flintstone", 
                    "dino" => undef, 
                    "barney" => "rubble", 
                    "betty" => "rubble"
                  );

my @k = keys %family_name; # stores all key values of %family_name

my $k_count = @k; # stores the num elements

my @v = values %family_name; # stores all values 

$foo = "bar"; 

#note double quotes for "ney" won't work due to parsing issues. ---use single quotes or use escape char \"ney\"

#prints ? accessing key barney, prints rubble 
print "$family_name{$foo . 'ney'}"; print "\n";  


while (($key, $value) = each %family_name) {
    print "$key => $value\n";
}


```
```OUTPUT
rubble
betty => rubble
dino =>
barney => rubble
fred => flintstone
```
`each %family_name`: The each function is used to iterate through a hash in Perl. When called in list context, it returns a key-value pair from the hash. The iteration continues until all key-value pairs have been returned. After the last key-value pair, the each function returns an empty list.

# Defining Associative Arrays and Access Elements in Hash
```Perl
%array_name = ('key1', 'value1', 'key2', 'value2');

%our_friends = ('best', 'Don', 'good', 'Robert', 'worst', 'Joe');

# To access an element, you use your key string in place of a number
print $our_friends{'good'}; print "\n"; 

$good_friend = $our_friends{'good'};

print "I have a good friend named $good_friend.\n";
```


# Access Elements in Hash (cont.)
- All the keys
	- The keys appear in a seemingly "reverse" order, but it's essential to understand that Perl hashes do not maintain any specific order. The internal order of a hash is determined by the hashing algorithm and other factors, so the order in which keys are stored or returned may not match the order in which they were added. Thus, when you print the keys, the order is not guaranteed to be the same as the order you defined them.
- All the values
- Accessing parts of the hash 
- **Accessing elements by forcing scalar** 
	- The scalar function is used to force a list context into a scalar context. When applied to the list of keys from the %countries hash, it returns the number of elements in the list, which corresponds to the number of keys in the hash.
- **postfix if-statement**
	- This line uses a postfixed if conditional statement to control the execution of the print function. The print function will only execute if the condition following the if statement is true. In this case, the condition is checking if the key 'NL' exists in the %countries hash. If it does, the line "It's there! \n" will be printed, followed by a newline character.

```Perl
%countries=('NL', 'The Netherlands', 'BE', 'Belgium', 'DE', 'Germany',
'MC', 'Monaco', 'ES', 'Spain');

#print all the keys 
#order is weird, refer above 
print keys %countries; print "\n";

#print all the values
print values %countries; print "\n";

#print "The Netherlands" and "Belgium" only
print "@countries{'NL', 'BE'}"; print "\n";

#how many elements are in the following? 
#scalar function forces...
print scalar(keys %countries); print "\n";

#does the key exist? 
#what the hell is a postfixed if statement 
print "It's there! \n" if exists $countries{'NL'};

#will not print anything 
print "It's there...?\n" if exists $countries {'AL'}; 
```
```OUTPUT
MCDEBEESNL
MonacoGermanyBelgiumSpainThe Netherlands
The Netherlands Belgium
5
It's there!
```

# Adding to the hash
Like a regular array, you can add a value to an associative array by simply defining a new value in your script

```Perl
%our_friends = ('best', 'Don', 'good', 'Robert', 'worst', 'Joe');

while (($key, $value) = each %our_friends) {
    print "$key => $value\n";
}

#add a key-value pair ('cool', 'Karen')##########
$our_friends{'cool'} = "Karen";

print "--------\n";

while (($key, $value) = each %our_friends) {
    print "$key => $value\n";
}

```

# Deleting from the hash

```Perl
%our_friends = ('best', 'Don', 'good', 'Robert', 'worst', 'Joe');

delete %our_friends{'worst'};

while (($key, $value) = each %our_friends) { 
    print "$key => $value\n"; 
}
```
```OUTPUT
good => Robert
best => Don
```

## Scoping Rule with 'my' % 'local'
- Scope (visibility) of a variable 
	- Static scoping: `my` 
		- `my` creates a variable only accessible within the block or file in which they are declared. 
			- a block is often declared with braces {} 
	- Dynamic scoping: `local` 
		- `local` variables *can* affect outside its block. 
		- Often times, it suspends the use of a global variable and uses a local variable (declared by local). 
			- This is often better understood using a run-time stack. 
```Perl
#1/user/bin/perl

$x = 1; # global variable is declared (scope is file)

sub foo {        # subroutine 
    print "$x\n"; 
}
# what happens if we use 'my' vs. 'local'
sub bar {
    $x = 2; 
    foo();
}


&foo; # since $x = 1 is declared, it will use this global variable
&bar; # bar is called, which replaces $x = 1 with $x = 2; 
# -- will print 2 when (foo()) is called inside bar
&foo; # since global variable $x = 2, 2 will print 
```
```Perl
1
2
2

```
### what happens if we call 'my'
```Perl
#1/user/bin/perl

$x = 1; # global variable is declared (scope is file)

sub foo {        # subroutine 
    print "$x\n"; 
}
# what happens if we use 'my' vs. 'local'
sub bar {
    my $x = 2; 
    foo();
}


&foo; # prints 1

# since my $x = 2; is only scoped inside bar()
# calling foo() inside bar(), means the subroutine of foo() calls global var $x = 1
&bar; #prints 1

&foo; #prints 1
```
```OUTPUT
1
1
1
```
### what happens if we call 'local'
```Perl
#1/user/bin/perl

$x = 1; # global variable is declared (scope is file)

sub foo {        # subroutine 
    print "$x\n"; 
}
# what happens if we use 'my' vs. 'local'
sub bar {
    local $x = 2; 
    foo();
}


&foo; # prints 1

#local $x = 2; temporarily replaces global $x = 1 (until the subroutine ends) 
#therefore, when foo is called, $x = 2 is the current variable. 
# foo() is returned and removed from the run stack. 
# then bar() is returned and removed from the run stack 
&bar; #prints 2

# because bar() is removed from the run stacl, $x = 2 is no more. 
# the global variable $x = 1 is the value. Hence...
&foo; #prints 1
```
```OUTPUT
1
2
1
```

## More complicated examples #1 without my or local
```Perl
$var = 5;
print $var, "\n"; # prints 5

&fun1; 
# prints 10 b/c $var inside fun1 replaces the global $var
# fun2 will iterate $var = 10 -> $var = 11 b/c it's the new global $var
# prints 11

print $var, "\n"; #prints 11 

#1st situation: no 'my' or 'local'
sub fun1 {
    $var = 10; #my, local $var ???
    print $var, "\n";
    &fun2;
    print $var, "\n";
}

sub fun2 {
    $var++;
}

@foo = (1, 2, 3, 4, 5);

foreach my $var (@foo) { print $var, "\n";} 
#prints 1, 2, 3, 4, 5 new line for each 
```
```OUTPUT
5
10
11
11
1
2
3
4
5
```

### More complicated examples #2, with 'my'

```Perl
$var = 5;
print $var, "\n"; # prints 5

&fun1;
# 1st print $var will print static variable inside scope $var = 10
# &fun2 calls $var, but calls global $var -- will iterate $var = 5 -> $var = 6
# 2nd print $var will print 10 again b/c of static declaration inside block 
# 3rd print $var (outside of subroutine) will print 6. 

print $var, "\n";

#2st situation: 'my $var'
sub fun1 {
    my $var = 10; #
    print $var, "\n";
    &fun2;
    print $var, "\n";
}

sub fun2 {
    $var++;
}

```
```Perl
5
10
10
6
```


### More complicated examples #3: 'local'
- basically, ask yourself if we are still in the subroutine or not
```Perl
$var = 5;
print $var, "\n"; # prints 5

&fun1;
# as long as we're in the subroutine, $var = 10; will replace the global $var = 5
# ask yourself--are we still in the subroutine? 
# 1st print: are we in subroutine? yes. so print: 10 
# &fun2; are we in subroutine? yes. so $var++ iterates the local $var = 10 -> local $var = 11
# 2nd print: (are we in the subroutine?) yes. prints 11
# 3rd print: (are we in the subroutine? NO.) $var = 5; prints 5

print $var, "\n";

#3rd situation: 'local $var'
sub fun1 {
    local $var = 10; 
    print $var, "\n";
    &fun2;
    print $var, "\n";
}

sub fun2 {
    $var++;
}
```
```OUTPUT
5
10
11
5
```


# Length() function
- length() function returns number of characters in a string variable 
```Perl
$ice = "cold";

# length function returns number of characters in a string 
# length() works by creating a 'scalar' context for its parameters
$length_ice = length($ice);

print $length_ice, "\n"; # prints 4

#what will be the output? 
$my_string = "abc"; 
@my_array = (1,2,3,4,5); 

#since length creates a scalar context 
print (length $my_string, "\n"); # prints 3 #### UNDEFINED BEHAVIOR  


print (length @my_array); # prints 5? no... #prints 1... 
```
- ## **the length function is only meant to be used on strings-- otherwise, unexpected behavior.**

# Substring ( substr() ) 
`substr($string_variable, start number, length)`
- $string_variable is the string intended to be substr'd
- 2nd parameter is the indexed value (starting at 0) 
- 3rd parameter is amount you wish to take

**substr() function brings on an important distinction when it comes to DESTRUCTIVE functions vs. non-destructive** 
	- substr() is a non-destructive function.
```Perl
$ice = "cold";
$age = substr($ice, 1, 3); 

print "It sure is $ice out here today\n"; 
print "I wonder if I am $age enough to play in the snow?";
```



## this looks at chomp(), STDIN, a bit of paramatching w/ a target =~, and the use of default sort (alphabet) and then reverse
```Perl


%countries = (
    'NL', 'The Netherlands', 
    'BE', 'Belgium', 
    'DE', 'Germany',
    'MC', 'Monaco', 
    'ES', 'Spain'
    );

print "Enter the country code: "; 

# What is the purpose of chomp again? 
chomp ($find = <STDIN>); 

# Make sure everything is in uppercase 
# This is a direct translation, any lowercase letters will be converted to upper. 
# =~ spacing MATTERS here. Makes $find the target string. 
$find =~ tr/a-z/A-Z/; 

print "$countries{$find} has the code $find\n";

# sorts in alphabet order first, but then it's reversed. So it'll print 
# NL -> MC -> ES -> DE -> BE? 
foreach (reverse sort keys %countries) { 
    print "The key $_ contains $countries{$_}\n";
}
```
```OUTPUT
Enter the country code: NL
The Netherlands has the code NL
The key NL contains The Netherlands
The key MC contains Monaco
The key ES contains Spain
The key DE contains Germany
The key BE contains Belgium
```

## Subroutines 
- User-defined functions in Perl
	- Lets us recycle one chunck of code multiple times.
	- Name of subrountines is another Perl identifier 
		- (only limitation is can't start with digit) 
**- To invoke subroutine, place `&` in front of its name.** 
- **In Perl, the special variable `@_` represents the list of arguments passed to a subroutine.**

```Perl
$n = &max(10, 15);
print $n;

sub max {
	my ($m, $n) = @_; # new private variable for this block 

	if ($m > $n) { $m } else { $n }
}

```
```OUTPUT
15
```

# Persistent, Private Variable 
- basically the static variable in C++


```Perl
use feature 'state';

sub marine {
    state $n = 0; #static (private, persistent) variable $n 
    $n += 1; 
    print "Hello, sailor number $n!\n";
}

for ($i = 0; $i < 3; $i++) {
    &marine; 
}

&marine; 
&marine;
```
```OUTPUT
Hello, sailor number 1!
Hello, sailor number 2!
Hello, sailor number 3!
Hello, sailor number 4!
Hello, sailor number 5!
```

```Perl
```
```OUTPUT
```

```Perl
```
```OUTPUT
```

```Perl
```
```OUTPUT
```
```Perl
```
```OUTPUT
```

```Perl
```
```OUTPUT
```

```Perl
```
```OUTPUT
```

```Perl
```
```OUTPUT
```

```Perl
```
```OUTPUT
```

```Perl
```
```OUTPUT
```
```Perl
```
```OUTPUT
```
```Perl
```
```OUTPUT
```
```Perl
```
```OUTPUT
```

```Perl
```
```OUTPUT
```

```Perl
```
```OUTPUT
```

```Perl
```
```OUTPUT
```
```Perl
```
```OUTPUT
```

# Pattern Matching

Perl has built in capabilities for patter matching. 
Pattern matching allows programs to scan data for patterns and extract data. 
- For example, to look for a specific name in a phone list or all of the names that start with the letter 'a'. 
- Can be used to reformat documents
- Search and replace


# Regular Expressions (regex) 
A regular expression is a pattern to be matched.
There are three main uses for regex
1. Matching
	1. use normal characters to match signal characters
	2. uses the m/ / operator, which evaluates to true or false value. 
2. Substitution 
	1. substitutes one expression for another; it uses the s/ / / operator 
3. Translation
	1. translates one set of characters to another and uses the tr/// operator. 

# Perl's Regular Expression Operators
| Operator | Description |
| --- | --- |
| `m/PATTERN/` | Returns true if the regular expression pattern `PATTERN` is found in the default variable `$_` (or in an explicitly specified string). |
| `s/PATTERN/REPLACEMENT/` | Searches the default variable `$_` (or an explicitly specified string) for the regular expression pattern `PATTERN`, and replaces the first occurrence with the string `REPLACEMENT`. The modified string is returned. |
| `tr/CHARACTERS/REPLACEMENTS/` | Translates the characters specified in `CHARACTERS` to the corresponding characters in `REPLACEMENTS`. This is typically used for simple character substitutions or transformations. The translation is performed on the default variable `$_` (or an explicitly specified string), and the modified string is returned. |


**All three regular expression operators work with $_ as the string to search. You can use the binding operators (=~ and !~) to search a variable other than $_.**
- What is the `!~` operator??? 


# Regular Expressions (cont.)

Using a regex to match against a string will either return true or false. 
Note that the return value of true or false is not stored anywhere unless we assign it. 
The code below is showing the target.
```Perl
$name =~m/John/ 
$name =~/John/ # if no expression is given, default is matching # same

#if "John" is inside $name, then returns true; else false. 
# The regular expresion itself is between / / slashes, and the =~ operator assigns the target for the search
```

Sometimes, you just want to see if there's a match.
Other times, you might want to do something with the matched string, such as **replacing it or storing it in a variable.**

# The Matching Operator (m//)
The matching operator (`m//`) is used to find patterns in a string. 
## **The matching operator only searches the $_ variable.** 
- makes the match statement shorter because you don't need to specify where to search. 



```Perl
$needToFind = "bbb";
$_ = "AAA bbb AAA"; 
print Found bbb\n if m/$needToFind/; # looks to match "bbb" in $_ string 
#recall postfix if-statements...
```

## Using the matching operator to find a string inside a file is very easy because the defaults are designed to facilitate this activity


```Perl
$targert = "M";
open(INPUT, "<findstr.dat"); 
while (<INPUT>) {
	if (/$target/) {
		print "Found $target on line $."; 
	}
}
close(INPUT); 
```


| Option | Description |
| ------ | ----------- |
| g | Finds all occurrences of the pattern in a string. |
| i | Ignores the case of characters in the string. |
| m | Treats the string as multiple lines. Use this option if you know that the string contains multiple newline characters to turn off the optimization. |
| o | Compiles the pattern only once. Can achieve small performance gains. Use with variable interpolation only when the value of the variable will not change during the lifetime of the program. |
| s | Treats the string as a single line. |
| x | Allows the use of extended regular expressions. Ignores whitespace that's not escaped with a backslash or within a character class. Recommended for making regular expressions more readable. |


# Examples

```Perl
if (/barney.*fred/is) { 
    print "That string mentioned Fred after Barney!\n";  
}

# / start of delimiter
# . matches any character except for newline chararacters
# * is a modifier indicating 0 or more. 
# fred is a matching word
# / end of delimiter
# i is a flag that specifies pattern match case-insensitivity
# s is a flag that makes '.' character also match newline characters since target string is now a single line
```

# /m modifier affects ^ and $, and /s affects special characters 

## using /m modifer (niches) 
```Perl
$_ = "foo\nbar\n";

if (/foo$/) {
    print "Match!\n";
}
else {
    print "No Match.\n";
}

# Output: No Match. 
# No match because "foo" is not the end of the string. 
# The lack of a 'm' flag treats the entire string as one. 
# Therefore, the actual end is "bar"...(why is it not \n? anyways...)

$_ = "foo\nbar\n";

if (/foo$/m) {
    print "Match!\n";
}
else {
    print "No Match.\n", "\n";
}

# Output: Match! 
# 'm' will treat the string as multiple lines. 
# Therefore, 'foo' is the end of the first line. 
**```
 **the regular expression `/foo$/m` is checking if the string ends with "foo" at the end of any line. Since the string assigned to $_ is "foo\nbar\n", the regular expression will match because "foo" appears at the end of the first line.**


### what does the `^` expression mean? 
 - **^ character is a special metacharacter that represents the beginning of a line or string. When used at the start of a regular expression pattern, it asserts that the pattern should match the beginning of a line or string.**

```
/^bar/ will match:

    "bar"
    "barbaz"
    "barnacle"

/^bar/ will not match:

    "foobar"`
```

### /m modifer: using the same string as above (similiar example) 
```Perl
$_ = "foo\nbar\n";

if (/^bar/) {
    print "Match!\n";
}
else {
    print "No Match.\n";
}

# Output: No Match. 
# lack of 'm' flag means the entire string is treated as one. 
# bar is in the middle of the string, not the beginning. 

if (/^bar/m) {
    print "Match!\n";
}
else {
    print "No Match.\n";
}

# Output: Match!
# 'm' flag treats string as now multiple strings. 
# Therefore, bar matches the start of the 2nd line/string. 
```

# /s modifer and its niches
```Perl
$_ = "cat\ndog\ngoldfish"; 

if (/cat.*fish/) {
    print "Match!\n";
}
else {
    print "No Match.\n";
}

# Does it match? 
# Output: No Match. 
# No match because '.' is any character BUT newline characters.
# (Recall .* indicates any amount 0 or more)


if (/cat.*fish/s) { #use /s flag 
    print "Match!\n";
}
else {
    print "No Match.\n";
}

# Does it match? 
# Output: Match!
# the '/s' flag modifer treats the string as a single line. 
# therefore, \n is just any other character now. 
```


# =~ operator
The search, modify, and translation operations work on the `$_` variable by default. 

What if the string to be searched is in some other variable? 
- That's where the **binding operators** come to play.
	- Perl lets you bind the regular expression opeators to a variable other than `$_`

## =~ operator compares a string to a regular expression 

The string to compare is on the left, refex on the right. 

### The =~ operator either returns true (1) or false (0). 

### The lack of a "target" operator will default to `$_`. 
```Perl
$mycar = <STDIN>;
if ($mycar =~ /abc/ {
	print "$mycar contains 'abc"!"; 
}
else {
	print "$mycar does not contain 'abc'!"; 
}
```

## !~ (non-match operator)
Returns true (1) if no match.
Returns false(0) if match. 

## Example of match/non-match/, m/, s/, and tr/ 
```Perl
$scalar = "The root has many leaves and root"; 

#generic matching 
$match = $scalar =~ m/root/; 

$substitution = $scalar =~ s/root/tree/g; # "The tree has many leaves and tree"

$translate = $scalar =~ tr/h/H/; # "THe tree Has many leaves and tree"

print ("\$match = $match\n"); # output: 1 

# !~ found NO match, which returns 1, and executes postfix if-
print ("String has no root.\n") if $scalar !~ m/root/; #output: "String has no root." 

print ("\$substitution = $substitution\n"); # output: 2 (because two root AND /g flag)

print ("\$translate = $translate\n"); # output: 2 

print ("\$scalar = $scalar\n"); # output: THe tree Has many leaves and tree
```
```OUTPUT
$match = 1
String has no root.
$substitution = 2
$translate = 2
$scalar = THe tree Has many leaves and tree
```

# Character Class
A group of characters in square brackets will match any characters in the bracket
| Pattern         | Description                                     | Example           |
|-----------------|-------------------------------------------------|-------------------|
| `/[ab][cd]/`    | Matches 'a' or 'b' followed by 'c' or 'd'       | ac, ad, bc, bd    |
| `/[aeiou]/`     | Matches any vowel (lowercase)                   | a, e, i, o, u     |
| `/[^aeiou]/`    | Matches any character that is not a vowel       | b, c, d, 1, #, @  |
| `/[0123456789]/`| Matches any digit (0-9)                         | 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 |
| `/[0-9]/`       | Matches any digit (0-9) using range syntax      | 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 |
#### Notice how in `^` used in a character class differs from `^` when used in pattern matching alone


The following is funtionally different from `/[0123456789]/`
 `/0123456789/`  | Matches the **exact** digit sequence '0123456789'   | 0123456789 |

## Symbolic Character Class

| Pattern | Equivalent      | Description                                         |
|---------|-----------------|-----------------------------------------------------|
| `.`     |                 | Matches any character except for the newline       |
| `\d`    | `[0-9]`         | Matches any digit (0-9)                            |
| `\D`    | `[^0-9]`        | Matches any character that is not a digit          |
| `\s`    | `[\t \n]`       | Matches whitespace characters (tab, space, newline)|
| `\S`    | `[^\t \n]`      | Matches any character that is not whitespace       |
| `\w`    | `[a-zA-Z0-9_]`  | Matches any word character (letters, digits, underscore)|
| `\W`    | `[^a-zA-Z0-9_]` | Matches any character that is not a word character |

### Symbolic Character Class (Example)

```Perl
$_ = "AAABBBCCC";
$charList = "ADE";

print "matched" if m/[$charList]/; #output: matched # contains ANY of the characters in $charList

$_ = "AAABBBCCC";
print "matched" if m/[^ABC]/; # will display nothing
# match only returns true if a character besides A, B, or C is in the searched string

$_ = "AAABBBCCC";
print "matched" if m/[^A]/; # output: matched
# (because there is a character besides A)
```

# Word Boundaries
### `\b` option is used for exact word boundaries
| Pattern  | Description                                         | Example                |
|----------|-----------------------------------------------------|------------------------|
| `m/foo\b/`| Matches 'foo' with exact word boundaries            | Matches 'foo', not 'foobar' |
| `m/\bwiz/`  | Matches 'wiz' at the beginning of a word            | Matches 'wizard', not 'geewiz'|

### example of word boundaries and use of group and OR (|)
```Perl
$mystr = "abcfeed";

print "matched" if $mystr =~ m/foo|far|fee/; #outout: matched

print "matched" if $mystr =~ m/\b(foo|far|fee)\b/; # no output: Why? 
```
The regular expression `m/\b(foo|far|fee)\b/` evaluates to false in this case because of the word boundary metacharacter `\b`. The `\b` asserts that the position it occupies is at the beginning or end of a word. In your example, the string "abcfeed" contains "fee" as part of a larger word, not as a separate word.

Since the regular expression is looking for "foo", "far", or "fee" as standalone words, it doesn't match the "fee" within the "abcfeed" string due to the surrounding characters.


# Matching Specific Points
Can you find the differences below? 

```Perl
if (/n/i) {
    # true if the $_ contains 'n' or 'N' anywhere
}

if (/^n/i) {
    # true $_ contains 'n' or 'N' at the start of the string 
    # recall that ^ has a different meaning within a character class []
}

if (/n$/i) {
    # true if $_ contains 'n' or 'N' char at the end of the string  
}

f (/[^n]/i) {
    # true if $_ does NOT contain any 'n' or 'N' characters at all
}
```

### Example with character class matching

```Perl
@names = qw(Karlson Carleon Karla Carla Karin Carina);

foreach (@names) { # no element is given, defaults to $_ 
    if (/[-a-eKCZ]arl[^sa]/) {
        print "Match! $_\n"; 
    }

    else {
        print "Sorry. $_\n"; 
    }
}

# couple of layers here...
#1. recall qw() is another way of initializing an array
#2. foreach has no element given, so every loop defaults to $_
#3. matching is also given no target string either via =~ or !~, so defaults to $_ 
#4. defaults to m/ matching
#5. [-a-eKCZ]arl[^sa]/ will match
## character class: hypen, a,b,c,d,e,K,C,Z
## then it must match 'arl'
## then it must not contain characters either starting with 's' or 'a' 
## So... Carleon is the only match... 'Carle'
```
```OUTPUT
Sorry. Karlson
Match! Carleon
Sorry. Karla
Sorry. Carla
Sorry. Karin
Sorry. Carina
```


# Negating the regex (!~) 
| Expression            | Description                                     | Example                |
|-----------------------|-------------------------------------------------|------------------------|
| `$_ !~ /[KC]arl/`     | Returns true if 'Karl' or 'Carl' is NOT in `$_` | True for 'Marla', false for 'Karl' or 'Carl' |
| `!/[KC]arl/`          | Alternative way to achieve the same result      | True for 'Marla', false for 'Karl' or 'Carl' |

# Grouping
Grouping allows you to look for a certain (or arbitrary) amount of something. 
- You can look for it at least *n* times
- At least *n* times but not more than *m* (range)
- 1 or more of something
- 0 or 1
- 0 or more

## Grouping Quantifiers
| Quantifier | Description                          | Example        |
|------------|--------------------------------------|----------------|
| `*`        | 0 or more times                      | a* (matches '', 'a', 'aa', 'aaa', ...) |
| `+`        | 1 or more times                      | a+ (matches 'a', 'aa', 'aaa', ...)     |
| `?`        | 0 or 1 time                          | a? (matches '', 'a')                   |
| `{n}`      | Exactly n times                      | a{3} (matches 'aaa')                   |
| `{n,}`     | At least n times                     | a{3,} (matches 'aaa', 'aaaa', ...)     |
| `{n,m}`    | At least n, but no more than m times | a{2,4} (matches 'aa', 'aaa', 'aaaa')   |


### Example + use of /x modifer 
```Perl
/-?\d+\.?\d*/ 

# -? ::: 0 or ONE dashes
# \d+ ::: [0-9] , 1 or more digits 
# \.? ::: wait.. I think this is 0 or 1 "decimal point"
# \d* ::: 0 or more digits 

#Recall the /x modifer! higher readability
/ -? \d+ \.? \d* /x 

```

### **paratheses may be used for grouping!**
```Perl
/fred+/ 
# this matches strings like fredddddddd 
# does not match fredfredfred

#use this instead to match fredfredfred
/(fred)+/ 
```


```Perl

$_ = "fred";

print "match\n" if (/(fred)+/); #output: match 

print "match\n" if (/(fred)*/); #output: match
#why??? 
# * group quantifier is 0 or more times. -- will match literally anything.  
```

## **Parantheses also give us a way to reuse part of the string directly in the match!!!!!!!!!!!**
- Back references `(\1, \2, \3)`

#### Example
```Perl
$_ = "abba"; 

if (/(.)\1/) { #\1 refers to the first grouping
    print "It matches with the first grouping.\n"; #no match for ab, but #match for bb 
}
```
```OUTPUT
It matches with the first grouping.
```

```Perl
$_ = "yabba dabba doo"; 

print "matches 1st option" if (/y(....)d\1/); # matches??? y(abba)(space_char) # no match

print "matches 2nd option" if (/y(.)(.)\2\1/) # matches??? y(a)(b)(b)(a) # match!
# \2 = b
# \1 = a
```
```OUTPUT
matches 2nd option
```

### using g{}, more readable way than \1
```Perl
$_ = "aa11bb";

print "1st print: matches" if (/(.)\111/); # matches??? yes! (a)(a)11, a little ambigious, but it works

print "2nd print: matches" if (/(.)\g{1}11/); # matches???  yes. 
#less ambigious # same 
#  use of g{1} refers to backreference of the first capturing group. 
```

```Perl
$_ = "racecarleelrotor";
if (/(.)(.)\g{2}\g{1}/g) {
    print "Match: $&\n";
}
```
```OUTPUT
Match: leel
```

#### **Another Example (combining some)** 
# Notice the lack of `g` in the `{}` 
```Perl
$_ = "AA AB AC AD AE"; 

if (m/^(\w+\W+){5}$/) {
    print "match!"; 
}
else {
    print "no match!"; 
}

# any amount of characters, [a-zA-Z0-9_]
# followed by any amount of white space/non_characters...? so like.. newline
# {} modifer for (), must repeat 5 times exactly
```
```OUTPUT
no match!
```

```Perl
$_ = "AA AB AC AD AE "; # added a space char, but in input files, would also be a newline char, so that would work too! 

if (m/^(\w+\W+){5}$/) {
    print "match!"; 
}
else {
    print "no match!"; 
}

# any amount of characters, [a-zA-Z0-9_]
# followed by any amount of white space/non_characters...? so like.. newline
# {} modifer for (), must repeat 5 times exactly
```
```OUTPUT
match!
```

```Perl
# match a starting word whose length is unknown
if (m/^\w+/) {
    print "match!\n"; 
}
else {
    print "no match!\n"; 
}

# matches any amount of characters [a-zA-Z0-9_]
# e.g., "QQQ", "AQQ", 
# will not match # " QQQ"
```

### storing a word into a buffer using grouping 
```Perl
$_ = "AAA BBB CCC"; 

if (m/(\w+)/) { # prints AAA
    print ("$1\n"); 
}
else {
    print "no match!\n"; 
}

# looks for first word in a string and stores it into first buffer ($1)
# which we can now access, given we used the grouping 
```


# capturing behavior
- only the grouping is stored. So in this case, even though the match is 'AA', 'BB', 'CC'. The array outputs A B C because of the grouping match.
- How do we fix this? Not sure. I tried wrapping the entire expression in a single paratheses; didn't work. 

- matching occurs fine as shown
```Perl

$_ = "AAA BBB CCC"; 

print "matched" if (m/(.)\1/g);  
# need to find repeated characters in a string 
# matches 'AA', 'BB', 'CC' #or does it...?! 
```
```OUTPUT
matched
```

- unintended array output. 
```Perl

$_ = "AAA BBB CCC"; 

@array1 = m/(.)\1/g; 
# need to find repeated characters in a string 
# matches 'AA', 'BB', 'CC' #or does it...?! 


print "@array1\n"; # Why?! grouping issue. 
```
```OUTPUT
A B C 
```

### other matching examples
```Perl

$_ = "AAA BBB CCC"; 

print "matched" if (m/^\s*(\w+)/); # notice the lack of /g, what effect? 

# match...
# any amount (0 or more) of white space at the beginning
# followed by  any number of characters 

# used to find the first word in a string 
```
```OUTPUT
matched 
```


# Saving Parts of a Match
- Parentheses allow you to save pieces of your match
	- If a match is successful, the item in paratheses gets stored in $1, $2, $3, etc according to their order
```Perl
$myvar =~ /System Configuration: (.*)/; 

#stores any non-new line character into $1 that is after "System Configuration: " 

```


```PErl
# we use '' instead of "" due to substitution issues 
$_ = 'My email address is John@Yahoo.com.';

# Paren forces matches to $1, $2, etc
print "Found it! $1 at $2\n" if (/(john)\@(yahoo.com)/i); 

# non-targets default matches with $_
# (john) in brackets will be stored in $1 if matched 
# \@ ignores the @ substitution  (?)
# (yahoo.com) is stored in $2 if matched 
# /i is case insensitive modifier 
```
```OUTPUT
Found it! John at Yahoo.com
```


```Perl
$_ = 'My email address is <john@yahoo.com>!.'; 


#matches '<' then any character that is not '>' 
#the grouping prints out everything proceeding the < but precedes > 
if (/<([^>]+)/i) {
	print "Found it! $1\n";
}

```
```OUTPUT
Found it! john@yahoo.com
```


# Alteration/Alternatives? 
- The `|` character is used to specify alternative expressions. 
- Basically the OR logic operator. 

```Perl
m/\w|\w\w/ # match a single char or two consecutive word char
```


- This 'OR' works well with paratheses. 

```Perl
$class = mat374;

$class =~ /(mat374|mat375)/;

print "The class is $1";
```



# Substitution Operators

# Searching and Replacing 
| Operator        | Syntax             | Description                  |
|-----------------|--------------------|------------------------------|
| Match Operator  | `/PATTERN/`        | Match the given pattern      |
| Match Operator  | `m/PATTERN/`       | Match the given pattern      |
| Search & Replace| `s/PATTERN/REPLACE/`| Search and replace the pattern |
| Char. S&R       | `tr/searchlist/replacelist/`| Character search and replace|
| Split           | `split(/PATTERN/, $line)` | Split on regex pattern  |


# The Substitution Operator (s///)
- The substitution operator (s///) is used to change strings


## IMPORTANT* : **looks like the original text is replaced, and actually the $result simply stores the NUMBER of substitutions made, not the actual result. **
```Perl
$needToReplace = "bbb";
$replacementText = "1234567890";

$_ = "AAA bbb AAA";

$result = s/$needToReplace/$replacementText/; 

print $_; print "\n";

print $result; # notice how this is '1'. why? 
```
```OUTPUT
AAA 1234567890 AAA
1
```


Options for Substitution Operator

| Option | Description |
|--------|-------------|
| e      | Forces Perl to evaluate the replacement pattern as an expression |
| g      | Replaces all occurrences of the pattern in the string |
| i      | Ignores the case of characters in a string |
| m      | Treats string as multiple lines (any `\n` will be the end of a single match) |
| s      | Treats string as a single line (treats `\n` as any other character) |
| o      | Compiles pattern only once |
| x      | Allows for extended regular expressions (ignores white spaces within the / /) |

```Perl
$_ = "home, sweet home!"; 
s/home/cave/g; #no target results to default target

print "$_\n"; # output: cave, sweet cave!
```
```OUTPUT
cave, sweet cave!
```

removing excessive whitespaces
```Perl
$_ = "   Input    data\t may have      extra whitespace. "; 
print "$_\n";

s/\s+/ /g;

# replaces all white space with a single whitespace
print "$_\n"; # output: " Input data may have extra whitespace."

# remove the whitespace in the beginning
s/^\s+//; # replaces 1 or more leading whitespaces with nothing 

print "$_\n";
```
```OUTPUT
   Input    data         may have      extra whitespace. 
 Input data may have extra whitespace.
Input data may have extra whitespace.
```

# Translation Operators

# translation operator (tr///)
- the translation operator is used to change **individual** characters in the $_ variable.
`tr/a/z/;` translates all 'a' characters to 'z' characters in the $_ .

## **if you specify mroe than one character in the match character list, you can translate multiple characters at a time, like this:** 

`tr/ab/z/;` # translates all 'a' and 'b' characters into the 'z' character

## **if the replacement list of characters is SHORTER than the target list of characters**, the last character in the replacement list is repeated as often as needed. 

```Perl
#!/usr/bin/perl

# Declare a string
my $string = "hello world!";

# Perform character transliteration
# Target list: "elw"
# Replacement list: "12"
$string =~ tr/elw/12/;

# Print the result
print "Modified string: $string\n"; # w -> 2 

```
```OUTPUT
Modified string: h122o 2or2d!
```

## However, if more than one replacement character is given for a matched character, only the first is used, like this: tr/WWW/ABC/; 

```Perl
#!/usr/bin/perl

# Declare a string
my $string = "WWWonderful WWWorld";

# Perform character transliteration
# Target list: "WWW"
# Replacement list: "ABC"
$string =~ tr/WWW/ABC/; # only W -> A is used 

# Print the result
print "Modified string: $string\n";
```
```OUTPUT
Modified string: AAAmazing AAAdorable
```

### Unlike the matching and substitution operators, the translation operator doesn't perform variable interpolation
- doesn't do the double quotes "" subsitution(?) 

# Options for Translation Operator 

| Option | Description |
|--------|-------------|
| c      | Complements the match character list. The translation is done for every character that does **not** match the character list. |
| d      | Deletes any character in the match list that does not have a corresponding character in the replacement list. |
| s      | Reduces repeated instances of matched characters to a single instance of that character. |

### /c option

```Perl
#!/usr/bin/perl

my $string = "AAA bbb AAA";

# Perform character transliteration with complement option
$string =~ tr/b/a/c;

# Print the result
print "Modified string: $string\n";
```
```OUTPUT
Modified string: aaaabbbaaaa
```

# /d option (delete) 
## if there is no replacement option, then /d will delete that value instead of doing a direct sub. 
```Perl
#!/usr/bin/perl

my $string = "AAA bbb AAA";

# Perform character transliteration with delete option
$string =~ tr/Ab/1/d; # replaces all 'A' and 'b' with 1, deletes rest. 

# Print the result
print "Modified string: $string\n";
```
```OUTPUT
Modified string: 111  111
```

# /s option (squeeze)
```Perl
my $string = "AAA bbb AAA";

# Perform character transliteration with squeeze option
$string =~ tr/A/1/s;

# Print the result
print "Modified string: $string\n";
```
```OUTPUT
1 bbb 1
```


```Perl
#!/usr/bin/perl

# Declare a string with repeated characters
my $string = "AAABBBAAACCCDDD";

# Perform character transliteration with the 's' option
# Target list: "ABCD"
# Replacement list: "1234"
$string =~ tr/ABCD/1234/s;

# Print the result
print "Modified string: $string\n";
```
```OUTPUT
```Modified string: 12134
```


### cont...

- Normally, if the match list is longer than the replacement list, the last character in the replacement list is used as the replacement for the extra characters. However, when the d option is used, the matched characters are simply deleted.





### More Examples
```Perl
$x = "'quoted words'";
$x =~ s/^'(.*)'$/$1/;

# must contain a beginning quote 
# followed by any number of characters
# and then end with an end quote 
# and sub that entire match with just the characters without the quotes

print "$x"; 
```
```OUTPUT
quoted words
```



- If the replacement list is empty, then no translation is done. The operator will still return the number of characters that matched, though. This is useful when you need to know how often a given letter appears in a string. This feature also can compress repeated characters using the s option.
- In the context of the tr/// operator in Perl, the period (.) is treated as a literal character, not a special character or a wildcard (any character) match as it would be in regular expressions. The tr/// operator performs character-by-character transliteration, and it doesn't recognize regular expression syntax or special characters.
	- **This is because tr/// isn't pattern matching!!!!**
```Perl
$y = "I'm fine. Thank you."; 
$count = ($y =~ tr/././); 
print $y, "\n";
print $count, "\n";
```
```OUTPUT
I'm fine. Thank you.
2
```

### Consider # `$count = ($y =~ s/././)` and # `$count = ($y =~ s/././g)`
```Perl
$y = "I'm fine. Thank you."; 
$count = ($y =~ s/././g); # pattern matching, (.) is a special character
print $y, "\n";
print $count, "\n";
```
```OUTPUT
Modified string: ................. 
Number of substitutions: 17
```


# More Examples of Regex
1. /[abc]|[123]/ -- matches a string that contains a character 
