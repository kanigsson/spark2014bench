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

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(define-fun in_range1 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(declare-sort enum_t 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (enum_t enum_t) Bool)

(declare-const dummy1 enum_t)

(declare-datatypes ()
((enum_t__ref (enum_t__refqtmk (enum_t__content enum_t)))))
(define-fun enum_t__ref_enum_t__content__projection ((a enum_t__ref)) enum_t 
  (enum_t__content a))

(declare-fun to_rep1 (enum_t) Int)

(declare-fun of_rep1 (Int) enum_t)

;; inversion_axiom
  (assert
  (forall ((x enum_t))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x enum_t)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__mixed__rec__b Bool)(rec__mixed__rec__e enum_t)(rec__mixed__rec__i integer)))))
(define-fun us_split_fields_rec__mixed__rec__b__projection ((a us_split_fields)) Bool 
  (rec__mixed__rec__b a))

(define-fun us_split_fields_rec__mixed__rec__e__projection ((a us_split_fields)) enum_t 
  (rec__mixed__rec__e a))

(define-fun us_split_fields_rec__mixed__rec__i__projection ((a us_split_fields)) integer 
  (rec__mixed__rec__i a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (ite (rec__mixed__rec__b (us_split_fields1 a)) 1 0) (ite 
                        (rec__mixed__rec__b (us_split_fields1 b)) 1 0))
                        (= (to_rep1
                           (rec__mixed__rec__e (us_split_fields1 a))) 
                        (to_rep1 (rec__mixed__rec__e (us_split_fields1 b)))))
                        (= (to_rep (rec__mixed__rec__i (us_split_fields1 a))) 
                        (to_rep (rec__mixed__rec__i (us_split_fields1 b)))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const mixed__rec__b__first__bit Int)

(declare-const mixed__rec__b__last__bit Int)

(declare-const mixed__rec__b__position Int)

;; mixed__rec__b__first__bit_axiom
  (assert (<= 0 mixed__rec__b__first__bit))

;; mixed__rec__b__last__bit_axiom
  (assert (< mixed__rec__b__first__bit mixed__rec__b__last__bit))

;; mixed__rec__b__position_axiom
  (assert (<= 0 mixed__rec__b__position))

(declare-const mixed__rec__e__first__bit Int)

(declare-const mixed__rec__e__last__bit Int)

(declare-const mixed__rec__e__position Int)

;; mixed__rec__e__first__bit_axiom
  (assert (<= 0 mixed__rec__e__first__bit))

;; mixed__rec__e__last__bit_axiom
  (assert (< mixed__rec__e__first__bit mixed__rec__e__last__bit))

;; mixed__rec__e__position_axiom
  (assert (<= 0 mixed__rec__e__position))

(declare-const mixed__rec__i__first__bit Int)

(declare-const mixed__rec__i__last__bit Int)

(declare-const mixed__rec__i__position Int)

;; mixed__rec__i__first__bit_axiom
  (assert (<= 0 mixed__rec__i__first__bit))

;; mixed__rec__i__last__bit_axiom
  (assert (< mixed__rec__i__first__bit mixed__rec__i__last__bit))

;; mixed__rec__i__position_axiom
  (assert (<= 0 mixed__rec__i__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ()
((rec____ref (rec____refqtmk (rec____content us_rep)))))
(define-fun rec____ref_rec____content__projection ((a rec____ref)) us_rep 
  (rec____content a))

(declare-fun get_i (us_rep) Int)

(declare-fun get_i__function_guard (Int us_rep) Bool)

;; get_i__post_axiom
  (assert
  (forall ((r us_rep))
  (! (let ((result (get_i r)))
     (=> (get_i__function_guard result r)
     (and (= result (to_rep (rec__mixed__rec__i (us_split_fields1 r))))
     (dynamic_invariant result true false true true)))) :pattern ((get_i r)) )))

(declare-const r us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_167 Int)
  (temp___is_init_163 Bool) (temp___skip_constant_164 Bool)
  (temp___do_toplevel_165 Bool)
  (temp___do_typ_inv_166 Bool)) Bool (=>
                                     (or (= temp___is_init_163 true)
                                     (<= 0 2)) (in_range2 temp___expr_167)))

(declare-const n Int)

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant n false false true true))

(define-fun o () us_rep r)

(define-fun o1 () Int (get_i o))

;; H
  (assert (get_i__function_guard o1 o))

;; H
  (assert (dynamic_invariant o1 true false true true))

;; H
  (assert (= o1 (to_rep (rec__mixed__rec__i (us_split_fields1 o)))))

(declare-const n1 Int)

;; H
  (assert (= n1 o1))

(assert
;; defqtvc
 ;; File "mixed.adb", line 28, characters 0-0
  (not (= n1 0)))
(check-sat)
