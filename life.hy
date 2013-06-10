(import sys)
(import random)

(defn p (msg) (sys.stdout.write msg))

(defn print-board (board)
  (for (line board)
    (for (spot line)
      (p (cond
               ((= spot 1) "<>")
               ((= spot 0) "  "))))
    (p "\n")))


; this neighborhood and next assume off the board are not alive
(defn next (neighborhood)
  (def alive (sum (list-comp 
                (sum line)
                (line neighborhood)
                )))
  (cond
    ((< alive 3) 0)
    ((in alive [3 4]) 1)
    ((> alive 4) 0)))

(defn get-neighborhood (board row col)
  (map
    (lambda (line) (slice line (max (- col 1) 0) (+ col 2)))
    (slice board (max (- row 1) 0) (+ row 2)))) 

(defn next-board (board)
  (defn next-row (r)
    (defn next-spot (c) (next (get-neighborhood board r c)))
    (map next-spot (range (len (get board 1)))))
  (map next-row (range (len board))))

;(setv board (lambda () (random.randint 1)))
;(setv board (map (lambda [_] (map (lambda [_] (random.randint 0 1)) (range 40))) (range 40)))

(defn populate (chance)
  (map (lambda [_] (map (lambda [_] (if (> chance (random.random)) 1 0)) (range 40))) (range 40)))
(setv board (populate .05))
(setv tiny-diehard [[0 0 0 0 0 0 0 0 0 0]
                    [0 0 0 0 0 0 0 1 0 0]
                    [0 1 1 0 0 0 0 0 0 0]
                    [0 0 1 0 0 0 1 1 1 0]
                    [0 0 0 0 0 0 0 0 0 0]])

(defn demo (board)
(print "start")
(while true 
    (print-board board)
    (setv board (next-board board))
    (raw_input)))

;(demo tiny-diehard)
(demo (populate .3))
    
