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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort extended_index_type 0)

(declare-fun extended_index_typeqtint (extended_index_type) Int)

;; extended_index_type'axiom
  (assert
  (forall ((i extended_index_type))
  (and (<= 0 (extended_index_typeqtint i))
  (<= (extended_index_typeqtint i) 100))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (extended_index_type extended_index_type) Bool)

(declare-const dummy extended_index_type)

(declare-datatypes ()
((extended_index_type__ref
 (extended_index_type__refqtmk
 (extended_index_type__content extended_index_type)))))
(define-fun extended_index_type__ref_extended_index_type__content__projection ((a extended_index_type__ref)) extended_index_type 
  (extended_index_type__content a))

(define-fun to_rep ((x extended_index_type)) Int (extended_index_typeqtint x))

(declare-fun of_rep (Int) extended_index_type)

;; inversion_axiom
  (assert
  (forall ((x extended_index_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x extended_index_type)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort position_type 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (position_type position_type) Bool)

(declare-const dummy1 position_type)

(declare-datatypes ()
((position_type__ref
 (position_type__refqtmk (position_type__content position_type)))))
(define-fun position_type__ref_position_type__content__projection ((a position_type__ref)) position_type 
  (position_type__content a))

(declare-fun to_rep1 (position_type) Int)

(declare-fun of_rep1 (Int) position_type)

;; inversion_axiom
  (assert
  (forall ((x position_type))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x position_type)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__binary_trees__cell__left extended_index_type)(rec__binary_trees__cell__right extended_index_type)(rec__binary_trees__cell__parent extended_index_type)(rec__binary_trees__cell__position position_type)))))
(define-fun us_split_fields_rec__binary_trees__cell__left__projection ((a us_split_fields)) extended_index_type 
  (rec__binary_trees__cell__left a))

(define-fun us_split_fields_rec__binary_trees__cell__right__projection ((a us_split_fields)) extended_index_type 
  (rec__binary_trees__cell__right a))

(define-fun us_split_fields_rec__binary_trees__cell__parent__projection ((a us_split_fields)) extended_index_type 
  (rec__binary_trees__cell__parent a))

(define-fun us_split_fields_rec__binary_trees__cell__position__projection ((a us_split_fields)) position_type 
  (rec__binary_trees__cell__position a))

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
                        (= (to_rep
                           (rec__binary_trees__cell__left
                           (us_split_fields1 a))) (to_rep
                                                  (rec__binary_trees__cell__left
                                                  (us_split_fields1 b))))
                        (= (to_rep
                           (rec__binary_trees__cell__right
                           (us_split_fields1 a))) (to_rep
                                                  (rec__binary_trees__cell__right
                                                  (us_split_fields1 b)))))
                        (and
                        (= (to_rep
                           (rec__binary_trees__cell__parent
                           (us_split_fields1 a))) (to_rep
                                                  (rec__binary_trees__cell__parent
                                                  (us_split_fields1 b))))
                        (= (to_rep1
                           (rec__binary_trees__cell__position
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__binary_trees__cell__position
                                                  (us_split_fields1 b))))))
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

(declare-const binary_trees__cell__left__first__bit Int)

(declare-const binary_trees__cell__left__last__bit Int)

(declare-const binary_trees__cell__left__position Int)

;; binary_trees__cell__left__first__bit_axiom
  (assert (<= 0 binary_trees__cell__left__first__bit))

;; binary_trees__cell__left__last__bit_axiom
  (assert
  (< binary_trees__cell__left__first__bit binary_trees__cell__left__last__bit))

;; binary_trees__cell__left__position_axiom
  (assert (<= 0 binary_trees__cell__left__position))

(declare-const binary_trees__cell__right__first__bit Int)

(declare-const binary_trees__cell__right__last__bit Int)

(declare-const binary_trees__cell__right__position Int)

;; binary_trees__cell__right__first__bit_axiom
  (assert (<= 0 binary_trees__cell__right__first__bit))

;; binary_trees__cell__right__last__bit_axiom
  (assert
  (< binary_trees__cell__right__first__bit binary_trees__cell__right__last__bit))

;; binary_trees__cell__right__position_axiom
  (assert (<= 0 binary_trees__cell__right__position))

(declare-const binary_trees__cell__parent__first__bit Int)

(declare-const binary_trees__cell__parent__last__bit Int)

