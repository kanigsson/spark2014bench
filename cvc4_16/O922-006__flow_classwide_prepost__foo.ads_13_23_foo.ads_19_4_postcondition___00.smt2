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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun to_rep1 ((x positive)) Int (positiveqtint x))

(declare-fun of_rep1 (Int) positive)

;; inversion_axiom
  (assert
  (forall ((x positive))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x positive)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__foo__point__x integer)(rec__foo__point__y integer)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__foo__point__x__projection ((a us_split_fields)) integer 
  (rec__foo__point__x a))

(define-fun us_split_fields_rec__foo__point__y__projection ((a us_split_fields)) integer 
  (rec__foo__point__y a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep (rec__foo__point__x (us_split_fields1 a))) 
                        (to_rep (rec__foo__point__x (us_split_fields1 b))))
                        (= (to_rep (rec__foo__point__y (us_split_fields1 a))) 
                        (to_rep (rec__foo__point__y (us_split_fields1 b)))))
                   true false))

(declare-fun us_dispatch_eq (us_rep us_rep) Bool)

(declare-const us_tag Int)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const foo__point__x__first__bit Int)

(declare-const foo__point__x__last__bit Int)

(declare-const foo__point__x__position Int)

;; foo__point__x__first__bit_axiom
  (assert (<= 0 foo__point__x__first__bit))

;; foo__point__x__last__bit_axiom
  (assert (< foo__point__x__first__bit foo__point__x__last__bit))

;; foo__point__x__position_axiom
  (assert (<= 0 foo__point__x__position))

(declare-const foo__point__y__first__bit Int)

(declare-const foo__point__y__last__bit Int)

(declare-const foo__point__y__position Int)

;; foo__point__y__first__bit_axiom
  (assert (<= 0 foo__point__y__first__bit))

;; foo__point__y__last__bit_axiom
  (assert (< foo__point__y__first__bit foo__point__y__last__bit))

;; foo__point__y__position_axiom
  (assert (<= 0 foo__point__y__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((point__ref 0))
(((point__refqtmk (point__content us_rep)))))
(define-fun point__ref_point__content__projection ((a point__ref)) us_rep 
  (point__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__foo__blinking_point__annoyance_level positive)(rec__foo__point__x1 integer)(rec__foo__point__y1 integer)(rec__ext__1 us_private)))))
(define-fun us_split_fields_rec__foo__blinking_point__annoyance_level__projection ((a us_split_fields2)) positive 
  (rec__foo__blinking_point__annoyance_level a))

(define-fun us_split_fields_rec__foo__point__x__2__projection ((a us_split_fields2)) integer 
  (rec__foo__point__x1 a))

(define-fun us_split_fields_rec__foo__point__y__2__projection ((a us_split_fields2)) integer 
  (rec__foo__point__y1 a))

(define-fun us_split_fields_rec__ext____2__projection ((a us_split_fields2)) us_private 
  (rec__ext__1 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)(attr__tag1 Int)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun us_rep_attr__tag__2__projection ((a us_rep1)) Int (attr__tag1 a))

(declare-fun hide_ext__ (positive us_private) us_private)

(declare-fun extract__foo__blinking_point__annoyance_level (us_private) positive)

;; extract__foo__blinking_point__annoyance_level__conv
  (assert
  (forall ((foo__blinking_point__annoyance_level positive))
  (forall ((rec__ext__2 us_private))
  (= (extract__foo__blinking_point__annoyance_level
     (hide_ext__ foo__blinking_point__annoyance_level rec__ext__2)) foo__blinking_point__annoyance_level))))

(declare-fun extract__ext__ (us_private) us_private)

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk
                                         (us_split_fieldsqtmk
                                         (rec__foo__point__x1
                                         (us_split_fields3 a))
                                         (rec__foo__point__y1
                                         (us_split_fields3 a))
                                         (hide_ext__
                                         (rec__foo__blinking_point__annoyance_level
                                         (us_split_fields3 a))
                                         (rec__ext__1 (us_split_fields3 a))))
                                         (attr__tag1 a)))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1
                                         (us_split_fieldsqtmk1
                                         (extract__foo__blinking_point__annoyance_level
                                         (rec__ext__ (us_split_fields1 r)))
                                         (rec__foo__point__x
                                         (us_split_fields1 r))
                                         (rec__foo__point__y
                                         (us_split_fields1 r))
                                         (extract__ext__
                                         (rec__ext__ (us_split_fields1 r))))
                                         (attr__tag r)))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (and
                         (= (to_rep1
                            (rec__foo__blinking_point__annoyance_level
                            (us_split_fields3 a))) (to_rep1
                                                   (rec__foo__blinking_point__annoyance_level
                                                   (us_split_fields3 b))))
                         (= (to_rep
                            (rec__foo__point__x1 (us_split_fields3 a))) 
                         (to_rep (rec__foo__point__x1 (us_split_fields3 b)))))
                         (= (to_rep
                            (rec__foo__point__y1 (us_split_fields3 a))) 
                         (to_rep (rec__foo__point__y1 (us_split_fields3 b)))))
                    true false))

