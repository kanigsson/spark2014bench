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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun foo (tuple0) Int)

(declare-fun foo__function_guard (Int tuple0) Bool)

(declare-sort enum_t 0)

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (enum_t enum_t) Bool)

(declare-const dummy enum_t)

(declare-datatypes ((enum_t__ref 0))
(((enum_t__refqtmk (enum_t__content enum_t)))))
(define-fun enum_t__ref_enum_t__content__projection ((a enum_t__ref)) enum_t 
  (enum_t__content a))

(define-fun dynamic_invariant ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (<= 0 2)) (in_range temp___expr_159)))

;; foo__post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (let ((result (foo us_void_param)))
     (=> (foo__function_guard result us_void_param) (dynamic_invariant result
     true false true true))) :pattern ((foo us_void_param)) )))

(assert
;; defqtvc
 ;; File "misc.adb", line 4, characters 0-0
  (not
  (forall ((x Int))
  (=> (dynamic_invariant x false false true true)
  (let ((o (foo Tuple0)))
  (=>
  (and (foo__function_guard o Tuple0) (dynamic_invariant o true false true
  true)) (not (= o 2))))))))
(check-sat)