# DAA110_Sorting
An assignment given from our Algorithm Design and Analysis lecturer, about sorting.

------

### Running
No we didn't use Matlab, we use Octave.
To run this project after cloning it, just go to your terminal and type
```
octave main.m --no-gui
```

Make sure the Octave MINGW64 or MINGW32 bin path is listed in your system `PATH` environment variable for windows user.

### What's insisde

- `main.m` is basically the main script file.
- `boseMain.m` is the function file that acts as handler for bose-nelson sort
- `boseNetGen.m` is the sorting network generator for the `boseMain.m`
- `heapMain.m` is the function file that acts as handler for heap sort
- `stalinMain.m` is the same, but for Stalin sort
- `thanosMain.m` is the same, but for Thanos sort
- `isSorted.m` is the function file that returns true if an array is sorted, otherwise false. Used in `thanosMain.m` and `stalinMain.m`
- `maxmin.m` is the function file that returns the max and min of two input integers. Used in `boseNetGen.m`
- `comp3.m` and `comp4.m` is an unused experiment file made while trying to figure on how to write `boseNetGen.m`
- Who the f\*\*k made the `bisection.m`

### Credits
Made by three people, with love:

- Muhammad Aufi Rayesa Frandhana
- Vivi Rofiah
- Ari Purnama Aji
