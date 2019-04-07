function [arr, swaps, nswaps] = boseMain (arr, descending)
    swaps = boseNetGen(size(arr)(2));
    nswaps = size(swaps)(1);
    i = 1;
    if descending
        while (i <= nswaps)
            s = swaps(i, :);
            [arr(s(1)), arr(s(2))] = maxmin(arr(s(1)), arr(s(2)));
            i += 1;
        endwhile
    else
        while (i <= nswaps)
            s = swaps(i, :);
            [arr(s(2)), arr(s(1))] = maxmin(arr(s(1)), arr(s(2)));
            i += 1;
        endwhile
    endif
endfunction

% tip: use randperm(a, b) to make shuffled matrix.