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

(declare-sort foo_kind 0)

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (foo_kind foo_kind) Bool)

(declare-const dummy foo_kind)

(declare-datatypes ()
((foo_kind__ref (foo_kind__refqtmk (foo_kind__content foo_kind)))))
(define-fun foo_kind__ref_foo_kind__content__projection ((a foo_kind__ref)) foo_kind 
  (foo_kind__content a))

(define-fun dynamic_invariant ((temp___expr_158 Int)
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool)
  (temp___do_typ_inv_157 Bool)) Bool (=>
                                     (or (= temp___is_init_154 true)
                                     (<= 0 2)) (in_range temp___expr_158)))

(declare-fun to_rep (foo_kind) Int)

(declare-fun of_rep (Int) foo_kind)

;; inversion_axiom
  (assert
  (forall ((x foo_kind))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x foo_kind)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort bar_kind 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (bar_kind bar_kind) Bool)

(declare-const dummy1 bar_kind)

(declare-datatypes ()
((bar_kind__ref (bar_kind__refqtmk (bar_kind__content bar_kind)))))
(define-fun bar_kind__ref_bar_kind__content__projection ((a bar_kind__ref)) bar_kind 
  (bar_kind__content a))

(declare-sort character 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (character character) Bool)

(declare-const dummy2 character)

(declare-datatypes ()
((character__ref (character__refqtmk (character__content character)))))
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

(define-fun in_range3 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (integer integer) Bool)

(declare-const dummy3 integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep2 ((x integer)) Int (integerqtint x))

(declare-fun of_rep2 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range4 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-fun to_rep3 (bar_kind) Int)

(declare-fun of_rep3 (Int) bar_kind)

;; inversion_axiom
  (assert
  (forall ((x bar_kind))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x bar_kind)) (! (in_range1 (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__repro__blech_type__opt bar_kind)))))
(define-fun us_split_discrs_rec__repro__blech_type__opt__projection ((a us_split_discrs)) bar_kind 
  (rec__repro__blech_type__opt a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__repro__blech_type__x integer)(rec__repro__blech_type__y Bool)))))
(define-fun us_split_fields_rec__repro__blech_type__x__projection ((a us_split_fields)) integer 
  (rec__repro__blech_type__x a))

(define-fun us_split_fields_rec__repro__blech_type__y__projection ((a us_split_fields)) Bool 
  (rec__repro__blech_type__y a))

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

(define-fun repro__blech_type__x__pred ((a us_rep)) Bool (= (to_rep3
                                                            (rec__repro__blech_type__opt
                                                            (us_split_discrs1
                                                            a))) 1))

(define-fun repro__blech_type__y__pred ((a us_rep)) Bool (= (to_rep3
                                                            (rec__repro__blech_type__opt
                                                            (us_split_discrs1
                                                            a))) 2))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep3
                           (rec__repro__blech_type__opt (us_split_discrs1 a))) 
                        (to_rep3
                        (rec__repro__blech_type__opt (us_split_discrs1 b))))
                        (and
                        (=> (repro__blech_type__x__pred a)
                        (= (to_rep2
                           (rec__repro__blech_type__x (us_split_fields1 a))) 
                        (to_rep2
                        (rec__repro__blech_type__x (us_split_fields1 b)))))
                        (=> (repro__blech_type__y__pred a)
                        (= (ite (rec__repro__blech_type__y
                                (us_split_fields1 a)) 1 0) (ite (rec__repro__blech_type__y
                                                                (us_split_fields1
                                                                b)) 1 0)))))
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

(declare-const repro__blech_type__opt__first__bit Int)

(declare-const repro__blech_type__opt__last__bit Int)

(declare-const repro__blech_type__opt__position Int)

;; repro__blech_type__opt__first__bit_axiom
  (assert (<= 0 repro__blech_type__opt__first__bit))

;; repro__blech_type__opt__last__bit_axiom
  (assert
  (< repro__blech_type__opt__first__bit repro__blech_type__opt__last__bit))

;; repro__blech_type__opt__position_axiom
  (assert (<= 0 repro__blech_type__opt__position))

(declare-const repro__blech_type__x__first__bit Int)

(declare-const repro__blech_type__x__last__bit Int)

(declare-const repro__blech_type__x__position Int)

;; repro__blech_type__x__first__bit_axiom
  (assert (<= 0 repro__blech_type__x__first__bit))

;; repro__blech_type__x__last__bit_axiom
  (assert
  (< repro__blech_type__x__first__bit repro__blech_type__x__last__bit))

;; repro__blech_type__x__position_axiom
  (assert (<= 0 repro__blech_type__x__position))

(declare-const repro__blech_type__y__first__bit Int)

(declare-const repro__blech_type__y__last__bit Int)

(declare-const repro__blech_type__y__position Int)

;; repro__blech_type__y__first__bit_axiom
  (assert (<= 0 repro__blech_type__y__first__bit))

