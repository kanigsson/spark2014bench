;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-fun bad_interrupt_priority (tuple0) Int)

(declare-fun bad_interrupt_priority__function_guard (Int tuple0) Bool)

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-sort us_rep 0)

(declare-fun bool_eq (us_rep us_rep) Bool)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-const dummy us_rep)

(declare-datatypes () ((time__ref (time__refqtmk (time__content us_rep)))))
(define-fun time__ref_time__content__projection ((a time__ref)) us_rep 
  (time__content a))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep1 0)

(declare-fun bool_eq1 (us_rep1 us_rep1) Bool)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-const dummy1 us_rep1)

(declare-datatypes ()
((time_span__ref (time_span__refqtmk (time_span__content us_rep1)))))
(define-fun time_span__ref_time_span__content__projection ((a time_span__ref)) us_rep1 
  (time_span__content a))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-fun seconds (Int) us_rep1)

(declare-fun seconds__function_guard (us_rep1 Int) Bool)

;; seconds__post_axiom
  (assert true)

(declare-fun oadd (us_rep us_rep1) us_rep)

(declare-fun oadd__function_guard (us_rep us_rep us_rep1) Bool)

;; oadd__post_axiom
  (assert true)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort any_priority 0)

(declare-fun any_priorityqtint (any_priority) Int)

;; any_priority'axiom
  (assert
  (forall ((i any_priority))
  (and (<= 0 (any_priorityqtint i)) (<= (any_priorityqtint i) 98))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 98)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq3 (any_priority any_priority) Bool)

(declare-const dummy3 any_priority)

(declare-datatypes ()
((any_priority__ref
 (any_priority__refqtmk (any_priority__content any_priority)))))
(define-fun any_priority__ref_any_priority__content__projection ((a any_priority__ref)) any_priority 
  (any_priority__content a))

;; bad_interrupt_priority__post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (let ((result (bad_interrupt_priority us_void_param)))
     (=> (bad_interrupt_priority__function_guard result us_void_param)
     (dynamic_invariant result true false true true))) :pattern ((bad_interrupt_priority
                                                                 us_void_param)) )))

;; bad_interrupt_priority__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (= (bad_interrupt_priority us_void_param) 99) :pattern ((bad_interrupt_priority
                                                             us_void_param)) )))

(define-fun dynamic_invariant1 ((temp___expr_162 Int)
  (temp___is_init_158 Bool) (temp___skip_constant_159 Bool)
  (temp___do_toplevel_160 Bool)
  (temp___do_typ_inv_161 Bool)) Bool (=>
                                     (or (= temp___is_init_158 true)
                                     (<= 0 98)) (in_range1 temp___expr_162)))

(declare-const wakeup us_rep)

;; Assume
  (assert true)

;; Assume
  (assert true)

;; H
  (assert false)

(assert
;; defqtvc
 ;; File "t.ads", line 9, characters 0-0
  (not false))
(check-sat)