disp("\n=========================================\n\nARRAY SORTER\nMade by the ith group of DAA100 course:\n> [13136170xx] Vivi Rofiah\n> [1313617014] Muhammad Aufi Rayesa Frandhana\n> [13136170xx] Ari Purnama Aji\n\n=========================================\n")

while true
    if yes_or_no ("Array Sorter -- Do you want to sort arrays? ")
        arr = input("Please define your one-dimensional array\nUse `[a1 a2 a3 ... an]` manually to make your n-element array\nUse `randperm(n, n)` to generate random array with n elements\nUse `previous` to use previously made array\n>>> ");
        previous = arr;
        disp("Unsorted array:")
        disp(arr)
        switch (menu ("Choose the algorithm", "bose-nelson sort", "counting sort", "heapsort", "Stalin sort", "Thanos sort"))
            case 1
                [arr, swaps, nswaps] = boseMain(arr, yes_or_no("Descending? "));
                disp("Sorted array:")
                disp(arr)
                disp(strcat("Comparison network size for array size of (", num2str(size(arr)(2)), ") = (", num2str(nswaps), ") comparators."))
                if (yes_or_no("Do you want to see the set of comparators? "))
                    disp(swaps)
                endif
            case 2
                disp("do countingsort")
            case 3
                arr = heapMain(arr, yes_or_no("Descending? "));
                disp("Sorted array:")
                disp(arr)
            case 4
                arr = stalinMain(arr, yes_or_no("Descending? "), yes_or_no("Do recursive merges? "));
                disp("Obeyful motherland comerades:")
                disp(arr)
            case 5
                [arr, snaps] = thanosMain(arr, yes_or_no("Descending? "), yes_or_no("Show snaps? "));
                disp(strcat("The rest of the Avengers after (", num2str(snaps), ") snaps:"))
                disp(arr)
            otherwise
                disp("invalid argument")
        endswitch
    else
        disp("\n    Thank you for using our Array Sorter.\n    This sorter is made as an task submission for\n    DAA110 course in Jakarta State University,\n    Computer Science.\n\nReturning to console...\n")
        break
    endif
    disp("\n=========================================\n")
endwhile