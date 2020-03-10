(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
;;; SMT-LIB2: real arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort duration 0)

(define-fun in_range1 ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                     (<= x 9223372036854775807)))

(declare-const dummy duration)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (duration duration) Bool)

(declare-datatypes ((duration__ref 0))
(((duration__refqtmk (duration__content duration)))))
(define-fun duration__ref_duration__content__projection ((a duration__ref)) duration 
  (duration__content a))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun div1 (Int Int) Int)

(declare-fun mod1 (Int Int) Int)

;; Div_mod
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (= x (+ (* y (div1 x y)) (mod1 x y))))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div1 x y)) (<= (div1 x y) x)))))

;; Mod_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0))
  (and (< (- (abs1 y)) (mod1 x y)) (< (mod1 x y) (abs1 y))))))

;; Div_sign_pos
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< 0 y)) (<= 0 (div1 x y)))))

;; Div_sign_neg
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= x 0) (< 0 y)) (<= (div1 x y) 0))))

;; Mod_sign_pos
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (not (= y 0))) (<= 0 (mod1 x y)))))

;; Mod_sign_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= x 0) (not (= y 0))) (<= (mod1 x y) 0))))

;; Rounds_toward_zero
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (<= (abs1 (* (div1 x y) y)) (abs1 x)))))

;; Div_1
  (assert (forall ((x Int)) (= (div1 x 1) x)))

;; Mod_1
  (assert (forall ((x Int)) (= (mod1 x 1) 0)))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div1 x y) 0))))

;; Mod_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (mod1 x y) x))))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (div1 (+ (* x y) z) x) (+ y (div1 z x)))) :pattern ((div1
                                                            (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (mod1 (+ (* x y) z) x) (mod1 z x))) :pattern ((mod1 (+ (* x y) z) x)) )))

;; Div_unique
  (assert
  (forall ((x Int) (y Int) (q Int))
  (=> (< 0 y) (=> (and (<= (* q y) x) (< x (+ (* q y) y))) (= (div x y) q)))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div x y)) (<= (div x y) x)))))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div x y) 0))))

;; Div_inf_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (< 0 x) (<= x y)) (= (div (- x) y) (- 1)))))

;; Mod_0
  (assert (forall ((y Int)) (=> (not (= y 0)) (= (mod 0 y) 0))))

;; Div_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div 1 y) 0))))

;; Div_minus1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div (- 1) y) (- 1)))))

;; Mod_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (mod 1 y) 1))))

;; Mod_minus1_left
  (assert
  (forall ((y Int))
  (! (=> (< 1 y) (= (mod (- 1) y) (- y 1))) :pattern ((mod (- 1) y)) )))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (div (+ (* x y) z) x) (+ y (div z x)))) :pattern ((div (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (mod (+ (* x y) z) x) (mod z x))) :pattern ((mod (+ (* x y) z) x)) )))

(define-fun mod2 ((x Int)
  (y Int)) Int (ite (< 0 y) (mod x y) (+ (mod x y) y)))

(define-fun pos_div_relation ((res Int) (num Int)
  (den Int)) Bool (let ((exact (div1 num den)))
                  (ite (= num 0) (= res 0)
                  (ite (= num (* exact den)) (= res exact)
                  (and (<= exact res) (<= res (+ exact 1)))))))

(declare-fun fxp_div_int (Int Int) Int)

;; fxp_div_int_def
  (assert
  (forall ((x Int))
  (forall ((y Int))
  (! (ite (= x 0) (= (fxp_div_int x y) 0)
     (ite (and (< 0 x) (< 0 y)) (pos_div_relation (fxp_div_int x y) x y)
     (ite (and (< x 0) (< y 0)) (pos_div_relation (fxp_div_int x y) (- x)
     (- y))
     (ite (and (< x 0) (< 0 y)) (pos_div_relation (- (fxp_div_int x y)) (- x)
     y)
     (=> (and (< 0 x) (< y 0)) (pos_div_relation (- (fxp_div_int x y)) x
     (- y))))))) :pattern ((fxp_div_int x y)) ))))

(declare-fun to_int1 (Int) Int)

