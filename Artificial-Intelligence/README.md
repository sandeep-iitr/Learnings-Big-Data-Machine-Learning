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
     - **Completeness**: Is algorithm guaranteed to find a solution, if there is one?
     - **Optimality**: Does the algorithm find optimal solution.
     - **Time Complexity**: Measured in terms of number of nodes generated during search.
     - **Space Complexity**: Maximum number of nodes stored in memory.

---
---
---

### Uninformed Search Strategies
Blind search. Generate successors and distinguish goal state from non-goal state. No additional information

#### Breadth First Search
Shallowest unexpanded node is chosen for expansion. FIFO queue for frontier. 
- Algorithm similar to Graph Search: Can do the goal test, when the node is generated or when it is expanded. 
- Time Complexity: Total number of nodes generated
  - Goal test when node is generated: b + b^2 + b^3 .... b^d = O(b^d)
  - Goal test when the node is expanded:  O(b^(d+1))
- Space Complexity: 
  - Explored set: nodes which are expanded = O(b^(d-1))
  - Frontier: Leaf nodes at depth d = O(b^d)
  - O(b^d): Dominated by Frontier.
**Practically memory requirements are a bigger problem for BFS than the time complexity**

#### Uniform cost search: With different cost on edges.
BFS is optimal only if all step costs are equal. Instead of expanding the shallowest node, UCS expands the node with lowest path cost g(n). 
- **Ordering of the queue by path cost**.
- **Goal test is applied to the node when it is selected for expansion**, rather then when it is first generated. 
- It is **Optimal**.
- It can struck in infinite loop: if there are negative costs, or paths with infinite sequence and zero cost.
- **Worst case Time and Space Complexity** = O(b^(1+a)), where a = (Cost of optimal solution)/(Minimum of the action costs)


#### Depth First Search
Use LIFO, in the graph search algorithm. Most recently generated node is chosen for expansion.
- Fails if an infinite non-goal path is encountered.
- Complexity depends on Max depth. Depth of solution doesn't matter, because we will go to the deepest levels.
- **Time Complexity**: m is max depth of tree = O(b^m)
- **Space Complexity**: generate b nodes, and remove 1 = O(m(b-1)) = O(mb).
  - b is branching factor. m is max depth
- **Optimality**: No, we might find a solution which is not optimal. 
- **Complete**: We might go into an infinite loop. No.

#### Depth Limited Search
Only search until level l. Solves the infinite path problem of DFS. 
- let d be the depth of the solution
  - if l<d, then it is incomplete
  - if l>d, then it is non-optimal.
  - **Time complexity** is: O(b^l) and **Space complexity** is O(bl)
 
#### Iterative Deepening Depth First Search
- Gradually increase the depth limit until goal is found.
- Since most of the nodes are in bottom level, tbe overhead is modest.
- **Space complexity** is still: O(bd). d is depth of the solution.
- **Time Complexity** is: O(b^d)
- It combines benefit of BFS and DFS.
- **Complete** when branching factor is finite. and **optimal** when path cost is non-decreasing function of depth of nodes.

