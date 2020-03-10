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

(declare-const dummy1 (Array Int integer))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq1 ((Array Int integer) (Array Int integer)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__use_unchecked_union__small_record__field1 integer)(rec__use_unchecked_union__small_record__field2 (Array Int integer))))))
(define-fun us_split_fields_rec__use_unchecked_union__small_record__field1__projection ((a us_split_fields)) integer 
  (rec__use_unchecked_union__small_record__field1 a))

(define-fun us_split_fields_rec__use_unchecked_union__small_record__field2__projection ((a us_split_fields)) (Array Int integer) 
  (rec__use_unchecked_union__small_record__field2 a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__use_unchecked_union__small_record__field1
                           (us_split_fields1 a))) (to_rep
                                                  (rec__use_unchecked_union__small_record__field1
                                                  (us_split_fields1 b))))
                        (= (bool_eq
                           (rec__use_unchecked_union__small_record__field2
                           (us_split_fields1 a)) 0 2
                           (rec__use_unchecked_union__small_record__field2
                           (us_split_fields1 b)) 0 2) true))
                   true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const use_unchecked_union__small_record__field1__first__bit Int)

(declare-const use_unchecked_union__small_record__field1__last__bit Int)

(declare-const use_unchecked_union__small_record__field1__position Int)

;; use_unchecked_union__small_record__field1__first__bit_axiom
  (assert (<= 0 use_unchecked_union__small_record__field1__first__bit))

;; use_unchecked_union__small_record__field1__last__bit_axiom
  (assert
  (< use_unchecked_union__small_record__field1__first__bit use_unchecked_union__small_record__field1__last__bit))

;; use_unchecked_union__small_record__field1__position_axiom
  (assert (<= 0 use_unchecked_union__small_record__field1__position))

(declare-const use_unchecked_union__small_record__field2__first__bit Int)

(declare-const use_unchecked_union__small_record__field2__last__bit Int)

(declare-const use_unchecked_union__small_record__field2__position Int)

;; use_unchecked_union__small_record__field2__first__bit_axiom
  (assert (<= 0 use_unchecked_union__small_record__field2__first__bit))

;; use_unchecked_union__small_record__field2__last__bit_axiom
  (assert
  (< use_unchecked_union__small_record__field2__first__bit use_unchecked_union__small_record__field2__last__bit))

;; use_unchecked_union__small_record__field2__position_axiom
  (assert (<= 0 use_unchecked_union__small_record__field2__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((small_record__ref 0))
(((small_record__refqtmk (small_record__content us_rep)))))
(define-fun small_record__ref_small_record__content__projection ((a small_record__ref)) us_rep 
  (small_record__content a))

(declare-const dummy3 (Array Int integer))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size1 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq3 ((Array Int integer) (Array Int integer)) Bool)

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__use_unchecked_union__big_record__field1 integer)(rec__use_unchecked_union__big_record__field2 (Array Int integer))))))
(define-fun us_split_fields_rec__use_unchecked_union__big_record__field1__projection ((a us_split_fields2)) integer 
  (rec__use_unchecked_union__big_record__field1 a))

(define-fun us_split_fields_rec__use_unchecked_union__big_record__field2__projection ((a us_split_fields2)) (Array Int integer) 
  (rec__use_unchecked_union__big_record__field2 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq2 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__use_unchecked_union__big_record__field1
                            (us_split_fields3 a))) (to_rep
                                                   (rec__use_unchecked_union__big_record__field1
                                                   (us_split_fields3 b))))
                         (= (bool_eq
                            (rec__use_unchecked_union__big_record__field2
                            (us_split_fields3 a)) 0 3
                            (rec__use_unchecked_union__big_record__field2
                            (us_split_fields3 b)) 0 3) true))
                    true false))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const use_unchecked_union__big_record__field1__first__bit Int)

(declare-const use_unchecked_union__big_record__field1__last__bit Int)

(declare-const use_unchecked_union__big_record__field1__position Int)

;; use_unchecked_union__big_record__field1__first__bit_axiom
  (assert (<= 0 use_unchecked_union__big_record__field1__first__bit))

;; use_unchecked_union__big_record__field1__last__bit_axiom
  (assert
  (< use_unchecked_union__big_record__field1__first__bit use_unchecked_union__big_record__field1__last__bit))