;; to_int_def
  (assert
  (forall ((x Int))
  (! (ite (= x 0) (= (to_int1 x) 0)
     (ite (< 0 x) (pos_div_relation (to_int1 x) (* x 1) 1000000000)
     (pos_div_relation (- (to_int1 x)) (* (- x) 1) 1000000000))) :pattern (
  (to_int1 x)) )))

(declare-fun of_int (Int) Int)

;; of_int_def
  (assert
  (forall ((x Int))
  (! (ite (= x 0) (= (of_int x) 0)
     (ite (< 0 x) (pos_div_relation (of_int x) (* x 1000000000) 1)
     (pos_div_relation (- (of_int x)) (* (- x) 1000000000) 1))) :pattern (
  (of_int x)) )))

(define-fun dynamic_invariant ((temp___expr_116 Int)
  (temp___is_init_112 Bool) (temp___skip_constant_113 Bool)
  (temp___do_toplevel_114 Bool)
  (temp___do_typ_inv_115 Bool)) Bool (=>
                                     (or (= temp___is_init_112 true)
                                     (<= (- 9223372036854775808) 9223372036854775807))
                                     (in_range1 temp___expr_116)))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-sort us_rep 0)

(declare-fun bool_eq (us_rep us_rep) Bool)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((time__ref 0))
(((time__refqtmk (time__content us_rep)))))
(define-fun time__ref_time__content__projection ((a time__ref)) us_rep 
  (time__content a))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep1 0)

(declare-fun bool_eq1 (us_rep1 us_rep1) Bool)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((time_span__ref 0))
(((time_span__refqtmk (time_span__content us_rep1)))))
(define-fun time_span__ref_time_span__content__projection ((a time_span__ref)) us_rep1 
  (time_span__content a))

(declare-fun ts_fraction (us_rep1) Int)

(declare-fun ts_fraction__function_guard (Int us_rep1) Bool)

(declare-fun to_duration (us_rep1) Int)

(declare-fun to_duration__function_guard (Int us_rep1) Bool)

(declare-fun ts_sc (us_rep1) Int)

(declare-fun ts_sc__function_guard (Int us_rep1) Bool)

;; ts_fraction__def_axiom
  (assert
  (forall ((ts us_rep1))
  (! (and
     (forall ((ts1 us_rep1)) (to_duration__function_guard (to_duration ts1)
     ts1))
     (and (forall ((ts1 us_rep1)) (ts_sc__function_guard (ts_sc ts1) ts1))
     (= (ts_fraction ts) (- (to_duration ts) (of_int (ts_sc ts)))))) :pattern (
  (ts_fraction ts)) )))

(declare-fun result_sc (Int us_rep1) Int)

(declare-fun result_sc__function_guard (Int Int us_rep1) Bool)

(declare-sort seconds_count 0)

(declare-fun seconds_countqtint (seconds_count) Int)

