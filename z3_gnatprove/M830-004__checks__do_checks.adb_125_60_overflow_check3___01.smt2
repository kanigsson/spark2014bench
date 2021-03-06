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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

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

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

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

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-sort character 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (character character) Bool)

(declare-const dummy3 character)

(declare-datatypes ()
((character__ref (character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range4 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int character))))))
(declare-fun slide ((Array Int character) Int Int) (Array Int character))

;; slide_eq
  (assert
  (forall ((a (Array Int character)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int character)) (a__first Int) (a__last Int)
  (b (Array Int character)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_91 Int))
                           (=>
                           (and (<= a__first temp___idx_91)
                           (<= temp___idx_91 a__last))
                           (= (to_rep (select a temp___idx_91)) (to_rep
                                                                (select b (+ (- b__first a__first) temp___idx_91)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_91 Int))
  (=> (and (<= a__first temp___idx_91) (<= temp___idx_91 a__last))
  (= (to_rep (select a temp___idx_91)) (to_rep
                                       (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int character))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int character) (elts a))

(define-fun of_array ((a (Array Int character)) (f Int)
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

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ()
((string____ref (string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const zero Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const b__first integer)

(declare-const b__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const b__first1 integer)

(declare-const b__last1 integer)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-const first2 Int)

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (integer integer) Bool)

(declare-const dummy5 integer)

(declare-datatypes () ((taS__ref (taS__refqtmk (taS__content integer)))))
(define-fun taS__ref_taS__content__projection ((a taS__ref)) integer 
  (taS__content a))

(define-fun dynamic_invariant2 ((temp___expr_228 Int)
  (temp___is_init_224 Bool) (temp___skip_constant_225 Bool)
  (temp___do_toplevel_226 Bool)
  (temp___do_typ_inv_227 Bool)) Bool (=>
                                     (or (= temp___is_init_224 true)
                                     (<= first2 1)) (dynamic_property1 
                                     first2 1 temp___expr_228)))

;; first__def_axiom
  (assert (= first2 zero))

(declare-const first3 Int)

(declare-const last2 Int)

(define-fun dynamic_property2 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (integer integer) Bool)

(declare-const dummy6 integer)

(declare-datatypes () ((taS__ref1 (taS__refqtmk1 (taS__content1 integer)))))
(define-fun taS__ref_taS__content__2__projection ((a taS__ref1)) integer 
  (taS__content1 a))

(define-fun dynamic_invariant3 ((temp___expr_235 Int)
  (temp___is_init_231 Bool) (temp___skip_constant_232 Bool)
  (temp___do_toplevel_233 Bool)
  (temp___do_typ_inv_234 Bool)) Bool (=>
                                     (or (= temp___is_init_231 true)
                                     (<= first3 last2)) (dynamic_property2
                                     first3 last2 temp___expr_235)))

;; first__def_axiom
  (assert (= first3 zero))

;; last__def_axiom
  (assert (= last2 (- zero 1)))

(declare-sort tTaSP1 0)

(declare-fun tTaSP1qtint (tTaSP1) Int)

;; tTaSP1'axiom
  (assert
  (forall ((i tTaSP1)) (and (<= 1 (tTaSP1qtint i)) (<= (tTaSP1qtint i) 11))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 11)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq7 (tTaSP1 tTaSP1) Bool)

(declare-const dummy7 tTaSP1)

(declare-datatypes ()
((tTaSP1__ref (tTaSP1__refqtmk (tTaSP1__content tTaSP1)))))
(define-fun tTaSP1__ref_tTaSP1__content__projection ((a tTaSP1__ref)) tTaSP1 
  (tTaSP1__content a))

(declare-datatypes () ((t14b__ref (t14b__refqtmk (t14b__content us_t)))))
(define-fun t14b__ref_t14b__content__projection ((a t14b__ref)) us_t 
  (t14b__content a))

(declare-sort tTaSP11 0)

(declare-fun tTaSP1qtint1 (tTaSP11) Int)

;; tTaSP1'axiom
  (assert
  (forall ((i tTaSP11))
  (and (<= 1 (tTaSP1qtint1 i)) (<= (tTaSP1qtint1 i) 11))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 11)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq8 (tTaSP11 tTaSP11) Bool)

(declare-const dummy8 tTaSP11)

(declare-datatypes ()
((tTaSP1__ref1 (tTaSP1__refqtmk1 (tTaSP1__content1 tTaSP11)))))
(define-fun tTaSP1__ref_tTaSP1__content__2__projection ((a tTaSP1__ref1)) tTaSP11 
  (tTaSP1__content1 a))

(declare-datatypes () ((t17b__ref (t17b__refqtmk (t17b__content us_t)))))
(define-fun t17b__ref_t17b__content__projection ((a t17b__ref)) us_t 
  (t17b__content a))

(define-fun dynamic_property3 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE9 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check9 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE9 (us_image) Int)

(declare-fun user_eq9 (integer integer) Bool)

(declare-const dummy9 integer)

(declare-datatypes () ((t18b__ref (t18b__refqtmk (t18b__content integer)))))
(define-fun t18b__ref_t18b__content__projection ((a t18b__ref)) integer 
  (t18b__content a))

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__do_checks__do_range_check__B_17__s__b Bool)))))
(define-fun us_split_discrs_rec__do_checks__do_range_check__B_17__s__b__projection ((a us_split_discrs)) Bool 
  (rec__do_checks__do_range_check__B_17__s__b a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk (rec__do_checks__do_range_check__B_17__s__c integer)))))
