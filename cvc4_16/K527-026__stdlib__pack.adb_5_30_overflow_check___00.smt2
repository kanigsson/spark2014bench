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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const c Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort tcountB 0)

(declare-fun tcountBqtint (tcountB) Int)

;; tcountB'axiom
  (assert
  (forall ((i tcountB))
  (and (<= (- 2147483648) (tcountBqtint i)) (<= (tcountBqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (tcountB tcountB) Bool)

(declare-const dummy tcountB)

(declare-datatypes ((tcountB__ref 0))
(((tcountB__refqtmk (tcountB__content tcountB)))))
(define-fun tcountB__ref_tcountB__content__projection ((a tcountB__ref)) tcountB 
  (tcountB__content a))

(declare-sort positive_count 0)

(declare-fun positive_countqtint (positive_count) Int)

;; positive_count'axiom
  (assert
  (forall ((i positive_count))
  (and (<= 1 (positive_countqtint i))
  (<= (positive_countqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (positive_count positive_count) Bool)

(declare-const dummy1 positive_count)

(declare-datatypes ((positive_count__ref 0))
(((positive_count__refqtmk (positive_count__content positive_count)))))
(define-fun positive_count__ref_positive_count__content__projection ((a positive_count__ref)) positive_count 
  (positive_count__content a))

(define-fun dynamic_invariant ((temp___expr_167 Int)
  (temp___is_init_163 Bool) (temp___skip_constant_164 Bool)
  (temp___do_toplevel_165 Bool)
  (temp___do_typ_inv_166 Bool)) Bool (=>
                                     (or (= temp___is_init_163 true)
                                     (<= 1 2147483647)) (in_range1
                                     temp___expr_167)))

(assert
;; defqtvc
 ;; File "pack.ads", line 5, characters 0-0
  (not
  (forall ((col_count Int))
  (=> (dynamic_invariant col_count true false true true)
  (=> (dynamic_invariant c true false true true) (in_range (+ col_count c)))))))
(check-sat)
(exit)
