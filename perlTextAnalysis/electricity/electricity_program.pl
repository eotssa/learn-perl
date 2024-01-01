##!/usr/bin/perl


if (open (FH, "<electricity.txt")) { 
    open (OUTPUT, ">outputElectric.txt");             # opens outpput file for writing 

    # 1. stores all words one at a time, anything that is seperated by a space is considered a word
    my @storage; 
    my $counter = 0;          

    while (my $line = <FH>) {                
        chomp($line); 
        my @currentLine = split(/\s+/, $line);
        foreach my $elem (@currentLine) {
            $elem =~ s/[^\w]+//g;           # removes any non-alphanumeric char
            if ($elem =~ m/[\w]/) {         # ensures no white space chars are stored 
                $storage[$counter] = $elem; # push_back to storage 
                $counter = $counter + 1; 
            }

        }
    }

    my @sortedInsensitivieAlpha = sort {lc($a) cmp lc($b)} (@storage); 

   #foreach (@sortedInsensitivieAlpha) {
   #   print OUTPUT "$_\n";
   #}

#2. alphabetically with upper case words just in front of lower-case words with the same initial characters
    my @sortedSensitivieAlpha = sort {
        if ($a ne $b) {  # if words do not match case-sensitive
            if (lc($a) eq lc($b)) { # but are the same word
                $a cmp $b
            }
        }
    } @sortedInsensitivieAlpha;
    
# 3. by frequency, from high to low, (any order for equal frequency)

    my %frequency; # (word => count)
    foreach (@sortedSensitivieAlpha) {
        if ($frequency{$_} < 1) {
            $frequency{$_} = 1; 
        }
        else {
            $frequency{$_} = $frequency{$_} + 1; 
        }
    }

    my @sortedByFrequency = sort {$frequency{$b} <=> $frequency{$a}} keys %frequency; 

    #foreach (@sortedByFrequency) {
    #    print OUTPUT "$_  $frequency{$_}\n";
    #}

    #foreach (@sortedSensitivieAlpha) {
    #    print OUTPUT "$_\n";
   # }    close(FH);   

# 4. by frequency, with alphabetical order for words with the same frequency

    my @sortedByFrequencyandAlpha = sort {lc($a) cmp lc($b)} keys %frequency;

    @sortedByFrequencyandAlpha = sort {$frequency{$b} <=> $frequency{$a}} @sortedByFrequencyandAlpha; 


    print OUTPUT "Word                 | Frequency\n";
    print OUTPUT "--------------------------------\n";
    foreach (@sortedByFrequencyandAlpha) {
        printf OUTPUT "%-20s | %2d\n", $_, $frequency{$_};

    }

    

                             
    close(OUTPUT); 

}  else { 
    print "Error: file failed to open"; 
}






=pod
Part 2: (20 points )
Separate, count and sort the words in the example text file, electricity.txt (see link at the
class homepage). Sort in the following orders and your output should be nicely lined up
in columns to the output file.


1. alphabetically (ignoring capitalization),
2. alphabetically with upper case words just in front of lower-case words with the
same initial characters
3. by frequency, from high to low, (any order for equal frequency)
4. by frequency, with alphabetical order for words with the same frequency
=cut