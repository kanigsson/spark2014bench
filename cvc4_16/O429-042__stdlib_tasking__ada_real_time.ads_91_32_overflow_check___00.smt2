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

(declare-sort duration 0)

(define-fun in_range1 ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                     (<= x 9223372036854775807)))

(declare-const dummy duration)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (duration duration) Bool)

(declare-datatypes ((duration__ref 0))
(((duration__refqtmk (duration__content duration)))))
(define-fun duration__ref_duration__content__projection ((a duration__ref)) duration 
  (duration__content a))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-sort us_rep 0)

(declare-fun bool_eq (us_rep us_rep) Bool)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((time_span__ref 0))
(((time_span__refqtmk (time_span__content us_rep)))))
(define-fun time_span__ref_time_span__content__projection ((a time_span__ref)) us_rep 
  (time_span__content a))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep1 0)

(declare-fun bool_eq1 (us_rep1 us_rep1) Bool)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((time__ref 0))
(((time__refqtmk (time__content us_rep1)))))
(define-fun time__ref_time__content__projection ((a time__ref)) us_rep1 
  (time__content a))

(declare-fun to_duration (us_rep1) Int)

(declare-fun to_duration__function_guard (Int us_rep1) Bool)

(define-fun dynamic_invariant ((temp___expr_116 Int)
  (temp___is_init_112 Bool) (temp___skip_constant_113 Bool)
  (temp___do_toplevel_114 Bool)
  (temp___do_typ_inv_115 Bool)) Bool (=>
                                     (or (= temp___is_init_112 true)
                                     (<= (- 9223372036854775808) 9223372036854775807))
                                     (in_range1 temp___expr_116)))

;; to_duration__post_axiom
  (assert
  (forall ((t us_rep1)) (! (in_range1
  (to_duration t)) :pattern ((to_duration t)) )))

(declare-const left us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const right us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(assert
;; defqtvc
 ;; File "ada_real_time.ads", line 87, characters 0-0
  (not
  (let ((o right))
  (let ((o1 (to_duration o)))
  (=>
  (and (to_duration__function_guard o1 o) (dynamic_invariant o1 true false
  true true))
  (=> (< o1 0)
  (let ((o2 right))
  (let ((o3 (to_duration o2)))
  (=>
  (and (to_duration__function_guard o3 o2) (dynamic_invariant o3 true false
  true true)) (in_range1 (+ 9223372036854775807 o3)))))))))))
(check-sat)
(exit)
