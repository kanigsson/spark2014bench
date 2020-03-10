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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun to_rep1 ((x natural)) Int (naturalqtint x))

(declare-fun of_rep1 (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__types_with_invariants__my_integer__sign Bool)(rec__types_with_invariants__my_integer__val natural)))))
(define-fun us_split_fields_rec__types_with_invariants__my_integer__sign__projection ((a us_split_fields)) Bool 
  (rec__types_with_invariants__my_integer__sign a))

(define-fun us_split_fields_rec__types_with_invariants__my_integer__val__projection ((a us_split_fields)) natural 
  (rec__types_with_invariants__my_integer__val a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__types_with_invariants__my_integer__sign
                                (us_split_fields1 a)) 1 0) (ite (rec__types_with_invariants__my_integer__sign
                                                                (us_split_fields1
                                                                b)) 1 0))
                        (= (to_rep1
                           (rec__types_with_invariants__my_integer__val
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__types_with_invariants__my_integer__val
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

(declare-const types_with_invariants__my_integer__sign__first__bit Int)

(declare-const types_with_invariants__my_integer__sign__last__bit Int)

(declare-const types_with_invariants__my_integer__sign__position Int)

;; types_with_invariants__my_integer__sign__first__bit_axiom
  (assert (<= 0 types_with_invariants__my_integer__sign__first__bit))

;; types_with_invariants__my_integer__sign__last__bit_axiom
  (assert
  (< types_with_invariants__my_integer__sign__first__bit types_with_invariants__my_integer__sign__last__bit))

;; types_with_invariants__my_integer__sign__position_axiom
  (assert (<= 0 types_with_invariants__my_integer__sign__position))

(declare-const types_with_invariants__my_integer__val__first__bit Int)

(declare-const types_with_invariants__my_integer__val__last__bit Int)

(declare-const types_with_invariants__my_integer__val__position Int)

;; types_with_invariants__my_integer__val__first__bit_axiom
  (assert (<= 0 types_with_invariants__my_integer__val__first__bit))

;; types_with_invariants__my_integer__val__last__bit_axiom
  (assert
  (< types_with_invariants__my_integer__val__first__bit types_with_invariants__my_integer__val__last__bit))

;; types_with_invariants__my_integer__val__position_axiom
  (assert (<= 0 types_with_invariants__my_integer__val__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((my_integer__ref 0))
(((my_integer__refqtmk (my_integer__content us_rep)))))
(define-fun my_integer__ref_my_integer__content__projection ((a my_integer__ref)) us_rep 
  (my_integer__content a))

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

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int us_rep))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int us_rep) (elts a))

(define-fun of_array ((a (Array Int us_rep)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

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
  (y us_t)) Bool (bool_eq1 (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ((my_array__ref 0))
(((my_array__refqtmk (my_array__content us_t)))))
(define-fun my_array__ref_my_array__content__projection ((a my_array__ref)) us_t 
  (my_array__content a))

(declare-datatypes ((t8s__ref 0))
(((t8s__refqtmk (t8s__content us_t)))))
(define-fun t8s__ref_t8s__content__projection ((a t8s__ref)) us_t (t8s__content
                                                                  a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__types_with_invariants__container__c natural)))))
(define-fun us_split_discrs_rec__types_with_invariants__container__c__projection ((a us_split_discrs)) natural 
  (rec__types_with_invariants__container__c a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__types_with_invariants__container__content us_t)))))
(define-fun us_split_fields_rec__types_with_invariants__container__content__projection ((a us_split_fields2)) us_t 
  (rec__types_with_invariants__container__content a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs1 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep1
                            (rec__types_with_invariants__container__c
                            (us_split_discrs1 a))) (to_rep1
                                                   (rec__types_with_invariants__container__c
                                                   (us_split_discrs1 b))))
                         (= (bool_eq2
                            (rec__types_with_invariants__container__content
                            (us_split_fields3 a))
                            (rec__types_with_invariants__container__content
                            (us_split_fields3 b))) true))
                    true false))

