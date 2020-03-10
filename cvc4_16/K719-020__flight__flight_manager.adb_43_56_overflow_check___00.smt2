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

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-const position_x Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const position_y Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const target_x Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const target_y Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__flight_manager__engine_values__x_speed integer)(rec__flight_manager__engine_values__y_speed integer)))))
(define-fun us_split_fields_rec__flight_manager__engine_values__x_speed__projection ((a us_split_fields)) integer 
  (rec__flight_manager__engine_values__x_speed a))

(define-fun us_split_fields_rec__flight_manager__engine_values__y_speed__projection ((a us_split_fields)) integer 
  (rec__flight_manager__engine_values__y_speed a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__flight_manager__engine_values__x_speed
                           (us_split_fields1 a))) (to_rep
                                                  (rec__flight_manager__engine_values__x_speed
                                                  (us_split_fields1 b))))
                        (= (to_rep
                           (rec__flight_manager__engine_values__y_speed
                           (us_split_fields1 a))) (to_rep
                                                  (rec__flight_manager__engine_values__y_speed
                                                  (us_split_fields1 b)))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const flight_manager__engine_values__x_speed__first__bit Int)

(declare-const flight_manager__engine_values__x_speed__last__bit Int)

(declare-const flight_manager__engine_values__x_speed__position Int)

;; flight_manager__engine_values__x_speed__first__bit_axiom
  (assert (<= 0 flight_manager__engine_values__x_speed__first__bit))

;; flight_manager__engine_values__x_speed__last__bit_axiom
  (assert
  (< flight_manager__engine_values__x_speed__first__bit flight_manager__engine_values__x_speed__last__bit))

;; flight_manager__engine_values__x_speed__position_axiom
  (assert (<= 0 flight_manager__engine_values__x_speed__position))

(declare-const flight_manager__engine_values__y_speed__first__bit Int)

(declare-const flight_manager__engine_values__y_speed__last__bit Int)

(declare-const flight_manager__engine_values__y_speed__position Int)

;; flight_manager__engine_values__y_speed__first__bit_axiom
  (assert (<= 0 flight_manager__engine_values__y_speed__first__bit))

;; flight_manager__engine_values__y_speed__last__bit_axiom
  (assert
  (< flight_manager__engine_values__y_speed__first__bit flight_manager__engine_values__y_speed__last__bit))

;; flight_manager__engine_values__y_speed__position_axiom
  (assert (<= 0 flight_manager__engine_values__y_speed__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((engine_values__ref 0))
(((engine_values__refqtmk (engine_values__content us_rep)))))
(define-fun engine_values__ref_engine_values__content__projection ((a engine_values__ref)) us_rep 
  (engine_values__content a))

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-fun my_abs (Int) Int)

(declare-fun my_abs__function_guard (Int Int) Bool)

;; my_abs__post_axiom
  (assert
  (forall ((i Int))
  (! (=> (dynamic_invariant i true true true true)
     (let ((result (my_abs i)))
     (=> (my_abs__function_guard result i) (dynamic_invariant result true
     false true true)))) :pattern ((my_abs i)) )))

(declare-const c4b Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const c7b Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

;; c4b__def_axiom
  (assert
  (and (my_abs__function_guard (my_abs (- position_x target_x))
  (- position_x target_x)) (= c4b (my_abs (- position_x target_x)))))

;; c7b__def_axiom
  (assert
  (and (my_abs__function_guard (my_abs (- position_y target_y))
  (- position_y target_y)) (= c7b (my_abs (- position_y target_y)))))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) (- 100)))

(declare-const rliteral1 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral1) 100))

(assert
;; defqtvc
 ;; File "flight_manager.ads", line 7, characters 0-0
  (not
  (forall ((result____split_fields us_split_fields) (spark__branch Bool)
  (result____split_fields1 us_split_fields) (spark__branch1 Bool)
  (result____split_fields2 us_split_fields))
  (=> (dynamic_invariant position_x true false true true)
  (=> (dynamic_invariant position_y true false true true)
  (=> (dynamic_invariant target_x true false true true)
  (=> (dynamic_invariant target_y true false true true)
  (=>
  (exists ((spark__branch2 Bool))
  (and (= spark__branch2 (ite (< target_x position_x) true false))
  (ite (= spark__branch2 true)
  (and
  (= result____split_fields1 (us_split_fieldsqtmk rliteral
                             (rec__flight_manager__engine_values__y_speed
                             result____split_fields)))
  (= spark__branch spark__branch2))
  (and (= spark__branch (ite (< position_x target_x) true false))
  (ite (= spark__branch true)
  (= result____split_fields1 (us_split_fieldsqtmk rliteral1
                             (rec__flight_manager__engine_values__y_speed
                             result____split_fields)))
  (= result____split_fields1 result____split_fields))))))
  (=>
  (exists ((spark__branch2 Bool))
  (and (= spark__branch2 (ite (< target_y position_y) true false))
  (ite (= spark__branch2 true)
  (and
  (= result____split_fields2 (us_split_fieldsqtmk
                             (rec__flight_manager__engine_values__x_speed
                             result____split_fields1) rliteral))
  (= spark__branch1 spark__branch2))
  (and (= spark__branch1 (ite (< position_y target_y) true false))
  (ite (= spark__branch1 true)
  (= result____split_fields2 (us_split_fieldsqtmk
                             (rec__flight_manager__engine_values__x_speed
                             result____split_fields1) rliteral1))
  (= result____split_fields2 result____split_fields1))))))
  (let ((o (- position_x target_x)))
  (=> (in_range1 o)
  (let ((flight_manager__set_engine_speed__C4b__assume (my_abs o)))
  (=>
  (and (my_abs__function_guard flight_manager__set_engine_speed__C4b__assume
  o) (dynamic_invariant flight_manager__set_engine_speed__C4b__assume true
  false true true))
  (=> (= flight_manager__set_engine_speed__C4b__assume c4b)
  (=> (dynamic_invariant c4b true false true true)
  (forall ((spark__branch2 Bool) (result____split_fields3 us_split_fields))
  (=>
  (and (= spark__branch2 (ite (< c4b 10) true false))
  (ite (= spark__branch2 true)
  (exists ((o1 Int))
  (and
  (= (to_rep
     (rec__flight_manager__engine_values__x_speed result____split_fields2)) o1)
  (let ((o2 (* o1 c4b)))
  (and (in_range1 o2)
  (exists ((o3 integer))
  (and (= (to_rep o3) (div1 o2 10))
  (= result____split_fields3 (us_split_fieldsqtmk o3
                             (rec__flight_manager__engine_values__y_speed
                             result____split_fields2)))))))))
  (= result____split_fields3 result____split_fields2))) (in_range1
  (- position_y target_y)))))))))))))))))))
(check-sat)
(exit)
