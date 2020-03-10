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

(declare-fun get_state (Int) Int)

(declare-fun get_state__function_guard (Int Int) Bool)

(declare-sort states_t 0)

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (states_t states_t) Bool)

(declare-const dummy states_t)

(declare-datatypes ((states_t__ref 0))
(((states_t__refqtmk (states_t__content states_t)))))
(define-fun states_t__ref_states_t__content__projection ((a states_t__ref)) states_t 
  (states_t__content a))

(define-fun dynamic_invariant ((temp___expr_173 Int)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (=>
                                     (or (= temp___is_init_169 true)
                                     (<= 0 3)) (in_range temp___expr_173)))

;; get_state__post_axiom
  (assert
  (forall ((sm_using_case_expression__state Int))
  (! (=> (dynamic_invariant sm_using_case_expression__state true true true
     true)
     (let ((result (get_state sm_using_case_expression__state)))
     (=> (get_state__function_guard result sm_using_case_expression__state)
     (dynamic_invariant result true false true true)))) :pattern ((get_state
                                                                  sm_using_case_expression__state)) )))

;; get_state__def_axiom
  (assert
  (forall ((sm_using_case_expression__state Int))
  (! (=> (dynamic_invariant sm_using_case_expression__state true true true
     true)
     (= (get_state sm_using_case_expression__state) sm_using_case_expression__state)) :pattern (
  (get_state sm_using_case_expression__state)) )))

(declare-const new_state Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(assert
;; defqtvc
 ;; File "sm_using_case_expression.ads", line 15, characters 0-0
  (not
  (forall ((state Int) (state1 Int))
  (=> (dynamic_invariant state false false true true)
  (=> (dynamic_invariant new_state true false true true)
  (=> (= state1 new_state)
  (=>
  (forall ((state2 Int)) (get_state__function_guard (get_state state2)
  state2)) (= (get_state state1) new_state))))))))
(check-sat)
(exit)
