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
((us_split_fields (us_split_fieldsqtmk (rec__test_type__t__f integer)))))
(define-fun us_split_fields_rec__test_type__t__f__projection ((a us_split_fields)) integer 
  (rec__test_type__t__f a))

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
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__test_type__t__f (us_split_fields1 a))) 
                   (to_rep (rec__test_type__t__f (us_split_fields1 b)))) true
                   false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const test_type__t__f__first__bit Int)

(declare-const test_type__t__f__last__bit Int)

(declare-const test_type__t__f__position Int)

;; test_type__t__f__first__bit_axiom
  (assert (<= 0 test_type__t__f__first__bit))

;; test_type__t__f__last__bit_axiom
  (assert (< test_type__t__f__first__bit test_type__t__f__last__bit))

;; test_type__t__f__position_axiom
  (assert (<= 0 test_type__t__f__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes () ((t__ref (t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq2 (natural natural) Bool)

(declare-const dummy2 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_182 us_rep)
  (temp___is_init_178 Bool) (temp___skip_constant_179 Bool)
  (temp___do_toplevel_180 Bool)
  (temp___do_typ_inv_181 Bool)) Bool (=> (= temp___do_typ_inv_181 true)
                                     (in_range1
                                     (to_rep
                                     (rec__test_type__t__f
                                     (us_split_fields1 temp___expr_182))))))

(define-fun default_initial_assumption ((temp___expr_185 us_rep)
  (temp___skip_top_level_186 Bool)) Bool (= (to_rep
                                            (rec__test_type__t__f
                                            (us_split_fields1
                                            temp___expr_185))) 0))

(define-fun type_invariant ((temp___187 us_rep)) Bool (in_range1
  (to_rep (rec__test_type__t__f (us_split_fields1 temp___187)))))

(declare-fun decr_int (us_rep) us_rep)

(declare-fun decr_int__function_guard (us_rep us_rep) Bool)

(declare-fun saturate (us_rep) us_rep)

(declare-fun saturate__function_guard (us_rep us_rep) Bool)

(declare-fun decr (us_rep) us_rep)

(declare-fun decr__function_guard (us_rep us_rep) Bool)

;; decr__post_axiom
  (assert
  (forall ((x us_rep))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (decr x)))
     (=> (decr__function_guard result x) (dynamic_invariant result true false
     true true)))) :pattern ((decr x)) )))

;; decr__def_axiom
  (assert
  (forall ((x us_rep))
  (! (=> (dynamic_invariant x true true true true)
     (and (forall ((x1 us_rep)) (decr_int__function_guard (decr_int x1) x1))
     (and (forall ((x1 us_rep)) (decr_int__function_guard (decr_int x1) x1))
     (and
     (forall ((x1 us_rep)) (saturate__function_guard (saturate (decr_int x1))
     (decr_int x1))) (= (decr x) (saturate (decr_int x))))))) :pattern (
  (decr x)) )))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

;; decr_int__post_axiom
  (assert
  (forall ((x us_rep))
  (! (=>
     (and (dynamic_invariant x true true true true)
     (< (- 2147483648) (to_rep (rec__test_type__t__f (us_split_fields1 x)))))
     (let ((result (decr_int x)))
     (=> (decr_int__function_guard result x) (dynamic_invariant result true
     false true false)))) :pattern ((decr_int x)) )))

;; decr_int__def_axiom
  (assert
  (forall ((x us_rep))
  (! (=> (dynamic_invariant x true true true true)
     (= (decr_int x) (us_repqtmk
                     (us_split_fieldsqtmk
                     (of_rep
                     (- (to_rep (rec__test_type__t__f (us_split_fields1 x))) 1)))))) :pattern (
  (decr_int x)) )))

;; saturate__post_axiom
  (assert
  (forall ((x us_rep))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (saturate x)))
     (=> (saturate__function_guard result x) (dynamic_invariant result true
     false true false)))) :pattern ((saturate x)) )))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

;; saturate__def_axiom
  (assert
  (forall ((x us_rep))
  (! (=> (dynamic_invariant x true true true true)
     (= (saturate x) (ite (< (to_rep
                             (rec__test_type__t__f (us_split_fields1 x))) 0)
                     (us_repqtmk (us_split_fieldsqtmk rliteral)) x))) :pattern (
  (saturate x)) )))

(declare-const x__split_fields integer)

;; Assume
  (assert (default_initial_assumption
  (us_repqtmk (us_split_fieldsqtmk x__split_fields)) false))

;; Assume
  (assert (dynamic_invariant
  (us_repqtmk (us_split_fieldsqtmk x__split_fields)) false false true true))

(define-fun o () us_rep (us_repqtmk (us_split_fieldsqtmk x__split_fields)))

(define-fun test__y__assume () us_rep (decr o))

;; H
  (assert (forall ((o1 us_rep)) (decr_int__function_guard (decr_int o1) o1)))

;; H
  (assert (forall ((o1 us_rep)) (decr_int__function_guard (decr_int o1) o1)))

;; H
  (assert
  (forall ((o1 us_rep)) (saturate__function_guard (saturate (decr_int o1))
  (decr_int o1))))

;; H
  (assert (decr__function_guard test__y__assume o))

;; H
  (assert (dynamic_invariant test__y__assume true false true true))

;; H
  (assert (= test__y__assume (saturate (decr_int o))))

(declare-const y__split_fields integer)

;; H
  (assert
  (= (us_split_fieldsqtmk y__split_fields) (us_split_fields1 test__y__assume)))

;; Assume
  (assert (dynamic_invariant
  (us_repqtmk (us_split_fieldsqtmk y__split_fields)) true false true true))

(assert
;; defqtvc
 ;; File "test.adb", line 2, characters 0-0
  (not
  (not
  (= (bool_eq (us_repqtmk (us_split_fieldsqtmk x__split_fields))
     (us_repqtmk (us_split_fieldsqtmk y__split_fields))) true))))
(check-sat)

(exit)