(define-fun us_split_fields_rec__do_checks__do_range_check__B_17__s__c__projection ((a us_split_fields)) integer 
  (rec__do_checks__do_range_check__B_17__s__c a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__3__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun do_checks__do_range_check__B_17__s__c__pred ((a us_rep)) Bool (= (ite 
  (rec__do_checks__do_range_check__B_17__s__b (us_split_discrs1 a)) 1 0) 1))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__do_checks__do_range_check__B_17__s__b
                                (us_split_discrs1 a)) 1 0) (ite (rec__do_checks__do_range_check__B_17__s__b
                                                                (us_split_discrs1
                                                                b)) 1 0))
                        (=> (do_checks__do_range_check__B_17__s__c__pred a)
                        (= (to_rep1
                           (rec__do_checks__do_range_check__B_17__s__c
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__do_checks__do_range_check__B_17__s__c
                                                  (us_split_fields1 b))))))
                   true false))

(define-fun in_range7 ((rec__do_checks__do_range_check__B_17__s__b1 Bool)
  (a us_split_discrs)) Bool (= rec__do_checks__do_range_check__B_17__s__b1 
  (rec__do_checks__do_range_check__B_17__s__b a)))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const do_checks__do_range_check__B_17__s__b__first__bit Int)

(declare-const do_checks__do_range_check__B_17__s__b__last__bit Int)

(declare-const do_checks__do_range_check__B_17__s__b__position Int)

;; do_checks__do_range_check__B_17__s__b__first__bit_axiom
  (assert (<= 0 do_checks__do_range_check__B_17__s__b__first__bit))

;; do_checks__do_range_check__B_17__s__b__last__bit_axiom
  (assert
  (< do_checks__do_range_check__B_17__s__b__first__bit do_checks__do_range_check__B_17__s__b__last__bit))

;; do_checks__do_range_check__B_17__s__b__position_axiom
  (assert (<= 0 do_checks__do_range_check__B_17__s__b__position))

(declare-const do_checks__do_range_check__B_17__s__c__first__bit Int)

(declare-const do_checks__do_range_check__B_17__s__c__last__bit Int)

(declare-const do_checks__do_range_check__B_17__s__c__position Int)

;; do_checks__do_range_check__B_17__s__c__first__bit_axiom
  (assert (<= 0 do_checks__do_range_check__B_17__s__c__first__bit))

;; do_checks__do_range_check__B_17__s__c__last__bit_axiom
  (assert
  (< do_checks__do_range_check__B_17__s__c__first__bit do_checks__do_range_check__B_17__s__c__last__bit))

;; do_checks__do_range_check__B_17__s__c__position_axiom
  (assert (<= 0 do_checks__do_range_check__B_17__s__c__position))

(declare-fun user_eq10 (us_rep us_rep) Bool)

(declare-const dummy10 us_rep)

(declare-datatypes () ((s__ref (s__refqtmk (s__content us_rep)))))
(define-fun s__ref_s__content__11__projection ((a s__ref)) us_rep (s__content
                                                                  a))

(define-fun dynamic_property4 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE10 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check10 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE10 (us_image) Int)

(declare-fun user_eq11 (integer integer) Bool)

(declare-const dummy11 integer)

(declare-datatypes () ((t19b__ref (t19b__refqtmk (t19b__content integer)))))
(define-fun t19b__ref_t19b__content__projection ((a t19b__ref)) integer 
  (t19b__content a))

(declare-datatypes ()
((us_split_discrs2
 (us_split_discrsqtmk1 (rec__do_checks__do_range_check__B_18__s__b Bool)))))
