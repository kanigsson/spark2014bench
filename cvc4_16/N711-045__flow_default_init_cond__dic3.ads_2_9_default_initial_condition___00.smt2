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

(declare-fun to_int1 (Int) Int)

(declare-fun to_int__function_guard (Int Int) Bool)

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

(declare-sort root_t 0)

(declare-fun root_tqtint (root_t) Int)

;; root_t'axiom
  (assert
  (forall ((i root_t))
  (and (<= (- 2147483648) (root_tqtint i)) (<= (root_tqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (root_t root_t) Bool)

(declare-const dummy1 root_t)

(declare-datatypes ((root_t__ref 0))
(((root_t__refqtmk (root_t__content root_t)))))
(define-fun root_t__ref_root_t__content__projection ((a root_t__ref)) root_t 
  (root_t__content a))

(define-fun dynamic_invariant1 ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range1 temp___expr_160)))

;; temp___result_164'def
  (assert
  (forall ((temp___163 Int)) (to_int__function_guard (to_int1 temp___163)
  temp___163)))

(define-fun default_initial_assumption ((temp___expr_161 Int)
  (temp___skip_top_level_162 Bool)) Bool (and (= temp___expr_161 5)
                                         (=>
                                         (not
                                         (= temp___skip_top_level_162 true))
                                         (= (to_int1 temp___expr_161) 5))))

;; to_int__post_axiom
  (assert
  (forall ((r Int))
  (! (=> (dynamic_invariant1 r true true true true)
     (let ((result (to_int1 r)))
     (=> (to_int__function_guard result r) (dynamic_invariant result true
     false true true)))) :pattern ((to_int1 r)) )))

;; to_int__def_axiom
  (assert
  (forall ((r Int))
  (! (=> (dynamic_invariant1 r true true true true) (= (to_int1 r) r)) :pattern (
  (to_int1 r)) )))

(assert
;; defqtvc
 ;; File "/home/kanig/dev/spark2014/benchmark_script/data/tmp-test-N711-045__flow_default_init_cond-3906/src/gnatprove/dic3__root_t.mlw", line 201, characters 5-8
  (not
  (forall ((usf Int))
  (=> (dynamic_invariant1 usf true false true true)
  (=> (= usf 5)
  (=> (forall ((usf1 Int)) (to_int__function_guard (to_int1 usf1) usf1))
  (=> (forall ((usf1 Int)) (to_int__function_guard (to_int1 usf1) usf1))
  (= (to_int1 usf) 5))))))))
(check-sat)
(exit)
