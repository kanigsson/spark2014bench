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

(declare-const detected Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort my_type2 0)

(declare-fun my_type2qtint (my_type2) Int)

;; my_type2'axiom
  (assert
  (forall ((i my_type2))
  (and (<= 0 (my_type2qtint i)) (<= (my_type2qtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (my_type2 my_type2) Bool)

(declare-const dummy my_type2)

(declare-datatypes ((my_type2__ref 0))
(((my_type2__refqtmk (my_type2__content my_type2)))))
(define-fun my_type2__ref_my_type2__content__projection ((a my_type2__ref)) my_type2 
  (my_type2__content a))

(define-fun dynamic_invariant ((temp___expr_214 Int)
  (temp___is_init_210 Bool) (temp___skip_constant_211 Bool)
  (temp___do_toplevel_212 Bool)
  (temp___do_typ_inv_213 Bool)) Bool (and
                                     (=>
                                     (or (= temp___is_init_210 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_214))
                                     (=> (= temp___do_toplevel_212 true)
                                     (=> (= temp___is_init_210 true)
                                     (and (<= 42 temp___expr_214)
                                     (<= temp___expr_214 42))))))

(define-fun dynamic_predicate ((temp___218 Int)) Bool (and (<= 42 temp___218)
                                                      (<= temp___218 42)))

;; detected__def_axiom
  (assert (= detected 23))

(assert
;; defqtvc
 ;; File "foo.adb", line 13, characters 0-0
  (not (<= 42 23)))
(check-sat)
(exit)
