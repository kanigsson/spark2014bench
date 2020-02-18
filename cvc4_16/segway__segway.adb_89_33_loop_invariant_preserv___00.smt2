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

(declare-fun current_status (Int) Int)

(declare-fun current_status__function_guard (Int Int) Bool)

(declare-sort status_type 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (status_type status_type) Bool)

(declare-const dummy status_type)

(declare-datatypes ((status_type__ref 0))
(((status_type__refqtmk (status_type__content status_type)))))
(define-fun status_type__ref_status_type__content__projection ((a status_type__ref)) status_type 
  (status_type__content a))

(define-fun dynamic_invariant ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= 0 2)) (in_range1 temp___expr_161)))

;; current_status__post_axiom
  (assert
  (forall ((segway__status Int))
  (! (=> (dynamic_invariant segway__status true true true true)
     (let ((result (current_status segway__status)))
     (=> (current_status__function_guard result segway__status)
     (dynamic_invariant result true false true true)))) :pattern ((current_status
                                                                  segway__status)) )))

;; current_status__def_axiom
  (assert
  (forall ((segway__status Int))
  (! (=> (dynamic_invariant segway__status true true true true)
     (= (current_status segway__status) segway__status)) :pattern ((current_status
                                                                   segway__status)) )))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun speed_is_valid (Int Int) Bool)

(declare-fun speed_is_valid__function_guard (Bool Int Int) Bool)

(declare-fun current_speed (Int) Int)

(declare-fun current_speed__function_guard (Int Int) Bool)

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

(define-fun dynamic_invariant1 ((temp___expr_182 Int)
  (temp___is_init_178 Bool) (temp___skip_constant_179 Bool)
  (temp___do_toplevel_180 Bool)
  (temp___do_typ_inv_181 Bool)) Bool (=>
                                     (or (= temp___is_init_178 true)
                                     (<= (- 100) 100)) (in_range2
                                     temp___expr_182)))

;; speed_is_valid__post_axiom
  (assert true)

;; speed_is_valid__def_axiom
  (assert
  (forall ((segway__status Int) (segway__speed Int))
  (! (and
     (forall ((segway__status1 Int)) (current_status__function_guard
     (current_status segway__status1) segway__status1))
     (and
     (forall ((segway__speed1 Int)) (current_speed__function_guard
     (current_speed segway__speed1) segway__speed1))
     (and
     (forall ((segway__status1 Int)) (current_status__function_guard
     (current_status segway__status1) segway__status1))
     (and
     (forall ((segway__speed1 Int)) (current_speed__function_guard
     (current_speed segway__speed1) segway__speed1))
     (and
     (forall ((segway__speed1 Int)) (current_speed__function_guard
     (current_speed segway__speed1) segway__speed1))
     (= (= (speed_is_valid segway__status segway__speed) true)
     (ite (= (current_status segway__status) 0)
     (= (current_speed segway__speed) 0)
     (ite (= (current_status segway__status) 1)
     (< 0 (current_speed segway__speed)) (< (current_speed segway__speed) 0))))))))) :pattern (
  (speed_is_valid segway__status segway__speed)) )))

;; current_speed__post_axiom
  (assert
  (forall ((segway__speed Int))
  (! (=> (dynamic_invariant1 segway__speed true true true true)
     (let ((result (current_speed segway__speed)))
     (=> (current_speed__function_guard result segway__speed)
     (dynamic_invariant1 result true false true true)))) :pattern ((current_speed
                                                                   segway__speed)) )))

;; current_speed__def_axiom
  (assert
  (forall ((segway__speed Int))
  (! (=> (dynamic_invariant1 segway__speed true true true true)
     (= (current_speed segway__speed) segway__speed)) :pattern ((current_speed
                                                                segway__speed)) )))

(assert
;; defqtvc
 ;; File "segway.ads", line 44, characters 0-0
  (not
  (forall ((status Int) (speed Int))
  (=> (dynamic_invariant1 speed true false true true)
  (=> (dynamic_invariant status true false true true)
  (=>
  (forall ((status1 Int) (speed1 Int)) (speed_is_valid__function_guard
  (speed_is_valid status1 speed1) status1 speed1))
  (=> (= (speed_is_valid status speed) true)
  (=> (not (= status 0))
  (let ((temp___inv_206 (speed_is_valid status speed)))
  (=>
  (forall ((status1 Int)) (current_status__function_guard
  (current_status status1) status1))
  (=>
  (forall ((speed1 Int)) (current_speed__function_guard
  (current_speed speed1) speed1))
  (=>
  (forall ((status1 Int)) (current_status__function_guard
  (current_status status1) status1))
  (=>
  (forall ((speed1 Int)) (current_speed__function_guard
  (current_speed speed1) speed1))
  (=>
  (forall ((speed1 Int)) (current_speed__function_guard
  (current_speed speed1) speed1))
  (=>
  (and (speed_is_valid__function_guard temp___inv_206 status speed)
  (= (= temp___inv_206 true)
  (ite (= (current_status status) 0) (= (current_speed speed) 0)
  (ite (= (current_status status) 1) (< 0 (current_speed speed))
  (< (current_speed speed) 0)))))
  (forall ((status1 Int) (speed1 Int))
  (=>
  (forall ((status2 Int) (speed2 Int)) (speed_is_valid__function_guard
  (speed_is_valid status2 speed2) status2 speed2))
  (=> (= (speed_is_valid status1 speed1) true)
  (=>
  (= (and (ite (and (dynamic_invariant status1 true true true true)
               (dynamic_invariant1 speed1 true true true true))
          true false) (ite (not (= status1 0)) true false)) true)
  (forall ((status2 Int) (speed2 Int))
  (=>
  (forall ((status3 Int) (speed3 Int)) (speed_is_valid__function_guard
  (speed_is_valid status3 speed3) status3 speed3))
  (=>
  (forall ((status3 Int) (speed3 Int)) (speed_is_valid__function_guard
  (speed_is_valid status3 speed3) status3 speed3))
  (=>
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (< 0 speed1) true false))
  (and (= (speed_is_valid status2 speed2) true)
  (and (dynamic_invariant status2 true true true true) (dynamic_invariant1
  speed2 true true true true)))))
  (=> (not (= status2 0))
  (let ((temp___inv_2061 (speed_is_valid status2 speed2)))
  (=>
  (forall ((status3 Int)) (current_status__function_guard
  (current_status status3) status3))
  (=>
  (forall ((speed3 Int)) (current_speed__function_guard
  (current_speed speed3) speed3))
  (=>
  (forall ((status3 Int)) (current_status__function_guard
  (current_status status3) status3))
  (=>
  (forall ((speed3 Int)) (current_speed__function_guard
  (current_speed speed3) speed3))
  (=>
  (forall ((speed3 Int)) (current_speed__function_guard
  (current_speed speed3) speed3))
  (=>
  (and (speed_is_valid__function_guard temp___inv_2061 status2 speed2)
  (= (= temp___inv_2061 true)
  (ite (= (current_status status2) 0) (= (current_speed speed2) 0)
  (ite (= (current_status status2) 1) (< 0 (current_speed speed2))
  (< (current_speed speed2) 0)))))
  (=>
  (forall ((status3 Int) (speed3 Int)) (speed_is_valid__function_guard
  (speed_is_valid status3 speed3) status3 speed3))
  (= (speed_is_valid status2 speed2) true)))))))))))))))))))))))))))))))))
(check-sat)