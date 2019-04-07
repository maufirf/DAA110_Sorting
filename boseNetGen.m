% This function generates sets of swaps instructions
% ffor bose-nelson sort.
function outmat = boseNetGen (n)

  % An empty matrix to 'save' the swaps that we should
  % commit in order to do bose-nelson sort.
  outmat = [];

  % This func adds next swap to outmat matrix
  % to be processed later in boseMain.m
  function P (i, j)
    outmat = [outmat; [i j]];
  endfunction

  % Pretty much to determine what swaps should happen
  % i, j = indices of first element in seq 1 and 2 respectively
  % x, y = lenght seq 1 and 2 respectively
  function Pbracket(i, x, j, y)
    % case both sequence are only 1 in length
    % so it means it implements comparator for
    % elements, which is maxmin() func
    if (x == 1 && y == 1)
      P(i, j)
    % case 3 elements, where seq 1 is only 1 in length
    % it implements comp3() func
    elseif (x == 1 && y == 2)
      P(i, (j + 1))
      P(i, j)
    % also case 3 elements, just this time seq 2 is 1 in length
    elseif (x == 2 && y == 1)
      P(i, j)
      P((i + 1), j)
    % if both sequences has exactly or more than 2 in length,
    % call this again recursively and try to make the length of
    % the subsequence odd and even for the other. If possible,
    % it will be easy for us just to merge them to 1.
    else
      a = floor(x / 2);
      if (mod(x, 2) == 1)
        b = floor(y / 2);
      else
        b = floor((y + 1) / 2);
      endif
      Pbracket(i, a, j, b)
      Pbracket((i + a), (x - a), (j + b), (y - b))
      Pbracket((i + a), (x - a), j, b)
    endif
  endfunction

  % Make two mergeable partitions
  % i = first element index in the current partition
  % m = length of said partition
  function Pstar(i, m)
    if (m > 1)
      a = floor(m / 2);
      Pstar(i, a)
      Pstar((i + a), (m - a))
      Pbracket(i, a, (i + a), (m - a))
    endif
  endfunction

  % Let's yeet the func lol awkoakwoakwaowk
  Pstar(1, n)

endfunction
