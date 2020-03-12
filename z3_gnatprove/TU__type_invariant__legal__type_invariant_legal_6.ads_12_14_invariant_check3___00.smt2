(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun type_invariant ((temp___157 Int)) Bool (not (= temp___157 0)))

(declare-sort t 0)

(declare-fun tqtint (t) Int)

;; t'axiom
  (assert
  (forall ((i t)) (and (<= 0 (tqtint i)) (<= (tqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (t t) Bool)

(declare-const dummy t)

(declare-datatypes () ((t__ref (t__refqtmk (t__content t)))))
(define-fun t__ref_t__content__projection ((a t__ref)) t (t__content a))

(define-fun dynamic_invariant ((temp___expr_163 Int)
  (temp___is_init_159 Bool) (temp___skip_constant_160 Bool)
  (temp___do_toplevel_161 Bool)
  (temp___do_typ_inv_162 Bool)) Bool (=>
                                     (or (= temp___is_init_159 true)
                                     (<= 0 2147483647)) (in_range
                                     temp___expr_163)))

(declare-const x Int)

;; Assume
  (assert (dynamic_invariant x false false true true))

(declare-const x1 Int)

;; H
  (assert (dynamic_invariant x1 true true true true))

;; H
  (assert (type_invariant x1))

;; Ensures
  (assert (type_invariant x1))

(declare-const x2 Int)

;; H
  (assert (dynamic_invariant x2 true true true true))

;; H
  (assert (type_invariant x2))

(declare-const x3 Int)

;; H
  (assert (= x3 0))

;; Ensures
  (assert (type_invariant x3))

(declare-const x4 Int)

;; H
  (assert (dynamic_invariant x4 true true true true))

;; H
  (assert (type_invariant x4))

(assert
;; defqtvc
 ;; File "type_invariant_legal_6.ads", line 12, characters 0-0
  (not (type_invariant x4)))
(check-sat)
