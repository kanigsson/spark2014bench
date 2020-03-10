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

(declare-fun cur_state (Int) Int)

(declare-fun cur_state__function_guard (Int Int) Bool)

(declare-sort state_t 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (state_t state_t) Bool)

(declare-const dummy state_t)

(declare-datatypes ((state_t__ref 0))
(((state_t__refqtmk (state_t__content state_t)))))
(define-fun state_t__ref_state_t__content__projection ((a state_t__ref)) state_t 
  (state_t__content a))

(define-fun dynamic_invariant ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (<= 0 3)) (in_range1 temp___expr_159)))

;; cur_state__post_axiom
  (assert
  (forall ((ghost_example__state Int))
  (! (=> (dynamic_invariant ghost_example__state true true true true)
     (let ((result (cur_state ghost_example__state)))
     (=> (cur_state__function_guard result ghost_example__state)
     (dynamic_invariant result true false true true)))) :pattern ((cur_state
                                                                  ghost_example__state)) )))

;; cur_state__def_axiom
  (assert
  (forall ((ghost_example__state Int))
  (! (=> (dynamic_invariant ghost_example__state true true true true)
     (= (cur_state ghost_example__state) ghost_example__state)) :pattern (
  (cur_state ghost_example__state)) )))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(assert
;; defqtvc
 ;; File "ghost_example.ads", line 11, characters 0-0
  (not
  (forall ((state Int) (successful Bool) (state1 Int) (done__ Bool))
  (=> (dynamic_invariant state true false true true)
  (=>
  (forall ((state2 Int)) (cur_state__function_guard (cur_state state2)
  state2))
  (=> (= (cur_state state) 2)
  (=> (= successful (distinct 0 0))
  (=>
  (exists ((spark__branch Bool))
  (and (= spark__branch successful)
  (ite (= spark__branch true) (and (= done__ (distinct 1 0)) (= state1 3))
  (and (= done__ (distinct 0 0)) (= state1 state)))))
  (=>
  (forall ((state2 Int)) (cur_state__function_guard (cur_state state2)
  state2)) (= (cur_state state1) (ite (= done__ true) 3 2)))))))))))
(check-sat)
(exit)