;; use_unchecked_union__big_record__field1__position_axiom
  (assert (<= 0 use_unchecked_union__big_record__field1__position))

(declare-const use_unchecked_union__big_record__field2__first__bit Int)

(declare-const use_unchecked_union__big_record__field2__last__bit Int)

(declare-const use_unchecked_union__big_record__field2__position Int)

;; use_unchecked_union__big_record__field2__first__bit_axiom
  (assert (<= 0 use_unchecked_union__big_record__field2__first__bit))

;; use_unchecked_union__big_record__field2__last__bit_axiom
  (assert
  (< use_unchecked_union__big_record__field2__first__bit use_unchecked_union__big_record__field2__last__bit))

;; use_unchecked_union__big_record__field2__position_axiom
  (assert (<= 0 use_unchecked_union__big_record__field2__position))

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ((big_record__ref 0))
(((big_record__refqtmk (big_record__content us_rep1)))))
(define-fun big_record__ref_big_record__content__projection ((a big_record__ref)) us_rep1 
  (big_record__content a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__use_unchecked_union__myunion__discr integer)))))
(define-fun us_split_discrs_rec__use_unchecked_union__myunion__discr__projection ((a us_split_discrs)) integer 
  (rec__use_unchecked_union__myunion__discr a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields4 0))
(((us_split_fieldsqtmk2
  (rec__use_unchecked_union__myunion__record1 us_rep)(rec__use_unchecked_union__myunion__record2 us_rep1)))))
(define-fun us_split_fields_rec__use_unchecked_union__myunion__record1__projection ((a us_split_fields4)) us_rep 
  (rec__use_unchecked_union__myunion__record1 a))

(define-fun us_split_fields_rec__use_unchecked_union__myunion__record2__projection ((a us_split_fields4)) us_rep1 
  (rec__use_unchecked_union__myunion__record2 a))

(declare-datatypes ((us_split_fields__ref2 0))
(((us_split_fields__refqtmk2 (us_split_fields__content2 us_split_fields4)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref2)) us_split_fields4 
  (us_split_fields__content2 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2
  (us_split_discrs1 us_split_discrs)(us_split_fields5 us_split_fields4)))))
(define-fun us_rep___split_discrs__projection ((a us_rep2)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__3__projection ((a us_rep2)) us_split_fields4 
  (us_split_fields5 a))

(define-fun use_unchecked_union__myunion__record1__pred ((a us_rep2)) Bool (= 
  (to_rep (rec__use_unchecked_union__myunion__discr (us_split_discrs1 a))) 0))

(define-fun use_unchecked_union__myunion__record2__pred ((a us_rep2)) Bool 
  (not
  (= (to_rep (rec__use_unchecked_union__myunion__discr (us_split_discrs1 a))) 0)))

(define-fun bool_eq3 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (to_rep
                            (rec__use_unchecked_union__myunion__discr
                            (us_split_discrs1 a))) (to_rep
                                                   (rec__use_unchecked_union__myunion__discr
                                                   (us_split_discrs1 b))))
                         (and
                         (=> (use_unchecked_union__myunion__record1__pred a)
                         (= (bool_eq1
                            (rec__use_unchecked_union__myunion__record1
                            (us_split_fields5 a))
                            (rec__use_unchecked_union__myunion__record1
                            (us_split_fields5 b))) true))
                         (=> (use_unchecked_union__myunion__record2__pred a)
                         (= (bool_eq2
                            (rec__use_unchecked_union__myunion__record2
                            (us_split_fields5 a))
                            (rec__use_unchecked_union__myunion__record2
                            (us_split_fields5 b))) true))))
                    true false))

(define-fun in_range1 ((rec__use_unchecked_union__myunion__discr1 Int)
  (a us_split_discrs)) Bool (= rec__use_unchecked_union__myunion__discr1 
  (to_rep (rec__use_unchecked_union__myunion__discr a))))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-const use_unchecked_union__myunion__discr__first__bit Int)

(declare-const use_unchecked_union__myunion__discr__last__bit Int)

(declare-const use_unchecked_union__myunion__discr__position Int)

;; use_unchecked_union__myunion__discr__first__bit_axiom
  (assert (<= 0 use_unchecked_union__myunion__discr__first__bit))

