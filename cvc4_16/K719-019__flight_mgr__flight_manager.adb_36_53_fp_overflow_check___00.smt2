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
(define-fun fp.isFinite32 ((x Float32)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral32 ((x Float32)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
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

(declare-fun pow2 (Int) Int)

(define-fun is_plus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float32)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float32)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

(declare-const max_int Int)

(define-fun in_int_range ((i Int)) Bool (and (<= (- max_int) i)
                                        (<= i max_int)))

(define-fun in_safe_int_range ((i Int)) Bool (and (<= (- 16777216) i)
                                             (<= i 16777216)))

(define-fun same_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isPositive y))
                    (and (fp.isNegative x) (fp.isNegative y))))

(define-fun diff_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isNegative y))
                    (and (fp.isNegative x) (fp.isPositive y))))

(define-fun product_sign ((z Float32) (x Float32)
  (y Float32)) Bool (and (=> (same_sign x y) (fp.isPositive z))
                    (=> (diff_sign x y) (fp.isNegative z))))

(define-fun sqr ((x Real)) Real (* x x))

(declare-fun sqrt1 (Real) Real)

(define-fun same_sign_real ((x Float32)
  (r Real)) Bool (or (and (fp.isPositive x) (< 0.0 r))
                 (and (fp.isNegative x) (< r 0.0))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content Float32)))))
(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort float__ 0)

(declare-fun user_eq (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float32)

(declare-const dummy float__)

(declare-datatypes ((float____ref 0))
(((float____refqtmk (float____content float__)))))
(define-fun float____ref_float____content__projection ((a float____ref)) float__ 
  (float____content a))

(define-fun dynamic_invariant ((temp___expr_60 Float32)
  (temp___is_init_56 Bool) (temp___skip_constant_57 Bool)
  (temp___do_toplevel_58 Bool)
  (temp___do_typ_inv_59 Bool)) Bool (=>
                                    (or (= temp___is_init_56 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                    (fp.isFinite32 temp___expr_60)))

(declare-fun to_rep (float__) Float32)

(declare-fun of_rep (Float32) float__)

;; inversion_axiom
  (assert
  (forall ((x float__)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x float__))
  (! (fp.isFinite32 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Float32))
  (! (=> (fp.isFinite32 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                                (of_rep x))) )))

(declare-const position_x Float32)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const position_y Float32)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const target_x Float32)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const target_y Float32)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__flight_manager__engine_values__x_speed float__)(rec__flight_manager__engine_values__y_speed float__)))))
(define-fun us_split_fields_rec__flight_manager__engine_values__x_speed__projection ((a us_split_fields)) float__ 
  (rec__flight_manager__engine_values__x_speed a))

(define-fun us_split_fields_rec__flight_manager__engine_values__y_speed__projection ((a us_split_fields)) float__ 
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
                        (fp.eq (to_rep
                               (rec__flight_manager__engine_values__x_speed
                               (us_split_fields1 a))) (to_rep
                                                      (rec__flight_manager__engine_values__x_speed
                                                      (us_split_fields1 b))))
                        (fp.eq (to_rep
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

(assert
;; defqtvc
 ;; File "flight_manager.ads", line 7, characters 0-0
  (not
  (forall ((result____split_fields us_split_fields) (spark__branch Bool)
  (result____split_fields1 us_split_fields)
  (result____split_fields2 us_split_fields))
  (=> (dynamic_invariant position_x true false true true)
  (=> (dynamic_invariant position_y true false true true)
  (=> (dynamic_invariant target_x true false true true)
  (=> (dynamic_invariant target_y true false true true)
  (=>
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (ite (fp.lt target_x position_x) true false))
  (ite (= spark__branch1 true)
  (and
  (exists ((o float__))
  (and (= (to_rep o) (fp.neg (fp #b0 #b10000101 #b10010000000000000000000)))
  (= result____split_fields1 (us_split_fieldsqtmk o
                             (rec__flight_manager__engine_values__y_speed
                             result____split_fields)))))
  (= spark__branch spark__branch1))
  (and (= spark__branch (ite (fp.lt position_x target_x) true false))
  (ite (= spark__branch true)
  (exists ((o float__))
  (and (= (to_rep o) (fp #b0 #b10000101 #b10010000000000000000000))
  (= result____split_fields1 (us_split_fieldsqtmk o
                             (rec__flight_manager__engine_values__y_speed
                             result____split_fields)))))
  (= result____split_fields1 result____split_fields))))))
  (=>
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (ite (fp.lt target_y position_y) true false))
  (ite (= spark__branch1 true)
  (exists ((o float__))
  (and (= (to_rep o) (fp.neg (fp #b0 #b10000101 #b10010000000000000000000)))
  (= result____split_fields2 (us_split_fieldsqtmk
                             (rec__flight_manager__engine_values__x_speed
                             result____split_fields1) o))))
  (exists ((spark__branch2 Bool))
  (and (= spark__branch2 (ite (fp.lt position_y target_y) true false))
  (ite (= spark__branch2 true)
  (exists ((o float__))
  (and (= (to_rep o) (fp #b0 #b10000101 #b10010000000000000000000))
  (= result____split_fields2 (us_split_fieldsqtmk
                             (rec__flight_manager__engine_values__x_speed
                             result____split_fields1) o))))
  (= result____split_fields2 result____split_fields1)))))))
  (fp.isFinite32 (fp.sub RNE position_x target_x)))))))))))
(check-sat)
(exit)