(define-fun us_split_discrs_rec__do_checks__do_range_check__B_18__s__b__projection ((a us_split_discrs2)) Bool 
  (rec__do_checks__do_range_check__B_18__s__b a))

(declare-datatypes ()
((us_split_discrs__ref1
 (us_split_discrs__refqtmk1 (us_split_discrs__content1 us_split_discrs2)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref1)) us_split_discrs2 
  (us_split_discrs__content1 a))

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1 (rec__do_checks__do_range_check__B_18__s__c integer)))))
(define-fun us_split_fields_rec__do_checks__do_range_check__B_18__s__c__projection ((a us_split_fields2)) integer 
  (rec__do_checks__do_range_check__B_18__s__c a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__4__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep1
 (us_repqtmk1
 (us_split_discrs3 us_split_discrs2)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs2 
  (us_split_discrs3 a))

(define-fun us_rep___split_fields__4__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun do_checks__do_range_check__B_18__s__c__pred ((a us_rep1)) Bool (= (ite 
  (rec__do_checks__do_range_check__B_18__s__b (us_split_discrs3 a)) 1 0) 1))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (ite (rec__do_checks__do_range_check__B_18__s__b
                                 (us_split_discrs3 a)) 1 0) (ite (rec__do_checks__do_range_check__B_18__s__b
                                                                 (us_split_discrs3
                                                                 b)) 1 0))
                         (=> (do_checks__do_range_check__B_18__s__c__pred a)
                         (= (to_rep1
                            (rec__do_checks__do_range_check__B_18__s__c
                            (us_split_fields3 a))) (to_rep1
                                                   (rec__do_checks__do_range_check__B_18__s__c
                                                   (us_split_fields3 b))))))
                    true false))

(define-fun in_range8 ((rec__do_checks__do_range_check__B_18__s__b1 Bool)
  (a us_split_discrs2)) Bool (= rec__do_checks__do_range_check__B_18__s__b1 
  (rec__do_checks__do_range_check__B_18__s__b a)))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const do_checks__do_range_check__B_18__s__b__first__bit Int)

(declare-const do_checks__do_range_check__B_18__s__b__last__bit Int)

(declare-const do_checks__do_range_check__B_18__s__b__position Int)

;; do_checks__do_range_check__B_18__s__b__first__bit_axiom
  (assert (<= 0 do_checks__do_range_check__B_18__s__b__first__bit))

;; do_checks__do_range_check__B_18__s__b__last__bit_axiom
  (assert
  (< do_checks__do_range_check__B_18__s__b__first__bit do_checks__do_range_check__B_18__s__b__last__bit))

;; do_checks__do_range_check__B_18__s__b__position_axiom
  (assert (<= 0 do_checks__do_range_check__B_18__s__b__position))

(declare-const do_checks__do_range_check__B_18__s__c__first__bit Int)

(declare-const do_checks__do_range_check__B_18__s__c__last__bit Int)

(declare-const do_checks__do_range_check__B_18__s__c__position Int)

;; do_checks__do_range_check__B_18__s__c__first__bit_axiom
  (assert (<= 0 do_checks__do_range_check__B_18__s__c__first__bit))

;; do_checks__do_range_check__B_18__s__c__last__bit_axiom
  (assert
  (< do_checks__do_range_check__B_18__s__c__first__bit do_checks__do_range_check__B_18__s__c__last__bit))

;; do_checks__do_range_check__B_18__s__c__position_axiom
  (assert (<= 0 do_checks__do_range_check__B_18__s__c__position))

(declare-fun user_eq12 (us_rep1 us_rep1) Bool)

(declare-const dummy12 us_rep1)

(declare-datatypes () ((s__ref1 (s__refqtmk1 (s__content1 us_rep1)))))
(define-fun s__ref_s__content__12__projection ((a s__ref1)) us_rep1 (s__content1
                                                                    a))

(declare-sort tTaSP12 0)

(declare-fun tTaSP1qtint2 (tTaSP12) Int)

;; tTaSP1'axiom
  (assert
  (forall ((i tTaSP12))
  (and (<= 1 (tTaSP1qtint2 i)) (<= (tTaSP1qtint2 i) 10))))

(define-fun in_range9 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE11 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check11 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE11 (us_image) Int)

(declare-fun user_eq13 (tTaSP12 tTaSP12) Bool)

(declare-const dummy13 tTaSP12)

