disp("\n\
=========================================\n\
\n\
ARRAY SORTER\n\
Made by the ith group of DAA100 course:\n\
> [13136170xx] Vivi Rofiah\n\
> [1313617014] Muhammad Aufi Rayesa Frandhana\n\
> [13136170xx] Ari Purnama Aji\n\
\n\
=========================================\n")

while true
    switch (menu ("Array Sorter -- What do you want to do?","Sort arrays","Help","Exit"))
        case 1
            arr = input("\Please define your one-dimensional array\nUse `[a1 a2 a3 ... an]` manually to make your n-element array\nUse `previous` to use previously made array\n(See help in the menu for more help)\n>>> ");
            previous = arr;
            disp("Unsorted array:")
            disp(arr)
            switch (menu ("Choose the algorithm", "Bose-Nelson sort", "counting sort", "heap sort", "Stalin sort", "Thanos sort"))
                case 1
                    [arr, swaps, nswaps] = boseMain(arr, yes_or_no("Descending? "));
                    disp("Sorted array:")
                    disp(arr)
                    disp(strcat("Comparison network size for array size of (", num2str(size(arr)(2)), ") = (", num2str(nswaps), ") comparators."))
                    if (yes_or_no("Do you want to see the set of comparators? "))
                        disp(swaps)
                    endif
                case 2
                    [arr, countarr, countarragg] = countingMain(arr, yes_or_no("Descending? "));
                    disp("Sorted array:")
                    disp(arr)
                    if yes_or_no("Do you want to see the per-type counter array prior to sorting? ")
                        disp(countarr)
                    endif
                    if yes_or_no("Do you want to see the aggregated counter array prior to sorting? ")
                        disp(countarragg)
                    endif
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
        case 2
            while true
                disp("\n=========================================\n")
                switch (menu("\n[HELP MENU]", "Get to know more about the algorithms", "How to generate random arrays", "Algorithm comparisons", "Arrays which can defeat those algorithms", "Exit help menu"))
                    case 1
                        while true
                            switch (menu("[HELP MENU] > [ALGORITHMS]", "Bose-Nelson sort", "counting sort", "heap sort", "Stalin sort", "Thanos sort", "[Up one menu]"))
                                case 1
                                    disp("\n\
        ============ BOSE-NELSON SORT ===========\n\
\n\
Bose-Nelson sort is the sorting network from 1960 invented by\n\
R. C. Bose and R. J. Nelson in their paper titled 'A Sorting\n\
Problem' dated back to 1962.\n\
\n\
Instead of algorithmic approach that usual sorting algorithm\n\
used, Bose-Nelson sort implemented predetermined sorting\n\
steps or we should call 'comparator network'. The smallest\n\
component in an comparator network is a maxmin() comparator\n\
which returns the maximum and minimum between two elements,\n\
then swap. The maxmin() comparator then combined into 5-\n\
comparator network consisted of maxmin() comparator to sort 4\n\
elements, which follows this pattern:\n\
\n\
                 1   2   3   4   5\n\
    element 1 ---+-------+-----------\n\
    element 2 ---+-------|---+---+---   each connected lines\n\
    element 3 -------+---+---|---+---   represent maxmin()\n\
    element 4 -------+-------+-------\n\
\n\
Thus this 5-comparator network can be developed to handle\n\
less or more elements, especially 3 or 8 elements. Although\n\
algorithm is not really used in the sorting itself, they made\n\
an algorithm consisted of minmax() and array merge algorithm\n\
to generate comparator network for n-element array sorting.\n\
\n\
Bose-Nelson sort is faster for small arrays than the most\n\
popular sorting algorithm as they follow O(n^1,6) complexity.\n\
However, Robert W. Floyd and Donald E. Knuth in their 1973\n\
paper titled 'The Bose-Nelson Sorting Problem' improved Bose-\n\
Nelson's sorting network to O(n^(1+(c/sqrt(log(n))))), it was\n\
made around 1964.\n\
\n\
In ascending method, minmax() returns the max() between two\n\
inputs then the min(). To swich into descending method, just\n\
simply invert minmax() returns: min() first, then max()\n\
\n\
References:\n\
BOSE, R. C., & NELSON, R. J. (1961). A sorting problem (No.\n\
    P1043). CASE INST OF TECH CLEVELAND OHIO.\n\
    DOI=http://dx.doi.org/10.1145/321119.321126\n\
FLOYD, R. W., & KNUTH, D. E. (1973). The Bose-Nelson Sorting\n\
    Problem††The preparation of this report has been\n\
    supported in part by the National Science Foundation, and\n\
    in part by the Office of Naval Research. A Survey of\n\
    Combinatorial Theory, 163–172.\n\
    doi:10.1016/b978-0-7204-2262-7.50020-x\n")
                                case 2
                                    disp("\n\
        ============= COUNTING SORT ==============\n\
\n\
Counting sort is a non-comparison sorting, which means there\n\
is no element-by-element comparison. It just straight doing\n\
an algorithm to sort arrays.\n\
\n\
It starts by an input, which is an array. input has n elements\n\
and k non-negative range (range between 0 to the maximum num\n\
found in input). Then it creates empty arrays called count\n\
with size k, and output with size n.\n\
\n\
count array counts how many elements from each of 0 to k \n\
exists within the input array. Then depends on the ascending-\n\
descending method, and this one assumes ascending for example,\n\
the count array is aggregated to left. for example, from this:\n\
    [ 0  1  0  1  1  2  3  1  0  3]\n\
to this:\n\
    [ 0  1  1  2  2  4  7  8  9  12]\n\
\n\
After that, we just traverse the input array from behind. with\n\
i as iteration traversing index, we take this formula to put\n\
sorted numbers to output:\n\
    output[count[input[i]]] = input[i]\n\
As you can see, the aggregated number in count array is used\n\
as index for output array. And also because of one number can\n\
appear more than once (more than elements with same value)\n\
we have to decrease the index for next iteration because it is\n\
ascending in order:\n\
    count[input[i]] -= 1\n\
\n\
We will have sorted array afterwards.\n\
\n\
References:\n\
https://en.wikipedia.org/wiki/Counting_sort\n")
                                case 3
                                    disp("\n\
        =============== HEAP SORT ===============\n\
\n\
Heap sort is using heap binary tree to sort an array.\n\
Using the properties it has: the topmost parent element is\n\
always the biggest element among the other elements in the\n\
same collection of elements.\n\
\n\
It first initialize the sorting by heapifying the array\n\
starting from the rightmost heap parent in the array.\n\
After that, we consider current array to become unsorted sub-\n\
array and there is an empty sorted subarray on the right.\n\
\n\
Then, until the array is sorted, first swap the biggest\n\
element in the unsorted subarray (because of the previous\n\
heapify, the biggest element will be on the first index of\n\
the unsorted subaray) with the rightmost element in the same\n\
subarray (which happen to be the last child the heap would\n\
have). We can consider the last element of unsorted subarray\n\
moved to and become the first element of sorted subarray.\n\
\n\
When the length of unsorted subarray is 1, it guarantees the\n\
sorting is finished.\n")
                                case 4
                                    disp("\n\
        ============== STALIN SORT ==============\n\
\n\
Stalin sort is an esoteric sorting algorithm made by internet\n\
back in 2017. It was started from a mailing list that reads:\n\
\n\
   'I came up with a single pass O(n) sort algorithm I call\n\
    StalinSort. U iterate down the list of elements checking\n\
    if they are in order. Any element which is out of order\n\
    is eliminated. At the end u have a sorted list.'\n\
\n\
    - @mathew@mastodon.social\n\
\n\
This sorting algorithm has O(n) complexity in the worst case.\n\
However, the entropy is so high that it can return only one\n\
element from an array with 1000+ of elements. This algorithm\n\
can still be used to actully sort an array by implementing\n\
divide and conquer methods inside, but it defeats the O(n)\n\
single pass purpose as mentioned in this internet article:\n\
https://humanoid-readable.claude-martin.ch/2018/11/04/stalin-sort/\n\
\n\
Only obeyful comerades can bring motherland to victory!\n\
URAAAAAAAAAAAAAAAAAAA!\n")
                                case 5
                                    disp("\n\
        ============== THANOS SORT ==============\n\
\n\
           'Perfectly balanced,\n\
                as all things should be.'\n\
\n\
            - Thanos, in Infinity War\n\
\n\
Thanos sort is one of the newest esoteric sorting that was\n\
created by internet in 2019. In the 'Infinity War' movie,\n\
the main antagonist, Thanos, has a power to make half of the\n\
population disappear at will using his 'infinity gauntlet'\n\
after he managed to get all the power gems for it. Within a\n\
snap on the hand he used the gauntlet, half of the population\n\
in earth is disappearing to dust.\n\
\n\
That develops the idea that Thanos could have snapped his\n\
fingers in order to make the world 'perfectly balanced, as\n\
everything should be', so he could snap until everything is\n\
sorted. This is where the algorithm born.\n\
\n\
On March 23, 2019, a github user findoslice uploaded a gist\n\
in github named 'thanos_sort.py', the python sort implementation\n\
https://gist.github.com/findoslice/4a83d2077fc6e55ed288c592593dbfa9\n\
And just by that, the algorithm spreads.\n")
                                case 6
                                    break
                                otherwise
                                    disp("invalid argument")
                            endswitch
                        endwhile
                    case 2
                        disp("\n\
When the program prompted you to input the 1D matrix to be\n\
sorted using available algorithms, you can actually type any\n\
Matlab or Octave functions that generate matrices such as\n\
zeros(n).\n\
\n\
If you wanted a random array, we've picked some functions\n\
for you to use as input:\n\
\n\
  > randperm(n) or randperm(k,n)\n\
    Returns random permutation array with length of n with\n\
    unique elements from 1 to n. If you wanted to pick random\n\
    unique numbers from 1 to k but only taking n elements from\n\
    them, use k as first argument with n after that. k <= 10.\n\
\n\
  > randi(k, 1, n)\n\
    Almost the same to randperm(k, n), but instead it allows\n\
    repetition (i.e. three elements can have same value). with\n\
    numbers 0 to k are the numbers that can be picked to the\n\
    result array with range n. This means the result array may\n\
    not have a particular number (i.e they have multiple 3s\n\
    but no 6s are seen).\n\
\n\
we also added variable `previous` so you can call it too.\n\
\n\
also if you previously using functions to generate random\n\
array. you can use `ans` that works like `previous`.")
                    case 3
                        disp("\n\
+--------------------+-------------------------------------------------------------------------+\n\
| Sorting algorithm  |                  Array aspects that may affect sorting                  |\n\
+                    +-------------------------------------------------------------------------+\n\
|                    |          Size          |         Range        |     Presorting order    |\n\
+--------------------+------------------------+----------------------+-------------------------+\n\
| Bose-Nelson        | Only good for small    | Don't care           | Don't care              |\n\
|                    | arrays, especially     |                      |                         |\n\
|                    | below 128 elements     |                      |                         |\n\
+--------------------+------------------------+----------------------+-------------------------+\n\
| Counting           | Good for any sizes     | Super weak if the    | Don't care              |\n\
|                    |                        | range is big, even   |                         |\n\
|                    |                        | if the array is only |                         |\n\
|                    |                        | 3 elements long.     |                         |\n\
+--------------------+------------------------+----------------------+-------------------------+\n\
| Heap               | Good for moderate-     | Good for any ranges  | Preforms best if the    |\n\
|                    | sized arrays           |                      | array is already        |\n\
|                    |                        |                      | sorted                  |\n\
+--------------------+------------------------+----------------------+-------------------------+\n\
| Stalin             | Stalin can fight       | Everyone has equal   | If the biggest element  |\n\
|                    | whatever the size of   | rights in communism. | is in the 1st index &   |\n\
|                    | his armies, even if    | Everyone is welcome. | we sort ascendingly,    |\n\
|                    | it is full of traitors | (Don't care)         | you'll have only one    |\n\
|                    | (Don't care)           |                      | comrade to fight with.  |\n\
+--------------------+------------------------+----------------------+-------------------------+\n\
| Thanos             | Within only n snaps,   | From civilian to     |                         |\n\
|                    | he can even kill       | Bruce Banner, he's   | Due to it's randomness  |\n\
|                    | 2^n Iron Men.(Don't    | undefeatable. (Don't | nature, in most cases   |\n\
|                    | care)                  | care)                | you could only have     |\n\
|                    |                        |                      | 2 people left in earth. |\n\
+--------------------+------------------------+----------------------+-------------------------+\n")
                    case 4
                        disp("\n\
BOSE-NELSON\n\
    Long arrays -> randi(128, 1, 2048)\n\
\n\
COUNTING\n\
    Arrays with big element range -> randi(4098,1,16)\n\
\n\
HEAP\n\
    Big arrays that is neither presorted either direction -> randperm(512)\n\
\n\
STALIN\n\
    Arrays with its biggest element in ascending order is presorted at the\n\
    first index -> [16 randperm(15)]\n\
\n\
THANOS\n\
    Arrays presorted like this: 1st biggest, 1st smallest, 2nd biggest, 2nd\n\
    smallest, ... n/2th biggest, n/2th smallest and also the biggest element\n\
    for ascending is already in the first index\n\
    Ascending -> [16 1 15 2 14 3 13 4 12 5 11 6 10 7 8 9]\n\
    Descending -> [1 16 2 15 3 14 4 13 5 12 6 11 7 10 8 9 ]\n")
                    case 5
                        break
                    otherwise
                        disp("invalid argument")
                endswitch
            endwhile
        case 3
            disp("\n    Thank you for using our Array Sorter.\n    This sorter is made as an task submission for\n    DAA110 course in Jakarta State University,\n    Computer Science.\n\nReturning to console...\n")
            break
        otherwise
            disp("invalid argument")
    endswitch
    disp("\n=========================================\n")
endwhile


%\n\
%                1   2   3   4   5\n\
%    element 1 ───┬───────┬───────────\n\
%    element 2 ───┴───────│───┬───┬───   each connected lines\n\
%    element 3 ───────┬───┴───│───┴───   represent maxmin()\n\
%    element 4 ───────┴───────┴───────\n\
%\n\