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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

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
  (forall ((x integer)) (! (in_range3 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int natural))))))
(declare-fun slide ((Array Int natural) Int Int) (Array Int natural))

;; slide_eq
  (assert
  (forall ((a (Array Int natural)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
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
  (forall ((a (Array Int natural)) (b (Array Int natural)))
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

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range3 f)
     (=> (in_range3 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range3 low)
                   (and (in_range3 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int natural))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int natural) (elts a))

(define-fun of_array ((a (Array Int natural)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

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
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((nat_array__ref 0))
(((nat_array__refqtmk (nat_array__content us_t)))))
(define-fun nat_array__ref_nat_array__content__projection ((a nat_array__ref)) us_t 
  (nat_array__content a))

(declare-datatypes ((t4s__ref 0))
(((t4s__refqtmk (t4s__content us_t)))))
(define-fun t4s__ref_t4s__content__projection ((a t4s__ref)) us_t (t4s__content
                                                                  a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__p__my_rec__c natural)))))
(define-fun us_split_discrs_rec__p__my_rec__c__projection ((a us_split_discrs)) natural 
  (rec__p__my_rec__c a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__p__my_rec__content us_t)))))
(define-fun us_split_fields_rec__p__my_rec__content__projection ((a us_split_fields)) us_t 
  (rec__p__my_rec__content a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep (rec__p__my_rec__c (us_split_discrs1 a))) 
                        (to_rep (rec__p__my_rec__c (us_split_discrs1 b))))
                        (= (bool_eq1
                           (rec__p__my_rec__content (us_split_fields1 a))
                           (rec__p__my_rec__content (us_split_fields1 b))) true))
                   true false))

(define-fun in_range4 ((rec__p__my_rec__c1 Int)
  (a us_split_discrs)) Bool (= rec__p__my_rec__c1 (to_rep
                                                  (rec__p__my_rec__c a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const p__my_rec__c__first__bit Int)

(declare-const p__my_rec__c__last__bit Int)

(declare-const p__my_rec__c__position Int)

;; p__my_rec__c__first__bit_axiom
  (assert (<= 0 p__my_rec__c__first__bit))

;; p__my_rec__c__last__bit_axiom
  (assert (< p__my_rec__c__first__bit p__my_rec__c__last__bit))

;; p__my_rec__c__position_axiom
  (assert (<= 0 p__my_rec__c__position))

(declare-const p__my_rec__content__first__bit Int)

(declare-const p__my_rec__content__last__bit Int)

(declare-const p__my_rec__content__position Int)

;; p__my_rec__content__first__bit_axiom
  (assert (<= 0 p__my_rec__content__first__bit))

;; p__my_rec__content__last__bit_axiom
  (assert (< p__my_rec__content__first__bit p__my_rec__content__last__bit))

;; p__my_rec__content__position_axiom
  (assert (<= 0 p__my_rec__content__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((my_rec__ref 0))
(((my_rec__refqtmk (my_rec__content us_rep)))))
(define-fun my_rec__ref_my_rec__content__projection ((a my_rec__ref)) us_rep 
  (my_rec__content a))

(declare-datatypes ((t6s__ref 0))
(((t6s__refqtmk (t6s__content us_t)))))
(define-fun t6s__ref_t6s__content__projection ((a t6s__ref)) us_t (t6s__content
                                                                  a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__p__my_rec__content1 us_t)))))
(define-fun us_split_fields_rec__p__my_rec__content__2__projection ((a us_split_fields2)) us_t 
  (rec__p__my_rec__content1 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs2 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs2 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk (us_split_discrs2 a)
                                         (us_split_fieldsqtmk
                                         (let ((temp___156 (rec__p__my_rec__content1
                                                           (us_split_fields3
                                                           a))))
                                         (of_array (to_array temp___156)
                                         (first1 temp___156)
                                         (last1 temp___156))))))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1 (us_split_discrs1 r)
                                         (us_split_fieldsqtmk1
                                         (let ((temp___155 (rec__p__my_rec__content
                                                           (us_split_fields1
                                                           r))))
                                         (of_array (to_array temp___155)
                                         (first1 temp___155)
                                         (last1 temp___155))))))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep (rec__p__my_rec__c (us_split_discrs2 a))) 
                         (to_rep (rec__p__my_rec__c (us_split_discrs2 b))))
                         (= (bool_eq1
                            (rec__p__my_rec__content1 (us_split_fields3 a))
                            (rec__p__my_rec__content1 (us_split_fields3 b))) true))
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

