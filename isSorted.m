function statement = isSorted(arr, descending)
    i = 1;
    statement = false;
    if descending
        while i < size(arr)(2)
            if arr(i) < arr(i+1)
                return
            endif
            i += 1;
        endwhile
    else
        while i < size(arr)(2)
            if arr(i) > arr(i+1)
                return
            endif
            i += 1;
        endwhile
    endif
    statement = true;
endfunction