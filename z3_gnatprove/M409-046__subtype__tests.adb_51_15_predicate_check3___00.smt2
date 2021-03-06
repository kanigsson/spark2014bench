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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (positive positive) Bool)

(declare-const dummy positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

(declare-const i7s Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort positive_not_one 0)

(declare-fun positive_not_oneqtint (positive_not_one) Int)

;; positive_not_one'axiom
  (assert
  (forall ((i positive_not_one))
  (and (<= 1 (positive_not_oneqtint i))
  (<= (positive_not_oneqtint i) 2147483647))))

(define-fun in_range2 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (positive_not_one positive_not_one) Bool)

(declare-const dummy1 positive_not_one)

(declare-datatypes ()
((positive_not_one__ref
 (positive_not_one__refqtmk (positive_not_one__content positive_not_one)))))
(define-fun positive_not_one__ref_positive_not_one__content__projection ((a positive_not_one__ref)) positive_not_one 
  (positive_not_one__content a))

(define-fun dynamic_invariant1 ((temp___expr_199 Int)
  (temp___is_init_195 Bool) (temp___skip_constant_196 Bool)
  (temp___do_toplevel_197 Bool)
  (temp___do_typ_inv_198 Bool)) Bool (and
                                     (=>
                                     (or (= temp___is_init_195 true)
                                     (<= 1 2147483647)) (in_range2
                                     temp___expr_199))
                                     (=> (= temp___do_toplevel_197 true)
                                     (=> (= temp___is_init_195 true)
                                     (and (<= 2 temp___expr_199)
                                     (<= temp___expr_199 2147483647))))))

(define-fun dynamic_predicate ((temp___203 Int)) Bool (and (<= 2 temp___203)
                                                      (<= temp___203 2147483647)))

(declare-const v Int)

;; Assume
  (assert (dynamic_invariant1 i7s true false true true))

;; Assume
  (assert (dynamic_invariant1 i7s true false true true))

;; Assume
  (assert (dynamic_invariant1 v true false true true))

;; Assume
  (assert (dynamic_invariant x true false true true))

(declare-const spark__branch Bool)

;; H
  (assert
  (= spark__branch (and (ite (in_range2 x) true false) (ite (let ((temp___224 
                                                            x))
                                                            (and
                                                            (<= 2 temp___224)
                                                            (<= temp___224 2147483647)))
                                                       true false))))

;; H
  (assert (= spark__branch true))

(define-fun temp___223 () Int x)

(assert
;; defqtvc
 ;; File "tests.adb", line 48, characters 0-0
  (not (<= 2 temp___223)))
(check-sat)

(exit)
