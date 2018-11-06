# Knights-Cover-Puzzle

-This project is to write a Lisp program to find a sequence of moves for a unique Chess piece that “covers”
	(visits all the squares) minimally on a 7x7chess board. A square can be visited only once in a minimal
	“cover”.
  
 -The unique chess piece moves in two parts. The first part is to an adjoining square orthogonally (horizontally or
	vertically). The giraffe may stop its move after the first part, or continue with a second part of the
	move. The second part is to move diagonally further away from its original square. The two-part
	giraffe move is like a Knight (Horse) move in chess. 
  
 -The unique chess piece starts on the upper-left corner square: coordinates (0 0). The lower right square has the
	coordinates (6 6).
  
 -The goal is to find a path of successive giraffe moves that visits the other 48 squares (a minimal
	cover). Then print out that path as a list, something like this “((0 0) (1 2) ... )”, or its reverse.
  
  Build, Installation and Setup:
	-  Built using GNU CLISP 2.49, ran through MAC terminal
