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

(define-fun to_rep ((x positive)) Int (positiveqtint x))

(declare-fun of_rep (Int) positive)

;; inversion_axiom
  (assert
  (forall ((x positive))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x positive)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                             (of_rep1 x))) )))

(declare-sort map1 0)

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content map1)))))
(declare-fun get (map1 Int Int) integer)

(declare-fun set (map1 Int Int integer) map1)

;; Select_eq
  (assert
  (forall ((m map1))
  (forall ((i Int))
  (forall ((j Int))
  (forall ((a integer))
  (! (= (get (set m i j a) i j) a) :pattern ((set m i j a)) ))))))

;; Select_neq
  (assert
  (forall ((m map1))
  (forall ((i Int) (i2 Int))
  (forall ((j Int) (j2 Int))
  (forall ((a integer))
  (! (=> (not (and (= i i2) (= j j2)))
     (= (get (set m i j a) i2 j2) (get m i2 j2))) :pattern ((get
                                                            (set m i j a) i2
                                                            j2)) :pattern (
  (set m i j a) (get m i2 j2)) ))))))

(declare-fun slide (map1 Int Int Int Int) map1)

;; slide_def
  (assert
  (forall ((a map1))
  (forall ((new_first Int) (old_first Int))
  (forall ((new_first_2 Int) (old_first_2 Int))
  (forall ((i Int))
  (forall ((j Int))
  (! (= (get (slide a old_first new_first old_first_2 new_first_2) i j) 
  (get a (- i (- new_first old_first)) (- j (- new_first_2 old_first_2)))) :pattern (
  (get (slide a old_first new_first old_first_2 new_first_2) i j)) )))))))

(define-fun bool_eq ((a map1) (a__first Int) (a__last Int) (a__first_2 Int)
  (a__last_2 Int) (b map1) (b__first Int) (b__last Int) (b__first_2 Int)
  (b__last_2 Int)) Bool (ite (and
                             (and
                             (ite (<= a__first a__last)
                             (and (<= b__first b__last)
                             (= (- a__last a__first) (- b__last b__first)))
                             (< b__last b__first))
                             (ite (<= a__first_2 a__last_2)
                             (and (<= b__first_2 b__last_2)
                             (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
                             (< b__last_2 b__first_2)))
                             (forall ((temp___idx_154 Int)
                             (temp___idx_155 Int))
                             (=>
                             (and
                             (and (<= a__first temp___idx_154)
                             (<= temp___idx_154 a__last))
                             (and (<= a__first_2 temp___idx_155)
                             (<= temp___idx_155 a__last_2)))
                             (= (to_rep1
                                (get a temp___idx_154 temp___idx_155)) 
                             (to_rep1
                             (get b (+ (- b__first a__first) temp___idx_154)
                             (+ (- b__first_2 a__first_2) temp___idx_155)))))))
                        true false))

;; bool_eq_rev
  (assert
  (forall ((a map1) (b map1))
  (forall ((a__first Int) (a__last Int) (a__first_2 Int) (a__last_2 Int)
  (b__first Int) (b__last Int) (b__first_2 Int) (b__last_2 Int))
  (=>
  (= (bool_eq b b__first b__last b__first_2 b__last_2 a a__first a__last
     a__first_2 a__last_2) true)
  (and
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (ite (<= a__first_2 a__last_2)
  (and (<= b__first_2 b__last_2)
  (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
  (< b__last_2 b__first_2)))
  (forall ((temp___idx_154 Int) (temp___idx_155 Int))
  (=>
  (and (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (and (<= a__first_2 temp___idx_155) (<= temp___idx_155 a__last_2)))
  (= (to_rep1 (get a temp___idx_154 temp___idx_155)) (to_rep1
                                                     (get b
                                                     (+ (- b__first a__first) temp___idx_154)
                                                     (+ (- b__first_2 a__first_2) temp___idx_155)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range f)
     (=> (in_range l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high) (and (in_range low) (in_range high))))))

(declare-sort t1 0)

(declare-fun first1 (t1) integer)

(declare-fun last1 (t1) integer)

(declare-fun mk1 (Int Int) t1)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range f)
     (=> (in_range l)
     (and (= (to_rep1 (first1 (mk1 f l))) f)
     (= (to_rep1 (last1 (mk1 f l))) l)))) :pattern ((mk1 f l)) )))

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high) (and (in_range low) (in_range high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts map1)(rt t)(rt_2 t1)))))
(define-fun to_array ((a us_t)) map1 (elts a))

(define-fun of_array ((a map1) (f Int) (l Int) (f2 Int)
  (l2 Int)) us_t (us_tqtmk a (mk f l) (mk1 f2 l2)))

(define-fun first2 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last2 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first2 a) (last2 a))
                                  (+ (- (last2 a) (first2 a)) 1) 0))

