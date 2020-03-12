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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const m Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const n Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const q Int)

(declare-const r Int)

;; Assume
  (assert (dynamic_invariant m true false true true))

;; Assume
  (assert (dynamic_invariant n true false true true))

;; Assume
  (assert (dynamic_invariant q false false true true))

;; Assume
  (assert (dynamic_invariant r false false true true))

;; Assume
  (assert (and (<= 0 m) (< 0 n)))

(declare-const q1 Int)

;; H
  (assert (= q1 0))

(declare-const r1 Int)

;; H
  (assert (= r1 m))

(declare-const q2 Int)

(declare-const r2 Int)

;; H
  (assert
  (ite (<= n r1)
  (let ((o (- m r1)))
  (and (in_range1 o)
  (and
  (or (not (<= q1 o))
  (let ((o1 (* q1 n))) (and (in_range1 o1) (in_range1 (+ o1 r1)))))
  (exists ((q3 Int) (r3 Int))
  (and (and (and (<= q3 (- m r3)) (= m (+ (* q3 n) r3))) (<= 0 r3))
  (and
  (= (and (ite (and (dynamic_invariant q3 false true true true)
               (dynamic_invariant r3 false true true true))
          true false) (ite (<= n r3) true false)) true)
  (let ((o1 (+ q3 1)))
  (and (in_range1 o1)
  (and (= q2 o1)
  (let ((o2 (- r3 n))) (and (in_range1 o2) (and (= r2 o2) (not (<= n r2))))))))))))))
  (and (= q2 q1) (= r2 r1))))

(define-fun o () Int (* q2 n))

;; Ensures
  (assert (in_range1 o))

(assert
;; defqtvc
 ;; File "divide.ads", line 2, characters 0-0
  (not (in_range1 (+ o r2))))
(check-sat)