;; repro__blech_type__y__last__bit_axiom
  (assert
  (< repro__blech_type__y__first__bit repro__blech_type__y__last__bit))

;; repro__blech_type__y__position_axiom
  (assert (<= 0 repro__blech_type__y__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes () ((t1s__ref (t1s__refqtmk (t1s__content us_rep)))))
(define-fun t1s__ref_t1s__content__projection ((a t1s__ref)) us_rep (t1s__content
                                                                    a))

(declare-datatypes ()
((us_split_discrs2
 (us_split_discrsqtmk1 (rec__repro__fnord_type__opt foo_kind)))))
(define-fun us_split_discrs_rec__repro__fnord_type__opt__projection ((a us_split_discrs2)) foo_kind 
  (rec__repro__fnord_type__opt a))

(declare-datatypes ()
((us_split_discrs__ref1
 (us_split_discrs__refqtmk1 (us_split_discrs__content1 us_split_discrs2)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref1)) us_split_discrs2 
  (us_split_discrs__content1 a))

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1
 (rec__repro__fnord_type__z character)(rec__repro__fnord_type__blech us_rep)))))
(define-fun us_split_fields_rec__repro__fnord_type__z__projection ((a us_split_fields2)) character 
  (rec__repro__fnord_type__z a))

(define-fun us_split_fields_rec__repro__fnord_type__blech__projection ((a us_split_fields2)) us_rep 
  (rec__repro__fnord_type__blech a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep1
 (us_repqtmk1
 (us_split_discrs3 us_split_discrs2)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs2 
  (us_split_discrs3 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun repro__fnord_type__z__pred ((a us_rep1)) Bool (= (to_rep
                                                             (rec__repro__fnord_type__opt
                                                             (us_split_discrs3
                                                             a))) 0))

(define-fun repro__fnord_type__blech__pred ((a us_rep1)) Bool (and
                                                              (<= 1 (to_rep
                                                                    (rec__repro__fnord_type__opt
                                                                    (us_split_discrs3
                                                                    a))))
                                                              (<= (to_rep
                                                                  (rec__repro__fnord_type__opt
                                                                  (us_split_discrs3
                                                                  a))) 2)))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__repro__fnord_type__opt
                            (us_split_discrs3 a))) (to_rep
                                                   (rec__repro__fnord_type__opt
                                                   (us_split_discrs3 b))))
                         (and
                         (=> (repro__fnord_type__z__pred a)
                         (= (to_rep1
                            (rec__repro__fnord_type__z (us_split_fields3 a))) 
                         (to_rep1
                         (rec__repro__fnord_type__z (us_split_fields3 b)))))
                         (=> (repro__fnord_type__blech__pred a)
                         (= (bool_eq
                            (rec__repro__fnord_type__blech
                            (us_split_fields3 a))
                            (rec__repro__fnord_type__blech
                            (us_split_fields3 b))) true))))
                    true false))

