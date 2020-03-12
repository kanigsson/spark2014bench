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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort tmy_duration2B 0)

(define-fun in_range ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                    (<= x 9223372036854775807)))

(declare-const dummy tmy_duration2B)

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (tmy_duration2B tmy_duration2B) Bool)

(declare-datatypes ()
((tmy_duration2B__ref
 (tmy_duration2B__refqtmk (tmy_duration2B__content tmy_duration2B)))))
(define-fun tmy_duration2B__ref_tmy_duration2B__content__projection ((a tmy_duration2B__ref)) tmy_duration2B 
  (tmy_duration2B__content a))

(declare-sort my_duration2 0)

(define-fun in_range1 ((x Int)) Bool (and (<= (- 20000000000) x)
                                     (<= x 20000000000)))

(declare-const dummy1 my_duration2)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (my_duration2 my_duration2) Bool)

(declare-datatypes ()
((my_duration2__ref
 (my_duration2__refqtmk (my_duration2__content my_duration2)))))
(define-fun my_duration2__ref_my_duration2__content__projection ((a my_duration2__ref)) my_duration2 
  (my_duration2__content a))

(define-fun dynamic_invariant ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (<= (- 20000000000) 20000000000))
                                     (in_range1 temp___expr_179)))

(declare-sort my_duration 0)

(define-fun in_range2 ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                     (<= x 9223372036854775807)))

(declare-const dummy2 my_duration)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (my_duration my_duration) Bool)

(declare-datatypes ()
((my_duration__ref (my_duration__refqtmk (my_duration__content my_duration)))))
(define-fun my_duration__ref_my_duration__content__projection ((a my_duration__ref)) my_duration 
  (my_duration__content a))

(define-fun dynamic_invariant1 ((temp___expr_186 Int)
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (=>
                                     (or (= temp___is_init_182 true)
                                     (<= (- 9223372036854775808) 9223372036854775807))
                                     (in_range2 temp___expr_186)))

(declare-const md Int)

;; H
  (assert (= md (- 10000000000)))

;; Assume
  (assert (dynamic_invariant1 md true false true true))

(declare-const md2 Int)

;; H
  (assert (= md2 10000000000))

;; Assume
  (assert (dynamic_invariant md2 true false true true))

(assert
;; defqtvc
 ;; File "fxp_true_check_4.adb", line 3, characters 0-0
  (not (= md (- md2))))
(check-sat)