;; use_unchecked_union__myunion__discr__last__bit_axiom
  (assert
  (< use_unchecked_union__myunion__discr__first__bit use_unchecked_union__myunion__discr__last__bit))

;; use_unchecked_union__myunion__discr__position_axiom
  (assert (<= 0 use_unchecked_union__myunion__discr__position))

(declare-const use_unchecked_union__myunion__record1__first__bit Int)

(declare-const use_unchecked_union__myunion__record1__last__bit Int)

(declare-const use_unchecked_union__myunion__record1__position Int)

;; use_unchecked_union__myunion__record1__first__bit_axiom
  (assert (<= 0 use_unchecked_union__myunion__record1__first__bit))

;; use_unchecked_union__myunion__record1__last__bit_axiom
  (assert
  (< use_unchecked_union__myunion__record1__first__bit use_unchecked_union__myunion__record1__last__bit))

;; use_unchecked_union__myunion__record1__position_axiom
  (assert (<= 0 use_unchecked_union__myunion__record1__position))

(declare-const use_unchecked_union__myunion__record2__first__bit Int)

(declare-const use_unchecked_union__myunion__record2__last__bit Int)

(declare-const use_unchecked_union__myunion__record2__position Int)

;; use_unchecked_union__myunion__record2__first__bit_axiom
  (assert (<= 0 use_unchecked_union__myunion__record2__first__bit))

;; use_unchecked_union__myunion__record2__last__bit_axiom
  (assert
  (< use_unchecked_union__myunion__record2__first__bit use_unchecked_union__myunion__record2__last__bit))

;; use_unchecked_union__myunion__record2__position_axiom
  (assert (<= 0 use_unchecked_union__myunion__record2__position))

(declare-fun user_eq5 (us_rep2 us_rep2) Bool)

(declare-const dummy5 us_rep2)

(declare-datatypes ((myunion__ref 0))
(((myunion__refqtmk (myunion__content us_rep2)))))
(define-fun myunion__ref_myunion__content__projection ((a myunion__ref)) us_rep2 
  (myunion__content a))

(declare-fun temp_____aggregate_def_183 (Int Int Int) (Array Int integer))

(declare-fun temp_____aggregate_def_197 (Int Int Int
  Int) (Array Int integer))

(define-fun default_initial_assumption ((temp___expr_212 us_rep2)
  (temp___skip_top_level_213 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__use_unchecked_union__myunion__discr
                                            (us_split_discrs1
                                            temp___expr_212))) 0)
                                         (and
                                         (=>
                                         (use_unchecked_union__myunion__record1__pred
                                         temp___expr_212)
                                         (and
                                         (= (to_rep
                                            (rec__use_unchecked_union__small_record__field1
                                            (us_split_fields1
                                            (rec__use_unchecked_union__myunion__record1
                                            (us_split_fields5
                                            temp___expr_212))))) 0)
                                         (= (rec__use_unchecked_union__small_record__field2
                                            (us_split_fields1
                                            (rec__use_unchecked_union__myunion__record1
                                            (us_split_fields5
                                            temp___expr_212)))) (temp_____aggregate_def_183
                                                                0 0 0))))
                                         (=>
                                         (use_unchecked_union__myunion__record2__pred
                                         temp___expr_212)
                                         (and
                                         (= (to_rep
                                            (rec__use_unchecked_union__big_record__field1
                                            (us_split_fields3
                                            (rec__use_unchecked_union__myunion__record2
                                            (us_split_fields5
                                            temp___expr_212))))) 0)
                                         (= (rec__use_unchecked_union__big_record__field2
                                            (us_split_fields3
                                            (rec__use_unchecked_union__myunion__record2
                                            (us_split_fields5
                                            temp___expr_212)))) (temp_____aggregate_def_197
                                                                0 0 0 0)))))))

(declare-const output__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const num Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun temp_____aggregate_def_262 (Int Int Int) (Array Int integer))

(declare-fun temp_____aggregate_def_274 (Int Int Int
  Int) (Array Int integer))

(declare-fun temp_____aggregate_def_287 (Int) (Array Int integer))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 1))

(declare-const rliteral1 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral1) 2))

(declare-const rliteral2 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral2) 3))

