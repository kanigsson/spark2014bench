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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun get_highest_reading (Int) Int)

(declare-fun get_highest_reading__function_guard (Int Int) Bool)

(declare-sort reading 0)

(declare-fun readingqtint (reading) Int)

;; reading'axiom
  (assert
  (forall ((i reading))
  (and (<= (- 1) (readingqtint i)) (<= (readingqtint i) 100))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 1) x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (reading reading) Bool)

(declare-const dummy reading)

(declare-datatypes ((reading__ref 0))
(((reading__refqtmk (reading__content reading)))))
(define-fun reading__ref_reading__content__projection ((a reading__ref)) reading 
  (reading__content a))

(define-fun dynamic_invariant ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (<= (- 1) 100)) (in_range1
                                     temp___expr_159)))

;; get_highest_reading__post_axiom
  (assert
  (forall ((refinement__high_reading Int))
  (! (=> (dynamic_invariant refinement__high_reading true true true true)
     (let ((result (get_highest_reading refinement__high_reading)))
     (=> (get_highest_reading__function_guard result
     refinement__high_reading) (dynamic_invariant result true false true
     true)))) :pattern ((get_highest_reading refinement__high_reading)) )))

;; get_highest_reading__def_axiom
  (assert
  (forall ((refinement__high_reading Int))
  (! (=> (dynamic_invariant refinement__high_reading true true true true)
     (= (get_highest_reading refinement__high_reading) refinement__high_reading)) :pattern (
  (get_highest_reading refinement__high_reading)) )))

(declare-const r Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(assert
;; defqtvc
 ;; File "refinement.ads", line 10, characters 0-0
  (not
  (forall ((high_reading Int) (high_reading1 Int))
  (=> (dynamic_invariant high_reading true false true true)
  (=> (dynamic_invariant r true false true true)
  (=> (<= 0 r)
  (=> (<= r 100)
  (=>
  (forall ((high_reading2 Int)) (get_highest_reading__function_guard
  (get_highest_reading high_reading2) high_reading2))
  (=> (< (- 1) (get_highest_reading high_reading1))
  (=> (dynamic_invariant high_reading1 true true true true)
  (=>
  (forall ((high_reading2 Int)) (get_highest_reading__function_guard
  (get_highest_reading high_reading2) high_reading2))
  (< (- 1) (get_highest_reading high_reading1)))))))))))))
(check-sat)
(exit)
