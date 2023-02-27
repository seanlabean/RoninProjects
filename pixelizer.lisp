; Ronin v2.50
; Ultra Low-Res (UL-R)
; Convert imported image into user-selected
; number of packed circles which sample their 
; color from region defined by their center.

; Necessary functionalities:
; 1. User gives number of rows
; 2. Detect how many circles can fit
;    width-wise based on num rows.
; 3. Define circle centers (row, column)
; 4. Sample and set circle colors.

(clear)
(open "leaves.jpg" 0.6)
(def f
  (get-frame))

(def n-rows 4)
(def unit 10)

(def rad
  (div (div f:h (div n-rows 2)) (add 2.0 (sqrt 3.0))))
(def diam
  (mul rad 2))
(def n-cols
  (floor (div f:w rad)))

(defn get-row (a)
  (sub f:h (mul a rad)))
(defn get-col (a)
  (sub f:w (mul a rad)))
(def active-rows
  (map (range 1 n-rows 1) get-row))
(def active-cols
  (map (range 1 n-cols 1) get-col))
(debug active-cols)
  
;(debug (fill (circle (eachof active-rows
;(eachof active-cols) rad) "red"))

;(debug (pop active-rows))
;(debug (pop active-cols))
(defn build-circ ()
  (fill (circle (pop active-cols) (pop active-rows) rad) "red"))

(each (range 1 n-cols) build-circ)
