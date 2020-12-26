# StreamDemo2

For displaying a stream in a webpage.
Please click [here](https://xanadu-lang.github.io/contrib/githwxi/StreamDemo2/TEST/QueenPuzzle/2020-12-12/.)
to see a demo.

## Genre
- It targets JavaScript (JS).

## Files
- Makefile: Just for debugging purpose.
- StreamDemo2.dats: For the portion of template code.
- StreamDemo2_.dats: For the portion of non-template code. 
- StreamDemo2.cats: The extension `cats` is traditionally reserved for a file containing code external to ATS.
  In this case, the external code is written in JS.
- StreamDemo2.html: For the webpage displaying a given stream (of the type `stream(item)` for some abstract type `item`).

## Tests
- TEST/Fibonacci: For enumerating Fibonacci numbers: 0, 1, 1, 2, 3, 5, 8, 13, ...
  (Please see the [demo](https://xanadu-lang.github.io/contrib/githwxi/StreamDemo2/TEST/Fibonacci/2020-12-12/.))
- TEST/PrimeNums: For enumerating prime numbers (generated with the sieve of Eratosthenes)
  (Please see the [demo](https://xanadu-lang.github.io/contrib/githwxi/StreamDemo2/TEST/PrimeNums/2020-12-12/.))
- TEST/HanoiTower: For animating the process of solving the Hanoi tower puzzle of size 8
  (Please see the [demo](https://xanadu-lang.github.io/contrib/githwxi/StreamDemo2/TEST/HanoiTower/2020-12-20/.))
- TEST/QueenPuzzle: For animating the process of depth-first search for solving the 8-queen puzzle
  (Please see the [demo](https://xanadu-lang.github.io/contrib/githwxi/StreamDemo2/TEST/QueenPuzzle/2020-12-12/.))

## Dependencies: Some

- [ATS3/Contrib/githwxi/StreamDemo](./../StreamDemo)

