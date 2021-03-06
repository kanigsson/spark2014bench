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

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__tagged_types__root__i integer)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__tagged_types__root__i__projection ((a us_split_fields)) integer 
  (rec__tagged_types__root__i a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__tagged_types__root__i (us_split_fields1 a))) 
                   (to_rep (rec__tagged_types__root__i (us_split_fields1 b))))
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

(declare-const tagged_types__root__i__first__bit Int)

(declare-const tagged_types__root__i__last__bit Int)

(declare-const tagged_types__root__i__position Int)

;; tagged_types__root__i__first__bit_axiom
  (assert (<= 0 tagged_types__root__i__first__bit))

;; tagged_types__root__i__last__bit_axiom
  (assert
  (< tagged_types__root__i__first__bit tagged_types__root__i__last__bit))

;; tagged_types__root__i__position_axiom
  (assert (<= 0 tagged_types__root__i__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((root__ref 0))
(((root__refqtmk (root__content us_rep)))))
(define-fun root__ref_root__content__projection ((a root__ref)) us_rep 
  (root__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__tagged_types__child__j integer)(rec__tagged_types__root__i1 integer)(rec__ext__1 us_private)))))
(define-fun us_split_fields_rec__tagged_types__child__j__projection ((a us_split_fields2)) integer 
  (rec__tagged_types__child__j a))

(define-fun us_split_fields_rec__tagged_types__root__i__2__projection ((a us_split_fields2)) integer 
  (rec__tagged_types__root__i1 a))

(define-fun us_split_fields_rec__ext____2__projection ((a us_split_fields2)) us_private 
  (rec__ext__1 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)(attr__tag1 Int)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun us_rep_attr__tag__2__projection ((a us_rep1)) Int (attr__tag1 a))

(declare-fun hide_ext__ (integer us_private) us_private)

(declare-fun extract__tagged_types__child__j (us_private) integer)

;; extract__tagged_types__child__j__conv
  (assert
  (forall ((tagged_types__child__j integer))
  (forall ((rec__ext__2 us_private))
  (= (extract__tagged_types__child__j
     (hide_ext__ tagged_types__child__j rec__ext__2)) tagged_types__child__j))))

(declare-fun extract__ext__ (us_private) us_private)

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk
                                         (us_split_fieldsqtmk
                                         (rec__tagged_types__root__i1
                                         (us_split_fields3 a))
                                         (hide_ext__
                                         (rec__tagged_types__child__j
                                         (us_split_fields3 a))
                                         (rec__ext__1 (us_split_fields3 a))))
                                         (attr__tag1 a)))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1
                                         (us_split_fieldsqtmk1
                                         (extract__tagged_types__child__j
                                         (rec__ext__ (us_split_fields1 r)))
                                         (rec__tagged_types__root__i
                                         (us_split_fields1 r))
                                         (extract__ext__
                                         (rec__ext__ (us_split_fields1 r))))
                                         (attr__tag r)))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__tagged_types__child__j
                            (us_split_fields3 a))) (to_rep
                                                   (rec__tagged_types__child__j
                                                   (us_split_fields3 b))))
                         (= (to_rep
                            (rec__tagged_types__root__i1
                            (us_split_fields3 a))) (to_rep
                                                   (rec__tagged_types__root__i1
                                                   (us_split_fields3 b)))))
                    true false))

(declare-const us_tag1 Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const tagged_types__child__j__first__bit Int)

(declare-const tagged_types__child__j__last__bit Int)

(declare-const tagged_types__child__j__position Int)

;; tagged_types__child__j__first__bit_axiom
  (assert (<= 0 tagged_types__child__j__first__bit))

;; tagged_types__child__j__last__bit_axiom
  (assert
  (< tagged_types__child__j__first__bit tagged_types__child__j__last__bit))

;; tagged_types__child__j__position_axiom
  (assert (<= 0 tagged_types__child__j__position))

(declare-const tagged_types__root__i__first__bit1 Int)

(declare-const tagged_types__root__i__last__bit1 Int)

(declare-const tagged_types__root__i__position1 Int)

;; tagged_types__root__i__first__bit_axiom
  (assert (<= 0 tagged_types__root__i__first__bit1))

;; tagged_types__root__i__last__bit_axiom
  (assert
  (< tagged_types__root__i__first__bit1 tagged_types__root__i__last__bit1))

;; tagged_types__root__i__position_axiom
  (assert (<= 0 tagged_types__root__i__position1))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((child__ref 0))
(((child__refqtmk (child__content us_rep1)))))
(define-fun child__ref_child__content__projection ((a child__ref)) us_rep1 
  (child__content a))

(declare-const x__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption ((temp___expr_191 us_rep1)
  (temp___skip_top_level_192 Bool)) Bool (= (attr__tag1 temp___expr_191) 
  us_tag1))

(declare-fun g (us_rep) Int)

(declare-fun g__function_guard (Int us_rep) Bool)

(declare-fun g1 (Int us_rep) Int)

(declare-fun g__function_guard1 (Int Int us_rep) Bool)

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-fun f (us_rep) Int)

(declare-fun f__function_guard (Int us_rep) Bool)

(declare-fun f1 (Int us_rep) Int)

(declare-fun f__function_guard1 (Int Int us_rep) Bool)

(define-fun default_initial_assumption1 ((temp___expr_183 us_rep)
  (temp___skip_top_level_184 Bool)) Bool (= (attr__tag temp___expr_183) 
  us_tag))

