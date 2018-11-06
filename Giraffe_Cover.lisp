;; Authors: Jonathan Moubayed and Andrew Vu
;; Contacts: jonmoubayed@csu.fullerton.edu, avu916@csu.fullerton.edu
;; Description: This project is to write a Lisp program to find a sequence of moves for a chess giraffe that “covers”
;;	(visits all the squares) minimally on a 7x7chess board. A square can be visited only once in a minimal
;;	“cover”.
;;	
;;	A giraffe moves in two parts. The first part is to an adjoining square orthogonally (horizontally or
;;	vertically). The giraffe may stop its move after the first part, or continue with a second part of the
;;	move. The second part is to move diagonally further away from its original square. The two-part
;;	giraffe move is like a Knight (Horse) move in chess. 
;;	
;;	The giraffe starts on the upper-left corner square: coordinates (0 0). The lower right square has the
;;	coordinates (6 6). (Note, the commas in the coordinates are implied.)
;;	
;;	The goal is to find a path of successive giraffe moves that visits the other 48 squares (a minimal
;;	cover). Then print out that path as a list, something like this “((0 0) (1 2) ... )”, or its reverse.



(defun get_children (row col)
  (list 
    ;;produce all children
    (list (+ row 1) (- col 2))
    (list (+ row 1) (+ col 0))
    (list (+ row 1) (+ col 2))
    (list (+ row 2) (- col 1))
    (list (+ row 2) (+ col 1))
    (list (+ row 0) (- col 1))
    (list (+ row 0) (+ col 1))
    (list (- row 2) (- col 1))
    (list (- row 2) (+ col 1))
    (list (- row 1) (- col 2))
    (list (- row 1) (+ col 0))
    (list (- row 1) (+ col 2))))


(defun in_bound_kids(row col)
  (let ((kids nil))
    (loop for x in (get_children row col) do 
      ;;check if child is within the bounds
      (if (and (>= (nth 0 x) 0) (<= (nth 0 x) 6) (>= (nth 1 x) 0) (<= (nth 1 x) 6)) 
            (push x kids)))(reverse kids)))

(defun giraffe_cover (path)
  ;;assigns the result of in_bound_kids to in_bound_list
  (let ((in_bound_list 
          (in_bound_kids 
            (nth 0 
              (nth 0 
                (last path))) 
              (nth 1 
                (nth 0 
                  (last path))))))
      (if (< (list-length path) 49) 
        (loop for x in in_bound_list do 
          ;;test whether or not child is already in path
         (if (not (member x path :test #'equal)) 
            (return (giraffe_cover 
              (reverse
                (cons x 
                  (reverse path))))))) (reverse (reverse path)))))