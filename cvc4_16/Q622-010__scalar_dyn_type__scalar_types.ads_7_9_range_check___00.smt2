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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-fun id (Int) Int)

(declare-fun id__function_guard (Int Int) Bool)

;; id__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (id x)))
     (=> (id__function_guard result x) (dynamic_invariant result true false
     true true)))) :pattern ((id x)) )))

;; id__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true) (= (id x) x)) :pattern (
  (id x)) )))

(declare-const dyn_ty_LAST Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort tdyn_tyB 0)

(declare-fun tdyn_tyBqtint (tdyn_tyB) Int)

;; tdyn_tyB'axiom
  (assert
  (forall ((i tdyn_tyB))
  (and (<= (- 2147483648) (tdyn_tyBqtint i))
  (<= (tdyn_tyBqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (tdyn_tyB tdyn_tyB) Bool)

(declare-const dummy1 tdyn_tyB)

(declare-datatypes ((tdyn_tyB__ref 0))
(((tdyn_tyB__refqtmk (tdyn_tyB__content tdyn_tyB)))))
(define-fun tdyn_tyB__ref_tdyn_tyB__content__projection ((a tdyn_tyB__ref)) tdyn_tyB 
  (tdyn_tyB__content a))

(define-fun to_rep ((x tdyn_tyB)) Int (tdyn_tyBqtint x))

(declare-fun of_rep (Int) tdyn_tyB)

;; inversion_axiom
  (assert
  (forall ((x tdyn_tyB))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x tdyn_tyB)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-const last Int)

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (tdyn_tyB tdyn_tyB) Bool)

(declare-const dummy2 tdyn_tyB)

(declare-datatypes ((dyn_ty__ref 0))
(((dyn_ty__refqtmk (dyn_ty__content tdyn_tyB)))))
(define-fun dyn_ty__ref_dyn_ty__content__projection ((a dyn_ty__ref)) tdyn_tyB 
  (dyn_ty__content a))

(define-fun dynamic_invariant1 ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= 1 last)) (dynamic_property 1 
                                     last temp___expr_160)))

;; last__def_axiom
  (assert (= last dyn_ty_LAST))

;; dyn_ty_LAST__def_axiom
  (assert (and (id__function_guard (id 10) 10) (= dyn_ty_LAST (id 10))))

(assert
;; defqtvc
 ;; File "scalar_types.ads", line 1, characters 0-0
  (not
  (let ((scalar_types__dyn_ty_LAST__assume (id 10)))
  (=>
  (and (id__function_guard scalar_types__dyn_ty_LAST__assume 10)
  (and (dynamic_invariant scalar_types__dyn_ty_LAST__assume true false true
  true) (= scalar_types__dyn_ty_LAST__assume 10)))
  (=> (= scalar_types__dyn_ty_LAST__assume dyn_ty_LAST)
  (=> (dynamic_invariant dyn_ty_LAST true false true true)
  (=> (<= 1 100) (<= 1 1))))))))
(check-sat)
(exit)
