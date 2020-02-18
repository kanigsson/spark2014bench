;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
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

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun speed_is_valid (Int Int) Bool)

(declare-fun speed_is_valid__function_guard (Bool Int Int) Bool)

(declare-sort state_type 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (state_type state_type) Bool)

(declare-const dummy state_type)

(declare-datatypes ((state_type__ref 0))
(((state_type__refqtmk (state_type__content state_type)))))
(define-fun state_type__ref_state_type__content__projection ((a state_type__ref)) state_type 
  (state_type__content a))

(define-fun dynamic_invariant ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (<= 0 2)) (in_range1 temp___expr_159)))

(declare-sort speed_type 0)

(declare-fun speed_typeqtint (speed_type) Int)

;; speed_type'axiom
  (assert
  (forall ((i speed_type))
  (and (<= (- 100) (speed_typeqtint i)) (<= (speed_typeqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 100) x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (speed_type speed_type) Bool)

(declare-const dummy1 speed_type)

(declare-datatypes ((speed_type__ref 0))
(((speed_type__refqtmk (speed_type__content speed_type)))))
(define-fun speed_type__ref_speed_type__content__projection ((a speed_type__ref)) speed_type 
  (speed_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_180 Int)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (=>
                                     (or (= temp___is_init_176 true)
                                     (<= (- 100) 100)) (in_range2
                                     temp___expr_180)))

;; speed_is_valid__post_axiom
  (assert true)

;; speed_is_valid__def_axiom
  (assert
  (forall ((vehicle__speed Int) (vehicle__state Int))
  (! (= (= (speed_is_valid vehicle__speed vehicle__state) true)
     (ite (= vehicle__state 0) (= vehicle__speed 0)
     (ite (= vehicle__state 1) (< 0 vehicle__speed) (< vehicle__speed 0)))) :pattern (
  (speed_is_valid vehicle__speed vehicle__state)) )))

(assert
;; defqtvc
 ;; File "vehicle.adb", line 3, characters 0-0
  (not
  (forall ((speed Int) (state Int))
  (=> (dynamic_invariant1 speed true false true true)
  (=> (dynamic_invariant state true false true true)
  (=>
  (forall ((speed1 Int) (state1 Int)) (speed_is_valid__function_guard
  (speed_is_valid speed1 state1) speed1 state1))
  (=> (= (speed_is_valid speed state) true)
  (=> (not (= state 0))
  (let ((temp___inv_191 (speed_is_valid speed state)))
  (=>
  (and (speed_is_valid__function_guard temp___inv_191 speed state)
  (= (= temp___inv_191 true)
  (ite (= state 0) (= speed 0) (ite (= state 1) (< 0 speed) (< speed 0)))))
  (forall ((speed1 Int) (state1 Int))
  (=>
  (forall ((speed2 Int) (state2 Int)) (speed_is_valid__function_guard
  (speed_is_valid speed2 state2) speed2 state2))
  (=> (= (speed_is_valid speed1 state1) true)
  (=>
  (= (and (ite (and (dynamic_invariant1 speed1 true true true true)
               (dynamic_invariant state1 true true true true))
          true false) (ite (not (= state1 0)) true false)) true)
  (forall ((spark__branch Bool))
  (=> (= spark__branch (ite (< 0 speed1) true false))
  (=> (= spark__branch true)
  (=>
  (forall ((speed2 Int) (state2 Int)) (speed_is_valid__function_guard
  (speed_is_valid speed2 state2) speed2 state2))
  (= (speed_is_valid speed1 state1) true)))))))))))))))))))
(check-sat)