(define-fun in_range5 ((rec__repro__fnord_type__opt1 Int)
  (a us_split_discrs2)) Bool (= rec__repro__fnord_type__opt1 (to_rep
                                                             (rec__repro__fnord_type__opt
                                                             a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const repro__fnord_type__opt__first__bit Int)

(declare-const repro__fnord_type__opt__last__bit Int)

(declare-const repro__fnord_type__opt__position Int)

;; repro__fnord_type__opt__first__bit_axiom
  (assert (<= 0 repro__fnord_type__opt__first__bit))

;; repro__fnord_type__opt__last__bit_axiom
  (assert
  (< repro__fnord_type__opt__first__bit repro__fnord_type__opt__last__bit))

;; repro__fnord_type__opt__position_axiom
  (assert (<= 0 repro__fnord_type__opt__position))

(declare-const repro__fnord_type__z__first__bit Int)

(declare-const repro__fnord_type__z__last__bit Int)

(declare-const repro__fnord_type__z__position Int)

;; repro__fnord_type__z__first__bit_axiom
  (assert (<= 0 repro__fnord_type__z__first__bit))

;; repro__fnord_type__z__last__bit_axiom
  (assert
  (< repro__fnord_type__z__first__bit repro__fnord_type__z__last__bit))

;; repro__fnord_type__z__position_axiom
  (assert (<= 0 repro__fnord_type__z__position))

(declare-const repro__fnord_type__blech__first__bit Int)

(declare-const repro__fnord_type__blech__last__bit Int)

(declare-const repro__fnord_type__blech__position Int)

;; repro__fnord_type__blech__first__bit_axiom
  (assert (<= 0 repro__fnord_type__blech__first__bit))

;; repro__fnord_type__blech__last__bit_axiom
  (assert
  (< repro__fnord_type__blech__first__bit repro__fnord_type__blech__last__bit))

;; repro__fnord_type__blech__position_axiom
  (assert (<= 0 repro__fnord_type__blech__position))

(declare-fun user_eq5 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ()
((fnord_type__ref (fnord_type__refqtmk (fnord_type__content us_rep1)))))
(define-fun fnord_type__ref_fnord_type__content__projection ((a fnord_type__ref)) us_rep1 
  (fnord_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range4 temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range2 temp___expr_74)))

(define-fun dynamic_invariant3 ((temp___expr_165 Int)
  (temp___is_init_161 Bool) (temp___skip_constant_162 Bool)
  (temp___do_toplevel_163 Bool)
  (temp___do_typ_inv_164 Bool)) Bool (=>
                                     (or (= temp___is_init_161 true)
                                     (<= 1 2)) (in_range1 temp___expr_165)))

(define-fun in_range6 ((rec__repro__blech_type__opt1 Int)
  (a us_split_discrs)) Bool (= rec__repro__blech_type__opt1 (to_rep3
                                                            (rec__repro__blech_type__opt
                                                            a))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const repro__blech_type__opt__first__bit1 Int)

(declare-const repro__blech_type__opt__last__bit1 Int)

(declare-const repro__blech_type__opt__position1 Int)

;; repro__blech_type__opt__first__bit_axiom
  (assert (<= 0 repro__blech_type__opt__first__bit1))

;; repro__blech_type__opt__last__bit_axiom
  (assert
  (< repro__blech_type__opt__first__bit1 repro__blech_type__opt__last__bit1))

;; repro__blech_type__opt__position_axiom
  (assert (<= 0 repro__blech_type__opt__position1))

(declare-const repro__blech_type__x__first__bit1 Int)

(declare-const repro__blech_type__x__last__bit1 Int)

(declare-const repro__blech_type__x__position1 Int)

;; repro__blech_type__x__first__bit_axiom
  (assert (<= 0 repro__blech_type__x__first__bit1))

;; repro__blech_type__x__last__bit_axiom
  (assert
  (< repro__blech_type__x__first__bit1 repro__blech_type__x__last__bit1))

;; repro__blech_type__x__position_axiom
  (assert (<= 0 repro__blech_type__x__position1))

(declare-const repro__blech_type__y__first__bit1 Int)

(declare-const repro__blech_type__y__last__bit1 Int)

(declare-const repro__blech_type__y__position1 Int)

;; repro__blech_type__y__first__bit_axiom
  (assert (<= 0 repro__blech_type__y__first__bit1))

;; repro__blech_type__y__last__bit_axiom
  (assert
  (< repro__blech_type__y__first__bit1 repro__blech_type__y__last__bit1))

;; repro__blech_type__y__position_axiom
  (assert (<= 0 repro__blech_type__y__position1))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ()
((blech_type__ref (blech_type__refqtmk (blech_type__content us_rep)))))
(define-fun blech_type__ref_blech_type__content__projection ((a blech_type__ref)) us_rep 
  (blech_type__content a))

(define-fun default_initial_assumption ((temp___expr_174 us_rep)
  (temp___skip_top_level_175 Bool)) Bool (= (to_rep3
                                            (rec__repro__blech_type__opt
                                            (us_split_discrs1
                                            temp___expr_174))) 1))

(define-fun dynamic_invariant4 ((temp___expr_183 us_rep1)
  (temp___is_init_179 Bool) (temp___skip_constant_180 Bool)
  (temp___do_toplevel_181 Bool)
  (temp___do_typ_inv_182 Bool)) Bool (=> (repro__fnord_type__blech__pred
                                     temp___expr_183) (in_range6
                                     (to_rep
                                     (rec__repro__fnord_type__opt
                                     (us_split_discrs3 temp___expr_183)))
                                     (us_split_discrs1
                                     (rec__repro__fnord_type__blech
                                     (us_split_fields3 temp___expr_183))))))

(define-fun default_initial_assumption1 ((temp___expr_186 us_rep1)
  (temp___skip_top_level_187 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__repro__fnord_type__opt
                                            (us_split_discrs3
                                            temp___expr_186))) 0)
                                         (=> (repro__fnord_type__blech__pred
                                         temp___expr_186)
                                         (= (to_rep3
                                            (rec__repro__blech_type__opt
                                            (us_split_discrs1
                                            (rec__repro__fnord_type__blech
                                            (us_split_fields3
                                            temp___expr_186))))) (to_rep
                                                                 (rec__repro__fnord_type__opt
                                                                 (us_split_discrs3
                                                                 temp___expr_186)))))))

(declare-const usf Int)

;; Ensures
  (assert (dynamic_invariant usf true true true true))

(declare-const usf1 us_rep1)

;; Ensures
  (assert
  (= (to_rep (rec__repro__fnord_type__opt (us_split_discrs3 usf1))) usf))

;; H
  (assert (repro__fnord_type__blech__pred usf1))

(assert
;; defqtvc
 ;; File "repro.ads", line 1, characters 0-0
  (not (in_range1 usf)))
(check-sat)

(exit)