(declare-datatypes ()
((tTaSP1__ref2 (tTaSP1__refqtmk2 (tTaSP1__content2 tTaSP12)))))
(define-fun tTaSP1__ref_tTaSP1__content__3__projection ((a tTaSP1__ref2)) tTaSP12 
  (tTaSP1__content2 a))

(declare-datatypes () ((t21b__ref (t21b__refqtmk (t21b__content us_t)))))
(define-fun t21b__ref_t21b__content__projection ((a t21b__ref)) us_t 
  (t21b__content a))

(declare-datatypes () ((t23b__ref (t23b__refqtmk (t23b__content us_t)))))
(define-fun t23b__ref_t23b__content__projection ((a t23b__ref)) us_t 
  (t23b__content a))

(declare-fun temp___String_Literal_769 (tuple0) (Array Int character))

;; temp___String_Literal_769__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_769 us_void_param) 1)) 104)
     (= (to_rep (select (temp___String_Literal_769 us_void_param) 2)) 101))
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_769 us_void_param) 3)) 108)
     (= (to_rep (select (temp___String_Literal_769 us_void_param) 4)) 108))
     (= (to_rep (select (temp___String_Literal_769 us_void_param) 5)) 111))
     (and
     (= (to_rep (select (temp___String_Literal_769 us_void_param) 6)) 32)
     (= (to_rep (select (temp___String_Literal_769 us_void_param) 7)) 119)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_769 us_void_param) 8)) 111)
     (= (to_rep (select (temp___String_Literal_769 us_void_param) 9)) 114))
     (and
     (= (to_rep (select (temp___String_Literal_769 us_void_param) 10)) 108)
     (= (to_rep (select (temp___String_Literal_769 us_void_param) 11)) 100))))) :pattern (
  (temp___String_Literal_769 us_void_param)) )))

(declare-fun temp___String_Literal_773 (tuple0) (Array Int character))

;; temp___String_Literal_773__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_773 us_void_param) 1)) 104)
     (= (to_rep (select (temp___String_Literal_773 us_void_param) 2)) 101))
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_773 us_void_param) 3)) 108)
     (= (to_rep (select (temp___String_Literal_773 us_void_param) 4)) 108))
     (= (to_rep (select (temp___String_Literal_773 us_void_param) 5)) 111))
     (and
     (= (to_rep (select (temp___String_Literal_773 us_void_param) 6)) 32)
     (= (to_rep (select (temp___String_Literal_773 us_void_param) 7)) 119)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_773 us_void_param) 8)) 111)
     (= (to_rep (select (temp___String_Literal_773 us_void_param) 9)) 114))
     (and
     (= (to_rep (select (temp___String_Literal_773 us_void_param) 10)) 108)
     (= (to_rep (select (temp___String_Literal_773 us_void_param) 11)) 100))))) :pattern (
  (temp___String_Literal_773 us_void_param)) )))

(declare-fun do_checks__do_range_check__B_19__a__aggregate_def (Int Int
  Int) us_t)

(declare-fun do_checks__do_range_check__B_20__a__aggregate_def (Int Int
  Int) us_t)

(define-fun dynamic_invariant4 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun dynamic_invariant5 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range4 temp___expr_74)))

