(import socket)
(import os)

(defn echo-upper  (c)
    (-> (.recv c 10000) (.upper) (c.send))
    (.close c)) 

(defn get-path (c)
  (def first-three (.split (car (.split (.recv c 1000) "\n"))))
  (def method (car first-three))
  (def path (car (cdr first-three)))
  (def protocol (car (cdr (cdr first-three))))
  path)

(defn file-bytes (path)
  (if (os.path.exists path)
    (.read (open path)) 
    "404"))

(defn serve-file (c)
  (c.send (file-bytes (cdr (get-path c)))))

(def s (socket.socket))
(.bind s (tuple ["" 8000]))
(.listen s 5)
(while True
  ;(echo-upper (car (s.accept))))
  (serve-file (car (s.accept))))
