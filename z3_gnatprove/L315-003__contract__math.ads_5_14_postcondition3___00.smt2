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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

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

;; Assume
  (assert (dynamic_invariant x true false true true))

;; Assume
  (assert (<= 0 x))

(define-fun usf () Bool (> x 0))

(define-fun usf1 () Bool (= x 0))

(declare-const res Int)

;; H
  (assert (= res 0))

;; Assume
  (assert (dynamic_invariant res true false true true))

(declare-const res1 Int)

;; H
  (assert (in_range1 (+ res 1)))

;; H
  (assert (in_range1 (+ res 1)))

;; H
  (assert (in_range1 (* (+ res 1) (+ res 1))))

;; H
  (assert
  (ite (<= (* (+ res 1) (+ res 1)) x)
  (exists ((res2 Int))
  (and
  (= (and (ite (dynamic_invariant res2 true true true true) true false) 
  (ite (<= (* (+ res2 1) (+ res2 1)) x) true false)) true)
  (let ((o (+ res2 1)))
  (and (in_range1 o)
  (and (= res1 o)
  (let ((o1 (+ res1 1)))
  (and (in_range1 o1)
  (let ((o2 (+ res1 1)))
  (and (in_range1 o2)
  (let ((o3 (* o2 o1))) (and (in_range1 o3) (not (<= o3 x)))))))))))))
  (= res1 res)))

(declare-const math__sqrt__result Int)

;; H
  (assert (= math__sqrt__result res1))

;; Assert
  (assert (=> (= usf1 true) (= math__sqrt__result 0)))

;; Assert
  (assert (=> (= usf true) (< 0 math__sqrt__result)))

(assert
;; defqtvc
 ;; File "math.ads", line 3, characters 0-0
  (not (<= 0 math__sqrt__result)))
(check-sat)