#### Iterative Lengthening Search
Limits the path cost, rather than the depth.
[Good Notes with question 2 and answer, on page 2](https://www.cs.rochester.edu/~brown/242/answers/04FinalAns.pdf)

#### Bidirectional Search
- Requires a method for computing predecesors. 
- Requires more space, atleast frontier of one of the search has to be kept in memory. 
- **Space and Time Complexity** if BFS is used for both sides: O(b^(d/2))
- It is **optimal** (steps cost all identical) and **complete** (branching factor is finite)


---
---
---

### Informed Heuristic Search Strategies
heuristic function: which evaluate the possible next choice to states to pick the best.

#### Greedy Best First Search
h(n): Heuristic. Estimated cost of the current state from the goal.

- Choose the next state, which is closest to the goal. (heuristic)
- Goal test: if expanded state is goal state.
- **Optimal**: It is not. It may find less optimal solution.
- **Completeness**: Incomplete even in finite state space. (Tree search version may enter into infinite loop). However graph search version is complete in finite space. 
- **Time and Space complexity in worst case**: O(b^m), where m is the maximum depth of search space. 

#### A* Algorithm
We want heuristic and cost both low. We want closer to the goal state and closer to the starting state.
- f(n) = g(n) + h(n): this the total function we can use. How expensive the solution is. What is cost of the entire thing.
- Admissable heuristic: h(n) <= True cost of reaching the state n in a optimal way
- Maintain the generated nodes in frontier, and pick the min f(n), when expanding.
- **Optimal**: it is optimal
- **Space Complexity**: O(b^(d+1)): Dump version of BFS. use iterative deepening with limit on f value to fix this. 
- **Time Complexity**: O(b^(d\*e)), where e is the relative error between true heuristic(h1) and heuristic (h2) = (h1-h2)/h1
  - d is the solution depth.
  

---
---
---
## Heuristics
Effect of heuristic: Effective branching factor.

### Heuristics for 8 puzzle
- H1
  - The number of misplaced tiles
- H2
  - The sum of the distances of the tiles from their goal position.
  - Sum of horizontal and vertical distance.
  
### Finding Heuristics
- Relax the problem
- Solve the subproblem.

### Pattern Database: SubProblems
Generate the admissible from solution cost of sub problems. 
- pattern database: store the exact solution cost for every possible subproblem instance. This is calculated by searching back 
from the goal. 

---
---
---

## Local Search Strategies
Good, where path to goal is irrevalent, and what matters is goal state.
- We don't do a systematic search

### Hill Climbing Search
- No memory, blindfolded. generate all possible positions and pick the best.
- Eg: Conitnue move toward a direction of increasing value. (value may be the closeness to the goal)
- Greedy local search. 
- **Beam Search**: variant of hill climbing, where we use the size of beam for parallel branches. Eg: beam size = 3, we start from 3 random initial states, and generate successors, then pick the next 3 best successor states. It works better than randomly doing the 3 starts. As we can skip the bad branches.

### Simulated Annealing
Balance between exploration and expoitation

Algorithm
- Compare next state to the current state:
  - Better: Pick it
  - Worse: Pick it with a probability P = e^((E)/(T)). E is how much worse this solution
    - If this is very very bad solution (-ve infinity): P = 0.
    - If T is very high (initial start of the problem): we choose the another state. This is exploration time.
    - If T is 0, we go back in case of worst state.
    
### Genetic Algorithm
- Steps: 
  - Selection
  - Cross Over
  - Mutation
 
  
----
----
----

# Adversarial Search/ Game Playing
Take into account what other agent may be thinking/doing in game

To learn: We have a function, which tells what to do next in this particular state. We learn a policy, or how to play the game.

## Zero Sum
- First player maximizes profit, and
- Second player minimizes profit.

Eg: Tic Tac Toe: Max(x), and Min (o)

Max prefers to move to the state of maximum value, and min prefer to move to the state of minimum value.
- **Min Max** tree:
  - Every node have a value generated in the tree. The root is the value for the player playing/starting the game.
  - Easy extension to **multiplayer**, where a vector of values is returned, and each player tries to maximize its component.
  
## Alpha-Beta Pruning
We can prune some of the branches.
- α = the value of the best (i.e., highest-value) choice we have found so far at any choice point along the path for MAX.
- β = the value of the best (i.e., lowest-value) choice we have found so far at any choice point along the path for MIN.
- Max node only updates the alpha, and Min node only updates the Beta.
- (Alpha, Beta): initialize (-inf,+inf)
- Pruning when: Beta<= Alpha.

## Evaluation Functions 5.4.1
avoiding search all the way to the terminal node.

## 5.4.2 Cut off search
Call the heuristic evaluation function, given the cut off. 
- Evaluation function should be applied only to positions that are **quiescent**.
- Nonquiescent positions can be expanded further using quiescence search until quiescent positions are reached.
- horizon effect: It arises when the program is facing an opponent’s move that causes serious damage and is ultimately unavoidable, but can be temporarily avoided by delaying tactics. 

## 5.5 Stochastic Games
When unpredicatble external events affect the game.
- Chance nodes in addition to min-max nodes.
- Now the expected value of a position is calculated: Avg over all possible values of the chance nodes.
- Generalize the minimax value for deterministic games to an expectiminimax value for games with chance nodes.
### Evaluation functions for games of chance: 5.5.1
- This need to be designed carefully.
- The ordering of values now affect. And the alpha beta still works, but due to chance, the expected values comes into picture.


---
---
---
---

# Constraint satisfaction : 6.0

## DEFINING CONSTRAINT SATISFACTION PROBLEMS 6.1
## [Good Exercise](https://s3-us-west-2.amazonaws.com/cs188websitecontent/written_hw/hw4_sol.pdf)
- X is a set of variables, {X1, . . . ,Xn}.
- D is a set of domains, {D1, . . . ,Dn}, one for each variable.
- C is a set of constraints that specify allowable combinations of values.

To solve a CSP, we need to define a state space and the notion of a solution. Each
state in a CSP is defined by an assignment of values to some or all of the variables.

- Visualize a CSP as a constraint graph, as shown in Figure 6.1(b).

### Types of Contraints
- unary constraint
- binary constraint
- global constraint: Alldiff
These constraints can be represented in a constraint hypergraph, such as the one shown in Figure 6.2(b). A hypergraph consists of ordinary nodes (the circles in the figure) and hypernodes (the squares), which represent n-ary constraints. 

### BackTracking Search
The term backtracking search  is used for a depth-first search that chooses values for one variable at a time and backtracks when a variable has no legal values left to assign.
- Algorithm in figure 6.5
  - Select a variable ordering (**minimum remaining-values (MRV) heuristic**)
    - For each variable now: select a value ordering(**least-constraining-value**)
      - If value is consistent with assignment. (binary constraint)
      - Do the inference (arc, path or k consistency). 
      - If inference is not failure, add them to the assignment.
- BACKTRACKING-SEARCH keeps only a single representation of a state and
alters that representation rather than creating new ones

### Constraint propagation:
In CSPs there is a choice: an algorithm can search (choose a new variable assignment from several possibilities)
or do a specific type of inference INFERENCE called constraint propagation: using the constraints to
reduce the number of legal values for a variable, which in turn can reduce the legal values
for another variable, and so on. Constraint propagation may be intertwined with search, or it
may be done as a preprocessing step, before search starts. Sometimes this preprocessing can
solve the whole problem, so no search is required at all.


### 6.2.1 Node consistency
A single variable is node-consistent if all the values in the variable’s domain satisfy the variable’s unary constraints.

### 6.2.2 Arc consistency
A variable in a CSP is arc-consistent if every value in its domain satisfies the variable’s
binary constraints. A network is arc-consistent if every variable is arc
consistent with every other variable. For example, consider the constraint Y = X^2 where the domain of both X and Y is the set of digits. We can write this constraint explicitly as
(X, Y ), {(0, 0), (1, 1), (2, 4), (3, 9))}.