(declare-const p__my_rec__c__first__bit1 Int)

(declare-const p__my_rec__c__last__bit1 Int)

(declare-const p__my_rec__c__position1 Int)

;; p__my_rec__c__first__bit_axiom
  (assert (<= 0 p__my_rec__c__first__bit1))

;; p__my_rec__c__last__bit_axiom
  (assert (< p__my_rec__c__first__bit1 p__my_rec__c__last__bit1))

;; p__my_rec__c__position_axiom
  (assert (<= 0 p__my_rec__c__position1))

(declare-const p__my_rec__content__first__bit1 Int)

(declare-const p__my_rec__content__last__bit1 Int)

(declare-const p__my_rec__content__position1 Int)

;; p__my_rec__content__first__bit_axiom
  (assert (<= 0 p__my_rec__content__first__bit1))

;; p__my_rec__content__last__bit_axiom
  (assert (< p__my_rec__content__first__bit1 p__my_rec__content__last__bit1))

;; p__my_rec__content__position_axiom
  (assert (<= 0 p__my_rec__content__position1))

(declare-fun user_eq5 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ((t5s__ref 0))
(((t5s__refqtmk (t5s__content us_rep1)))))
(define-fun t5s__ref_t5s__content__projection ((a t5s__ref)) us_rep1 
  (t5s__content a))

(declare-datatypes ((us_split_discrs3 0))
(((us_split_discrsqtmk1 (rec__p__pp__b Bool)(rec__p__pp__c natural)))))
(define-fun us_split_discrs_rec__p__pp__b__projection ((a us_split_discrs3)) Bool 
  (rec__p__pp__b a))

(define-fun us_split_discrs_rec__p__pp__c__projection ((a us_split_discrs3)) natural 
  (rec__p__pp__c a))

(declare-datatypes ((us_split_discrs__ref1 0))
(((us_split_discrs__refqtmk1 (us_split_discrs__content1 us_split_discrs3)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref1)) us_split_discrs3 
  (us_split_discrs__content1 a))

(declare-datatypes ((us_split_fields4 0))
(((us_split_fieldsqtmk2 (rec__p__pp__dummy Bool)(rec__p__pp__r us_rep1)))))
(define-fun us_split_fields_rec__p__pp__dummy__projection ((a us_split_fields4)) Bool 
  (rec__p__pp__dummy a))

(define-fun us_split_fields_rec__p__pp__r__projection ((a us_split_fields4)) us_rep1 
  (rec__p__pp__r a))

(declare-datatypes ((us_split_fields__ref2 0))
(((us_split_fields__refqtmk2 (us_split_fields__content2 us_split_fields4)))))
(define-fun us_split_fields__ref___split_fields__content__4__projection ((a us_split_fields__ref2)) us_split_fields4 
  (us_split_fields__content2 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2
  (us_split_discrs4 us_split_discrs3)(us_split_fields5 us_split_fields4)))))
(define-fun us_rep___split_discrs__4__projection ((a us_rep2)) us_split_discrs3 
  (us_split_discrs4 a))

(define-fun us_rep___split_fields__4__projection ((a us_rep2)) us_split_fields4 
  (us_split_fields5 a))

(define-fun in_range5 ((rec__p__pp__b1 Bool) (rec__p__pp__c1 Int)
  (a us_split_discrs3)) Bool (and (= rec__p__pp__b1 (rec__p__pp__b a))
                             (= rec__p__pp__c1 (to_rep (rec__p__pp__c a)))))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const p__pp__b__first__bit Int)

(declare-const p__pp__b__last__bit Int)

(declare-const p__pp__b__position Int)

;; p__pp__b__first__bit_axiom
  (assert (<= 0 p__pp__b__first__bit))

;; p__pp__b__last__bit_axiom
  (assert (< p__pp__b__first__bit p__pp__b__last__bit))

;; p__pp__b__position_axiom
  (assert (<= 0 p__pp__b__position))

(declare-const p__pp__c__first__bit Int)

(declare-const p__pp__c__last__bit Int)

(declare-const p__pp__c__position Int)

;; p__pp__c__first__bit_axiom
  (assert (<= 0 p__pp__c__first__bit))

