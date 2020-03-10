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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun state_a (Bool Int) Bool)

(declare-fun state_a__function_guard (Bool Bool Int) Bool)

;; state_a__post_axiom
  (assert true)

;; state_a__def_axiom
  (assert
  (forall ((state_machine__flag Bool))
  (forall ((state_machine__num Int))
  (! (= (= (state_a state_machine__flag state_machine__num) true)
     (and (= state_machine__flag true) (< 0 state_machine__num))) :pattern (
  (state_a state_machine__flag state_machine__num)) ))))

(declare-fun state_b (Bool Int) Bool)

(declare-fun state_b__function_guard (Bool Bool Int) Bool)

;; state_b__post_axiom
  (assert true)

;; state_b__def_axiom
  (assert
  (forall ((state_machine__flag Bool))
  (forall ((state_machine__num Int))
  (! (= (= (state_b state_machine__flag state_machine__num) true)
     (and (= state_machine__flag true) (<= state_machine__num 0))) :pattern (
  (state_b state_machine__flag state_machine__num)) ))))

(declare-fun state_c (Bool Int) Bool)

(declare-fun state_c__function_guard (Bool Bool Int) Bool)

;; state_c__post_axiom
  (assert true)

;; state_c__def_axiom
  (assert
  (forall ((state_machine__flag Bool))
  (forall ((state_machine__num Int))
  (! (= (= (state_c state_machine__flag state_machine__num) true)
     (and (not (= state_machine__flag true)) (< 0 state_machine__num))) :pattern (
  (state_c state_machine__flag state_machine__num)) ))))

(declare-fun state_d (Bool Int) Bool)

(declare-fun state_d__function_guard (Bool Bool Int) Bool)

;; state_d__post_axiom
  (assert true)

;; state_d__def_axiom
  (assert
  (forall ((state_machine__flag Bool))
  (forall ((state_machine__num Int))
  (! (= (= (state_d state_machine__flag state_machine__num) true)
     (and (not (= state_machine__flag true)) (< state_machine__num 0))) :pattern (
  (state_d state_machine__flag state_machine__num)) ))))

(assert
;; defqtvc
 ;; File "state_machine.adb", line 24, characters 0-0
  (not
  (forall ((flag Bool) (num Int))
  (=> (dynamic_invariant num true false true true)
  (=>
  (forall ((flag1 Bool) (num1 Int)) (state_d__function_guard
  (state_d flag1 num1) flag1 num1))
  (let ((usf (state_d flag num)))
  (=>
  (forall ((flag1 Bool) (num1 Int)) (state_c__function_guard
  (state_c flag1 num1) flag1 num1))
  (let ((usf1 (state_c flag num)))
  (=>
  (forall ((flag1 Bool) (num1 Int)) (state_b__function_guard
  (state_b flag1 num1) flag1 num1))
  (let ((usf2 (state_b flag num)))
  (=>
  (forall ((flag1 Bool) (num1 Int)) (state_a__function_guard
  (state_a flag1 num1) flag1 num1))
  (let ((usf3 (state_a flag num)))
  (forall ((flag1 Bool) (num1 Int))
  (=>
  (let ((o (state_a flag num)))
  (and
  (and (state_a__function_guard o flag num)
  (= (= o true) (and (= flag true) (< 0 num))))
  (exists ((spark__branch Bool))
  (and (= spark__branch o)
  (ite (= spark__branch true) (and (= flag1 flag) (= num1 num))
  (let ((o1 (state_b flag num)))
  (and
  (and (state_b__function_guard o1 flag num)
  (= (= o1 true) (and (= flag true) (<= num 0))))
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 o1)
  (ite (= spark__branch1 true)
  (and (let ((o2 (+ num 1))) (and (in_range1 o2) (= num1 o2)))
  (= flag1 flag))
  (let ((o2 (state_c flag num)))
  (and
  (and (state_c__function_guard o2 flag num)
  (= (= o2 true) (and (not (= flag true)) (< 0 num))))
  (exists ((spark__branch2 Bool))
  (and (= spark__branch2 o2)
  (ite (= spark__branch2 true)
  (and (= flag1 (distinct 1 0))
  (let ((o3 (- num))) (and (in_range1 o3) (= num1 o3))))
  (and
  (let ((o3 (state_d flag num)))
  (and
  (and (state_d__function_guard o3 flag num)
  (= (= o3 true) (and (not (= flag true)) (< num 0))))
  (exists ((spark__branch3 Bool))
  (and (= spark__branch3 o3)
  (and (= spark__branch3 true)
  (let ((o4 (+ num 1))) (and (in_range1 o4) (= num1 o4))))))))
  (= flag1 flag)))))))))))))))))
  (=>
  (forall ((flag2 Bool) (num2 Int)) (state_a__function_guard
  (state_a flag2 num2) flag2 num2))
  (=> (=> (= usf3 true) (= (state_a flag1 num1) true))
  (=>
  (forall ((flag2 Bool) (num2 Int)) (state_a__function_guard
  (state_a flag2 num2) flag2 num2))
  (=>
  (forall ((flag2 Bool) (num2 Int)) (state_b__function_guard
  (state_b flag2 num2) flag2 num2))
  (=>
  (=> (= usf2 true)
  (or (= (state_a flag1 num1) true) (= (state_b flag1 num1) true)))
  (=>
  (forall ((flag2 Bool) (num2 Int)) (state_b__function_guard
  (state_b flag2 num2) flag2 num2))
  (=> (=> (= usf1 true) (= (state_b flag1 num1) true))
  (=>
  (forall ((flag2 Bool) (num2 Int)) (state_c__function_guard
  (state_c flag2 num2) flag2 num2))
  (=>
  (forall ((flag2 Bool) (num2 Int)) (state_d__function_guard
  (state_d flag2 num2) flag2 num2))
  (=>
  (=> (= usf true)
  (or (= (state_c flag1 num1) true) (= (state_d flag1 num1) true)))
  (= (or (or (or usf3 usf2) usf1) usf) true)))))))))))))))))))))))))
(check-sat)
(exit)
