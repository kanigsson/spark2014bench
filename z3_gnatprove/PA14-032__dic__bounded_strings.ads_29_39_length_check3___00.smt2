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

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 65536))))

(define-fun in_range ((x Int)) Bool (and (<= 1 x) (<= x 65536)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (index_type index_type) Bool)

(declare-const dummy index_type)

(declare-datatypes ()
((index_type__ref (index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun to_rep ((x index_type)) Int (index_typeqtint x))

(declare-fun of_rep (Int) index_type)

;; inversion_axiom
  (assert
  (forall ((x index_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x index_type)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort length_type 0)

(declare-fun length_typeqtint (length_type) Int)

;; length_type'axiom
  (assert
  (forall ((i length_type))
  (and (<= 0 (length_typeqtint i)) (<= (length_typeqtint i) 65536))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 65536)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (length_type length_type) Bool)

(declare-const dummy1 length_type)

(declare-datatypes ()
((length_type__ref (length_type__refqtmk (length_type__content length_type)))))
(define-fun length_type__ref_length_type__content__projection ((a length_type__ref)) length_type 
  (length_type__content a))

(define-fun to_rep1 ((x length_type)) Int (length_typeqtint x))

(declare-fun of_rep1 (Int) length_type)

;; inversion_axiom
  (assert
  (forall ((x length_type))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x length_type)) (! (in_range1
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

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

(declare-fun user_eq3 (positive positive) Bool)

(declare-const dummy3 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-sort character 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (character character) Bool)

(declare-const dummy4 character)

(declare-datatypes ()
((character__ref (character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep2 (character) Int)

(declare-fun of_rep2 (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range4
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

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
                           (= (to_rep2 (select a temp___idx_91)) (to_rep2
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
  (= (to_rep2 (select a temp___idx_91)) (to_rep2
                                        (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(define-fun to_rep3 ((x integer)) Int (integerqtint x))

(declare-fun of_rep3 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range2 (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep3 (first (mk f l))) f) (= (to_rep3 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int character))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int character) (elts a))

(define-fun of_array ((a (Array Int character)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep3 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep3 (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep3 (first (rt x)))
                 (to_rep3 (last (rt x))) (elts y) (to_rep3 (first (rt y)))
                 (to_rep3 (last (rt y)))))

(declare-fun user_eq5 (us_t us_t) Bool)

(declare-const dummy5 us_t)

(declare-datatypes ()
((string____ref (string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(declare-datatypes () ((t3s__ref (t3s__refqtmk (t3s__content us_t)))))
(define-fun t3s__ref_t3s__content__projection ((a t3s__ref)) us_t (t3s__content
                                                                  a))

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk
 (rec__bounded_strings__bounded_string__bound index_type)))))
(define-fun us_split_discrs_rec__bounded_strings__bounded_string__bound__projection ((a us_split_discrs)) index_type 
  (rec__bounded_strings__bounded_string__bound a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__bounded_strings__bounded_string__text us_t)(rec__bounded_strings__bounded_string__length length_type)))))
(define-fun us_split_fields_rec__bounded_strings__bounded_string__text__projection ((a us_split_fields)) us_t 
  (rec__bounded_strings__bounded_string__text a))

(define-fun us_split_fields_rec__bounded_strings__bounded_string__length__projection ((a us_split_fields)) length_type 
  (rec__bounded_strings__bounded_string__length a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__bounded_strings__bounded_string__bound
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__bounded_strings__bounded_string__bound
                                                  (us_split_discrs1 b))))
                        (and
                        (= (bool_eq1
                           (rec__bounded_strings__bounded_string__text
                           (us_split_fields1 a))
                           (rec__bounded_strings__bounded_string__text
                           (us_split_fields1 b))) true)
                        (= (to_rep1
                           (rec__bounded_strings__bounded_string__length
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__bounded_strings__bounded_string__length
                                                  (us_split_fields1 b))))))
                   true false))

(define-fun in_range5 ((rec__bounded_strings__bounded_string__bound1 Int)
  (a us_split_discrs)) Bool (= rec__bounded_strings__bounded_string__bound1 
  (to_rep (rec__bounded_strings__bounded_string__bound a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const bounded_strings__bounded_string__bound__first__bit Int)

(declare-const bounded_strings__bounded_string__bound__last__bit Int)

(declare-const bounded_strings__bounded_string__bound__position Int)

;; bounded_strings__bounded_string__bound__first__bit_axiom
  (assert (<= 0 bounded_strings__bounded_string__bound__first__bit))

;; bounded_strings__bounded_string__bound__last__bit_axiom
  (assert
  (< bounded_strings__bounded_string__bound__first__bit bounded_strings__bounded_string__bound__last__bit))

;; bounded_strings__bounded_string__bound__position_axiom
  (assert (<= 0 bounded_strings__bounded_string__bound__position))

(declare-const bounded_strings__bounded_string__text__first__bit Int)

(declare-const bounded_strings__bounded_string__text__last__bit Int)

(declare-const bounded_strings__bounded_string__text__position Int)

;; bounded_strings__bounded_string__text__first__bit_axiom
  (assert (<= 0 bounded_strings__bounded_string__text__first__bit))

;; bounded_strings__bounded_string__text__last__bit_axiom
  (assert
  (< bounded_strings__bounded_string__text__first__bit bounded_strings__bounded_string__text__last__bit))

;; bounded_strings__bounded_string__text__position_axiom
  (assert (<= 0 bounded_strings__bounded_string__text__position))

(declare-const bounded_strings__bounded_string__length__first__bit Int)

(declare-const bounded_strings__bounded_string__length__last__bit Int)

(declare-const bounded_strings__bounded_string__length__position Int)

;; bounded_strings__bounded_string__length__first__bit_axiom
  (assert (<= 0 bounded_strings__bounded_string__length__first__bit))

;; bounded_strings__bounded_string__length__last__bit_axiom
  (assert
  (< bounded_strings__bounded_string__length__first__bit bounded_strings__bounded_string__length__last__bit))

;; bounded_strings__bounded_string__length__position_axiom
  (assert (<= 0 bounded_strings__bounded_string__length__position))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ()
((bounded_string__ref
 (bounded_string__refqtmk (bounded_string__content us_rep)))))
(define-fun bounded_string__ref_bounded_string__content__projection ((a bounded_string__ref)) us_rep 
  (bounded_string__content a))

(declare-fun length1 (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(define-fun dynamic_invariant ((temp___expr_176 us_rep)
  (temp___is_init_172 Bool) (temp___skip_constant_173 Bool)
  (temp___do_toplevel_174 Bool)
  (temp___do_typ_inv_175 Bool)) Bool (let ((temp___177 (rec__bounded_strings__bounded_string__bound
                                                       (us_split_discrs1
                                                       temp___expr_176))))
                                     (and (dynamic_property 1
                                     (to_rep temp___177)
                                     (first1
                                     (rec__bounded_strings__bounded_string__text
                                     (us_split_fields1 temp___expr_176)))
                                     (last1
                                     (rec__bounded_strings__bounded_string__text
                                     (us_split_fields1 temp___expr_176))))
                                     (and
                                     (= (first1
                                        (rec__bounded_strings__bounded_string__text
                                        (us_split_fields1 temp___expr_176))) 1)
                                     (= (last1
                                        (rec__bounded_strings__bounded_string__text
                                        (us_split_fields1 temp___expr_176))) 
                                     (to_rep temp___177))))))

(define-fun dynamic_invariant1 ((temp___expr_169 Int)
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (=>
                                     (or (= temp___is_init_165 true)
                                     (<= 0 65536)) (in_range1
                                     temp___expr_169)))

;; length__post_axiom
  (assert
  (forall ((source us_rep))
  (! (=> (dynamic_invariant source true true true true)
     (let ((result (length1 source)))
     (=> (length__function_guard result source) (dynamic_invariant1 result
     true false true true)))) :pattern ((length1 source)) )))

;; length__def_axiom
  (assert
  (forall ((source us_rep))
  (! (=> (dynamic_invariant source true true true true)
     (= (length1 source) (to_rep1
                         (rec__bounded_strings__bounded_string__length
                         (us_split_fields1 source))))) :pattern ((length1
                                                                 source)) )))

(define-fun dynamic_invariant2 ((temp___expr_162 Int)
  (temp___is_init_158 Bool) (temp___skip_constant_159 Bool)
  (temp___do_toplevel_160 Bool)
  (temp___do_typ_inv_161 Bool)) Bool (=>
                                     (or (= temp___is_init_158 true)
                                     (<= 1 65536)) (in_range
                                     temp___expr_162)))

(declare-datatypes () ((t5s__ref (t5s__refqtmk (t5s__content us_t)))))
(define-fun t5s__ref_t5s__content__projection ((a t5s__ref)) us_t (t5s__content
                                                                  a))

(declare-fun temp_____aggregate_def_199 (Int Int Int) us_t)

(define-fun dynamic_invariant3 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun dynamic_invariant4 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range4 temp___expr_74)))

(define-fun dynamic_invariant5 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(define-fun dynamic_invariant6 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

;; def_axiom
  (assert
  (forall ((temp___201 Int) (temp___202 Int) (temp___203 Int))
  (let ((temp___200 (temp_____aggregate_def_199 temp___201 temp___202
                    temp___203)))
  (=> (dynamic_invariant4 temp___201 true true true true)
  (and
  (=> (dynamic_property 1 2147483647 temp___202 temp___203)
  (and (= (first1 temp___200) temp___202) (= (last1 temp___200) temp___203)))
  (forall ((temp___204 Int))
  (= (to_rep2 (select (to_array temp___200) temp___204)) temp___201)))))))

(declare-const usf Int)

;; Ensures
  (assert (dynamic_invariant2 usf true true true true))

(declare-const usf1 us_rep)

;; Ensures
  (assert
  (= usf (to_rep
         (rec__bounded_strings__bounded_string__bound
         (us_split_discrs1 usf1)))))

(define-fun temp___212 () us_t (temp_____aggregate_def_199 32 1 usf))

;; Assume
  (assert (= (first1 temp___212) 1))

;; Assume
  (assert (= (last1 temp___212) usf))

;; H
  (assert (<= (first1 temp___212) (last1 temp___212)))

(assert
;; defqtvc
 ;; File "/home/kanig/dev/spark2014/benchmark_script/data/tmp-test-PA14-032__dic-25465/src/gnatprove/bounded_strings__bounded_string.mlw", line 1039, characters 5-8
  (not (<= 1 usf)))
(check-sat)