(define-fun first_2 ((a us_t)) Int (to_rep1 (first1 (rt_2 a))))

(define-fun last_2 ((a us_t)) Int (to_rep1 (last1 (rt_2 a))))

(define-fun length_2 ((a us_t)) Int (ite (<= (first_2 a) (last_2 a))
                                    (+ (- (last_2 a) (first_2 a)) 1) 0))

(define-fun dynamic_property2 ((range_first1 Int) (range_last1 Int) (f1 Int)
  (l1 Int) (range_first2 Int) (range_last2 Int) (f2 Int)
  (l2 Int)) Bool (and (dynamic_property range_first1 range_last1 f1 l1)
                 (dynamic_property1 range_first2 range_last2 f2 l2)))

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

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (to_rep1 (first1 (rt_2 x)))
                 (to_rep1 (last1 (rt_2 x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y))) (to_rep1 (first1 (rt_2 y)))
                 (to_rep1 (last1 (rt_2 y)))))

(declare-fun user_eq2 (us_t us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes ((array_2d__ref 0))
(((array_2d__refqtmk (array_2d__content us_t)))))
(define-fun array_2d__ref_array_2d__content__projection ((a array_2d__ref)) us_t 
  (array_2d__content a))

(declare-datatypes ((t19b__ref 0))
(((t19b__refqtmk (t19b__content us_t)))))
(define-fun t19b__ref_t19b__content__projection ((a t19b__ref)) us_t 
  (t19b__content a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__test__matrix__c positive)(rec__test__matrix__r positive)))))
(define-fun us_split_discrs_rec__test__matrix__c__projection ((a us_split_discrs)) positive 
  (rec__test__matrix__c a))

(define-fun us_split_discrs_rec__test__matrix__r__projection ((a us_split_discrs)) positive 
  (rec__test__matrix__r a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__test__matrix__mat us_t)))))
(define-fun us_split_fields_rec__test__matrix__mat__projection ((a us_split_fields)) us_t 
  (rec__test__matrix__mat a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep
                           (rec__test__matrix__c (us_split_discrs1 a))) 
                        (to_rep (rec__test__matrix__c (us_split_discrs1 b))))
                        (= (to_rep
                           (rec__test__matrix__r (us_split_discrs1 a))) 
                        (to_rep (rec__test__matrix__r (us_split_discrs1 b)))))
                        (= (bool_eq1
                           (rec__test__matrix__mat (us_split_fields1 a))
                           (rec__test__matrix__mat (us_split_fields1 b))) true))
                   true false))

