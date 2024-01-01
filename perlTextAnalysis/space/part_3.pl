use warnings; 
use strict;
#!/usr/bin/perl

if (open (FH, "<part_3_input.txt")) { 
    open (OUTPUT, ">part3output.txt");             # opens outpput file for writing 

#Input text 
    print OUTPUT "Input Text: \n\n";
    while (my $line = <FH>) {                 
        chomp($line); 
        print OUTPUT "$line\n";
    }              
    print OUTPUT "\n\n";
    

#Revised text 
    print OUTPUT "Output text: \n\n";
    seek(FH, 0, 0); 
    while (my $line = <FH>) {                       
        chomp($line); 
        my @numbers = qw(zero one two three four five six seven eight nine);
        $line =~ s/(\d{1})/$numbers[$1]/g; # take advantage of grouping and indexing
        print OUTPUT "$line\n";
    }              

    close(FH);                                # close filehandle 
    close(OUTPUT); 
}  else { 
    print "Error: file failed to open"; 
}


=pod
Part 3: (10 points )
Write a perl program that replaces all digits with the name of the digit, so every "0" is
replaced with "zero" , "1" is replaced with "one", ... "9" is replaced with "nine". Test your
program with your own input file containing digits and letters. Your program should
write the result to output file and you need to print both input and output files along with
your source code.

=cut