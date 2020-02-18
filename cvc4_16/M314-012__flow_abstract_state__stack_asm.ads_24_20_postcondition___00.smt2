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

(declare-fun is_empty (Int) Bool)

(declare-fun is_empty__function_guard (Bool Int) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort ptr_t 0)

(declare-fun ptr_tqtint (ptr_t) Int)

;; ptr_t'axiom
  (assert
  (forall ((i ptr_t)) (and (<= 0 (ptr_tqtint i)) (<= (ptr_tqtint i) 100))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (ptr_t ptr_t) Bool)

(declare-const dummy ptr_t)

(declare-datatypes ((ptr_t__ref 0))
(((ptr_t__refqtmk (ptr_t__content ptr_t)))))
(define-fun ptr_t__ref_ptr_t__content__projection ((a ptr_t__ref)) ptr_t 
  (ptr_t__content a))

(define-fun dynamic_invariant ((temp___expr_185 Int)
  (temp___is_init_181 Bool) (temp___skip_constant_182 Bool)
  (temp___do_toplevel_183 Bool)
  (temp___do_typ_inv_184 Bool)) Bool (=>
                                     (or (= temp___is_init_181 true)
                                     (<= 0 100)) (in_range temp___expr_185)))

;; is_empty__post_axiom
  (assert true)

(assert
;; defqtvc
 ;; File "stack_asm.ads", line 22, characters 0-0
  (not
  (forall ((the_ptr Int) (the_ptr1 Int))
  (=> (dynamic_invariant the_ptr false false true true)
  (=> (= the_ptr1 0)
  (=>
  (forall ((the_ptr2 Int)) (is_empty__function_guard (is_empty the_ptr2)
  the_ptr2)) (= (is_empty the_ptr1) true)))))))
(check-sat)