(define-fun dynamic_invariant6 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(define-fun dynamic_invariant7 ((temp___expr_332 us_rep)
  (temp___is_init_328 Bool) (temp___skip_constant_329 Bool)
  (temp___do_toplevel_330 Bool)
  (temp___do_typ_inv_331 Bool)) Bool (=>
                                     (do_checks__do_range_check__B_17__s__c__pred
                                     temp___expr_332)
                                     (=>
                                     (or (= temp___is_init_328 true)
                                     (<= zero 1)) (dynamic_property3 
                                     zero 1
                                     (to_rep1
                                     (rec__do_checks__do_range_check__B_17__s__c
                                     (us_split_fields1 temp___expr_332)))))))

(define-fun dynamic_invariant8 ((temp___expr_338 us_rep1)
  (temp___is_init_334 Bool) (temp___skip_constant_335 Bool)
  (temp___do_toplevel_336 Bool)
  (temp___do_typ_inv_337 Bool)) Bool (=>
                                     (do_checks__do_range_check__B_18__s__c__pred
                                     temp___expr_338)
                                     (=>
                                     (or (= temp___is_init_334 true)
                                     (<= zero (- zero 1))) (dynamic_property4
                                     zero (- zero 1)
                                     (to_rep1
                                     (rec__do_checks__do_range_check__B_18__s__c
                                     (us_split_fields3 temp___expr_338)))))))

;; def_axiom
  (assert
  (forall ((temp___782 Int) (temp___783 Int) (temp___784 Int))
  (let ((temp___781 (do_checks__do_range_check__B_19__a__aggregate_def
                    temp___782 temp___783 temp___784)))
  (=> (dynamic_invariant5 temp___782 true true true true)
  (and
  (=> (dynamic_property 1 2147483647 temp___783 temp___784)
  (and (= (first1 temp___781) temp___783) (= (last1 temp___781) temp___784)))
  (forall ((temp___785 Int))
  (= (to_rep (select (to_array temp___781) temp___785)) temp___782)))))))

;; def_axiom
  (assert
  (forall ((temp___789 Int) (temp___790 Int) (temp___791 Int))
  (let ((temp___788 (do_checks__do_range_check__B_20__a__aggregate_def
                    temp___789 temp___790 temp___791)))
  (=> (dynamic_invariant5 temp___789 true true true true)
  (and
  (=> (dynamic_property 1 2147483647 temp___790 temp___791)
  (and (= (first1 temp___788) temp___790) (= (last1 temp___788) temp___791)))
  (forall ((temp___792 Int))
  (= (to_rep (select (to_array temp___788) temp___792)) temp___789)))))))

(declare-const branch Int)

;; Assume
  (assert (dynamic_invariant1 branch true false true true))

;; Assume
  (assert (dynamic_invariant zero true false true true))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite (= branch 0) true false)))

;; H
  (assert (not (= spark__branch true)))

(declare-const spark__branch1 Bool)

;; H
  (assert (= spark__branch1 (ite (= branch 1) true false)))

;; H
  (assert (not (= spark__branch1 true)))

(declare-const spark__branch2 Bool)

;; H
  (assert (= spark__branch2 (ite (= branch 2) true false)))

;; H
  (assert (not (= spark__branch2 true)))

(declare-const spark__branch3 Bool)

;; H
  (assert (= spark__branch3 (ite (= branch 3) true false)))

;; H
  (assert (not (= spark__branch3 true)))

(declare-const spark__branch4 Bool)

;; H
  (assert (= spark__branch4 (ite (= branch 4) true false)))

;; H
  (assert (not (= spark__branch4 true)))

(declare-const spark__branch5 Bool)

;; H
  (assert (= spark__branch5 (ite (= branch 5) true false)))

;; H
  (assert (not (= spark__branch5 true)))

(declare-const spark__branch6 Bool)

;; H
  (assert (= spark__branch6 (ite (= branch 6) true false)))

;; H
  (assert (not (= spark__branch6 true)))

(declare-const spark__branch7 Bool)

;; H
  (assert (= spark__branch7 (ite (= branch 7) true false)))

;; H
  (assert (not (= spark__branch7 true)))

(declare-const spark__branch8 Bool)

;; H
  (assert (= spark__branch8 (ite (= branch 8) true false)))

;; H
  (assert (not (= spark__branch8 true)))

(declare-const spark__branch9 Bool)

;; H
  (assert (= spark__branch9 (ite (= branch 9) true false)))

;; H
  (assert (not (= spark__branch9 true)))

(declare-const spark__branch10 Bool)

;; H
  (assert (= spark__branch10 (ite (= branch 10) true false)))

;; H
  (assert (not (= spark__branch10 true)))

(declare-const spark__branch11 Bool)

;; H
  (assert (= spark__branch11 (ite (= branch 11) true false)))

;; H
  (assert (not (= spark__branch11 true)))

(declare-const spark__branch12 Bool)

;; H
  (assert (= spark__branch12 (ite (= branch 12) true false)))

;; H
  (assert (not (= spark__branch12 true)))

(declare-const spark__branch13 Bool)

;; H
  (assert (= spark__branch13 (ite (= branch 13) true false)))

;; H
  (assert (not (= spark__branch13 true)))

(declare-const spark__branch14 Bool)

;; H
  (assert (= spark__branch14 (ite (= branch 14) true false)))

;; H
  (assert (not (= spark__branch14 true)))

(declare-const spark__branch15 Bool)

;; H
  (assert (= spark__branch15 (ite (= branch 15) true false)))

;; H
  (assert (= spark__branch15 true))

(declare-const a (Array Int character))

;; H
  (assert (= a (temp___String_Literal_773 Tuple0)))

;; Assume
  (assert true)

(assert
;; defqtvc
 ;; File "do_checks.adb", line 5, characters 0-0
  (not (in_range1 (- zero 1))))
(check-sat)

(exit)
