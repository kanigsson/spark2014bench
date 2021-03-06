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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(define-fun in_range3 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__types_with_invariants_auto__my_integer_bad__sign Bool)(rec__types_with_invariants_auto__my_integer_bad__val natural)))))
(define-fun us_split_fields_rec__types_with_invariants_auto__my_integer_bad__sign__projection ((a us_split_fields)) Bool 
  (rec__types_with_invariants_auto__my_integer_bad__sign a))

(define-fun us_split_fields_rec__types_with_invariants_auto__my_integer_bad__val__projection ((a us_split_fields)) natural 
  (rec__types_with_invariants_auto__my_integer_bad__val a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__3__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__types_with_invariants_auto__my_integer_bad__sign
                                (us_split_fields1 a)) 1 0) (ite (rec__types_with_invariants_auto__my_integer_bad__sign
                                                                (us_split_fields1
                                                                b)) 1 0))
                        (= (to_rep
                           (rec__types_with_invariants_auto__my_integer_bad__val
                           (us_split_fields1 a))) (to_rep
                                                  (rec__types_with_invariants_auto__my_integer_bad__val
                                                  (us_split_fields1 b)))))
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

(declare-const types_with_invariants_auto__my_integer_bad__sign__first__bit Int)

(declare-const types_with_invariants_auto__my_integer_bad__sign__last__bit Int)

(declare-const types_with_invariants_auto__my_integer_bad__sign__position Int)

;; types_with_invariants_auto__my_integer_bad__sign__first__bit_axiom
  (assert
  (<= 0 types_with_invariants_auto__my_integer_bad__sign__first__bit))

;; types_with_invariants_auto__my_integer_bad__sign__last__bit_axiom
  (assert
  (< types_with_invariants_auto__my_integer_bad__sign__first__bit types_with_invariants_auto__my_integer_bad__sign__last__bit))

;; types_with_invariants_auto__my_integer_bad__sign__position_axiom
  (assert (<= 0 types_with_invariants_auto__my_integer_bad__sign__position))

(declare-const types_with_invariants_auto__my_integer_bad__val__first__bit Int)

(declare-const types_with_invariants_auto__my_integer_bad__val__last__bit Int)

(declare-const types_with_invariants_auto__my_integer_bad__val__position Int)

;; types_with_invariants_auto__my_integer_bad__val__first__bit_axiom
  (assert (<= 0 types_with_invariants_auto__my_integer_bad__val__first__bit))

;; types_with_invariants_auto__my_integer_bad__val__last__bit_axiom
  (assert
  (< types_with_invariants_auto__my_integer_bad__val__first__bit types_with_invariants_auto__my_integer_bad__val__last__bit))

;; types_with_invariants_auto__my_integer_bad__val__position_axiom
  (assert (<= 0 types_with_invariants_auto__my_integer_bad__val__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((my_integer_bad__ref 0))
(((my_integer_bad__refqtmk (my_integer_bad__content us_rep)))))
(define-fun my_integer_bad__ref_my_integer_bad__content__projection ((a my_integer_bad__ref)) us_rep 
  (my_integer_bad__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int us_rep))))))
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
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (bool_eq (select a temp___idx_155)
                              (select b (+ (- b__first a__first) temp___idx_155))) true))))
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
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (bool_eq (select a temp___idx_155)
     (select b (+ (- b__first a__first) temp___idx_155))) true))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int us_rep))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int us_rep) (elts a))

(define-fun of_array ((a (Array Int us_rep)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

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

(define-fun bool_eq2 ((x us_t)
  (y us_t)) Bool (bool_eq1 (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ((my_array_bad__ref 0))
(((my_array_bad__refqtmk (my_array_bad__content us_t)))))
(define-fun my_array_bad__ref_my_array_bad__content__projection ((a my_array_bad__ref)) us_t 
  (my_array_bad__content a))

(declare-datatypes ((t13s__ref 0))
(((t13s__refqtmk (t13s__content us_t)))))
(define-fun t13s__ref_t13s__content__projection ((a t13s__ref)) us_t 
  (t13s__content a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__use_types_with_invariants_auto__container_bad__c natural)))))
(define-fun us_split_discrs_rec__use_types_with_invariants_auto__container_bad__c__projection ((a us_split_discrs)) natural 
  (rec__use_types_with_invariants_auto__container_bad__c a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__use_types_with_invariants_auto__container_bad__content us_t)))))