;; seconds_count'axiom
  (assert
  (forall ((i seconds_count))
  (and (<= (- 9223372036854775808) (seconds_countqtint i))
  (<= (seconds_countqtint i) 9223372036854775807))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                     (<= x 9223372036854775807)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq3 (seconds_count seconds_count) Bool)

(declare-const dummy3 seconds_count)

(declare-datatypes ((seconds_count__ref 0))
(((seconds_count__refqtmk (seconds_count__content seconds_count)))))
(define-fun seconds_count__ref_seconds_count__content__projection ((a seconds_count__ref)) seconds_count 
  (seconds_count__content a))

(define-fun dynamic_invariant1 ((temp___expr_303 Int)
  (temp___is_init_299 Bool) (temp___skip_constant_300 Bool)
  (temp___do_toplevel_301 Bool)
  (temp___do_typ_inv_302 Bool)) Bool (=>
                                     (or (= temp___is_init_299 true)
                                     (<= (- 9223372036854775808) 9223372036854775807))
                                     (in_range2 temp___expr_303)))

;; result_sc__def_axiom
  (assert
  (forall ((sc Int))
  (forall ((ts us_rep1))
  (! (=> (dynamic_invariant1 sc true true true true)
     (and (forall ((ts1 us_rep1)) (ts_sc__function_guard (ts_sc ts1) ts1))
     (= (result_sc sc ts) (+ sc (ts_sc ts))))) :pattern ((result_sc sc ts)) ))))

(declare-const fudged Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const sc Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const ts us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort tseconds_countB 0)

(declare-fun tseconds_countBqtint (tseconds_countB) Int)

;; tseconds_countB'axiom
  (assert
  (forall ((i tseconds_countB))
  (and (<= (- 9223372036854775808) (tseconds_countBqtint i))
  (<= (tseconds_countBqtint i) 9223372036854775807))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                     (<= x 9223372036854775807)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (tseconds_countB tseconds_countB) Bool)

(declare-const dummy4 tseconds_countB)

(declare-datatypes ((tseconds_countB__ref 0))
(((tseconds_countB__refqtmk (tseconds_countB__content tseconds_countB)))))
(define-fun tseconds_countB__ref_tseconds_countB__content__projection ((a tseconds_countB__ref)) tseconds_countB 
  (tseconds_countB__content a))

;; to_duration__post_axiom
  (assert
  (forall ((ts1 us_rep1)) (! (in_range1
  (to_duration ts1)) :pattern ((to_duration ts1)) )))

;; ts_sc__def_axiom
  (assert
  (forall ((ts1 us_rep1))
  (! (and
     (forall ((ts2 us_rep1)) (to_duration__function_guard (to_duration ts2)
     ts2)) (= (ts_sc ts1) (to_int1 (to_duration ts1)))) :pattern ((ts_sc ts1)) )))

(assert
;; defqtvc
 ;; File "ada_real_time.ads", line 266, characters 0-0
  (not
  (=> (dynamic_invariant fudged true false true true)
  (=> (dynamic_invariant1 sc true false true true)
  (let ((o (* 3 9223372036)))
  (=> (in_range3 o)
  (let ((o1 (* 3 (- 9223372036))))
  (=> (in_range3 o1)
  (let ((o2 (and (ite (<= o1 sc) true false) (ite (<= sc o) true false))))
  (=> (forall ((o3 us_rep1)) (ts_sc__function_guard (ts_sc o3) o3))
  (=>
  (or (not (= o2 true))
  (let ((o3 ts))
  (let ((o4 sc))
  (let ((temp___426 (result_sc o4 o3)))
  (and
  (and (result_sc__function_guard temp___426 o4 o3)
  (and (dynamic_invariant1 temp___426 true false true true)
  (= temp___426 (+ o4 (ts_sc o3)))))
  (and (in_range3 (+ 9223372036 1)) (in_range3 (- (- 9223372036) 1))))))))
  (=>
  (= (ite (= o2 true)
     (let ((temp___426 (result_sc sc ts)))
     (and (ite (<= (- (- 9223372036) 1) temp___426) true false) (ite (<= temp___426 (+ 9223372036 1))
                                                                true false)))
     false) true)
  (let ((o3 ts))
  (let ((o4 sc))
  (let ((o5 (result_sc o4 o3)))
  (=> (forall ((o6 us_rep1)) (ts_sc__function_guard (ts_sc o6) o6))
  (=>
  (and (result_sc__function_guard o5 o4 o3)
  (and (dynamic_invariant1 o5 true false true true) (= o5 (+ o4 (ts_sc o3)))))
  (=> (< 0 o5)
  (let ((o6 ts))
  (let ((o7 (ts_fraction o6)))
  (=>
  (forall ((o8 us_rep1)) (to_duration__function_guard (to_duration o8) o8))
  (=> (forall ((o8 us_rep1)) (ts_sc__function_guard (ts_sc o8) o8))
  (=>
  (and (ts_fraction__function_guard o7 o6)
  (and (dynamic_invariant o7 true false true true)
  (= o7 (- (to_duration o6) (of_int (ts_sc o6))))))
  (let ((o8 ts))
  (let ((o9 sc))
  (let ((o10 (result_sc o9 o8)))
  (=> (forall ((o11 us_rep1)) (ts_sc__function_guard (ts_sc o11) o11))
  (=>
  (and (result_sc__function_guard o10 o9 o8)
  (and (dynamic_invariant1 o10 true false true true)
  (= o10 (+ o9 (ts_sc o8))))) (in_range3 (- o10 10))))))))))))))))))))))))))))))
(check-sat)
(exit)
