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

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort en 0)

(define-fun in_range2 ((x1 Int)) Bool (and (<= 0 x1) (<= x1 4)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (en en) Bool)

(declare-const dummy1 en)

(declare-datatypes () ((en__ref (en__refqtmk (en__content en)))))
(define-fun en__ref_en__content__projection ((a en__ref)) en (en__content a))

(define-fun dynamic_invariant1 ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= 0 4)) (in_range2 temp___expr_160)))

(declare-const res Int)

;; Assume
  (assert (dynamic_invariant1 x true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant res false false true true))

(declare-const res1 Int)

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite (= x 0) true false)))

(declare-const spark__branch1 Bool)

(declare-const spark__branch2 Bool)

;; H
  (assert
  (ite (= spark__branch true) (= res1 0)
  (and (= spark__branch1 (ite (= x 1) true false))
  (ite (= spark__branch1 true) (= res1 1)
  (and
  (= spark__branch2 (and (ite (<= 2 x) true false) (ite (<= x 3) true false)))
  (ite (= spark__branch2 true) (= res1 2) (= res1 3)))))))

(declare-const casing__f__result Int)

;; H
  (assert (= casing__f__result res1))

(assert
;; defqtvc
 ;; File "casing.ads", line 4, characters 0-0
  (not
  (= casing__f__result (ite (= x 0) 0
                       (ite (= x 1) 1 (ite (or (= x 2) (= x 3)) 2 3))))))
(check-sat)
