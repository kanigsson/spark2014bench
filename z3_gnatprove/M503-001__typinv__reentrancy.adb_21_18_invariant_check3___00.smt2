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

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun type_invariant ((temp___156 Int)) Bool (not (= temp___156 0)))

(declare-sort t 0)

(declare-fun tqtint (t) Int)

;; t'axiom
  (assert
  (forall ((i t))
  (and (<= (- 2147483648) (tqtint i)) (<= (tqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (t t) Bool)

(declare-const dummy t)

(declare-datatypes () ((t__ref (t__refqtmk (t__content t)))))
(define-fun t__ref_t__content__projection ((a t__ref)) t (t__content a))

(define-fun dynamic_invariant ((temp___expr_162 Int)
  (temp___is_init_158 Bool) (temp___skip_constant_159 Bool)
  (temp___do_toplevel_160 Bool)
  (temp___do_typ_inv_161 Bool)) Bool (=>
                                     (or (= temp___is_init_158 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range1 temp___expr_162)))

(declare-sort ttB 0)

(declare-fun ttBqtint (ttB) Int)

;; ttB'axiom
  (assert
  (forall ((i ttB))
  (and (<= (- 2147483648) (ttBqtint i)) (<= (ttBqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (ttB ttB) Bool)

(declare-const dummy1 ttB)

(declare-datatypes () ((ttB__ref (ttB__refqtmk (ttB__content ttB)))))
(define-fun ttB__ref_ttB__content__projection ((a ttB__ref)) ttB (ttB__content
                                                                 a))

(declare-const x Int)

(declare-const start Bool)

;; Assume
  (assert (dynamic_invariant x true false true true))

;; Assume
  (assert (type_invariant x))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch start))

;; H
  (assert (= spark__branch true))

(assert
;; defqtvc
 ;; File "reentrancy.ads", line 7, characters 0-0
  (not (type_invariant x)))
(check-sat)
