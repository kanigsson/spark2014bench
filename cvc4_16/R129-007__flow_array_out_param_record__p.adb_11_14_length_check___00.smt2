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

(declare-sort character 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (character character) Bool)

(declare-const dummy2 character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep1 (character) Int)

(declare-fun of_rep1 (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int character))))))
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
                           (= (to_rep1 (select a temp___idx_91)) (to_rep1
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
  (= (to_rep1 (select a temp___idx_91)) (to_rep1
                                        (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range f)
     (=> (in_range l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int character))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int character) (elts a))

(define-fun of_array ((a (Array Int character)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((string____ref 0))
(((string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(declare-datatypes ((t2s__ref 0))
(((t2s__refqtmk (t2s__content us_t)))))
(define-fun t2s__ref_t2s__content__projection ((a t2s__ref)) us_t (t2s__content
                                                                  a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__p__my_rec__len integer)))))
(define-fun us_split_discrs_rec__p__my_rec__len__projection ((a us_split_discrs)) integer 
  (rec__p__my_rec__len a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__p__my_rec__a us_t)))))
(define-fun us_split_fields_rec__p__my_rec__a__projection ((a us_split_fields)) us_t 
  (rec__p__my_rec__a a))

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
                        (= (to_rep
                           (rec__p__my_rec__len (us_split_discrs1 a))) 
                        (to_rep (rec__p__my_rec__len (us_split_discrs1 b))))
                        (= (bool_eq1 (rec__p__my_rec__a (us_split_fields1 a))
                           (rec__p__my_rec__a (us_split_fields1 b))) true))
                   true false))

(define-fun in_range3 ((rec__p__my_rec__len1 Int)
  (a us_split_discrs)) Bool (= rec__p__my_rec__len1 (to_rep
                                                    (rec__p__my_rec__len a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const p__my_rec__len__first__bit Int)

(declare-const p__my_rec__len__last__bit Int)

(declare-const p__my_rec__len__position Int)

;; p__my_rec__len__first__bit_axiom
  (assert (<= 0 p__my_rec__len__first__bit))

;; p__my_rec__len__last__bit_axiom
  (assert (< p__my_rec__len__first__bit p__my_rec__len__last__bit))

;; p__my_rec__len__position_axiom
  (assert (<= 0 p__my_rec__len__position))

(declare-const p__my_rec__a__first__bit Int)

(declare-const p__my_rec__a__last__bit Int)

(declare-const p__my_rec__a__position Int)

;; p__my_rec__a__first__bit_axiom
  (assert (<= 0 p__my_rec__a__first__bit))

;; p__my_rec__a__last__bit_axiom
  (assert (< p__my_rec__a__first__bit p__my_rec__a__last__bit))

;; p__my_rec__a__position_axiom
  (assert (<= 0 p__my_rec__a__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((my_rec__ref 0))
(((my_rec__refqtmk (my_rec__content us_rep)))))
(define-fun my_rec__ref_my_rec__content__projection ((a my_rec__ref)) us_rep 
  (my_rec__content a))

(define-fun dynamic_invariant1 ((temp___expr_159 us_rep)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (let ((temp___160 (rec__p__my_rec__len
                                                       (us_split_discrs1
                                                       temp___expr_159))))
                                     (and (dynamic_property 1
                                     (to_rep temp___160)
                                     (first1
                                     (rec__p__my_rec__a
                                     (us_split_fields1 temp___expr_159)))
                                     (last1
                                     (rec__p__my_rec__a
                                     (us_split_fields1 temp___expr_159))))
                                     (and
                                     (= (first1
                                        (rec__p__my_rec__a
                                        (us_split_fields1 temp___expr_159))) 1)
                                     (= (last1
                                        (rec__p__my_rec__a
                                        (us_split_fields1 temp___expr_159))) 
                                     (to_rep temp___160))))))

(declare-const x__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const r9b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ((s8b__ref 0))
(((s8b__refqtmk (s8b__content us_t)))))
(define-fun s8b__ref_s8b__content__projection ((a s8b__ref)) us_t (s8b__content
                                                                  a))

(declare-datatypes ((t11b__ref 0))
(((t11b__refqtmk (t11b__content us_t)))))
(define-fun t11b__ref_t11b__content__projection ((a t11b__ref)) us_t 
  (t11b__content a))

(declare-fun temp_____aggregate_def_206 (Int Int Int) us_t)

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

(define-fun dynamic_invariant3 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range2 temp___expr_74)))

(define-fun dynamic_invariant4 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

;; def_axiom
  (assert
  (forall ((temp___208 Int) (temp___209 Int) (temp___210 Int))
  (let ((temp___207 (temp_____aggregate_def_206 temp___208 temp___209
                    temp___210)))
  (=> (dynamic_invariant3 temp___208 true true true true)
  (and
  (=> (dynamic_property 1 2147483647 temp___209 temp___210)
  (and (= (first1 temp___207) temp___209) (= (last1 temp___207) temp___210)))
  (forall ((temp___211 Int))
  (= (to_rep1 (select (to_array temp___207) temp___211)) temp___208)))))))

(define-fun dynamic_invariant5 ((temp___expr_180 us_t)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (=>
                                     (not (= temp___skip_constant_177 true))
                                     (and (dynamic_property 1 r9b
                                     (first1 temp___expr_180)
                                     (last1 temp___expr_180))
                                     (and (= (first1 temp___expr_180) 1)
                                     (= (last1 temp___expr_180) r9b)))))

(define-fun default_initial_assumption ((temp___expr_182 us_t)
  (temp___skip_top_level_183 Bool)) Bool (and (= (first1 temp___expr_182) 1)
                                         (= (last1 temp___expr_182) r9b)))

(assert
;; defqtvc
 ;; File "p.adb", line 9, characters 0-0
  (not
  (forall ((x__split_fields us_t) (p__proc__2__R9b__assume Int))
  (=> (dynamic_invariant1
  (us_repqtmk x__split_discrs (us_split_fieldsqtmk x__split_fields)) false
  false true true)
  (=>
  (= (to_rep (rec__p__my_rec__len x__split_discrs)) p__proc__2__R9b__assume)
  (=> (= p__proc__2__R9b__assume r9b)
  (=> (dynamic_invariant r9b true false true true)
  (let ((temp___212 (temp_____aggregate_def_206 32 1 r9b)))
  (=> (= (first1 temp___212) 1)
  (=> (= (last1 temp___212) r9b)
  (=> (<= (first1 temp___212) (last1 temp___212)) (<= 1 r9b))))))))))))
(check-sat)
(exit)