;; def_axiom
  (assert
  (forall ((temp___264 Int) (temp___265 Int) (temp___266 Int))
  (let ((temp___263 (temp_____aggregate_def_262 temp___264 temp___265
                    temp___266)))
  (=>
  (and
  (and (dynamic_invariant temp___264 true true true true) (dynamic_invariant
  temp___265 true true true true)) (dynamic_invariant temp___266 true true
  true true))
  (and
  (and (= (select temp___263 0) rliteral)
  (= (select temp___263 1) rliteral1)) (= (select temp___263 2) rliteral2))))))

(declare-const rliteral3 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral3) 4))

;; def_axiom
  (assert
  (forall ((temp___276 Int) (temp___277 Int) (temp___278 Int)
  (temp___279 Int))
  (let ((temp___275 (temp_____aggregate_def_274 temp___276 temp___277
                    temp___278 temp___279)))
  (=>
  (and
  (and (dynamic_invariant temp___276 true true true true) (dynamic_invariant
  temp___277 true true true true))
  (and (dynamic_invariant temp___278 true true true true) (dynamic_invariant
  temp___279 true true true true)))
  (and
  (and (= (select temp___275 0) rliteral)
  (= (select temp___275 1) rliteral1))
  (and (= (select temp___275 2) rliteral2)
  (= (select temp___275 3) rliteral3)))))))

(declare-const rliteral4 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral4) 0))

;; def_axiom
  (assert
  (forall ((temp___289 Int))
  (=> (dynamic_invariant temp___289 true true true true)
  (forall ((temp___290 Int))
  (= (select (temp_____aggregate_def_287 temp___289) temp___290) rliteral4)))))

(define-fun default_initial_assumption1 ((temp___expr_181 us_rep)
  (temp___skip_top_level_182 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__use_unchecked_union__small_record__field1
                                            (us_split_fields1
                                            temp___expr_181))) 0)
                                         (= (rec__use_unchecked_union__small_record__field2
                                            (us_split_fields1
                                            temp___expr_181)) (temp_____aggregate_def_183
                                                              0 0 0))))

;; def_axiom
  (assert
  (forall ((temp___185 Int) (temp___186 Int) (temp___187 Int))
  (let ((temp___184 (temp_____aggregate_def_183 temp___185 temp___186
                    temp___187)))
  (=>
  (and
  (and (dynamic_invariant temp___185 true true true true) (dynamic_invariant
  temp___186 true true true true)) (dynamic_invariant temp___187 true true
  true true))
  (and
  (and (= (select temp___184 0) rliteral4)
  (= (select temp___184 1) rliteral4)) (= (select temp___184 2) rliteral4))))))

(define-fun default_initial_assumption2 ((temp___expr_195 us_rep1)
  (temp___skip_top_level_196 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__use_unchecked_union__big_record__field1
                                            (us_split_fields3
                                            temp___expr_195))) 0)
                                         (= (rec__use_unchecked_union__big_record__field2
                                            (us_split_fields3
                                            temp___expr_195)) (temp_____aggregate_def_197
                                                              0 0 0 0))))

;; def_axiom
  (assert
  (forall ((temp___199 Int) (temp___200 Int) (temp___201 Int)
  (temp___202 Int))
  (let ((temp___198 (temp_____aggregate_def_197 temp___199 temp___200
                    temp___201 temp___202)))
  (=>
  (and
  (and (dynamic_invariant temp___199 true true true true) (dynamic_invariant
  temp___200 true true true true))
  (and (dynamic_invariant temp___201 true true true true) (dynamic_invariant
  temp___202 true true true true)))
  (and
  (and (= (select temp___198 0) rliteral4)
  (= (select temp___198 1) rliteral4))
  (and (= (select temp___198 2) rliteral4)
  (= (select temp___198 3) rliteral4)))))))

(assert
;; defqtvc
 ;; File "use_unchecked_union.ads", line 33, characters 0-0
  (not
  (forall ((output__split_fields us_split_fields4)
  (output__split_discrs integer) (spark__branch Bool) (spark__branch1 Bool))
  (=> (dynamic_invariant num true false true true)
  (=> (= spark__branch (ite (= num 0) true false))
  (=> (not (= spark__branch true))
  (=> (= spark__branch1 (ite (= num 1) true false))
  (=> (not (= spark__branch1 true))
  (use_unchecked_union__myunion__record2__pred
  (us_repqtmk2 (us_split_discrsqtmk output__split_discrs)
  output__split_fields))))))))))
(check-sat)
(exit)
