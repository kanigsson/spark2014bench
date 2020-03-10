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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

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

(declare-datatypes ((time_span__ref 0))
(((time_span__refqtmk (time_span__content us_rep)))))
(define-fun time_span__ref_time_span__content__projection ((a time_span__ref)) us_rep 
  (time_span__content a))

(declare-const time_span_first us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const time_span_last us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const time_span_zero us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun olt (us_rep us_rep) Bool)

(declare-fun olt__function_guard (Bool us_rep us_rep) Bool)

;; olt__post_axiom
  (assert true)

(declare-fun to_duration (us_rep) Int)

(declare-fun to_duration__function_guard (Int us_rep) Bool)

(declare-sort duration 0)

(define-fun in_range2 ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                     (<= x 9223372036854775807)))

(declare-const dummy2 duration)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (duration duration) Bool)

(declare-datatypes ((duration__ref 0))
(((duration__refqtmk (duration__content duration)))))
(define-fun duration__ref_duration__content__projection ((a duration__ref)) duration 
  (duration__content a))

(define-fun dynamic_invariant1 ((temp___expr_116 Int)
  (temp___is_init_112 Bool) (temp___skip_constant_113 Bool)
  (temp___do_toplevel_114 Bool)
  (temp___do_typ_inv_115 Bool)) Bool (=>
                                     (or (= temp___is_init_112 true)
                                     (<= (- 9223372036854775808) 9223372036854775807))
                                     (in_range2 temp___expr_116)))

;; to_duration__post_axiom
  (assert
  (forall ((ts us_rep)) (! (in_range2
  (to_duration ts)) :pattern ((to_duration ts)) )))

(declare-fun ogt (us_rep us_rep) Bool)

(declare-fun ogt__function_guard (Bool us_rep us_rep) Bool)

;; ogt__post_axiom
  (assert true)

(declare-fun osubtract (us_rep) us_rep)

(declare-fun osubtract__function_guard (us_rep us_rep) Bool)

(declare-const left us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const right Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-fun oge (us_rep us_rep) Bool)

(declare-fun oge__function_guard (Bool us_rep us_rep) Bool)

;; oge__post_axiom
  (assert true)

(declare-sort tduration_repB 0)

(declare-fun tduration_repBqtint (tduration_repB) Int)

;; tduration_repB'axiom
  (assert
  (forall ((i tduration_repB))
  (and (<= (- 9223372036854775808) (tduration_repBqtint i))
  (<= (tduration_repBqtint i) 9223372036854775807))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                     (<= x 9223372036854775807)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (tduration_repB tduration_repB) Bool)

(declare-const dummy3 tduration_repB)

(declare-datatypes ((tduration_repB__ref 0))
(((tduration_repB__refqtmk (tduration_repB__content tduration_repB)))))
(define-fun tduration_repB__ref_tduration_repB__content__projection ((a tduration_repB__ref)) tduration_repB 
  (tduration_repB__content a))

(declare-sort duration_rep 0)

(declare-fun duration_repqtint (duration_rep) Int)

;; duration_rep'axiom
  (assert
  (forall ((i duration_rep))
  (and (<= (- 9223372036854775808) (duration_repqtint i))
  (<= (duration_repqtint i) 9223372036854775807))))

(define-fun in_range4 ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                     (<= x 9223372036854775807)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (duration_rep duration_rep) Bool)

(declare-const dummy4 duration_rep)

(declare-datatypes ((duration_rep__ref 0))
(((duration_rep__refqtmk (duration_rep__content duration_rep)))))
(define-fun duration_rep__ref_duration_rep__content__projection ((a duration_rep__ref)) duration_rep 
  (duration_rep__content a))

(define-fun pos_div_relation ((res Int) (num Int)
  (den Int)) Bool (let ((exact (div1 num den)))
                  (ite (= num 0) (= res 0)
                  (ite (= num (* exact den)) (= res exact)
                  (and (<= exact res) (<= res (+ exact 1)))))))

(declare-fun fxp_mult (Int Int) Int)

;; fxp_mult_def
  (assert
  (forall ((x Int))
  (forall ((y Int))
  (! (ite (or (= x 0) (= y 0)) (= (fxp_mult x y) 0)
     (ite (or (and (< 0 x) (< 0 y)) (and (< x 0) (< y 0))) (pos_div_relation
     (fxp_mult x y) (* (* (* (* x y) 1) 1) 1)
     (* (* 1000000000 1000000000) 1)) (pos_div_relation (- (fxp_mult x y))
     (- (* (* (* (* x y) 1) 1) 1)) (* (* 1000000000 1000000000) 1)))) :pattern (
  (fxp_mult x y)) ))))

(declare-fun fxp_div (Int Int) Int)

;; fxp_div_def
  (assert
  (forall ((x Int))
  (forall ((y Int))
  (! (ite (= x 0) (= (fxp_div x y) 0)
     (ite (and (< 0 x) (< 0 y)) (pos_div_relation (fxp_div x y)
     (* (* (* x 1) 1000000000) 1) (* (* (* y 1000000000) 1) 1))
     (ite (and (< x 0) (< y 0)) (pos_div_relation (fxp_div x y)
     (* (* (* (- x) 1) 1000000000) 1) (* (* (* (- y) 1000000000) 1) 1))
     (ite (and (< x 0) (< 0 y)) (pos_div_relation (- (fxp_div x y))
     (* (* (* (- x) 1) 1000000000) 1) (* (* (* y 1000000000) 1) 1))
     (=> (and (< 0 x) (< y 0)) (pos_div_relation (- (fxp_div x y))
     (* (* (* x 1) 1000000000) 1) (* (* (* (- y) 1000000000) 1) 1))))))) :pattern (
  (fxp_div x y)) ))))

(define-fun dynamic_invariant2 ((temp___expr_190 Int)
  (temp___is_init_186 Bool) (temp___skip_constant_187 Bool)
  (temp___do_toplevel_188 Bool)
  (temp___do_typ_inv_189 Bool)) Bool (=>
                                     (or (= temp___is_init_186 true)
                                     (<= (- 9223372036854775808) 9223372036854775807))
                                     (in_range4 temp___expr_190)))

(assert
;; defqtvc
 ;; File "ada_real_time.ads", line 127, characters 0-0
  (not
  (=> (dynamic_invariant right true false true true)
  (=> (< 0 right)
  (let ((o time_span_zero))
  (let ((o1 left))
  (let ((o2 (ogt o1 o)))
  (=> (ogt__function_guard o2 o1 o)
  (=> (not (= o2 true))
  (let ((o3 time_span_zero))
  (let ((o4 left))
  (let ((o5 (olt o4 o3)))
  (=> (olt__function_guard o5 o4 o3)
  (=> (= o5 true)
  (let ((o6 time_span_first))
  (let ((o7 (to_duration o6)))
  (=>
  (and (to_duration__function_guard o7 o6) (dynamic_invariant1 o7 true false
  true true)) (in_range3 (fxp_div o7 1)))))))))))))))))))
(check-sat)
(exit)
