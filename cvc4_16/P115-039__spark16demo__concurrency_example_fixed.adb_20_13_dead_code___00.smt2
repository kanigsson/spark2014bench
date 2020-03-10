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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

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
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const all_zeroes (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const all_ones (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__concurrency_example_fixed__dataT__value (Array Int integer))))))
(define-fun us_split_fields_rec__concurrency_example_fixed__dataT__value__projection ((a us_split_fields)) (Array Int integer) 
  (rec__concurrency_example_fixed__dataT__value a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const concurrency_example_fixed__dataT__value__first__bit Int)

(declare-const concurrency_example_fixed__dataT__value__last__bit Int)

(declare-const concurrency_example_fixed__dataT__value__position Int)

;; concurrency_example_fixed__dataT__value__first__bit_axiom
  (assert (<= 0 concurrency_example_fixed__dataT__value__first__bit))

;; concurrency_example_fixed__dataT__value__last__bit_axiom
  (assert
  (< concurrency_example_fixed__dataT__value__first__bit concurrency_example_fixed__dataT__value__last__bit))

;; concurrency_example_fixed__dataT__value__position_axiom
  (assert (<= 0 concurrency_example_fixed__dataT__value__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-datatypes ((dataT__ref 0))
(((dataT__refqtmk (dataT__content us_rep)))))
(define-fun dataT__ref_dataT__content__projection ((a dataT__ref)) us_rep 
  (dataT__content a))

(define-fun default_initial_assumption ((temp___expr_203 us_rep)
  (temp___skip_top_level_204 Bool)) Bool (= (rec__concurrency_example_fixed__dataT__value
                                            (us_split_fields1
                                            temp___expr_203)) all_zeroes))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

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

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy1 us_rep1)

(declare-datatypes ((time__ref 0))
(((time__refqtmk (time__content us_rep1)))))
(define-fun time__ref_time__content__projection ((a time__ref)) us_rep1 
  (time__content a))

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep2 0)

(declare-fun bool_eq2 (us_rep2 us_rep2) Bool)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq3 (us_rep2 us_rep2) Bool)

(declare-const dummy2 us_rep2)

(declare-datatypes ((time_span__ref 0))
(((time_span__refqtmk (time_span__content us_rep2)))))
(define-fun time_span__ref_time_span__content__projection ((a time_span__ref)) us_rep2 
  (time_span__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-fun milliseconds (Int) us_rep2)

(declare-fun milliseconds__function_guard (us_rep2 Int) Bool)

;; milliseconds__post_axiom
  (assert true)

(declare-fun oadd (us_rep1 us_rep2) us_rep1)

(declare-fun oadd__function_guard (us_rep1 us_rep1 us_rep2) Bool)

;; oadd__post_axiom
  (assert true)

(declare-fun concurrency_example_fixed__all_zeroes__aggregate_def (Int) (Array Int integer))

(declare-fun concurrency_example_fixed__all_ones__aggregate_def (Int) (Array Int integer))

(declare-sort priority 0)

(declare-fun priorityqtint (priority) Int)

;; priority'axiom
  (assert
  (forall ((i priority))
  (and (<= 0 (priorityqtint i)) (<= (priorityqtint i) 97))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 97)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq4 (priority priority) Bool)

(declare-const dummy3 priority)

(declare-datatypes ((priority__ref 0))
(((priority__refqtmk (priority__content priority)))))
(define-fun priority__ref_priority__content__projection ((a priority__ref)) priority 
  (priority__content a))

;; all_zeroes__def_axiom
  (assert
  (= all_zeroes (concurrency_example_fixed__all_zeroes__aggregate_def 0)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___156 Int))
  (=> (dynamic_invariant temp___156 true true true true)
  (forall ((temp___157 Int))
  (= (select (concurrency_example_fixed__all_zeroes__aggregate_def
             temp___156) temp___157) rliteral)))))

;; all_ones__def_axiom
  (assert
  (= all_ones (concurrency_example_fixed__all_ones__aggregate_def
              (- 2147483648))))

(declare-const rliteral1 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral1) (- 2147483648)))

;; def_axiom
  (assert
  (forall ((temp___159 Int))
  (=> (dynamic_invariant temp___159 true true true true)
  (forall ((temp___160 Int))
  (= (select (concurrency_example_fixed__all_ones__aggregate_def temp___159) temp___160) 
  rliteral1)))))

(define-fun dynamic_invariant1 ((temp___expr_187 Int)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=>
                                     (or (= temp___is_init_183 true)
                                     (<= 0 97)) (in_range2 temp___expr_187)))

(assert
;; defqtvc
 ;; File "concurrency_example_fixed.ads", line 14, characters 0-0
  (not
  (forall ((o us_rep1) (deadline us_rep1))
  (=> (= (concurrency_example_fixed__all_zeroes__aggregate_def 0) all_zeroes)
  (=>
  (= (concurrency_example_fixed__all_ones__aggregate_def (- 2147483648)) 
  all_ones) (not (= deadline o)))))))
(check-sat)
(exit)
