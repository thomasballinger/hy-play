
(import socket)
(defn foo (x y) (+ x y))
[socket.socket]
(def s (socket.socket))
(s.connect (tuple ["www.google.com" 80]))
(s.send (.encode "GET /\r\n\r\n" "ascii"))
(print (s.recv 100000))
(print (s.recv 100000))
(print (s.recv 100000))
(print (s.recv 100000))


(defn foo (x) (+ x 1))
