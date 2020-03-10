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

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort ttime_spanB 0)

(declare-fun ttime_spanBqtint (ttime_spanB) Int)

;; ttime_spanB'axiom
  (assert
  (forall ((i ttime_spanB))
  (and (<= (- 128) (ttime_spanBqtint i)) (<= (ttime_spanBqtint i) 127))))

(define-fun in_range1 ((x1 Int)) Bool (and (<= (- 128) x1) (<= x1 127)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (ttime_spanB ttime_spanB) Bool)

(declare-const dummy ttime_spanB)

(declare-datatypes ((ttime_spanB__ref 0))
(((ttime_spanB__refqtmk (ttime_spanB__content ttime_spanB)))))
(define-fun ttime_spanB__ref_ttime_spanB__content__projection ((a ttime_spanB__ref)) ttime_spanB 
  (ttime_spanB__content a))

(declare-sort time_span 0)

(declare-fun time_spanqtint (time_span) Int)

;; time_span'axiom
  (assert
  (forall ((i time_span))
  (and (<= (- 10) (time_spanqtint i)) (<= (time_spanqtint i) 10))))

(define-fun in_range2 ((x1 Int)) Bool (and (<= (- 10) x1) (<= x1 10)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (time_span time_span) Bool)

(declare-const dummy1 time_span)

(declare-datatypes ((time_span__ref 0))
(((time_span__refqtmk (time_span__content time_span)))))
(define-fun time_span__ref_time_span__content__projection ((a time_span__ref)) time_span 
  (time_span__content a))

(define-fun dynamic_invariant ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= (- 10) 10)) (in_range2
                                     temp___expr_160)))

(assert
;; defqtvc
 ;; File "p.ads", line 15, characters 0-0
  (not
  (=> (dynamic_invariant x true false true true)
  (let ((o (abs1 x)))
  (=> (in_range1 o)
  (forall ((spark__branch Bool))
  (=> (= spark__branch (ite (<= 0 o) true false)) (= spark__branch true))))))))
(check-sat)
(exit)