- **Arc consistency algorithm**
  - To make every variable arc-consistent, the AC-3 algorithm maintains a queue of arcs to consider. (order of arcs not important), Initially, the queue contains all the arcs in the CSP.
  - AC-3 then pops off an arbitrary arc (Xi,Xj) from the queue and makes Xi arc-consistent with respect to Xj, ie we try to reduce the domain of Xi, making sure that Xj has valid values. This may happen is Xj is dependent of Xi.
    - If this leaves Di(domain of Xi) unchanged, the algorithm just moves on to the next arc.
    - But if this revises Di (makes the domain smaller), then we add to the queue all arcs (Xk,Xi) where Xk is a neighbor of Xi. We need to do that because the change in Di might enable further reductions in the domains of Dk, even if we have previously considered Xk. If Di is revised down to nothing, then we know the whole CSP has no consistent solution, and AC-3 can immediately return failure. Otherwise, we keep checking, trying to remove values from the domains of variables until no more arcs are in the queue. At that point, we are left with a CSP that is equivalent to the original CSP—they both have the same solutions—but the arc-consistent CSP will in most cases be faster to search because its variables have smaller domains

- Complexity: Assume a CSP with n variables, each with domain size at most d, and with c binary constraints (arcs). Each arc (Xk,Xi) can be inserted in the queue only d times because Xi has at most d values to delete. Checking consistency of an arc can be done in O(d^2) time, so we get O(cd^3) total worst-case time. 

### 6.2.3 Path consistency
Path consistency tightens the binary constraints by using implicit constraints that are inferred by looking at triples of variables. 

A two-variable set {Xi,Xj} is path-consistent with respect to a third variable Xm if,
for every assignment {Xi = a,Xj = b} consistent with the constraints on {Xi,Xj}, there is
an assignment to Xm that satisfies the constraints on {Xi,Xm} and {Xm,Xj}. This is called
path consistency because one can think of it as looking at a path from Xi to Xj with Xm in
the middle.

### 6.2.4 K-consistency
A CSP is k-consistent if, for any set of k − 1 variables and for any consistent assignment to those
variables, a consistent value can always be assigned to any kth variable

