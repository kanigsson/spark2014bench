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

(declare-const y Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const the_action Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort y_coord 0)

(declare-fun y_coordqtint (y_coord) Int)

;; y_coord'axiom
  (assert
  (forall ((i y_coord))
  (and (<= 1 (y_coordqtint i)) (<= (y_coordqtint i) 16))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 16)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (y_coord y_coord) Bool)

(declare-const dummy y_coord)

(declare-datatypes ((y_coord__ref 0))
(((y_coord__refqtmk (y_coord__content y_coord)))))
(define-fun y_coord__ref_y_coord__content__projection ((a y_coord__ref)) y_coord 
  (y_coord__content a))

(define-fun dynamic_invariant ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= 1 16)) (in_range1 temp___expr_160)))

(declare-sort action 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (action action) Bool)

(declare-const dummy1 action)

(declare-datatypes ((action__ref 0))
(((action__refqtmk (action__content action)))))
(define-fun action__ref_action__content__projection ((a action__ref)) action 
  (action__content a))

(define-fun dynamic_invariant1 ((temp___expr_167 Int)
  (temp___is_init_163 Bool) (temp___skip_constant_164 Bool)
  (temp___do_toplevel_165 Bool)
  (temp___do_typ_inv_166 Bool)) Bool (=>
                                     (or (= temp___is_init_163 true)
                                     (<= 0 3)) (in_range2 temp___expr_167)))

(assert
;; defqtvc
 ;; File "tetris.adb", line 4, characters 0-0
  (not
  (=> (dynamic_invariant y true false true true)
  (=> (dynamic_invariant1 the_action true false true true)
  (=> (= the_action 3) (in_range1 (- y 1)))))))
(check-sat)
(exit)
