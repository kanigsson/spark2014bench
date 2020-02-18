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

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort state_range 0)

(declare-fun state_rangeqtint (state_range) Int)

;; state_range'axiom
  (assert
  (forall ((i state_range))
  (and (<= 0 (state_rangeqtint i)) (<= (state_rangeqtint i) 623))))

(define-fun in_range ((x1 Int)) Bool (and (<= 0 x1) (<= x1 623)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (state_range state_range) Bool)

(declare-const dummy state_range)

(declare-datatypes ((state_range__ref 0))
(((state_range__refqtmk (state_range__content state_range)))))
(define-fun state_range__ref_state_range__content__projection ((a state_range__ref)) state_range 
  (state_range__content a))

(define-fun dynamic_invariant ((temp___expr_169 Int)
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (=>
                                     (or (= temp___is_init_165 true)
                                     (<= 0 623)) (in_range temp___expr_169)))

(assert
;; defqtvc
 ;; File "random.adb", line 109, characters 0-0
  (not
  (=> (dynamic_invariant x true false true true)
  (=> (not (= x 623)) (in_range (+ x 1))))))
(check-sat)