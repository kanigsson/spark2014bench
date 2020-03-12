(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
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

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

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

(declare-fun bad (tuple0) Int)

(declare-fun bad__function_guard (Int tuple0) Bool)

;; bad__post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (let ((result (bad us_void_param)))
     (=> (bad__function_guard result us_void_param) (dynamic_invariant result
     true false true true))) :pattern ((bad us_void_param)) )))

;; bad__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (= (bad us_void_param) 6) :pattern ((bad us_void_param)) )))

(declare-const r10b Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort my_range 0)

(declare-fun my_rangeqtint (my_range) Int)

;; my_range'axiom
  (assert
  (forall ((i my_range))
  (and (<= 1 (my_rangeqtint i)) (<= (my_rangeqtint i) 5))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (my_range my_range) Bool)

(declare-const dummy1 my_range)

(declare-datatypes ()
((my_range__ref (my_range__refqtmk (my_range__content my_range)))))
(define-fun my_range__ref_my_range__content__projection ((a my_range__ref)) my_range 
  (my_range__content a))

(define-fun dynamic_invariant1 ((temp___expr_166 Int)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (<= 1 5)) (in_range1 temp___expr_166)))

;; r10b__def_axiom
  (assert
  (and (bad__function_guard (bad Tuple0) Tuple0) (= r10b (bad Tuple0))))

(define-fun discr_checks__check_subtype_task__R10b__assume () Int (bad
                                                                  Tuple0))

;; H
  (assert (bad__function_guard discr_checks__check_subtype_task__R10b__assume
  Tuple0))

;; H
  (assert (dynamic_invariant discr_checks__check_subtype_task__R10b__assume
  true false true true))

;; H
  (assert (= discr_checks__check_subtype_task__R10b__assume 6))

;; Assume
  (assert (= discr_checks__check_subtype_task__R10b__assume r10b))

;; Assume
  (assert (dynamic_invariant r10b true false true true))

(assert
;; defqtvc
 ;; File "discr_checks.ads", line 20, characters 0-0
  (not (in_range1 r10b)))
(check-sat)
