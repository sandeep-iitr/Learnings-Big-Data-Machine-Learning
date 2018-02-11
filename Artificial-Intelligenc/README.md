# AI

## Winograd Schema Challenge
- [WebPage](https://cs.nyu.edu/faculty/davise/papers/WinogradSchemas/WS.html)

A Winograd schema is a pair of sentences that differ in only one or two words and that contain an ambiguity that is resolved in opposite ways in the two sentences and requires the use of world knowledge and reasoning for its resolution. The schema takes its name from a well-known example by Terry Winograd
- The city councilmen refused the demonstrators a permit because they [feared/advocated] violence.
If the word is ''feared'', then ''they'' presumably refers to the city council; if it is ''advocated'' then ''they'' presumably refers to the demonstrators.

## Systematic search strategies
- **Terminologies**:
  - Goal, Goal formulation, Problem formulation, env. is determinisitic.
  - Problem Formulation: What actions and states to consider, given a goal.
  - We assume the environment is observable, so agent knows the current state.
  - We assume the environment is deterministric, so every actions has one output.
- **Search**:
  - Process of looking at a sequence of actions that reaches the goal.
  - Solution: Sequence of Actions. Sometimes the solution is to find the final goal state, like in N-Queens Problem.
- **Well defined problems and solutions**
  - Problem Component
    - Initial state
    - Possible actions
    - Transition model: output state after applying action.
    - Goal test
    - Path cost
    - Solution and Optimal Solution
- **Toy Problems**
   - **Vacuum World Toy Problem**
     - State: Location of vacuum, and dirt.
     - Actions: Move Left, Move Right, Suck
     - Transition Model: Actions have their affect and may change the state.
     - Goal Test: Check when all squares are clean.
     - Path Cost: each step costs 1.
     
   - **8-Puzzle**(Family of sliding block puzzles): 3 by 3 board with eight numbered tiles and a blank. The objective is to reach specified goal state.
     - State: Location of each of eight tiles and a blank.
     - Initial State: Any state can be designated as initial state, or it may be given.
     - Action: Movement of blank space, Left: Right: Top: Bottom. Other formulations possible.
     - Transition model, goal test and path cost follows respectively.
   
   - **8-Queens**: Place 8 queens on chess board such that no queen attack each other.
     - Incremental formulation: Add each queen one at a time. Start with empty state, and try to find a goal state.
       - **States-1:** Any arrangements of 0-8 queens on the board.
       - Action1: Add a queen at any empty space.
       - **States-2:** All possible arrangement of 8 queens on board, such that one queen per column in the leftmost n columns, with no queen attacking each other.
       - Action2: Add a new queen to the leftmost empty column such that is not attacked by any other column. 
     - Complete-State formulation: Start with all 8 queens on the board, and move them around.
     
 - **Real World Problems**
   - **Route Finding Problems**
   - Touring Problems: Visit every city atleast once, with starting and ending in the same city.
     - State: will include the current city, and the set of visited cities as well.
   - TSP: Travelling salesperson problem: Touring problem in which each city must be visited exactly once.
   - And many other variants and additions to this list.
   
   