;; p__pp__c__last__bit_axiom
  (assert (< p__pp__c__first__bit p__pp__c__last__bit))

;; p__pp__c__position_axiom
  (assert (<= 0 p__pp__c__position))

(declare-const p__pp__dummy__first__bit Int)

(declare-const p__pp__dummy__last__bit Int)

(declare-const p__pp__dummy__position Int)

;; p__pp__dummy__first__bit_axiom
  (assert (<= 0 p__pp__dummy__first__bit))

;; p__pp__dummy__last__bit_axiom
  (assert (< p__pp__dummy__first__bit p__pp__dummy__last__bit))

;; p__pp__dummy__position_axiom
  (assert (<= 0 p__pp__dummy__position))

(declare-const p__pp__r__first__bit Int)

(declare-const p__pp__r__last__bit Int)

(declare-const p__pp__r__position Int)

;; p__pp__r__first__bit_axiom
  (assert (<= 0 p__pp__r__first__bit))

;; p__pp__r__last__bit_axiom
  (assert (< p__pp__r__first__bit p__pp__r__last__bit))

;; p__pp__r__position_axiom
  (assert (<= 0 p__pp__r__position))

(declare-fun user_eq6 (us_rep2 us_rep2) Bool)

(declare-datatypes ((pp__ref 0))
(((pp__refqtmk (pp__content us_rep2)))))
(define-fun pp__ref_pp__content__projection ((a pp__ref)) us_rep2 (pp__content
                                                                  a))

(declare-fun prot (us_rep2) Bool)

(declare-fun prot__function_guard (Bool us_rep2) Bool)

(define-fun dynamic_invariant1 ((temp___expr_200 us_rep2)
  (temp___is_init_196 Bool) (temp___skip_constant_197 Bool)
  (temp___do_toplevel_198 Bool)
  (temp___do_typ_inv_199 Bool)) Bool (let ((temp___202 (rec__p__pp__c
                                                       (us_split_discrs4
                                                       temp___expr_200))))
                                     (and (in_range4 (to_rep temp___202)
                                     (us_split_discrs1
                                     (to_base
                                     (rec__p__pp__r
                                     (us_split_fields5 temp___expr_200)))))
                                     (and (dynamic_property 1
                                     (to_rep temp___202)
                                     (first1
                                     (rec__p__my_rec__content1
                                     (us_split_fields3
                                     (rec__p__pp__r
                                     (us_split_fields5 temp___expr_200)))))
                                     (last1
                                     (rec__p__my_rec__content1
                                     (us_split_fields3
                                     (rec__p__pp__r
                                     (us_split_fields5 temp___expr_200))))))
                                     (and
                                     (= (first1
                                        (rec__p__my_rec__content1
                                        (us_split_fields3
                                        (rec__p__pp__r
                                        (us_split_fields5 temp___expr_200))))) 1)
                                     (= (last1
                                        (rec__p__my_rec__content1
                                        (us_split_fields3
                                        (rec__p__pp__r
                                        (us_split_fields5 temp___expr_200))))) 
                                     (to_rep temp___202)))))))

;; prot__post_axiom
  (assert true)

;; prot__def_axiom
  (assert
  (forall ((self__ us_rep2))
  (! (= (= (prot self__) true)
     (and (= (rec__p__pp__b (us_split_discrs4 self__)) true)
     (= (rec__p__pp__dummy (us_split_fields5 self__)) true))) :pattern (
  (prot self__)) )))

(declare-datatypes ((us_split_fields6 0))
(((us_split_fieldsqtmk3 (rec__p__pp__dummy1 Bool)(rec__p__pp__r1 us_rep1)))))
(define-fun us_split_fields_rec__p__pp__dummy__2__projection ((a us_split_fields6)) Bool 
  (rec__p__pp__dummy1 a))

(define-fun us_split_fields_rec__p__pp__r__2__projection ((a us_split_fields6)) us_rep1 
  (rec__p__pp__r1 a))

(declare-datatypes ((us_split_fields__ref3 0))
(((us_split_fields__refqtmk3 (us_split_fields__content3 us_split_fields6)))))
(define-fun us_split_fields__ref___split_fields__content__5__projection ((a us_split_fields__ref3)) us_split_fields6 
  (us_split_fields__content3 a))

