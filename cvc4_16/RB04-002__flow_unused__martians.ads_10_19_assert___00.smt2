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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-fun is_martian (Int) Bool)

(declare-fun is_martian__function_guard (Bool Int) Bool)

(declare-sort living 0)

(declare-fun livingqtint (living) Int)

;; living'axiom
  (assert
  (forall ((i living))
  (and (<= (- 2147483648) (livingqtint i)) (<= (livingqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (living living) Bool)

(declare-const dummy living)

(declare-datatypes ((living__ref 0))
(((living__refqtmk (living__content living)))))
(define-fun living__ref_living__content__projection ((a living__ref)) living 
  (living__content a))

(define-fun dynamic_invariant ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range1 temp___expr_160)))

;; is_martian__post_axiom
  (assert true)

;; is_martian__def_axiom
  (assert
  (forall ((unused Int))
  (! (not (= (is_martian unused) true)) :pattern ((is_martian unused)) )))

(declare-fun is_green (Int) Bool)

(declare-fun is_green__function_guard (Bool Int) Bool)

;; is_green__post_axiom
  (assert true)

;; is_green__def_axiom
  (assert
  (forall ((unused Int))
  (! (= (is_green unused) true) :pattern ((is_green unused)) )))

(assert
;; defqtvc
 ;; File "martians.ads", line 1, characters 0-0
  (not
  (forall ((m Int))
  (=> (forall ((m1 Int)) (is_martian__function_guard (is_martian m1) m1))
  (=> (forall ((m1 Int)) (is_green__function_guard (is_green m1) m1))
  (=>
  (forall ((m1 Int))
  (=> (and (<= (- 2147483648) m1) (<= m1 2147483647))
  (=> (= (is_martian m1) true) (= (is_green m1) true))))
  (=> (<= (- 2147483648) m)
  (=> (<= m 2147483647)
  (=> (forall ((m1 Int)) (is_martian__function_guard (is_martian m1) m1))
  (=> (= (is_martian m) true)
  (=> (forall ((m1 Int)) (is_green__function_guard (is_green m1) m1))
  (not (= (is_green m) true)))))))))))))
(check-sat)
(exit)