(define-fun us_split_fields_rec__use_types_with_invariants_auto__container_bad__content__projection ((a us_split_fields2)) us_t 
  (rec__use_types_with_invariants_auto__container_bad__content a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__4__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs1 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__4__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__use_types_with_invariants_auto__container_bad__c
                            (us_split_discrs1 a))) (to_rep
                                                   (rec__use_types_with_invariants_auto__container_bad__c
                                                   (us_split_discrs1 b))))
                         (= (bool_eq2
                            (rec__use_types_with_invariants_auto__container_bad__content
                            (us_split_fields3 a))
                            (rec__use_types_with_invariants_auto__container_bad__content
                            (us_split_fields3 b))) true))
                    true false))

(define-fun in_range4 ((rec__use_types_with_invariants_auto__container_bad__c1 Int)
  (a us_split_discrs)) Bool (= rec__use_types_with_invariants_auto__container_bad__c1 
  (to_rep (rec__use_types_with_invariants_auto__container_bad__c a))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const use_types_with_invariants_auto__container_bad__c__first__bit Int)

(declare-const use_types_with_invariants_auto__container_bad__c__last__bit Int)

(declare-const use_types_with_invariants_auto__container_bad__c__position Int)

;; use_types_with_invariants_auto__container_bad__c__first__bit_axiom
  (assert
  (<= 0 use_types_with_invariants_auto__container_bad__c__first__bit))

;; use_types_with_invariants_auto__container_bad__c__last__bit_axiom
  (assert
  (< use_types_with_invariants_auto__container_bad__c__first__bit use_types_with_invariants_auto__container_bad__c__last__bit))

;; use_types_with_invariants_auto__container_bad__c__position_axiom
  (assert (<= 0 use_types_with_invariants_auto__container_bad__c__position))

(declare-const use_types_with_invariants_auto__container_bad__content__first__bit Int)

(declare-const use_types_with_invariants_auto__container_bad__content__last__bit Int)

(declare-const use_types_with_invariants_auto__container_bad__content__position Int)

;; use_types_with_invariants_auto__container_bad__content__first__bit_axiom
  (assert
  (<= 0 use_types_with_invariants_auto__container_bad__content__first__bit))

;; use_types_with_invariants_auto__container_bad__content__last__bit_axiom
  (assert
  (< use_types_with_invariants_auto__container_bad__content__first__bit 
  use_types_with_invariants_auto__container_bad__content__last__bit))

;; use_types_with_invariants_auto__container_bad__content__position_axiom
  (assert
  (<= 0 use_types_with_invariants_auto__container_bad__content__position))

(declare-fun user_eq5 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ((container_bad__ref 0))
(((container_bad__refqtmk (container_bad__content us_rep1)))))
(define-fun container_bad__ref_container_bad__content__projection ((a container_bad__ref)) us_rep1 
  (container_bad__content a))

(declare-const c us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_208 us_rep1)
  (temp___is_init_204 Bool) (temp___skip_constant_205 Bool)
  (temp___do_toplevel_206 Bool) (temp___do_typ_inv_207 Bool)
  (types_with_invariants_auto__zero_is_positive Bool)) Bool (let ((temp___209 
                                                            (rec__use_types_with_invariants_auto__container_bad__c
                                                            (us_split_discrs1
                                                            temp___expr_208))))
                                                            (and
                                                            (and
                                                            (dynamic_property
                                                            1
                                                            (to_rep
                                                            temp___209)
                                                            (first1
                                                            (rec__use_types_with_invariants_auto__container_bad__content
                                                            (us_split_fields3
                                                            temp___expr_208)))
                                                            (last1
                                                            (rec__use_types_with_invariants_auto__container_bad__content
                                                            (us_split_fields3
                                                            temp___expr_208))))
                                                            (and
                                                            (= (first1
                                                               (rec__use_types_with_invariants_auto__container_bad__content
                                                               (us_split_fields3
                                                               temp___expr_208))) 1)
                                                            (= (last1
                                                               (rec__use_types_with_invariants_auto__container_bad__content
                                                               (us_split_fields3
                                                               temp___expr_208))) 
                                                            (to_rep
                                                            temp___209))))
                                                            (forall
                                                            ((temp___210 Int))
                                                            (=>
                                                            (and
                                                            (<= (first1
                                                                (rec__use_types_with_invariants_auto__container_bad__content
                                                                (us_split_fields3
                                                                temp___expr_208))) temp___210)
                                                            (<= temp___210 
                                                            (last1
                                                            (rec__use_types_with_invariants_auto__container_bad__content
                                                            (us_split_fields3
                                                            temp___expr_208)))))
                                                            (=>
                                                            (= temp___do_typ_inv_207 true)
                                                            (let ((temp___211 (select 
                                                            (to_array
                                                            (rec__use_types_with_invariants_auto__container_bad__content
                                                            (us_split_fields3
                                                            temp___expr_208))) temp___210)))
                                                            (=>
                                                            (= (to_rep
                                                               (rec__types_with_invariants_auto__my_integer_bad__val
                                                               (us_split_fields1
                                                               temp___211))) 0)
                                                            (=
                                                            (= (rec__types_with_invariants_auto__my_integer_bad__sign
                                                               (us_split_fields1
                                                               temp___211)) true)
                                                            (= types_with_invariants_auto__zero_is_positive true))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(define-fun dynamic_invariant3 ((temp___expr_191 us_rep)
  (temp___is_init_187 Bool) (temp___skip_constant_188 Bool)
  (temp___do_toplevel_189 Bool) (temp___do_typ_inv_190 Bool)
  (types_with_invariants_auto__zero_is_positive Bool)) Bool (=>
                                                            (= temp___do_typ_inv_190 true)
                                                            (=>
                                                            (= (to_rep
                                                               (rec__types_with_invariants_auto__my_integer_bad__val
                                                               (us_split_fields1
                                                               temp___expr_191))) 0)
                                                            (=
                                                            (= (rec__types_with_invariants_auto__my_integer_bad__sign
                                                               (us_split_fields1
                                                               temp___expr_191)) true)
                                                            (= types_with_invariants_auto__zero_is_positive true)))))

(define-fun default_initial_assumption ((temp___expr_193 us_rep)
  (temp___skip_top_level_194 Bool)) Bool (and
                                         (= (rec__types_with_invariants_auto__my_integer_bad__sign
                                            (us_split_fields1
                                            temp___expr_193)) (distinct 1 0))
                                         (= (to_rep
                                            (rec__types_with_invariants_auto__my_integer_bad__val
                                            (us_split_fields1
                                            temp___expr_193))) 0)))

(define-fun type_invariant ((temp___195 us_rep)
  (types_with_invariants_auto__zero_is_positive Bool)) Bool (=>
                                                            (= (to_rep
                                                               (rec__types_with_invariants_auto__my_integer_bad__val
                                                               (us_split_fields1
                                                               temp___195))) 0)
                                                            (=
                                                            (= (rec__types_with_invariants_auto__my_integer_bad__sign
                                                               (us_split_fields1
                                                               temp___195)) true)
                                                            (= types_with_invariants_auto__zero_is_positive true))))

(assert
;; defqtvc
 ;; File "use_types_with_invariants_auto.ads", line 15, characters 0-0
  (not
  (forall ((zero_is_positive Bool))
  (=> (dynamic_invariant1 c true false true true zero_is_positive)
  (=> (dynamic_invariant i true false true true)
  (=>
  (<= i (to_rep
        (rec__use_types_with_invariants_auto__container_bad__c
        (us_split_discrs1 c))))
  (<= (first1
      (rec__use_types_with_invariants_auto__container_bad__content
      (us_split_fields3 c))) i)))))))
(check-sat)
(exit)
