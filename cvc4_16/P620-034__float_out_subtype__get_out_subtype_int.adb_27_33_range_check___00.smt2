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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

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
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const y Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const z Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-sort t_rate 0)

(declare-fun t_rateqtint (t_rate) Int)

;; t_rate'axiom
  (assert
  (forall ((i t_rate))
  (and (<= (- 3000) (t_rateqtint i)) (<= (t_rateqtint i) 3000))))

(define-fun in_range1 ((x1 Int)) Bool (and (<= (- 3000) x1) (<= x1 3000)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (t_rate t_rate) Bool)

(declare-const dummy1 t_rate)

(declare-datatypes ((t_rate__ref 0))
(((t_rate__refqtmk (t_rate__content t_rate)))))
(define-fun t_rate__ref_t_rate__content__projection ((a t_rate__ref)) t_rate 
  (t_rate__content a))

(define-fun dynamic_invariant1 ((temp___expr_158 Int)
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool)
  (temp___do_typ_inv_157 Bool)) Bool (=>
                                     (or (= temp___is_init_154 true)
                                     (<= (- 3000) 3000)) (in_range1
                                     temp___expr_158)))

(define-fun to_rep ((x1 t_rate)) Int (t_rateqtint x1))

(declare-fun of_rep (Int) t_rate)

;; inversion_axiom
  (assert
  (forall ((x1 t_rate))
  (! (= (of_rep (to_rep x1)) x1) :pattern ((to_rep x1)) )))

;; range_axiom
  (assert
  (forall ((x1 t_rate)) (! (in_range1 (to_rep x1)) :pattern ((to_rep x1)) )))

;; coerce_axiom
  (assert
  (forall ((x1 Int))
  (! (=> (in_range1 x1) (= (to_rep (of_rep x1)) x1)) :pattern ((to_rep
                                                               (of_rep x1))) )))

(assert
;; defqtvc
 ;; File "get_out_subtype_int.adb", line 2, characters 0-0
  (not
  (forall ((roll_rate_desired Int) (pitch_rate_desired Int)
  (yaw_rate_desired Int)
  (get_out_subtype_int__controller_get_desired_rate__yaw_rate_desired Int)
  (get_out_subtype_int__controller_get_desired_rate__pitch_rate_desired Int)
  (get_out_subtype_int__controller_get_desired_rate__roll_rate_desired Int))
  (=> (dynamic_invariant x true false true true)
  (=> (dynamic_invariant y true false true true)
  (=> (dynamic_invariant z true false true true)
  (=> (= roll_rate_desired 0)
  (=> (dynamic_invariant1 roll_rate_desired true false true true)
  (=> (= pitch_rate_desired 0)
  (=> (dynamic_invariant1 pitch_rate_desired true false true true)
  (=> (= yaw_rate_desired 0)
  (=> (dynamic_invariant1 yaw_rate_desired true false true true)
  (=> (in_range pitch_rate_desired)
  (=> (in_range pitch_rate_desired)
  (=> (dynamic_invariant
  get_out_subtype_int__controller_get_desired_rate__roll_rate_desired true
  true true true)
  (=> (dynamic_invariant
  get_out_subtype_int__controller_get_desired_rate__pitch_rate_desired true
  true true true)
  (=> (dynamic_invariant
  get_out_subtype_int__controller_get_desired_rate__yaw_rate_desired true
  true true true) (in_range1
  get_out_subtype_int__controller_get_desired_rate__roll_rate_desired))))))))))))))))))
(check-sat)
(exit)
