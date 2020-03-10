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

(declare-fun is_full (Int) Bool)

(declare-fun is_full__function_guard (Bool Int) Bool)

(declare-fun is_full1 (Int) Bool)

(declare-fun is_full__function_guard1 (Bool Int) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort pointer_type 0)

(declare-fun pointer_typeqtint (pointer_type) Int)

;; pointer_type'axiom
  (assert
  (forall ((i pointer_type))
  (and (<= 0 (pointer_typeqtint i)) (<= (pointer_typeqtint i) 100))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (pointer_type pointer_type) Bool)

(declare-const dummy pointer_type)

(declare-datatypes ((pointer_type__ref 0))
(((pointer_type__refqtmk (pointer_type__content pointer_type)))))
(define-fun pointer_type__ref_pointer_type__content__projection ((a pointer_type__ref)) pointer_type 
  (pointer_type__content a))

(define-fun dynamic_invariant ((temp___expr_168 Int)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (or (= temp___is_init_164 true)
                                     (<= 0 100)) (in_range temp___expr_168)))

;; is_full__post_axiom
  (assert true)

;; is_full__post_refine_axiom
  (assert
  (forall ((stacks_2__a_pointer Int))
  (! (=> (dynamic_invariant stacks_2__a_pointer true true true true)
     (let ((result (is_full1 stacks_2__a_pointer)))
     (=> (is_full__function_guard1 result stacks_2__a_pointer)
     (= (= result true) (= stacks_2__a_pointer 100))))) :pattern ((is_full1
                                                                  stacks_2__a_pointer)) )))

(assert
;; defqtvc
 ;; File "stacks_2.ads", line 19, characters 0-0
  (not
  (forall ((a_pointer Int))
  (=> (dynamic_invariant a_pointer true false true true)
  (let ((o (- a_pointer 1)))
  (=> (in_range o)
  (forall ((a_pointer1 Int))
  (=> (= a_pointer1 o) (= a_pointer1 (- a_pointer 1))))))))))
(check-sat)
(exit)