(declare-datatypes ((us_rep3 0))
(((us_repqtmk3
  (us_split_discrs5 us_split_discrs3)(us_split_fields7 us_split_fields6)))))
(define-fun us_rep___split_discrs__5__projection ((a us_rep3)) us_split_discrs3 
  (us_split_discrs5 a))

(define-fun us_rep___split_fields__5__projection ((a us_rep3)) us_split_fields6 
  (us_split_fields7 a))

(define-fun to_base1 ((a us_rep3)) us_rep2 (us_repqtmk2 (us_split_discrs5 a)
                                           (us_split_fieldsqtmk2
                                           (rec__p__pp__dummy1
                                           (us_split_fields7 a))
                                           (rec__p__pp__r1
                                           (us_split_fields7 a)))))

(define-fun of_base1 ((r us_rep2)) us_rep3 (us_repqtmk3 (us_split_discrs4 r)
                                           (us_split_fieldsqtmk3
                                           (rec__p__pp__dummy
                                           (us_split_fields5 r))
                                           (rec__p__pp__r
                                           (us_split_fields5 r)))))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-const p__pp__b__first__bit1 Int)

(declare-const p__pp__b__last__bit1 Int)

(declare-const p__pp__b__position1 Int)

;; p__pp__b__first__bit_axiom
  (assert (<= 0 p__pp__b__first__bit1))

;; p__pp__b__last__bit_axiom
  (assert (< p__pp__b__first__bit1 p__pp__b__last__bit1))

;; p__pp__b__position_axiom
  (assert (<= 0 p__pp__b__position1))

(declare-const p__pp__c__first__bit1 Int)

(declare-const p__pp__c__last__bit1 Int)

(declare-const p__pp__c__position1 Int)

;; p__pp__c__first__bit_axiom
  (assert (<= 0 p__pp__c__first__bit1))

;; p__pp__c__last__bit_axiom
  (assert (< p__pp__c__first__bit1 p__pp__c__last__bit1))

;; p__pp__c__position_axiom
  (assert (<= 0 p__pp__c__position1))

(declare-const p__pp__dummy__first__bit1 Int)

(declare-const p__pp__dummy__last__bit1 Int)

(declare-const p__pp__dummy__position1 Int)

;; p__pp__dummy__first__bit_axiom
  (assert (<= 0 p__pp__dummy__first__bit1))

;; p__pp__dummy__last__bit_axiom
  (assert (< p__pp__dummy__first__bit1 p__pp__dummy__last__bit1))

;; p__pp__dummy__position_axiom
  (assert (<= 0 p__pp__dummy__position1))

(declare-const p__pp__r__first__bit1 Int)

(declare-const p__pp__r__last__bit1 Int)

(declare-const p__pp__r__position1 Int)

;; p__pp__r__first__bit_axiom
  (assert (<= 0 p__pp__r__first__bit1))

;; p__pp__r__last__bit_axiom
  (assert (< p__pp__r__first__bit1 p__pp__r__last__bit1))

;; p__pp__r__position_axiom
  (assert (<= 0 p__pp__r__position1))

(declare-fun user_eq7 (us_rep3 us_rep3) Bool)

(declare-datatypes ((txS__ref 0))
(((txS__refqtmk (txS__content us_rep3)))))
(define-fun txS__ref_txS__content__projection ((a txS__ref)) us_rep3 
  (txS__content a))

(declare-const x__split_discrs us_split_discrs3)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ((t8s__ref 0))
(((t8s__refqtmk (t8s__content us_t)))))
(define-fun t8s__ref_t8s__content__projection ((a t8s__ref)) us_t (t8s__content
                                                                  a))

(declare-datatypes ((us_split_fields8 0))
(((us_split_fieldsqtmk4 (rec__p__my_rec__content2 us_t)))))
(define-fun us_split_fields_rec__p__my_rec__content__3__projection ((a us_split_fields8)) us_t 
  (rec__p__my_rec__content2 a))