(define-fun in_range4 ((rec__types_with_invariants__container__c1 Int)
  (a us_split_discrs)) Bool (= rec__types_with_invariants__container__c1 
  (to_rep1 (rec__types_with_invariants__container__c a))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const types_with_invariants__container__c__first__bit Int)

(declare-const types_with_invariants__container__c__last__bit Int)

(declare-const types_with_invariants__container__c__position Int)

;; types_with_invariants__container__c__first__bit_axiom
  (assert (<= 0 types_with_invariants__container__c__first__bit))

;; types_with_invariants__container__c__last__bit_axiom
  (assert
  (< types_with_invariants__container__c__first__bit types_with_invariants__container__c__last__bit))

;; types_with_invariants__container__c__position_axiom
  (assert (<= 0 types_with_invariants__container__c__position))

(declare-const types_with_invariants__container__content__first__bit Int)

(declare-const types_with_invariants__container__content__last__bit Int)

(declare-const types_with_invariants__container__content__position Int)

;; types_with_invariants__container__content__first__bit_axiom
  (assert (<= 0 types_with_invariants__container__content__first__bit))

;; types_with_invariants__container__content__last__bit_axiom
  (assert
  (< types_with_invariants__container__content__first__bit types_with_invariants__container__content__last__bit))

;; types_with_invariants__container__content__position_axiom
  (assert (<= 0 types_with_invariants__container__content__position))

(declare-fun user_eq5 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ((container__ref 0))
(((container__refqtmk (container__content us_rep1)))))
(define-fun container__ref_container__content__projection ((a container__ref)) us_rep1 
  (container__content a))

(define-fun dynamic_invariant1 ((temp___expr_178 us_rep1)
  (temp___is_init_174 Bool) (temp___skip_constant_175 Bool)
  (temp___do_toplevel_176 Bool)
  (temp___do_typ_inv_177 Bool)) Bool (let ((temp___179 (rec__types_with_invariants__container__c
                                                       (us_split_discrs1
                                                       temp___expr_178))))
                                     (and (dynamic_property 1
                                     (to_rep1 temp___179)
                                     (first1
                                     (rec__types_with_invariants__container__content
                                     (us_split_fields3 temp___expr_178)))
                                     (last1
                                     (rec__types_with_invariants__container__content
                                     (us_split_fields3 temp___expr_178))))
                                     (and
                                     (= (first1
                                        (rec__types_with_invariants__container__content
                                        (us_split_fields3 temp___expr_178))) 1)
                                     (= (last1
                                        (rec__types_with_invariants__container__content
                                        (us_split_fields3 temp___expr_178))) 
                                     (to_rep1 temp___179))))))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int integer))))))
(declare-fun slide1 ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first2 Int))
  (! (= (slide1 a first2 first2) a) :pattern ((slide1 a first2 first2)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq4 ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_156 Int))
                           (=>
                           (and (<= a__first temp___idx_156)
                           (<= temp___idx_156 a__last))
                           (= (to_rep (select a temp___idx_156)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_156)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq4 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_156 Int))
  (=> (and (<= a__first temp___idx_156) (<= temp___idx_156 a__last))
  (= (to_rep (select a temp___idx_156)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_156)))))))))))

(declare-sort t1 0)

(declare-fun first2 (t1) integer)

(declare-fun last2 (t1) integer)

(declare-fun mk1 (Int Int) t1)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first2 (mk1 f l))) f) (= (to_rep (last2 (mk1 f l))) l)))) :pattern (
  (mk1 f l)) )))

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t1 0))
(((us_tqtmk1 (elts1 (Array Int integer))(rt1 t1)))))
(define-fun to_array1 ((a us_t1)) (Array Int integer) (elts1 a))

(define-fun of_array1 ((a (Array Int integer)) (f Int)
  (l Int)) us_t1 (us_tqtmk1 a (mk1 f l)))

(define-fun first3 ((a us_t1)) Int (to_rep (first2 (rt1 a))))

(define-fun last3 ((a us_t1)) Int (to_rep (last2 (rt1 a))))

(define-fun length1 ((a us_t1)) Int (ite (<= (first3 a) (last3 a))
                                    (+ (- (last3 a) (first3 a)) 1) 0))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const component__size1 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment3))