(declare-const binary_trees__cell__parent__position Int)

;; binary_trees__cell__parent__first__bit_axiom
  (assert (<= 0 binary_trees__cell__parent__first__bit))

;; binary_trees__cell__parent__last__bit_axiom
  (assert
  (< binary_trees__cell__parent__first__bit binary_trees__cell__parent__last__bit))

;; binary_trees__cell__parent__position_axiom
  (assert (<= 0 binary_trees__cell__parent__position))

(declare-const binary_trees__cell__position__first__bit Int)

(declare-const binary_trees__cell__position__last__bit Int)

(declare-const binary_trees__cell__position__position Int)

;; binary_trees__cell__position__first__bit_axiom
  (assert (<= 0 binary_trees__cell__position__first__bit))

;; binary_trees__cell__position__last__bit_axiom
  (assert
  (< binary_trees__cell__position__first__bit binary_trees__cell__position__last__bit))

;; binary_trees__cell__position__position_axiom
  (assert (<= 0 binary_trees__cell__position__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes () ((cell__ref (cell__refqtmk (cell__content us_rep)))))
(define-fun cell__ref_cell__content__projection ((a cell__ref)) us_rep 
  (cell__content a))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int us_rep))))))
(declare-fun slide ((Array Int us_rep) Int Int) (Array Int us_rep))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int us_rep)) (a__first Int) (a__last Int)
  (b (Array Int us_rep)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (bool_eq (select a temp___idx_154)
                              (select b (+ (- b__first a__first) temp___idx_154))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep)) (b (Array Int us_rep)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (bool_eq (select a temp___idx_154)
     (select b (+ (- b__first a__first) temp___idx_154))) true))))))))

(declare-const dummy3 (Array Int us_rep))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq3 ((Array Int us_rep) (Array Int us_rep)) Bool)

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1
 (rec__binary_trees__forest__s extended_index_type)(rec__binary_trees__forest__c (Array Int us_rep))))))
(define-fun us_split_fields_rec__binary_trees__forest__s__projection ((a us_split_fields2)) extended_index_type 
  (rec__binary_trees__forest__s a))

(define-fun us_split_fields_rec__binary_trees__forest__c__projection ((a us_split_fields2)) (Array Int us_rep) 
  (rec__binary_trees__forest__c a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep1 (us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq2 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__binary_trees__forest__s
                            (us_split_fields3 a))) (to_rep
                                                   (rec__binary_trees__forest__s
                                                   (us_split_fields3 b))))
                         (= (bool_eq1
                            (rec__binary_trees__forest__c
                            (us_split_fields3 a)) 1 100
                            (rec__binary_trees__forest__c
                            (us_split_fields3 b)) 1 100) true))
                    true false))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const binary_trees__forest__s__first__bit Int)

(declare-const binary_trees__forest__s__last__bit Int)

(declare-const binary_trees__forest__s__position Int)

;; binary_trees__forest__s__first__bit_axiom
  (assert (<= 0 binary_trees__forest__s__first__bit))

;; binary_trees__forest__s__last__bit_axiom
  (assert
  (< binary_trees__forest__s__first__bit binary_trees__forest__s__last__bit))

;; binary_trees__forest__s__position_axiom
  (assert (<= 0 binary_trees__forest__s__position))

(declare-const binary_trees__forest__c__first__bit Int)

(declare-const binary_trees__forest__c__last__bit Int)

(declare-const binary_trees__forest__c__position Int)

;; binary_trees__forest__c__first__bit_axiom
  (assert (<= 0 binary_trees__forest__c__first__bit))

;; binary_trees__forest__c__last__bit_axiom
  (assert
  (< binary_trees__forest__c__first__bit binary_trees__forest__c__last__bit))

;; binary_trees__forest__c__position_axiom
  (assert (<= 0 binary_trees__forest__c__position))

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ()
((forest__ref (forest__refqtmk (forest__content us_rep1)))))
(define-fun forest__ref_forest__content__projection ((a forest__ref)) us_rep1 
  (forest__content a))

(declare-const f us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq5 (index_type index_type) Bool)

(declare-const dummy5 index_type)

