use warnings; 
use strict;
#!/usr/bin/perl


if (open (FH, "<solar.txt")) { 
    open (OUTPUT, ">output.txt");             # opens outpput file for writing 

    &Task_1; 
    &Task_2;
    &Task_3;
    &Task_4;
    &Task_5;

    close(FH);                                # close filehandle 
    close(OUTPUT); 
}  else { 
    print "Error: file failed to open"; 
}

# 1. Print all records that do not list a discoverer in the eighth field.
sub Task_1 {
    seek(FH, 0, 0);
    print OUTPUT "The following records do not have a discoverer in the eighth field: \n\n";
    while (my $line = <FH>) {                 # loops through each line 
        chomp($line); 
        my @currentLine = split(/ /, $line);
        print OUTPUT "@currentLine\n" if ($currentLine[7] =~ /-/);
    }          
    print OUTPUT "\n";
}

#2. Print every record after erasing the fourth field. Note: It would be better to say "print every record" omitting the fourth field.
sub Task_2 {
    seek(FH, 0, 0);
    print OUTPUT "Print every record omitting the fourth field: \n\n";
    while (my $line = <FH>) {                 # loops through each line
        chomp($line); 
        my @currentLine = split(/ /, $line);
        splice(@currentLine, 3, 1);           # destructive function 
        print OUTPUT "@currentLine\n";
    } 
    print OUTPUT "\n";
}

#3. Print the records for satellites that have negative orbital periods. (A negative orbital period simply means that the satellite orbits in a counterclockwise direction.)
sub Task_3  {
    seek(FH, 0, 0);
    print OUTPUT "Print the records for satellites that have negative orbital periods: \n\n";
    while (my $line = <FH>) {                 # loops through each line
        chomp($line); 
        my @currentLine = split(/ /, $line);
        print OUTPUT "@currentLine\n" if ($currentLine[4] =~ /^-\d+(\.\d*)?$/);
    } 
    print OUTPUT "\n";
}

# 4. Print the data for the objects discovered by the Sheppard space probe.
sub Task_4  {
    seek(FH, 0, 0);
    print OUTPUT "Print the data for the objects discovered by the Sheppard space probe. \n\n";
    while (my $line = <FH>) {                 # loops through each line
        chomp($line); 
        my @currentLine = split(/ /, $line);
        print OUTPUT "@currentLine\n" if ($currentLine[7] =~ /Sheppard/);
    } 
    print OUTPUT "\n";
}

# 5. Print each record with the orbital period given in seconds rather than days.
sub Task_5  {
    seek(FH, 0, 0);
    print OUTPUT "Print each record with the orbital period given in seconds rather than days. \n\n";
    while (my $line = <FH>) {                 # loops through each line
        chomp($line); 
        my @currentLine = split(/ /, $line);
        if ($currentLine[4] =~ /[-\d][\.\d+]/) { # looks like Perl accounts for negatives     
            $currentLine[4] = $currentLine[4] * 24 * 60 * 60; # convert to seconds
            print OUTPUT "@currentLine\n";  
        }
        elsif ($currentLine[4] =~ /[?-]{1}/) { # accounts for sun or lack of data 
            print OUTPUT "@currentLine\n";
        }
        #else {          # debug purposes 
        #    print OUTPUT "NOT MATCHED!: $line\n";
        #}
    } 
    print OUTPUT "\n";
}



=pod
Write a Perl program to accomplish each of the following on the file solar.txt (see link at
the class homepage)
1. Print all records that do not list a discoverer in the eighth field.
2. Print every record after erasing the fourth field. Note: It would be better to say
"print every record" omitting the fourth field.
3. Print the records for satellites that have negative orbital periods. (A negative
orbital period simply means that the satellite orbits in a counterclockwise
direction.)
4. Print the data for the objects discovered by the Sheppard space probe.
5. Print each record with the orbital period given in seconds rather than days.
=cut


=pod 
Adrastea XV Jupiter 129000 0.30 0.00 0.00 Jewitt 1979

1. Name of planet or moon [Adrastea]
2. Number of moon or planet (roman numerals) [XV]
3. Name of the object around which the satellite orbits [Jupiter]
4. Orbital radius (semimajor axis) in kilometers [129000]
5. Orbital period in days [0.30]
6. Orbital inclination in degrees [0.00]
7. Orbital eccentricity [0.00]
8. Discoverer [Jewitt]
9. Year of discovery [1979]
=cut