(define-fun bool_eq5 ((x us_t1)
  (y us_t1)) Bool (bool_eq4 (elts1 x) (to_rep (first2 (rt1 x)))
                  (to_rep (last2 (rt1 x))) (elts1 y)
                  (to_rep (first2 (rt1 y))) (to_rep (last2 (rt1 y)))))

(declare-fun user_eq6 (us_t1 us_t1) Bool)

(declare-const dummy6 us_t1)

(declare-datatypes ((u__ref 0))
(((u__refqtmk (u__content us_t1)))))
(define-fun u__ref_u__content__projection ((a u__ref)) us_t1 (u__content a))

(define-fun default_initial_assumption ((temp___expr_164 us_rep)
  (temp___skip_top_level_165 Bool)) Bool (and
                                         (= (rec__types_with_invariants__my_integer__sign
                                            (us_split_fields1
                                            temp___expr_164)) (distinct 1 0))
                                         (= (to_rep1
                                            (rec__types_with_invariants__my_integer__val
                                            (us_split_fields1
                                            temp___expr_164))) 0)))

(define-fun type_invariant ((temp___166 us_rep)) Bool (=>
                                                      (= (to_rep1
                                                         (rec__types_with_invariants__my_integer__val
                                                         (us_split_fields1
                                                         temp___166))) 0)
                                                      (= (rec__types_with_invariants__my_integer__sign
                                                         (us_split_fields1
                                                         temp___166)) true)))

(define-fun dynamic_invariant2 ((temp___expr_172 us_t)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (=>
                                     (not (= temp___skip_constant_169 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_172)
                                     (last1 temp___expr_172))))

(define-fun type_invariant1 ((temp___191 Int)) Bool (not (= temp___191 0)))

(declare-sort t2 0)

(declare-fun tqtint (t2) Int)

;; t'axiom
  (assert
  (forall ((i t2))
  (and (<= (- 2147483648) (tqtint i)) (<= (tqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq7 (t2 t2) Bool)

(declare-const dummy7 t2)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content t2)))))
(define-fun t__ref_t__content__projection ((a t__ref)) t2 (t__content a))

(define-fun dynamic_invariant3 ((temp___expr_197 Int)
  (temp___is_init_193 Bool) (temp___skip_constant_194 Bool)
  (temp___do_toplevel_195 Bool)
  (temp___do_typ_inv_196 Bool)) Bool (=>
                                     (or (= temp___is_init_193 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range5 temp___expr_197)))

(define-fun to_rep2 ((x t2)) Int (tqtint x))

(declare-fun of_rep2 (Int) t2)

;; inversion_axiom
  (assert
  (forall ((x t2)) (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x t2)) (! (in_range5 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range5 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort s 0)

(declare-fun sqtint (s) Int)

;; s'axiom
  (assert
  (forall ((i s))
  (and (<= (- 2147483648) (sqtint i)) (<= (sqtint i) 2147483647))))

(define-fun in_range6 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq8 (s s) Bool)

(declare-const dummy8 s)

(declare-datatypes ((s__ref 0))
(((s__refqtmk (s__content s)))))
(define-fun s__ref_s__content__projection ((a s__ref)) s (s__content a))

(define-fun dynamic_invariant4 ((temp___expr_204 Int)
  (temp___is_init_200 Bool) (temp___skip_constant_201 Bool)
  (temp___do_toplevel_202 Bool)
  (temp___do_typ_inv_203 Bool)) Bool (=>
                                     (or (= temp___is_init_200 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range6 temp___expr_204)))

(declare-sort taD1 0)

(declare-fun taD1qtint (taD1) Int)

;; taD1'axiom
  (assert
  (forall ((i taD1)) (and (<= 1 (taD1qtint i)) (<= (taD1qtint i) 100))))

(define-fun in_range7 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq9 (taD1 taD1) Bool)

(declare-const dummy9 taD1)

(declare-datatypes ((taD1__ref 0))
(((taD1__refqtmk (taD1__content taD1)))))
(define-fun taD1__ref_taD1__content__projection ((a taD1__ref)) taD1 
  (taD1__content a))

(declare-sort t3 0)

(declare-fun first4 (t3) integer)

(declare-fun last4 (t3) integer)

(declare-fun mk2 (Int Int) t3)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first4 (mk2 f l))) f) (= (to_rep (last4 (mk2 f l))) l)))) :pattern (
  (mk2 f l)) )))

