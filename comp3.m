function arr = comp3 (arr, descending)
  if descending
    [arr(1), arr(2)] = maxmin(arr(1), arr(2))
    [arr(1), arr(3)] = maxmin(arr(1), arr(3))
    [arr(2), arr(3)] = maxmin(arr(2), arr(3))
  else
    [arr(2), arr(1)] = maxmin(arr(1), arr(2))
    [arr(3), arr(1)] = maxmin(arr(1), arr(3))
    [arr(3), arr(2)] = maxmin(arr(2), arr(3))
  endif
endfunction