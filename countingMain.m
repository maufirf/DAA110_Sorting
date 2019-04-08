function [output, countarrbak, countarragg] = countingMain (arr, descending)
    k = max(arr); % range of non-negative key values
    countarr = zeros([1 k]); % new array of k zeros
    out = zeros ([1 size(arr)(2)]);
    arrsize = size(arr)(2);

    % Counting section
    i = 1;
    while i <= arrsize;
        countarr(arr(i)) += 1;
        i += 1;
    endwhile

    countarrbak = countarr;

    if descending
        % Aggregating section
        i = k;
        while i >= 2
            countarr(i-1) += countarr(i);
            i -= 1;
        endwhile

        countarragg = countarr;

        % Resorting section
        i = 1;
        while i <= arrsize
            output(countarr(arr(i))) = arr(i);
            countarr(arr(i)) -= 1;
            i += 1;
        endwhile
    else   
        % Aggregating section
        i = 2;
        while i <= k
            countarr(i) += countarr(i-1);
            i += 1;
        endwhile

        countarragg = countarr;

        % Resorting section
        i = arrsize;
        while i >= 1
            output(countarr(arr(i))) = arr(i);
            countarr(arr(i)) -= 1;
            i -= 1;
        endwhile
    endif
endfunction