;; g__post_axiom
  (assert
  (forall ((x us_rep))
  (! (let ((result (g x)))
     (=> (g__function_guard result x) (dynamic_invariant result true false
     true true))) :pattern ((g x)) )))

;; g__post__dispatch_axiom
  (assert
  (forall ((attr__tag2 Int))
  (forall ((x us_rep))
  (! (let ((result (g1 attr__tag2 x)))
     (=> (g__function_guard1 result attr__tag2 x) (dynamic_invariant result
     true false true true))) :pattern ((g1 attr__tag2 x)) ))))

;; tagged_types__root__compat_axiom
  (assert
  (forall ((x us_rep))
  (! (=> (g__function_guard1 (g1 us_tag x) us_tag x)
     (and (forall ((x1 us_rep)) (g__function_guard (g x1) x1))
     (= (g x) (g1 us_tag x)))) :pattern ((g1 us_tag x)) )))

;; tagged_types__child__compat_axiom
  (assert
  (forall ((x us_rep))
  (! (=> (g__function_guard1 (g1 us_tag1 x) us_tag1 x)
     (and (forall ((x1 us_rep)) (g__function_guard (g x1) x1))
     (= (g x) (g1 us_tag1 x)))) :pattern ((g1 us_tag1 x)) )))

;; g__def_axiom
  (assert
  (forall ((x us_rep))
  (! (and
     (forall ((x1 us_rep)) (f__function_guard1 (f1 (attr__tag x1) x1)
     (attr__tag x1) x1)) (= (g x) (f1 (attr__tag x) x))) :pattern ((g x)) )))

(declare-fun f2 (us_rep1) Int)

(declare-fun f__function_guard2 (Int us_rep1) Bool)

(declare-fun f3 (Int us_rep1) Int)

(declare-fun f__function_guard3 (Int Int us_rep1) Bool)

;; f__post_axiom
  (assert
  (forall ((x us_rep))
  (! (let ((result (f x)))
     (=> (f__function_guard result x) (dynamic_invariant result true false
     true true))) :pattern ((f x)) )))

;; f__post__dispatch_axiom
  (assert
  (forall ((attr__tag2 Int))
  (forall ((x us_rep))
  (! (let ((result (f1 attr__tag2 x)))
     (=> (f__function_guard1 result attr__tag2 x) (dynamic_invariant result
     true false true true))) :pattern ((f1 attr__tag2 x)) ))))

;; tagged_types__root__compat_axiom
  (assert
  (forall ((x us_rep))
  (! (=> (f__function_guard1 (f1 us_tag x) us_tag x)
     (and (forall ((x1 us_rep)) (f__function_guard (f x1) x1))
     (= (f x) (f1 us_tag x)))) :pattern ((f1 us_tag x)) )))

;; tagged_types__child__compat_axiom
  (assert
  (forall ((x us_rep))
  (! (=> (f__function_guard1 (f1 us_tag1 x) us_tag1 x)
     (and
     (forall ((x1 us_rep)) (f__function_guard2 (f2 (of_base x1))
     (of_base x1))) (= (f2 (of_base x)) (f1 us_tag1 x)))) :pattern ((f1
                                                                    us_tag1
                                                                    x)) )))

;; f__def_axiom
  (assert
  (forall ((x us_rep))
  (! (= (f x) (to_rep (rec__tagged_types__root__i (us_split_fields1 x)))) :pattern (
  (f x)) )))

;; f__post_axiom
  (assert
  (forall ((x us_rep1))
  (! (let ((result (f2 x)))
     (=> (f__function_guard2 result x) (dynamic_invariant result true false
     true true))) :pattern ((f2 x)) )))

;; f__post__dispatch_axiom
  (assert
  (forall ((attr__tag2 Int))
  (forall ((x us_rep1))
  (! (let ((result (f3 attr__tag2 x)))
     (=> (f__function_guard3 result attr__tag2 x) (dynamic_invariant result
     true false true true))) :pattern ((f3 attr__tag2 x)) ))))

;; tagged_types__child__compat_axiom
  (assert
  (forall ((x us_rep1))
  (! (=> (f__function_guard3 (f3 us_tag1 x) us_tag1 x)
     (and (forall ((x1 us_rep1)) (f__function_guard2 (f2 x1) x1))
     (= (f2 x) (f3 us_tag1 x)))) :pattern ((f3 us_tag1 x)) )))

;; f__def_axiom
  (assert
  (forall ((x us_rep1))
  (! (= (f2 x) (to_rep (rec__tagged_types__child__j (us_split_fields3 x)))) :pattern (
  (f2 x)) )))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 2))

(declare-const rliteral1 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral1) 1))

(assert
;; defqtvc
 ;; File "test_redispatch.adb", line 2, characters 0-0
  (not
  (forall ((x__split_fields us_split_fields2))
  (=>
  (= x__split_fields (us_split_fieldsqtmk1 rliteral rliteral1 us_null_ext__))
  (=> (= x__attr__tag us_tag1)
  (=>
  (forall ((x__split_fields1 us_split_fields2)) (g__function_guard
  (g (to_base (us_repqtmk1 x__split_fields1 x__attr__tag)))
  (to_base (us_repqtmk1 x__split_fields1 x__attr__tag))))
  (= (g (to_base (us_repqtmk1 x__split_fields x__attr__tag))) 2)))))))
(check-sat)
(exit)