(declare-datatypes ()
((index_type__ref (index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(declare-fun size (us_rep1) Int)

(declare-fun size__function_guard (Int us_rep1) Bool)

(declare-fun tree_structure (us_rep1) Bool)

(declare-fun tree_structure__function_guard (Bool us_rep1) Bool)

(define-fun default_initial_assumption ((temp___expr_229 us_rep1)
  (temp___skip_top_level_230 Bool)) Bool (and
                                         (and
                                         (= (to_rep
                                            (rec__binary_trees__forest__s
                                            (us_split_fields3
                                            temp___expr_229))) 0)
                                         (forall ((temp___232 Int))
                                         (=>
                                         (and (<= 1 temp___232)
                                         (<= temp___232 100))
                                         (and
                                         (and
                                         (= (to_rep
                                            (rec__binary_trees__cell__left
                                            (us_split_fields1
                                            (select (rec__binary_trees__forest__c
                                                    (us_split_fields3
                                                    temp___expr_229)) temp___232)))) 0)
                                         (= (to_rep
                                            (rec__binary_trees__cell__right
                                            (us_split_fields1
                                            (select (rec__binary_trees__forest__c
                                                    (us_split_fields3
                                                    temp___expr_229)) temp___232)))) 0))
                                         (and
                                         (= (to_rep
                                            (rec__binary_trees__cell__parent
                                            (us_split_fields1
                                            (select (rec__binary_trees__forest__c
                                                    (us_split_fields3
                                                    temp___expr_229)) temp___232)))) 0)
                                         (= (to_rep1
                                            (rec__binary_trees__cell__position
                                            (us_split_fields1
                                            (select (rec__binary_trees__forest__c
                                                    (us_split_fields3
                                                    temp___expr_229)) temp___232)))) 2))))))
                                         (=>
                                         (not
                                         (= temp___skip_top_level_230 true))
                                         (= (size temp___expr_229) 0))))

(define-fun type_invariant ((temp___235 us_rep1)) Bool (= (tree_structure
                                                          temp___235) true))

(define-fun dynamic_invariant ((temp___expr_182 Int)
  (temp___is_init_178 Bool) (temp___skip_constant_179 Bool)
  (temp___do_toplevel_180 Bool)
  (temp___do_typ_inv_181 Bool)) Bool (=>
                                     (or (= temp___is_init_178 true)
                                     (<= 0 100)) (in_range1 temp___expr_182)))

;; size__post_axiom
  (assert
  (forall ((f1 us_rep1))
  (! (=> (type_invariant f1) (dynamic_invariant (size f1) true false true
     true)) :pattern ((size f1)) )))

;; size__def_axiom
  (assert
  (forall ((f1 us_rep1))
  (! (= (size f1) (to_rep
                  (rec__binary_trees__forest__s (us_split_fields3 f1)))) :pattern (
  (size f1)) )))

(define-fun default_initial_assumption1 ((temp___expr_211 us_rep)
  (temp___skip_top_level_212 Bool)) Bool (and
                                         (and
                                         (= (to_rep
                                            (rec__binary_trees__cell__left
                                            (us_split_fields1
                                            temp___expr_211))) 0)
                                         (= (to_rep
                                            (rec__binary_trees__cell__right
                                            (us_split_fields1
                                            temp___expr_211))) 0))
                                         (and
                                         (= (to_rep
                                            (rec__binary_trees__cell__parent
                                            (us_split_fields1
                                            temp___expr_211))) 0)
                                         (= (to_rep1
                                            (rec__binary_trees__cell__position
                                            (us_split_fields1
                                            temp___expr_211))) 2))))

(define-fun default_initial_assumption2 ((temp___expr_219 (Array Int us_rep))
  (temp___skip_top_level_220 Bool)) Bool (forall ((temp___221 Int))
                                         (=>
                                         (and (<= 1 temp___221)
                                         (<= temp___221 100))
                                         (and
                                         (and
                                         (= (to_rep
                                            (rec__binary_trees__cell__left
                                            (us_split_fields1
                                            (select temp___expr_219 temp___221)))) 0)
                                         (= (to_rep
                                            (rec__binary_trees__cell__right
                                            (us_split_fields1
                                            (select temp___expr_219 temp___221)))) 0))
                                         (and
                                         (= (to_rep
                                            (rec__binary_trees__cell__parent
                                            (us_split_fields1
                                            (select temp___expr_219 temp___221)))) 0)
                                         (= (to_rep1
                                            (rec__binary_trees__cell__position
                                            (us_split_fields1
                                            (select temp___expr_219 temp___221)))) 2))))))

;; tree_structure__post_axiom
  (assert true)

(declare-const rliteral extended_index_type)

;; rliteral_axiom
  (assert (= (extended_index_typeqtint rliteral) 0))

;; tree_structure__def_axiom
  (assert
  (forall ((f1 us_rep1))
  (! (= (= (tree_structure f1) true)
     (and
     (and
     (and
     (and
     (and
     (and
     (and
     (and
     (forall ((i Int))
     (=>
     (and
     (<= (+ (to_rep (rec__binary_trees__forest__s (us_split_fields3 f1))) 1) i)
     (<= i 100))
     (= (bool_eq
        (let ((temp___268 (rec__binary_trees__forest__c
                          (us_split_fields3 f1))))
        (select temp___268 i))
        (us_repqtmk
        (us_split_fieldsqtmk rliteral rliteral rliteral (of_rep1 2)))) true)))
     (forall ((i Int))
     (=> (and (<= 1 i) (<= i 100))
     (let ((temp___272 (to_rep
                       (rec__binary_trees__cell__parent
                       (us_split_fields1
                       (let ((temp___271 (rec__binary_trees__forest__c
                                         (us_split_fields3 f1))))
                       (select temp___271 i)))))))
     (and (<= 0 temp___272)
     (<= temp___272 (to_rep
                    (rec__binary_trees__forest__s (us_split_fields3 f1)))))))))
     (forall ((i Int))
     (=> (and (<= 1 i) (<= i 100))
     (let ((temp___274 (to_rep
                       (rec__binary_trees__cell__left
                       (us_split_fields1
                       (let ((temp___273 (rec__binary_trees__forest__c
                                         (us_split_fields3 f1))))
                       (select temp___273 i)))))))
     (and (<= 0 temp___274)
     (<= temp___274 (to_rep
                    (rec__binary_trees__forest__s (us_split_fields3 f1)))))))))
     (forall ((i Int))
     (=> (and (<= 1 i) (<= i 100))
     (let ((temp___276 (to_rep
                       (rec__binary_trees__cell__right
                       (us_split_fields1
                       (let ((temp___275 (rec__binary_trees__forest__c
                                         (us_split_fields3 f1))))
                       (select temp___275 i)))))))
     (and (<= 0 temp___276)
     (<= temp___276 (to_rep
                    (rec__binary_trees__forest__s (us_split_fields3 f1)))))))))
     (forall ((i Int))
     (=> (and (<= 1 i) (<= i 100))
     (=>
     (= (to_rep1
        (rec__binary_trees__cell__position
        (us_split_fields1
        (let ((temp___278 (rec__binary_trees__forest__c
                          (us_split_fields3 f1))))
        (select temp___278 i))))) 2)
     (= (to_rep
        (rec__binary_trees__cell__parent
        (us_split_fields1
        (let ((temp___277 (rec__binary_trees__forest__c
                          (us_split_fields3 f1))))
        (select temp___277 i))))) 0)))))
     (forall ((i Int))
     (=> (and (<= 1 i) (<= i 100))
     (=>
     (not
     (= (to_rep
        (rec__binary_trees__cell__left
        (us_split_fields1
        (let ((temp___283 (rec__binary_trees__forest__c
                          (us_split_fields3 f1))))
        (select temp___283 i))))) 0))
     (and
     (= (to_rep1
        (rec__binary_trees__cell__position
        (us_split_fields1
        (let ((temp___279 (rec__binary_trees__forest__c
                          (us_split_fields3 f1))))
        (select temp___279 (to_rep
                           (rec__binary_trees__cell__left
                           (us_split_fields1
                           (let ((temp___280 (rec__binary_trees__forest__c
                                             (us_split_fields3 f1))))
                           (select temp___280 i)))))))))) 0)
     (= (to_rep
        (rec__binary_trees__cell__parent
        (us_split_fields1
        (let ((temp___281 (rec__binary_trees__forest__c
                          (us_split_fields3 f1))))
        (select temp___281 (to_rep
                           (rec__binary_trees__cell__left
                           (us_split_fields1
                           (let ((temp___282 (rec__binary_trees__forest__c
                                             (us_split_fields3 f1))))
                           (select temp___282 i)))))))))) i))))))
     (forall ((i Int))
     (=> (and (<= 1 i) (<= i 100))
     (=>
     (not
     (= (to_rep
        (rec__binary_trees__cell__right
        (us_split_fields1
        (let ((temp___288 (rec__binary_trees__forest__c
                          (us_split_fields3 f1))))
        (select temp___288 i))))) 0))
     (and
     (= (to_rep1
        (rec__binary_trees__cell__position
        (us_split_fields1
        (let ((temp___284 (rec__binary_trees__forest__c
                          (us_split_fields3 f1))))
        (select temp___284 (to_rep
                           (rec__binary_trees__cell__right
                           (us_split_fields1
                           (let ((temp___285 (rec__binary_trees__forest__c
                                             (us_split_fields3 f1))))
                           (select temp___285 i)))))))))) 1)
     (= (to_rep
        (rec__binary_trees__cell__parent
        (us_split_fields1
        (let ((temp___286 (rec__binary_trees__forest__c
                          (us_split_fields3 f1))))
        (select temp___286 (to_rep
                           (rec__binary_trees__cell__right
                           (us_split_fields1
                           (let ((temp___287 (rec__binary_trees__forest__c
                                             (us_split_fields3 f1))))
                           (select temp___287 i)))))))))) i))))))
     (forall ((i Int))
     (=> (and (<= 1 i) (<= i 100))
     (=>
     (and
     (not
     (= (to_rep
        (rec__binary_trees__cell__parent
        (us_split_fields1
        (let ((temp___291 (rec__binary_trees__forest__c
                          (us_split_fields3 f1))))
        (select temp___291 i))))) 0))
     (= (to_rep1
        (rec__binary_trees__cell__position
        (us_split_fields1
        (let ((temp___292 (rec__binary_trees__forest__c
                          (us_split_fields3 f1))))
        (select temp___292 i))))) 0))
     (= (to_rep
        (rec__binary_trees__cell__left
        (us_split_fields1
        (let ((temp___289 (rec__binary_trees__forest__c
                          (us_split_fields3 f1))))
        (select temp___289 (to_rep
                           (rec__binary_trees__cell__parent
                           (us_split_fields1
                           (let ((temp___290 (rec__binary_trees__forest__c
                                             (us_split_fields3 f1))))
                           (select temp___290 i)))))))))) i)))))
     (forall ((i Int))
     (=> (and (<= 1 i) (<= i 100))
     (=>
     (and
     (not
     (= (to_rep
        (rec__binary_trees__cell__parent
        (us_split_fields1
        (let ((temp___295 (rec__binary_trees__forest__c
                          (us_split_fields3 f1))))
        (select temp___295 i))))) 0))
     (= (to_rep1
        (rec__binary_trees__cell__position
        (us_split_fields1
        (let ((temp___296 (rec__binary_trees__forest__c
                          (us_split_fields3 f1))))
        (select temp___296 i))))) 1))
     (= (to_rep
        (rec__binary_trees__cell__right
        (us_split_fields1
        (let ((temp___293 (rec__binary_trees__forest__c
                          (us_split_fields3 f1))))
        (select temp___293 (to_rep
                           (rec__binary_trees__cell__parent
                           (us_split_fields1
                           (let ((temp___294 (rec__binary_trees__forest__c
                                             (us_split_fields3 f1))))
                           (select temp___294 i)))))))))) i)))))) :pattern (
  (tree_structure f1)) )))

(define-fun dynamic_invariant1 ((temp___expr_196 Int)
  (temp___is_init_192 Bool) (temp___skip_constant_193 Bool)
  (temp___do_toplevel_194 Bool)
  (temp___do_typ_inv_195 Bool)) Bool (=>
                                     (or (= temp___is_init_192 true)
                                     (<= 1 100)) (in_range3 temp___expr_196)))

(define-fun dynamic_invariant2 ((temp___expr_203 Int)
  (temp___is_init_199 Bool) (temp___skip_constant_200 Bool)
  (temp___do_toplevel_201 Bool)
  (temp___do_typ_inv_202 Bool)) Bool (=>
                                     (or (= temp___is_init_199 true)
                                     (<= 0 2)) (in_range2 temp___expr_203)))

;; Assume
  (assert true)

(declare-const o Bool)

(declare-const o1 Int)

;; Ensures
  (assert
  (= (to_rep (rec__binary_trees__forest__s (us_split_fields3 f))) o1))

(declare-const o2 Bool)

;; H
  (assert
  (ite (forall ((i Int))
       (=>
       (and
       (<= (+ (to_rep (rec__binary_trees__forest__s (us_split_fields3 f))) 1) i)
       (<= i 100))
       (= (bool_eq
          (select (rec__binary_trees__forest__c (us_split_fields3 f)) i)
          (us_repqtmk
          (us_split_fieldsqtmk rliteral rliteral rliteral (of_rep1 2)))) true)))
  (= o2 (ite (forall ((i Int))
             (=> (and (<= 1 i) (<= i 100))
             (let ((temp___340 (to_rep
                               (rec__binary_trees__cell__parent
                               (us_split_fields1
                               (select (rec__binary_trees__forest__c
                                       (us_split_fields3 f)) i))))))
             (and (<= 0 temp___340)
             (<= temp___340 (to_rep
                            (rec__binary_trees__forest__s
                            (us_split_fields3 f))))))))
        true false))
  (= o2 false)))

(declare-const o3 Bool)

;; H
  (assert
  (ite (= o2 true)
  (= o3 (ite (forall ((i Int))
             (=> (and (<= 1 i) (<= i 100))
             (let ((temp___344 (to_rep
                               (rec__binary_trees__cell__left
                               (us_split_fields1
                               (select (rec__binary_trees__forest__c
                                       (us_split_fields3 f)) i))))))
             (and (<= 0 temp___344)
             (<= temp___344 (to_rep
                            (rec__binary_trees__forest__s
                            (us_split_fields3 f))))))))
        true false))
  (= o3 false)))

(declare-const o4 Bool)

;; H
  (assert
  (ite (= o3 true)
  (= o4 (ite (forall ((i Int))
             (=> (and (<= 1 i) (<= i 100))
             (let ((temp___348 (to_rep
                               (rec__binary_trees__cell__right
                               (us_split_fields1
                               (select (rec__binary_trees__forest__c
                                       (us_split_fields3 f)) i))))))
             (and (<= 0 temp___348)
             (<= temp___348 (to_rep
                            (rec__binary_trees__forest__s
                            (us_split_fields3 f))))))))
        true false))
  (= o4 false)))

;; H
  (assert
  (ite (= o4 true)
  (= o (ite (forall ((i Int))
            (=> (and (<= 1 i) (<= i 100))
            (=>
            (= (to_rep1
               (rec__binary_trees__cell__position
               (us_split_fields1
               (select (rec__binary_trees__forest__c (us_split_fields3 f)) i)))) 2)
            (= (to_rep
               (rec__binary_trees__cell__parent
               (us_split_fields1
               (select (rec__binary_trees__forest__c (us_split_fields3 f)) i)))) 0))))
       true false))
  (= o false)))

;; H
  (assert (= o true))

(declare-const usf Int)

;; H
  (assert
  (= (and (ite (<= 1 usf) true false) (ite (<= usf 100) true false)) true))

(declare-const o5 Int)

;; Ensures
  (assert
  (= (to_rep
     (rec__binary_trees__cell__left
     (us_split_fields1
     (select (rec__binary_trees__forest__c (us_split_fields3 f)) usf)))) 
  o5))

;; H
  (assert (not (= o5 0)))

(declare-const temp___355 Int)

;; Ensures
  (assert
  (= (to_rep
     (rec__binary_trees__cell__left
     (us_split_fields1
     (select (rec__binary_trees__forest__c (us_split_fields3 f)) usf)))) 
  temp___355))

;; Assert
  (assert (and (<= 1 temp___355) (<= temp___355 100)))

(declare-const o6 Int)

;; Ensures
  (assert
  (= (to_rep1
     (rec__binary_trees__cell__position
     (us_split_fields1
     (select (rec__binary_trees__forest__c (us_split_fields3 f)) temp___355)))) 
  o6))

;; H
  (assert (= o6 0))

(declare-const temp___358 Int)

;; Ensures
  (assert
  (= (to_rep
     (rec__binary_trees__cell__left
     (us_split_fields1
     (select (rec__binary_trees__forest__c (us_split_fields3 f)) usf)))) 
  temp___358))

(assert
;; defqtvc
 ;; File "binary_trees.ads", line 36, characters 0-0
  (not (<= 1 temp___358)))
(check-sat)
