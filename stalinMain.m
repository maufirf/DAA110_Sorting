function arr = stalinMain(arr, descending, remerge)
    i = 1;
    discarded = [];
    if descending
        while i <= size(arr)(2) - 1
            if arr(i) < arr(i + 1)
                discarded = [discarded arr(i + 1)];
                arr(i + 1) = [];
                i -= 1;
            endif
            i += 1;
        endwhile
    else
        while i <= size(arr)(2) - 1
            if arr(i) > arr(i + 1)
                discarded = [discarded arr(i + 1)];
                arr(i + 1) = [];
                i -= 1;
            endif
            i += 1;
        endwhile        
    endif
    if remerge
        if size(discarded)(2) > 1
            arr = [arr stalinMain(discarded, descending, remerge)];
        else
            arr = [arr discarded];
        endif
    endif
endfunction