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

(declare-sort count 0)

(declare-fun countqtint (count) Int)

;; count'axiom
  (assert
  (forall ((i count)) (and (<= 0 (countqtint i)) (<= (countqtint i) 64))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 64)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (count count) Bool)

(declare-const dummy count)

(declare-datatypes ((count__ref 0))
(((count__refqtmk (count__content count)))))
(define-fun count__ref_count__content__projection ((a count__ref)) count 
  (count__content a))

(define-fun to_rep ((x count)) Int (countqtint x))

(declare-fun of_rep (Int) count)

;; inversion_axiom
  (assert
  (forall ((x count)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x count)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort group1_id 0)

(declare-fun group1_idqtint (group1_id) Int)

;; group1_id'axiom
  (assert
  (forall ((i group1_id))
  (and (<= 1 (group1_idqtint i)) (<= (group1_idqtint i) 64))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 64)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (group1_id group1_id) Bool)

(declare-const dummy1 group1_id)

(declare-datatypes ((group1_id__ref 0))
(((group1_id__refqtmk (group1_id__content group1_id)))))
(define-fun group1_id__ref_group1_id__content__projection ((a group1_id__ref)) group1_id 
  (group1_id__content a))

(define-fun to_rep1 ((x group1_id)) Int (group1_idqtint x))

(declare-fun of_rep1 (Int) group1_id)

;; inversion_axiom
  (assert
  (forall ((x group1_id))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x group1_id)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int group1_id))))))
(declare-fun slide ((Array Int group1_id) Int Int) (Array Int group1_id))

;; slide_eq
  (assert
  (forall ((a (Array Int group1_id)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int group1_id)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int group1_id)) (a__first Int) (a__last Int)
  (b (Array Int group1_id)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int group1_id)) (b (Array Int group1_id)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const dummy2 (Array Int group1_id))

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

(declare-fun user_eq2 ((Array Int group1_id) (Array Int group1_id)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__stable_marriage__matching__group1_set__elements (Array Int group1_id))(rec__stable_marriage__matching__group1_set__cardinality count)))))
(define-fun us_split_fields_rec__stable_marriage__matching__group1_set__elements__projection ((a us_split_fields)) (Array Int group1_id) 
  (rec__stable_marriage__matching__group1_set__elements a))

(define-fun us_split_fields_rec__stable_marriage__matching__group1_set__cardinality__projection ((a us_split_fields)) count 
  (rec__stable_marriage__matching__group1_set__cardinality a))

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
                        (= (bool_eq
                           (rec__stable_marriage__matching__group1_set__elements
                           (us_split_fields1 a)) 1 64
                           (rec__stable_marriage__matching__group1_set__elements
                           (us_split_fields1 b)) 1 64) true)
                        (= (to_rep
                           (rec__stable_marriage__matching__group1_set__cardinality
                           (us_split_fields1 a))) (to_rep
                                                  (rec__stable_marriage__matching__group1_set__cardinality
                                                  (us_split_fields1 b)))))
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

(declare-const stable_marriage__matching__group1_set__elements__first__bit Int)

(declare-const stable_marriage__matching__group1_set__elements__last__bit Int)

(declare-const stable_marriage__matching__group1_set__elements__position Int)

;; stable_marriage__matching__group1_set__elements__first__bit_axiom
  (assert (<= 0 stable_marriage__matching__group1_set__elements__first__bit))

;; stable_marriage__matching__group1_set__elements__last__bit_axiom
  (assert
  (< stable_marriage__matching__group1_set__elements__first__bit stable_marriage__matching__group1_set__elements__last__bit))

;; stable_marriage__matching__group1_set__elements__position_axiom
  (assert (<= 0 stable_marriage__matching__group1_set__elements__position))

(declare-const stable_marriage__matching__group1_set__cardinality__first__bit Int)

(declare-const stable_marriage__matching__group1_set__cardinality__last__bit Int)

(declare-const stable_marriage__matching__group1_set__cardinality__position Int)

;; stable_marriage__matching__group1_set__cardinality__first__bit_axiom
  (assert
  (<= 0 stable_marriage__matching__group1_set__cardinality__first__bit))

;; stable_marriage__matching__group1_set__cardinality__last__bit_axiom
  (assert
  (< stable_marriage__matching__group1_set__cardinality__first__bit stable_marriage__matching__group1_set__cardinality__last__bit))

;; stable_marriage__matching__group1_set__cardinality__position_axiom
  (assert
  (<= 0 stable_marriage__matching__group1_set__cardinality__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((group1_set__ref 0))
(((group1_set__refqtmk (group1_set__content us_rep)))))
(define-fun group1_set__ref_group1_set__content__projection ((a group1_set__ref)) us_rep 
  (group1_set__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 1 (indexqtint i)) (<= (indexqtint i) 64))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 64)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (index index) Bool)

(declare-const dummy4 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun dynamic_invariant ((temp___expr_377 Int)
  (temp___is_init_373 Bool) (temp___skip_constant_374 Bool)
  (temp___do_toplevel_375 Bool)
  (temp___do_typ_inv_376 Bool)) Bool (=>
                                     (or (= temp___is_init_373 true)
                                     (<= 0 64)) (in_range1 temp___expr_377)))

(define-fun dynamic_invariant1 ((temp___expr_384 Int)
  (temp___is_init_380 Bool) (temp___skip_constant_381 Bool)
  (temp___do_toplevel_382 Bool)
  (temp___do_typ_inv_383 Bool)) Bool (=>
                                     (or (= temp___is_init_380 true)
                                     (<= 1 64)) (in_range3 temp___expr_384)))

(define-fun dynamic_invariant2 ((temp___expr_177 Int)
  (temp___is_init_173 Bool) (temp___skip_constant_174 Bool)
  (temp___do_toplevel_175 Bool)
  (temp___do_typ_inv_176 Bool)) Bool (=>
                                     (or (= temp___is_init_173 true)
                                     (<= 1 64)) (in_range2 temp___expr_177)))

(assert
;; defqtvc
 ;; File "stable_marriage.adb", line 185, characters 0-0
  (not
  (forall ((unmatched_g1_set__split_fields us_split_fields) (usf Int) (o Int)
  (usf1 Int) (o1 Int))
  (=>
  (= (to_rep
     (rec__stable_marriage__matching__group1_set__cardinality
     unmatched_g1_set__split_fields)) o)
  (=> (= (and (ite (<= 1 usf) true false) (ite (<= usf o) true false)) true)
  (=>
  (= (to_rep
     (rec__stable_marriage__matching__group1_set__cardinality
     unmatched_g1_set__split_fields)) o1)
  (=>
  (= (and (ite (<= 1 usf1) true false) (ite (<= usf1 o1) true false)) true)
  (=> (not (= usf usf1)) (=> (<= 1 usf1) (=> (<= usf1 64) (<= 1 usf)))))))))))
(check-sat)
(exit)
