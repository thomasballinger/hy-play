(setv boards [[[0 0 0] [0 0 0] [0 0 0]]
              [[1 0 0] [0 0 0] [0 0 0]]
              [[1 1 0] [0 0 0] [0 0 0]]
              [[1 1 1] [0 0 0] [0 0 0]]
              [[1 1 1] [1 0 0] [0 0 0]]
              [[1 1 1] [1 1 0] [0 0 0]]
              [[1 1 1] [1 1 1] [0 0 0]]
              [[1 1 1] [1 1 1] [1 0 0]]
              [[1 1 1] [1 1 1] [1 1 0]]
              [[1 1 1] [1 1 1] [1 1 1]]])

(defn print-board (board)
  (for (line board)
    (print line)))

(defn next (neighborhood)
  (def alive (sum (list-comp 
                (sum line)
                (line neighborhood)
                )))
  (cond
    ((< alive 3) 0)
    ((in alive [3 4]) 1)
    ((> alive 5) 0)))

(print-board board)

(print (next board))