1-consistency says that, given the empty set, we can make any set of one variable consistent: this is what we
called node consistency. 2-consistency is the same as arc consistency. For binary constraint
networks, 3-consistency is the same as path consistency.

## backtracking search
The term backtracking search  is used for a depth-first search that chooses values for  one variable at a time and backtracks when a variable has no legal values left to assign.

It repeatedly chooses an unassigned variable, and then tries
all values in the domain of that variable in turn, trying to find a solution. If an inconsistency is
detected, then BACKTRACK returns failure, causing the previous call to try another value.

### Which variable should be assigned next (SELECT-UNASSIGNED-VARIABLE), and in what order should its values be tried (ORDER-DOMAIN-VALUES)?

### 6.3.1 Variable and value ordering
- **minimum remaining-values (MRV) heuristic**.
  - Pick the ordering of variables such that we have minimum values to assign to a particular variable. As we go on assigning variables, the values which are available to us for remaining goes on decreasing. 
  
  - It also has been called the **“most constrained variable”** or
    **"fail-first"** heuristic, the latter because it picks a variable that is most likely to cause a failure soon, thereby pruning the search tree.
  - The MRV heuristic doesn’t help at all in choosing the first region to color in Australia, because initially every region has three legal colors. In this case, the **degree heuristic** comes
in handy. It attempts to reduce the branching factor on future choices by selecting the variable
that is involved in the largest number of constraints on other unassigned variables.

- **least-constraining-value** heuristic: It prefers the value that rules out the fewest choices for the neighboring variables in the constraint graph.
  - Pick value of variable which is less likely to fail in future. 
  
Why should variable selection be fail-first, but value selection be fail-last? It turns out
that, for a wide variety of problems, a variable ordering that chooses a variable with the
minimum number of remaining values helps minimize the number of nodes in the search tree
by pruning larger parts of the tree earlier.

### 6.3.2 Interleaving search and inference
- **forward checking**: 
  - Removing values which are no longer possible. 
  - Example in Map coloring problem: 
    - initially: WA {r,g,b}, NT{r,g,b}, SA{r,g,b} and so-on
    - WA=R, then  NT{g,b}, SA{g,b}
    - Q=g, NT{b}, SA{b}, NSW {r,b}
    - V= b, SA={Empty}: Deadend
    
  - Forward Checking can be combined with minimum remaining value.
  - Whenever a variable X is assigned, the forward-checking process establishes arc consistency for it: for each unassigned variable Y that is connected to X by a constraint, delete from Y ’s domain any
value that is inconsistent with the value chosen for X. 
  - Although forward checking detects many inconsistencies, it does not detect all of them.
The problem is that it makes the current variable arc-consistent(enforces constraints on the current variables), but doesn’t look ahead and make all the other variables arc-consistent.

### Maintaining Arc Consistency (MAC) Algorithm
Do forward checking, and look ahead and maintain all the variables arc consistent.
- Recursively propagate the constraints: **After assigning the variable, do the forward checking (Reduce the domains of all un assigned variables), and then consider that constraints are satisfied on the neighbors of the currently assigned variable**.


## 6.5 THE STRUCTURE OF PROBLEMS
- Independent subproblems identification can be done from the constraint satisfication graph.
- A constraint graph is a tree when any two variables are connected by only one path. We show that any tree-structured CSP can
be solved in time linear in the number of variables
- In a tree structures CSP: Once linearly ordered. We can move through it linearly, and solve it. [More Details are here online link with book example](http://cs188ai.wikia.com/wiki/Tree_Structure_CSPs)

### Constraint graphs can be reduced to trees
- one based on removing nodes
  - Remove the nodes which make the graph a tree. Assign values to the removed nodes, and make change in the domain of nodes of tree, due to constraints of the removed nodes. Now solve the tree structures CSP, in polynomial time. If no solution exist, try the different values for removed nodes.
- one based on collapsing nodes together
  - Also called **tree decomposition of the constraint graph** into a set of connected subproblems. 
- Tree Decomposition
  - Every variable in the original problem appears in at least one of the subproblems
  - If two variables are connected by a constraint in the original problem, they must appear together (along with the constraint) in at least one of the subproblems.
  - If a variable appears in two subproblems in the tree, it must appear in every subproblem
along the path connecting those subproblems
    
The first two conditions ensure that all the variables and constraints are represented in the
decomposition. The third condition seems rather technical, but simply reflects the constraint
that any given variable must have the same value in every subproblem in which it appears. 