(define-fun in_range2 ((rec__test__matrix__c1 Int)
  (rec__test__matrix__r1 Int)
  (a us_split_discrs)) Bool (and
                            (= rec__test__matrix__c1 (to_rep
                                                     (rec__test__matrix__c a)))
                            (= rec__test__matrix__r1 (to_rep
                                                     (rec__test__matrix__r a)))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const test__matrix__c__first__bit Int)

(declare-const test__matrix__c__last__bit Int)

(declare-const test__matrix__c__position Int)

;; test__matrix__c__first__bit_axiom
  (assert (<= 0 test__matrix__c__first__bit))

;; test__matrix__c__last__bit_axiom
  (assert (< test__matrix__c__first__bit test__matrix__c__last__bit))

;; test__matrix__c__position_axiom
  (assert (<= 0 test__matrix__c__position))

(declare-const test__matrix__r__first__bit Int)

(declare-const test__matrix__r__last__bit Int)

(declare-const test__matrix__r__position Int)

;; test__matrix__r__first__bit_axiom
  (assert (<= 0 test__matrix__r__first__bit))

;; test__matrix__r__last__bit_axiom
  (assert (< test__matrix__r__first__bit test__matrix__r__last__bit))

;; test__matrix__r__position_axiom
  (assert (<= 0 test__matrix__r__position))

(declare-const test__matrix__mat__first__bit Int)

(declare-const test__matrix__mat__last__bit Int)

(declare-const test__matrix__mat__position Int)

;; test__matrix__mat__first__bit_axiom
  (assert (<= 0 test__matrix__mat__first__bit))

;; test__matrix__mat__last__bit_axiom
  (assert (< test__matrix__mat__first__bit test__matrix__mat__last__bit))

;; test__matrix__mat__position_axiom
  (assert (<= 0 test__matrix__mat__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((matrix__ref 0))
(((matrix__refqtmk (matrix__content us_rep)))))
(define-fun matrix__ref_matrix__content__projection ((a matrix__ref)) us_rep 
  (matrix__content a))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_207 us_rep)
  (temp___is_init_203 Bool) (temp___skip_constant_204 Bool)
  (temp___do_toplevel_205 Bool)
  (temp___do_typ_inv_206 Bool)) Bool (let ((temp___209 (rec__test__matrix__r
                                                       (us_split_discrs1
                                                       temp___expr_207))))
                                     (let ((temp___208 (rec__test__matrix__c
                                                       (us_split_discrs1
                                                       temp___expr_207))))
                                     (and
                                     (and (dynamic_property2 1
                                     (to_rep temp___208)
                                     (first2
                                     (rec__test__matrix__mat
                                     (us_split_fields1 temp___expr_207)))
                                     (last2
                                     (rec__test__matrix__mat
                                     (us_split_fields1 temp___expr_207))) 1
                                     (to_rep temp___209)
                                     (first_2
                                     (rec__test__matrix__mat
                                     (us_split_fields1 temp___expr_207)))
                                     (last_2
                                     (rec__test__matrix__mat
                                     (us_split_fields1 temp___expr_207))))
                                     (and
                                     (= (first2
                                        (rec__test__matrix__mat
                                        (us_split_fields1 temp___expr_207))) 1)
                                     (= (last2
                                        (rec__test__matrix__mat
                                        (us_split_fields1 temp___expr_207))) 
                                     (to_rep temp___208))))
                                     (and
                                     (= (first_2
                                        (rec__test__matrix__mat
                                        (us_split_fields1 temp___expr_207))) 1)
                                     (= (last_2
                                        (rec__test__matrix__mat
                                        (us_split_fields1 temp___expr_207))) 
                                     (to_rep temp___209)))))))

(assert
;; defqtvc
 ;; File "test.ads", line 1, characters 0-0
  (not
  (forall ((usf Int) (usf1 Int) (usf2 us_rep))
  (=> (dynamic_invariant usf true true true true)
  (=> (dynamic_invariant usf1 true true true true)
  (=> (= (to_rep (rec__test__matrix__c (us_split_discrs1 usf2))) usf1)
  (=> (= (to_rep (rec__test__matrix__r (us_split_discrs1 usf2))) usf)
  (=> (<= 1 usf) (<= (- 2147483648) 1)))))))))
(check-sat)
(exit)
