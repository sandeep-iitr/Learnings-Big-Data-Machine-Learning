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
   
 - **Searching for Solutions**
   - Search Tree: initial state as the root, branches as the actions, and node corresponds to the states in the state space.
   - Frontier: Set of all leaf nodes, available for expansion at any given point.
   - Search Strategy: Choosing which state to expand next.
   - Removing loopy paths: Consider path costs are additive to remove the loops.
   - Redundant paths: More that one way to get from one state to another. Choose the cost optimal one here.
   
   - **Function Tree Search(Problem)**: returns a solution or failure.
       - initialize the Frontier using initial state of the problem
       - loop do
         - if Frontier is empty then return failure.
         - Choose a leaf node, remove it from Frontier
         - if the node contains goal state, then return the corresponsing solution.
         - expand the chosen node, add the resulting node to the Frontier.
         
   - **Function Graph Search(Problem)**: 
       - initialize the Frontier using initial state of the problem
       - initialize the explored set to be empty.
       - loop do
         - if Frontier is empty then return failure.
         - Choose a leaf node, remove it from Frontier.
         - if the node contains goal state, then return the corresponsing solution.
         - add the node to the explored set.
         - expand the chosen node, add the resulting node to the Frontier only if not in the frontier or in explored set.
         
   - Infrastructure for Search Algorithms
     - Node vs State: Node is bookeeping datastructure used to represent search tree. A state corresponds to configuration of the world. Nodes are on a particular path defined by parent pointer, whereas states are not. Two different nodes may contain the same world state which might be generated via different search paths. 
   
   - **Problem solving Performance**:
     - Completeness: Is algorithm guaranteed to find a solution, if there is one?
     - Optimality: Does the algorithm find optimal solution.
     - Time Complexity: Measured in terms of number of nodes generated during search.
     - Space Complexity: Maximum number of nodes stored in memory.
     
     
     