(define-fun dynamic_property2 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range7 low) (in_range7 high))))))

(declare-datatypes ((us_t2 0))
(((us_tqtmk2 (elts2 (Array Int integer))(rt2 t3)))))
(define-fun to_array2 ((a us_t2)) (Array Int integer) (elts2 a))

(define-fun of_array2 ((a (Array Int integer)) (f Int)
  (l Int)) us_t2 (us_tqtmk2 a (mk2 f l)))

(define-fun first5 ((a us_t2)) Int (to_rep (first4 (rt2 a))))

(define-fun last5 ((a us_t2)) Int (to_rep (last4 (rt2 a))))

(define-fun length2 ((a us_t2)) Int (ite (<= (first5 a) (last5 a))
                                    (+ (- (last5 a) (first5 a)) 1) 0))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const component__size2 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; component__size_axiom
  (assert (<= 0 component__size2))

;; alignment_axiom
  (assert (<= 0 alignment4))

(define-fun bool_eq6 ((x us_t2)
  (y us_t2)) Bool (bool_eq4 (elts2 x) (to_rep (first4 (rt2 x)))
                  (to_rep (last4 (rt2 x))) (elts2 y)
                  (to_rep (first4 (rt2 y))) (to_rep (last4 (rt2 y)))))

(declare-fun user_eq10 (us_t2 us_t2) Bool)

(declare-const dummy10 us_t2)

(declare-datatypes ((taB__ref 0))
(((taB__refqtmk (taB__content us_t2)))))
(define-fun taB__ref_taB__content__projection ((a taB__ref)) us_t2 (taB__content
                                                                   a))

(define-fun type_invariant2 ((temp___207 us_t2)) Bool (and
                                                      (not
                                                      (= (to_rep
                                                         (select (to_array2
                                                                 temp___207) 1)) 0))
                                                      (forall ((i Int))
                                                      (=>
                                                      (and (<= 1 i)
                                                      (<= i 100))
                                                      (not
                                                      (= (to_rep
                                                         (select (to_array2
                                                                 temp___207) i)) 0))))))

(define-fun default_initial_assumption1 ((temp___expr_215 (Array Int integer))
  (temp___skip_top_level_216 Bool)) Bool (and
                                         (forall ((temp___217 Int))
                                         (=>
                                         (and (<= 1 temp___217)
                                         (<= temp___217 100))
                                         (= (to_rep
                                            (select temp___expr_215 temp___217)) 0)))
                                         (= temp___skip_top_level_216 true)))

(define-fun dynamic_invariant5 ((temp___expr_223 us_t1)
  (temp___is_init_219 Bool) (temp___skip_constant_220 Bool)
  (temp___do_toplevel_221 Bool)
  (temp___do_typ_inv_222 Bool)) Bool (=>
                                     (not (= temp___skip_constant_220 true))
                                     (dynamic_property1 1 2147483647
                                     (first3 temp___expr_223)
                                     (last3 temp___expr_223))))

(define-fun type_invariant3 ((temp___225 us_t1)) Bool (and
                                                      (not
                                                      (= (to_rep
                                                         (select (to_array1
                                                                 temp___225) 
                                                         (first3 temp___225))) 1))
                                                      (forall ((i Int))
                                                      (=>
                                                      (and
                                                      (<= (first3 temp___225) i)
                                                      (<= i (last3
                                                            temp___225)))
                                                      (not
                                                      (= (to_rep
                                                         (select (to_array1
                                                                 temp___225) i)) 0))))))

