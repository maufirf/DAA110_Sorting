% A fully functional heapsort function. It takes the matrix
% input then sorting it by:
% > Fully heapify the array, from the heap's last parent to first parent.
%   The first index of array is always the biggest number after every heapifying.
%   Decide the ascending-descending here:
%   > If ascending, the heap head is always the biggest as usual.
%   > If descending, the heap head is inverted, so it is the smallest.
% > Start the Head-take and re-heap until sorted:
%   > The first index (the biggest element in unsorted subarray) is swapped
%     with the last index of unsorted array (the last child in the heap tree),
%     making it the current leftmost element of sorted array.
%
% Parameter list is simply the one-dimensional matrix.
function list = heapMain(list, descending)
 
    % Subfunction siftDown is the function that manages how the heap head should
    % be, so ascending-descending method is decided here. this function sends
    % the selected element to its appropriate heap tree level downwards.
    %
    % list is the array being sorted
    % root is the currently selected parent element to be shifted downwards
    % theEnd is the last index of the unsorted array.
    function list = siftDown(list, root, theEnd, descending) 
    
        % This is the part we separate the ascending-descending method.
        if descending
            % root * 2 is always the left index of the root's left child,
            % try it for yourself. In other programming language that starts
            % the array indexing from 0, the root's left child is (root * 2) + 1
            %
            % "While the root still have at least the left children..."
            while (root * 2) <= theEnd
        
                child = root * 2; % "Select the left child index in child variable"
                % "If root also has right child and it is smaller than current selected
                % child (left child)..."
                if (child + 1 <= theEnd) && (list(child) > list(child+1))
                    child = child + 1; % Select the right child anyway
                endif
    
                % "if the child happen to be smaller than its parent..."
                if list(root) > list(child)
                    list([root child]) = list([child root]); %Swap
                    root = child; % Change current parent index to its child's previous index
                else % else parent is still bigger.
                    return % then we're finished heaping.
                endif
            endwhile
        else
            % root * 2 is always the left index of the root's left child,
            % try it for yourself. In other programming language that starts
            % the array indexing from 0, the root's left child is (root * 2) + 1
            %
            % "While the root still have at least the left children..."
            while (root * 2) <= theEnd
        
                child = root * 2; % "Select the left child index in child variable"
                % "If root also has right child and it is bigger than current selected
                % child (left child)..."
                if (child + 1 <= theEnd) && (list(child) < list(child+1))
                    child = child + 1; % Select the right child anyway
                endif
    
                % "if the child happen to be bigger than its parent..."
                if list(root) < list(child)
                    list([root child]) = list([child root]); %Swap
                    root = child; % Change current parent index to its child's previous index
                else % else parent is still bigger.
                    return % then we're finished heaping.
                endif
            endwhile
        endif
        
        
    endfunction
 
    count = numel(list);
    % count is the current rightmost index of the unsorted array.
    % This will be used as 'theEnd' parameter for sift down in
    % a loop that decrements count by 1 each iteration as one
    % more element is sorted in each iteration.
    % Currently, count is the length of the array
 
    % Because heapify is called once in pseudo-code, it is inline here

    % We initialize the first heapify by selecting the last parent.
    % floor(count/2) is always the parent index of a child, you can
    % try it for yourself. In other programming language that starts
    % array indexing from 0, the parent index is floor((count-2)/2).
    % We will heapify from the last parent to the first parent in order.
    start = floor(count/2);
 
    % "While the currently selected parent index is 1 (first parent) or more..."
    while start >= 1
        % Shift down the currently selected parent 
        list = siftDown(list, start, count, descending);
        start = start - 1; % Selects the previous parent for next iteration
    endwhile
    
    % End Heapify
 
    % This is the part where we start to sort it one element at a time.

    % Now, we utilize the count variable we declared before.
    % "While there's still have elements unsorted... "
    % (if the unsorted element is already 1 left, that is automatically
    % the biggest (if descending) or smallest (if ascending) element in
    % unsorted subarrays, thus no comparisons should be done.)
    while count > 1
 
        % Swap 1st index to the rightmost element of unsorted subarray
        % as it is already heapified previously, making it the leftmost
        % element of sorted subarray.
        list([count 1]) = list([1 count]);      
        % move the barrier of unsorted-sorted subarray to the left
        % as one more element is sorted.
        count = count - 1;
        % re-heapify with the new count
        list = siftDown(list,1,count, descending);
 
    endwhile
 
endfunction