(declare-datatypes ((us_split_fields__ref4 0))
(((us_split_fields__refqtmk4 (us_split_fields__content4 us_split_fields8)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref4)) us_split_fields8 
  (us_split_fields__content4 a))

(declare-datatypes ((us_rep4 0))
(((us_repqtmk4
  (us_split_discrs6 us_split_discrs)(us_split_fields9 us_split_fields8)))))
(define-fun us_rep___split_discrs__3__projection ((a us_rep4)) us_split_discrs 
  (us_split_discrs6 a))

(define-fun us_rep___split_fields__3__projection ((a us_rep4)) us_split_fields8 
  (us_split_fields9 a))

(define-fun to_base2 ((a us_rep4)) us_rep (us_repqtmk (us_split_discrs6 a)
                                          (us_split_fieldsqtmk
                                          (let ((temp___158 (rec__p__my_rec__content2
                                                            (us_split_fields9
                                                            a))))
                                          (of_array (to_array temp___158)
                                          (first1 temp___158)
                                          (last1 temp___158))))))

(define-fun of_base2 ((r us_rep)) us_rep4 (us_repqtmk4 (us_split_discrs1 r)
                                          (us_split_fieldsqtmk4
                                          (let ((temp___157 (rec__p__my_rec__content
                                                            (us_split_fields1
                                                            r))))
                                          (of_array (to_array temp___157)
                                          (first1 temp___157)
                                          (last1 temp___157))))))

(define-fun bool_eq4 ((a us_rep4)
  (b us_rep4)) Bool (ite (and
                         (= (to_rep (rec__p__my_rec__c (us_split_discrs6 a))) 
                         (to_rep (rec__p__my_rec__c (us_split_discrs6 b))))
                         (= (bool_eq1
                            (rec__p__my_rec__content2 (us_split_fields9 a))
                            (rec__p__my_rec__content2 (us_split_fields9 b))) true))
                    true false))

(declare-const value__size5 Int)

(declare-const object__size5 Int)

(declare-const alignment5 Int)

;; value__size_axiom
  (assert (<= 0 value__size5))

;; object__size_axiom
  (assert (<= 0 object__size5))

;; alignment_axiom
  (assert (<= 0 alignment5))

(declare-const p__my_rec__c__first__bit2 Int)

(declare-const p__my_rec__c__last__bit2 Int)

(declare-const p__my_rec__c__position2 Int)

;; p__my_rec__c__first__bit_axiom
  (assert (<= 0 p__my_rec__c__first__bit2))

;; p__my_rec__c__last__bit_axiom
  (assert (< p__my_rec__c__first__bit2 p__my_rec__c__last__bit2))

;; p__my_rec__c__position_axiom
  (assert (<= 0 p__my_rec__c__position2))

(declare-const p__my_rec__content__first__bit2 Int)

(declare-const p__my_rec__content__last__bit2 Int)

(declare-const p__my_rec__content__position2 Int)

;; p__my_rec__content__first__bit_axiom
  (assert (<= 0 p__my_rec__content__first__bit2))

;; p__my_rec__content__last__bit_axiom
  (assert (< p__my_rec__content__first__bit2 p__my_rec__content__last__bit2))

;; p__my_rec__content__position_axiom
  (assert (<= 0 p__my_rec__content__position2))

(declare-fun user_eq8 (us_rep4 us_rep4) Bool)

(declare-const dummy6 us_rep4)

(declare-datatypes ((t7s__ref 0))
(((t7s__refqtmk (t7s__content us_rep4)))))
(define-fun t7s__ref_t7s__content__projection ((a t7s__ref)) us_rep4 
  (t7s__content a))

(declare-datatypes ((t10s__ref 0))
(((t10s__refqtmk (t10s__content us_t)))))
(define-fun t10s__ref_t10s__content__projection ((a t10s__ref)) us_t 
  (t10s__content a))

(declare-fun temp_____aggregate_def_225 (Int Int Int) us_t)

(define-fun dynamic_invariant2 ((temp___expr_216 us_rep3)
  (temp___is_init_212 Bool) (temp___skip_constant_213 Bool)
  (temp___do_toplevel_214 Bool)
  (temp___do_typ_inv_215 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_213 true))
                                     (in_range5 (distinct 1 0) 10
                                     (us_split_discrs4
                                     (to_base1 temp___expr_216))))
                                     (let ((temp___218 (rec__p__pp__c
                                                       (us_split_discrs5
                                                       temp___expr_216))))
                                     (and (in_range4 (to_rep temp___218)
                                     (us_split_discrs1
                                     (to_base
                                     (rec__p__pp__r1
                                     (us_split_fields7 temp___expr_216)))))
                                     (and (dynamic_property 1
                                     (to_rep temp___218)
                                     (first1
                                     (rec__p__my_rec__content1
                                     (us_split_fields3
                                     (rec__p__pp__r1
                                     (us_split_fields7 temp___expr_216)))))
                                     (last1
                                     (rec__p__my_rec__content1
                                     (us_split_fields3
                                     (rec__p__pp__r1
                                     (us_split_fields7 temp___expr_216))))))
                                     (and
                                     (= (first1
                                        (rec__p__my_rec__content1
                                        (us_split_fields3
                                        (rec__p__pp__r1
                                        (us_split_fields7 temp___expr_216))))) 1)
                                     (= (last1
                                        (rec__p__my_rec__content1
                                        (us_split_fields3
                                        (rec__p__pp__r1
                                        (us_split_fields7 temp___expr_216))))) 
                                     (to_rep temp___218))))))))

