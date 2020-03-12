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

(declare-const a Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort small 0)

(declare-fun smallqtint (small) Int)

;; small'axiom
  (assert
  (forall ((i small)) (and (<= 1 (smallqtint i)) (<= (smallqtint i) 10))))

(define-fun in_range ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (small small) Bool)

(declare-const dummy small)

(declare-datatypes () ((small__ref (small__refqtmk (small__content small)))))
(define-fun small__ref_small__content__projection ((a1 small__ref)) small 
  (small__content a1))

(define-fun dynamic_invariant ((temp___expr_158 Int)
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool)
  (temp___do_typ_inv_157 Bool)) Bool (=>
                                     (or (= temp___is_init_154 true)
                                     (<= 1 10)) (in_range temp___expr_158)))

(declare-sort big 0)

(declare-fun bigqtint (big) Int)

;; big'axiom
  (assert (forall ((i big)) (and (<= 1 (bigqtint i)) (<= (bigqtint i) 21))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 21)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (big big) Bool)

(declare-const dummy1 big)

(declare-datatypes () ((big__ref (big__refqtmk (big__content big)))))
(define-fun big__ref_big__content__projection ((a1 big__ref)) big (big__content
                                                                  a1))

(define-fun dynamic_invariant1 ((temp___expr_165 Int)
  (temp___is_init_161 Bool) (temp___skip_constant_162 Bool)
  (temp___do_toplevel_163 Bool)
  (temp___do_typ_inv_164 Bool)) Bool (=>
                                     (or (= temp___is_init_161 true)
                                     (<= 1 21)) (in_range1 temp___expr_165)))

(declare-const c Int)

;; Assume
  (assert (dynamic_invariant a true false true true))

;; Assume
  (assert (dynamic_invariant b true false true true))

;; Assume
  (assert (dynamic_invariant1 c true false true true))

(declare-const c1 Int)

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite (<= c (+ a b)) true false)))

(declare-const c2 Int)

(declare-const c3 Int)

;; H
  (assert
  (ite (= spark__branch true)
  (and (= c2 a)
  (let ((o (+ c2 b)))
  (and (in_range1 o)
  (and (= c3 o) (let ((o1 (+ c3 1))) (and (in_range1 o1) (= c1 o1)))))))
  (= c1 c)))

(assert
;; defqtvc
 ;; File "check_14.ads", line 7, characters 0-0
  (not (< (+ a b) c1)))
(check-sat)
