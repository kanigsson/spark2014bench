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

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__dic_and_predicate_checks__nested_2__r__f integer)))))
(define-fun us_split_fields_rec__dic_and_predicate_checks__nested_2__r__f__projection ((a us_split_fields)) integer 
  (rec__dic_and_predicate_checks__nested_2__r__f a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__dic_and_predicate_checks__nested_2__r__f
                           (us_split_fields1 a))) (to_rep
                                                  (rec__dic_and_predicate_checks__nested_2__r__f
                                                  (us_split_fields1 b))))
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

(declare-const dic_and_predicate_checks__nested_2__r__f__first__bit Int)

(declare-const dic_and_predicate_checks__nested_2__r__f__last__bit Int)

(declare-const dic_and_predicate_checks__nested_2__r__f__position Int)

;; dic_and_predicate_checks__nested_2__r__f__first__bit_axiom
  (assert (<= 0 dic_and_predicate_checks__nested_2__r__f__first__bit))

;; dic_and_predicate_checks__nested_2__r__f__last__bit_axiom
  (assert
  (< dic_and_predicate_checks__nested_2__r__f__first__bit dic_and_predicate_checks__nested_2__r__f__last__bit))

;; dic_and_predicate_checks__nested_2__r__f__position_axiom
  (assert (<= 0 dic_and_predicate_checks__nested_2__r__f__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes () ((t__ref (t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__2__projection ((a t__ref)) us_rep (t__content
                                                                 a))

(declare-fun is_valid (us_rep) Bool)

(declare-fun is_valid__function_guard (Bool us_rep) Bool)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const dic_and_predicate_checks__nested_2__r__f__first__bit1 Int)

(declare-const dic_and_predicate_checks__nested_2__r__f__last__bit1 Int)

(declare-const dic_and_predicate_checks__nested_2__r__f__position1 Int)

;; dic_and_predicate_checks__nested_2__r__f__first__bit_axiom
  (assert (<= 0 dic_and_predicate_checks__nested_2__r__f__first__bit1))

;; dic_and_predicate_checks__nested_2__r__f__last__bit_axiom
  (assert
  (< dic_and_predicate_checks__nested_2__r__f__first__bit1 dic_and_predicate_checks__nested_2__r__f__last__bit1))

;; dic_and_predicate_checks__nested_2__r__f__position_axiom
  (assert (<= 0 dic_and_predicate_checks__nested_2__r__f__position1))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes () ((r__ref (r__refqtmk (r__content us_rep)))))
(define-fun r__ref_r__content__2__projection ((a r__ref)) us_rep (r__content
                                                                 a))

(define-fun dynamic_invariant1 ((temp___expr_202 us_rep)
  (temp___is_init_198 Bool) (temp___skip_constant_199 Bool)
  (temp___do_toplevel_200 Bool)
  (temp___do_typ_inv_201 Bool)) Bool (< 0 (to_rep
                                          (rec__dic_and_predicate_checks__nested_2__r__f
                                          (us_split_fields1 temp___expr_202)))))

;; temp___result_210'def
  (assert
  (forall ((temp___209 us_rep)) (is_valid__function_guard
  (is_valid temp___209) temp___209)))

(define-fun default_initial_assumption ((temp___expr_206 us_rep)
  (temp___skip_top_level_207 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_207 true))
                                         (= (is_valid temp___expr_206) true)))

(define-fun dynamic_predicate ((temp___211 us_rep)) Bool (< 0 (to_rep
                                                              (rec__dic_and_predicate_checks__nested_2__r__f
                                                              (us_split_fields1
                                                              temp___211)))))

;; is_valid__post_axiom
  (assert true)

;; is_valid__def_axiom
  (assert
  (forall ((x us_rep))
  (! (= (= (is_valid x) true)
     (< 0 (to_rep
          (rec__dic_and_predicate_checks__nested_2__r__f
          (us_split_fields1 x))))) :pattern ((is_valid x)) )))

(define-fun dynamic_invariant2 ((temp___expr_191 us_rep)
  (temp___is_init_187 Bool) (temp___skip_constant_188 Bool)
  (temp___do_toplevel_189 Bool)
  (temp___do_typ_inv_190 Bool)) Bool (=> (= temp___do_toplevel_189 true)
                                     (=> (= temp___is_init_187 true)
                                     (< 0 (to_rep
                                          (rec__dic_and_predicate_checks__nested_2__r__f
                                          (us_split_fields1 temp___expr_191)))))))

(define-fun dynamic_predicate1 ((temp___196 us_rep)) Bool (< 0 (to_rep
                                                               (rec__dic_and_predicate_checks__nested_2__r__f
                                                               (us_split_fields1
                                                               temp___196)))))

(declare-const usf integer)

(define-fun usf1 () us_rep (us_repqtmk (us_split_fieldsqtmk usf)))

;; H
  (assert
  (forall ((usf2 us_rep)) (is_valid__function_guard (is_valid usf2) usf2)))

;; H
  (assert true)

;; H
  (assert true)

(assert
;; defqtvc
 ;; File "/home/kanig/dev/spark2014/benchmark_script/data/tmp-test-PA12-001__default_checks_on_private-25155/src/gnatprove/dic_and_predicate_checks__nested_2__t.mlw", line 475, characters 5-8
  (not (dynamic_predicate usf1)))
(check-sat)

(exit)