(define-fun default_initial_assumption ((temp___expr_221 us_rep3)
  (temp___skip_top_level_222 Bool)) Bool (let ((temp___224 (rec__p__pp__c
                                                           (us_split_discrs5
                                                           temp___expr_221))))
                                         (and
                                         (and
                                         (= (rec__p__pp__b
                                            (us_split_discrs5
                                            temp___expr_221)) (distinct 1 0))
                                         (= (to_rep
                                            (rec__p__pp__c
                                            (us_split_discrs5
                                            temp___expr_221))) 10))
                                         (and
                                         (= (rec__p__pp__dummy1
                                            (us_split_fields7
                                            temp___expr_221)) (distinct 1 0))
                                         (= (rec__p__pp__r1
                                            (us_split_fields7
                                            temp___expr_221)) (of_base
                                                              (to_base2
                                                              (us_repqtmk4
                                                              (us_split_discrsqtmk
                                                              temp___224)
                                                              (us_split_fieldsqtmk4
                                                              (let ((temp___231 
                                                              (temp_____aggregate_def_225
                                                              0 1
                                                              (to_rep
                                                              temp___224))))
                                                              (of_array
                                                              (to_array
                                                              temp___231)
                                                              (first1
                                                              temp___231)
                                                              (last1
                                                              temp___231))))))))))))

(declare-const c Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const d Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const e Bool)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun dynamic_invariant3 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(define-fun dynamic_invariant4 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range3 temp___expr_18)))

(define-fun dynamic_invariant5 ((temp___expr_166 us_t)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (not (= temp___skip_constant_163 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_166)
                                     (last1 temp___expr_166))))

(define-fun dynamic_invariant6 ((temp___expr_172 us_rep)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (let ((temp___173 (rec__p__my_rec__c
                                                       (us_split_discrs1
                                                       temp___expr_172))))
                                     (and (dynamic_property 1
                                     (to_rep temp___173)
                                     (first1
                                     (rec__p__my_rec__content
                                     (us_split_fields1 temp___expr_172)))
                                     (last1
                                     (rec__p__my_rec__content
                                     (us_split_fields1 temp___expr_172))))
                                     (and
                                     (= (first1
                                        (rec__p__my_rec__content
                                        (us_split_fields1 temp___expr_172))) 1)
                                     (= (last1
                                        (rec__p__my_rec__content
                                        (us_split_fields1 temp___expr_172))) 
                                     (to_rep temp___173))))))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___227 Int) (temp___228 Int) (temp___229 Int))
  (let ((temp___226 (temp_____aggregate_def_225 temp___227 temp___228
                    temp___229)))
  (=> (dynamic_invariant temp___227 true true true true)
  (and
  (=> (dynamic_property 1 2147483647 temp___228 temp___229)
  (and (= (first1 temp___226) temp___228) (= (last1 temp___226) temp___229)))
  (forall ((temp___230 Int))
  (= (select (to_array temp___226) temp___230) rliteral)))))))

(assert
;; defqtvc
 ;; File "p.ads", line 1, characters 0-0
  (not
  (forall ((usf Int) (usf1 us_rep2))
  (=>
  (exists ((usf2 Int))
  (and (dynamic_invariant usf2 true true true true)
  (exists ((usf3 us_rep))
  (= (to_rep (rec__p__my_rec__c (us_split_discrs1 usf3))) usf2))))
  (=> (dynamic_invariant usf true true true true)
  (=> (= (to_rep (rec__p__pp__c (us_split_discrs4 usf1))) usf) (in_range1
  usf)))))))
(check-sat)
(exit)
