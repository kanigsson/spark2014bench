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

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__predicate_ints__int__min integer)(rec__predicate_ints__int__max integer)(rec__predicate_ints__int__value integer)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__predicate_ints__int__min__projection ((a us_split_fields)) integer 
  (rec__predicate_ints__int__min a))

(define-fun us_split_fields_rec__predicate_ints__int__max__projection ((a us_split_fields)) integer 
  (rec__predicate_ints__int__max a))

(define-fun us_split_fields_rec__predicate_ints__int__value__projection ((a us_split_fields)) integer 
  (rec__predicate_ints__int__value a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep
                           (rec__predicate_ints__int__min
                           (us_split_fields1 a))) (to_rep
                                                  (rec__predicate_ints__int__min
                                                  (us_split_fields1 b))))
                        (= (to_rep
                           (rec__predicate_ints__int__max
                           (us_split_fields1 a))) (to_rep
                                                  (rec__predicate_ints__int__max
                                                  (us_split_fields1 b)))))
                        (= (to_rep
                           (rec__predicate_ints__int__value
                           (us_split_fields1 a))) (to_rep
                                                  (rec__predicate_ints__int__value
                                                  (us_split_fields1 b)))))
                   true false))

(declare-fun us_dispatch_eq (us_rep us_rep) Bool)

(declare-const us_tag Int)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const predicate_ints__int__min__first__bit Int)

(declare-const predicate_ints__int__min__last__bit Int)

(declare-const predicate_ints__int__min__position Int)

;; predicate_ints__int__min__first__bit_axiom
  (assert (<= 0 predicate_ints__int__min__first__bit))

;; predicate_ints__int__min__last__bit_axiom
  (assert
  (< predicate_ints__int__min__first__bit predicate_ints__int__min__last__bit))

;; predicate_ints__int__min__position_axiom
  (assert (<= 0 predicate_ints__int__min__position))

(declare-const predicate_ints__int__max__first__bit Int)

(declare-const predicate_ints__int__max__last__bit Int)

(declare-const predicate_ints__int__max__position Int)

;; predicate_ints__int__max__first__bit_axiom
  (assert (<= 0 predicate_ints__int__max__first__bit))

;; predicate_ints__int__max__last__bit_axiom
  (assert
  (< predicate_ints__int__max__first__bit predicate_ints__int__max__last__bit))

;; predicate_ints__int__max__position_axiom
  (assert (<= 0 predicate_ints__int__max__position))

(declare-const predicate_ints__int__value__first__bit Int)

(declare-const predicate_ints__int__value__last__bit Int)

(declare-const predicate_ints__int__value__position Int)

;; predicate_ints__int__value__first__bit_axiom
  (assert (<= 0 predicate_ints__int__value__first__bit))

;; predicate_ints__int__value__last__bit_axiom
  (assert
  (< predicate_ints__int__value__first__bit predicate_ints__int__value__last__bit))

;; predicate_ints__int__value__position_axiom
  (assert (<= 0 predicate_ints__int__value__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ()
((int____ref (int____refqtmk (int____content us_rep)))))
(define-fun int____ref_int____content__projection ((a int____ref)) us_rep 
  (int____content a))

(define-fun default_initial_assumption ((temp___expr_167 us_rep)
  (temp___skip_top_level_168 Bool)) Bool (= (attr__tag temp___expr_167) 
  us_tag))

(declare-const arg1 us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const arg2 us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert
  (and
  (= (to_rep (rec__predicate_ints__int__min (us_split_fields1 arg1))) 
  (to_rep (rec__predicate_ints__int__min (us_split_fields1 arg2))))
  (= (to_rep (rec__predicate_ints__int__max (us_split_fields1 arg1))) 
  (to_rep (rec__predicate_ints__int__max (us_split_fields1 arg2))))))

(declare-const o Int)

;; Ensures
  (assert
  (= (to_rep (rec__predicate_ints__int__value (us_split_fields1 arg2))) 
  o))

(declare-const o1 Int)

;; Ensures
  (assert
  (= (to_rep (rec__predicate_ints__int__value (us_split_fields1 arg1))) 
  o1))

(assert
;; defqtvc
 ;; File "predicate_ints.ads", line 15, characters 0-0
  (not (in_range (+ o1 o))))
(check-sat)