(declare-const us_tag1 Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const foo__blinking_point__annoyance_level__first__bit Int)

(declare-const foo__blinking_point__annoyance_level__last__bit Int)

(declare-const foo__blinking_point__annoyance_level__position Int)

;; foo__blinking_point__annoyance_level__first__bit_axiom
  (assert (<= 0 foo__blinking_point__annoyance_level__first__bit))

;; foo__blinking_point__annoyance_level__last__bit_axiom
  (assert
  (< foo__blinking_point__annoyance_level__first__bit foo__blinking_point__annoyance_level__last__bit))

;; foo__blinking_point__annoyance_level__position_axiom
  (assert (<= 0 foo__blinking_point__annoyance_level__position))

(declare-const foo__point__x__first__bit1 Int)

(declare-const foo__point__x__last__bit1 Int)

(declare-const foo__point__x__position1 Int)

;; foo__point__x__first__bit_axiom
  (assert (<= 0 foo__point__x__first__bit1))

;; foo__point__x__last__bit_axiom
  (assert (< foo__point__x__first__bit1 foo__point__x__last__bit1))

;; foo__point__x__position_axiom
  (assert (<= 0 foo__point__x__position1))

(declare-const foo__point__y__first__bit1 Int)

(declare-const foo__point__y__last__bit1 Int)

(declare-const foo__point__y__position1 Int)

;; foo__point__y__first__bit_axiom
  (assert (<= 0 foo__point__y__first__bit1))

;; foo__point__y__last__bit_axiom
  (assert (< foo__point__y__first__bit1 foo__point__y__last__bit1))

;; foo__point__y__position_axiom
  (assert (<= 0 foo__point__y__position1))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((blinking_point__ref 0))
(((blinking_point__refqtmk (blinking_point__content us_rep1)))))
(define-fun blinking_point__ref_blinking_point__content__projection ((a blinking_point__ref)) us_rep1 
  (blinking_point__content a))

(declare-const p__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun default_initial_assumption ((temp___expr_175 us_rep1)
  (temp___skip_top_level_176 Bool)) Bool (= (attr__tag1 temp___expr_175) 
  us_tag1))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(define-fun default_initial_assumption1 ((temp___expr_159 us_rep)
  (temp___skip_top_level_160 Bool)) Bool (= (attr__tag temp___expr_159) 
  us_tag))

(declare-const rliteral positive)

;; rliteral_axiom
  (assert (= (positiveqtint rliteral) 9001))

(assert
;; defqtvc
 ;; File "foo.ads", line 19, characters 0-0
  (not
  (forall ((limit Int) (p__split_fields us_split_fields2) (o Int)
  (o1 integer) (p__split_fields1 us_split_fields2)
  (p__split_fields2 us_split_fields2))
  (=> (dynamic_invariant limit true false true true)
  (=> (<= (to_rep (rec__foo__point__x1 p__split_fields)) limit)
  (=>
  (or (<= (to_rep (rec__foo__point__x1 p__split_fields)) limit)
  (<= (to_rep (rec__foo__point__y1 p__split_fields)) limit))
  (=> (= (to_rep (rec__foo__point__y1 p__split_fields)) o)
  (=> (= (to_rep o1) o)
  (=>
  (= p__split_fields1 (us_split_fieldsqtmk1
                      (rec__foo__blinking_point__annoyance_level
                      p__split_fields) o1
                      (rec__foo__point__y1 p__split_fields)
                      (rec__ext__1 p__split_fields)))
  (=>
  (= p__split_fields2 (us_split_fieldsqtmk1 rliteral
                      (rec__foo__point__x1 p__split_fields1)
                      (rec__foo__point__y1 p__split_fields1)
                      (rec__ext__1 p__split_fields1)))
  (= (to_rep (rec__foo__point__x1 p__split_fields2)) (to_rep
                                                     (rec__foo__point__y1
                                                     p__split_fields2)))))))))))))
(check-sat)
(exit)
