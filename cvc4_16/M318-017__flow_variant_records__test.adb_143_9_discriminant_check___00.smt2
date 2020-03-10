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

(declare-sort failure_reason 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (failure_reason failure_reason) Bool)

(declare-const dummy1 failure_reason)

(declare-datatypes ((failure_reason__ref 0))
(((failure_reason__refqtmk (failure_reason__content failure_reason)))))
(define-fun failure_reason__ref_failure_reason__content__projection ((a failure_reason__ref)) failure_reason 
  (failure_reason__content a))

(declare-fun to_rep1 (failure_reason) Int)

(declare-fun of_rep1 (Int) failure_reason)

;; inversion_axiom
  (assert
  (forall ((x failure_reason))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x failure_reason)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__test__search_result__found Bool)))))
(define-fun us_split_discrs_rec__test__search_result__found__projection ((a us_split_discrs)) Bool 
  (rec__test__search_result__found a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__3__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__test__search_result__index integer)(rec__test__search_result__reason failure_reason)))))
(define-fun us_split_fields_rec__test__search_result__index__projection ((a us_split_fields)) integer 
  (rec__test__search_result__index a))

(define-fun us_split_fields_rec__test__search_result__reason__projection ((a us_split_fields)) failure_reason 
  (rec__test__search_result__reason a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__4__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__4__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__4__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun test__search_result__index__pred ((a us_rep)) Bool (= (ite 
  (rec__test__search_result__found (us_split_discrs1 a)) 1 0) 1))

(define-fun test__search_result__reason__pred ((a us_rep)) Bool (= (ite 
  (rec__test__search_result__found (us_split_discrs1 a)) 1 0) 0))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__test__search_result__found
                                (us_split_discrs1 a)) 1 0) (ite (rec__test__search_result__found
                                                                (us_split_discrs1
                                                                b)) 1 0))
                        (and
                        (=> (test__search_result__index__pred a)
                        (= (to_rep
                           (rec__test__search_result__index
                           (us_split_fields1 a))) (to_rep
                                                  (rec__test__search_result__index
                                                  (us_split_fields1 b)))))
                        (=> (test__search_result__reason__pred a)
                        (= (to_rep1
                           (rec__test__search_result__reason
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__test__search_result__reason
                                                  (us_split_fields1 b)))))))
                   true false))

(define-fun in_range3 ((rec__test__search_result__found1 Bool)
  (a us_split_discrs)) Bool (= rec__test__search_result__found1 (rec__test__search_result__found
                                                                a)))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const test__search_result__found__first__bit Int)

(declare-const test__search_result__found__last__bit Int)

(declare-const test__search_result__found__position Int)

;; test__search_result__found__first__bit_axiom
  (assert (<= 0 test__search_result__found__first__bit))

;; test__search_result__found__last__bit_axiom
  (assert
  (< test__search_result__found__first__bit test__search_result__found__last__bit))

;; test__search_result__found__position_axiom
  (assert (<= 0 test__search_result__found__position))

(declare-const test__search_result__index__first__bit Int)

(declare-const test__search_result__index__last__bit Int)

(declare-const test__search_result__index__position Int)

;; test__search_result__index__first__bit_axiom
  (assert (<= 0 test__search_result__index__first__bit))

;; test__search_result__index__last__bit_axiom
  (assert
  (< test__search_result__index__first__bit test__search_result__index__last__bit))

;; test__search_result__index__position_axiom
  (assert (<= 0 test__search_result__index__position))

(declare-const test__search_result__reason__first__bit Int)

(declare-const test__search_result__reason__last__bit Int)

(declare-const test__search_result__reason__position Int)

;; test__search_result__reason__first__bit_axiom
  (assert (<= 0 test__search_result__reason__first__bit))

;; test__search_result__reason__last__bit_axiom
  (assert
  (< test__search_result__reason__first__bit test__search_result__reason__last__bit))

;; test__search_result__reason__position_axiom
  (assert (<= 0 test__search_result__reason__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((search_result__ref 0))
(((search_result__refqtmk (search_result__content us_rep)))))
(define-fun search_result__ref_search_result__content__projection ((a search_result__ref)) us_rep 
  (search_result__content a))

(define-fun default_initial_assumption ((temp___expr_242 us_rep)
  (temp___skip_top_level_243 Bool)) Bool (= (rec__test__search_result__found
                                            (us_split_discrs1
                                            temp___expr_242)) (distinct 0 0)))

(declare-const x__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const r42b Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const test__search_result__found__first__bit1 Int)

(declare-const test__search_result__found__last__bit1 Int)

(declare-const test__search_result__found__position1 Int)

;; test__search_result__found__first__bit_axiom
  (assert (<= 0 test__search_result__found__first__bit1))

;; test__search_result__found__last__bit_axiom
  (assert
  (< test__search_result__found__first__bit1 test__search_result__found__last__bit1))

;; test__search_result__found__position_axiom
  (assert (<= 0 test__search_result__found__position1))

(declare-const test__search_result__index__first__bit1 Int)

(declare-const test__search_result__index__last__bit1 Int)

(declare-const test__search_result__index__position1 Int)

;; test__search_result__index__first__bit_axiom
  (assert (<= 0 test__search_result__index__first__bit1))

;; test__search_result__index__last__bit_axiom
  (assert
  (< test__search_result__index__first__bit1 test__search_result__index__last__bit1))

;; test__search_result__index__position_axiom
  (assert (<= 0 test__search_result__index__position1))

(declare-const test__search_result__reason__first__bit1 Int)

(declare-const test__search_result__reason__last__bit1 Int)

(declare-const test__search_result__reason__position1 Int)

;; test__search_result__reason__first__bit_axiom
  (assert (<= 0 test__search_result__reason__first__bit1))

;; test__search_result__reason__last__bit_axiom
  (assert
  (< test__search_result__reason__first__bit1 test__search_result__reason__last__bit1))

;; test__search_result__reason__position_axiom
  (assert (<= 0 test__search_result__reason__position1))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((t43b__ref 0))
(((t43b__refqtmk (t43b__content us_rep)))))
(define-fun t43b__ref_t43b__content__projection ((a t43b__ref)) us_rep 
  (t43b__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant1 ((temp___expr_233 Int)
  (temp___is_init_229 Bool) (temp___skip_constant_230 Bool)
  (temp___do_toplevel_231 Bool)
  (temp___do_typ_inv_232 Bool)) Bool (=>
                                     (or (= temp___is_init_229 true)
                                     (<= 0 2)) (in_range2 temp___expr_233)))

(assert
;; defqtvc
 ;; File "test.adb", line 135, characters 0-0
  (not
  (forall ((x__split_discrs Bool) (o failure_reason))
  (=> (= x__split_discrs r42b)
  (=> (= (to_rep1 o) 2)
  (=> (= x__attr__constrained true) (= (distinct 0 0) x__split_discrs)))))))
(check-sat)
(exit)