(declare-datatypes ((us_split_discrs2 0))
(((us_split_discrsqtmk1 (rec__types_with_invariants__r__c t2)))))
(define-fun us_split_discrs_rec__types_with_invariants__r__c__projection ((a us_split_discrs2)) t2 
  (rec__types_with_invariants__r__c a))

(declare-datatypes ((us_split_discrs__ref1 0))
(((us_split_discrs__refqtmk1 (us_split_discrs__content1 us_split_discrs2)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref1)) us_split_discrs2 
  (us_split_discrs__content1 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2 (us_split_discrs3 us_split_discrs2)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep2)) us_split_discrs2 
  (us_split_discrs3 a))

(define-fun bool_eq7 ((a us_rep2)
  (b us_rep2)) Bool (ite (= (to_rep2
                            (rec__types_with_invariants__r__c
                            (us_split_discrs3 a))) (to_rep2
                                                   (rec__types_with_invariants__r__c
                                                   (us_split_discrs3 b))))
                    true false))

(define-fun in_range8 ((rec__types_with_invariants__r__c1 Int)
  (a us_split_discrs2)) Bool (= rec__types_with_invariants__r__c1 (to_rep2
                                                                  (rec__types_with_invariants__r__c
                                                                  a))))

(declare-const value__size5 Int)

(declare-const object__size5 Int)

(declare-const alignment5 Int)

;; value__size_axiom
  (assert (<= 0 value__size5))

;; object__size_axiom
  (assert (<= 0 object__size5))

;; alignment_axiom
  (assert (<= 0 alignment5))

(declare-const types_with_invariants__r__c__first__bit Int)

(declare-const types_with_invariants__r__c__last__bit Int)

(declare-const types_with_invariants__r__c__position Int)

;; types_with_invariants__r__c__first__bit_axiom
  (assert (<= 0 types_with_invariants__r__c__first__bit))

;; types_with_invariants__r__c__last__bit_axiom
  (assert
  (< types_with_invariants__r__c__first__bit types_with_invariants__r__c__last__bit))

;; types_with_invariants__r__c__position_axiom
  (assert (<= 0 types_with_invariants__r__c__position))

(declare-fun user_eq11 (us_rep2 us_rep2) Bool)

(declare-const dummy11 us_rep2)

(declare-datatypes ((r__ref 0))
(((r__refqtmk (r__content us_rep2)))))
(define-fun r__ref_r__content__projection ((a r__ref)) us_rep2 (r__content a))

(define-fun dynamic_invariant6 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant7 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(assert
;; defqtvc
 ;; File "types_with_invariants.ads", line 1, characters 0-0
  (not
  (forall ((usf us_rep1) (temp___272 Int))
  (=>
  (exists ((usf1 Int))
  (and (dynamic_invariant usf1 true true true true)
  (exists ((usf2 us_rep1))
  (= (to_rep1
     (rec__types_with_invariants__container__c (us_split_discrs1 usf2))) usf1))))
  (=> (dynamic_invariant1 usf true false true true)
  (=>
  (and
  (and
  (= (first1
     (rec__types_with_invariants__container__content (us_split_fields3 usf))) 1)
  (= (last1
     (rec__types_with_invariants__container__content (us_split_fields3 usf))) 
  (to_rep1 (rec__types_with_invariants__container__c (us_split_discrs1 usf)))))
  (forall ((temp___269 Int))
  (=>
  (and
  (<= (first1
      (rec__types_with_invariants__container__content (us_split_fields3 usf))) temp___269)
  (<= temp___269 (last1
                 (rec__types_with_invariants__container__content
                 (us_split_fields3 usf)))))
  (default_initial_assumption
  (select (to_array
          (rec__types_with_invariants__container__content
          (us_split_fields3 usf))) temp___269)
  false))))
  (=>
  (<= (first1
      (rec__types_with_invariants__container__content (us_split_fields3 usf))) temp___272)
  (=>
  (<= temp___272 (last1
                 (rec__types_with_invariants__container__content
                 (us_split_fields3 usf))))
  (type_invariant
  (select (to_array
          (rec__types_with_invariants__container__content
          (us_split_fields3 usf))) temp___272))))))))))
(check-sat)
(exit)
