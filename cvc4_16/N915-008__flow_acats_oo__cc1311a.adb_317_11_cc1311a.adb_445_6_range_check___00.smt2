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

(declare-const c470b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort numbers 0)

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (numbers numbers) Bool)

(declare-const dummy numbers)

(declare-datatypes ((numbers__ref 0))
(((numbers__refqtmk (numbers__content numbers)))))
(define-fun numbers__ref_numbers__content__projection ((a numbers__ref)) numbers 
  (numbers__content a))

(define-fun dynamic_invariant ((temp___expr_225 Int)
  (temp___is_init_221 Bool) (temp___skip_constant_222 Bool)
  (temp___do_toplevel_223 Bool)
  (temp___do_typ_inv_224 Bool)) Bool (=>
                                     (or (= temp___is_init_221 true)
                                     (<= 0 2)) (in_range temp___expr_225)))

(declare-sort t 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (t t) Bool)

(declare-const dummy1 t)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content t)))))
(define-fun t__ref_t__content__4__projection ((a t__ref)) t (t__content a))

(define-fun dynamic_invariant1 ((temp___expr_620 Int)
  (temp___is_init_616 Bool) (temp___skip_constant_617 Bool)
  (temp___do_toplevel_618 Bool)
  (temp___do_typ_inv_619 Bool)) Bool (=>
                                     (or (= temp___is_init_616 true)
                                     (<= 0 2)) (in_range1 temp___expr_620)))

;; c470b__def_axiom
  (assert (= c470b 0))

(assert
;; defqtvc
 ;; File "cc1311a.adb", line 445, characters 0-0
  (not
  (forall ((results Int))
  (=> (dynamic_invariant1 results false false true true) (in_range 0)))))
(check-sat)
(exit)
