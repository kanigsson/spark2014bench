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

(define-fun in_range1 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(declare-sort value_kind 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (value_kind value_kind) Bool)

(declare-const dummy1 value_kind)

(declare-datatypes ((value_kind__ref 0))
(((value_kind__refqtmk (value_kind__content value_kind)))))
(define-fun value_kind__ref_value_kind__content__projection ((a value_kind__ref)) value_kind 
  (value_kind__content a))

(declare-fun to_rep1 (value_kind) Int)

(declare-fun of_rep1 (Int) value_kind)

;; inversion_axiom
  (assert
  (forall ((x value_kind))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x value_kind)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__foo__value__kind value_kind)))))
(define-fun us_split_discrs_rec__foo__value__kind__projection ((a us_split_discrs)) value_kind 
  (rec__foo__value__kind a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__foo__value__bool_field Bool)(rec__foo__value__int_field integer)))))
(define-fun us_split_fields_rec__foo__value__bool_field__projection ((a us_split_fields)) Bool 
  (rec__foo__value__bool_field a))

(define-fun us_split_fields_rec__foo__value__int_field__projection ((a us_split_fields)) integer 
  (rec__foo__value__int_field a))

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

(define-fun foo__value__bool_field__pred ((a us_rep)) Bool (= (to_rep1
                                                              (rec__foo__value__kind
                                                              (us_split_discrs1
                                                              a))) 1))

(define-fun foo__value__int_field__pred ((a us_rep)) Bool (= (to_rep1
                                                             (rec__foo__value__kind
                                                             (us_split_discrs1
                                                             a))) 2))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1
                           (rec__foo__value__kind (us_split_discrs1 a))) 
                        (to_rep1
                        (rec__foo__value__kind (us_split_discrs1 b))))
                        (and
                        (=> (foo__value__bool_field__pred a)
                        (= (ite (rec__foo__value__bool_field
                                (us_split_fields1 a)) 1 0) (ite (rec__foo__value__bool_field
                                                                (us_split_fields1
                                                                b)) 1 0)))
                        (=> (foo__value__int_field__pred a)
                        (= (to_rep
                           (rec__foo__value__int_field (us_split_fields1 a))) 
                        (to_rep
                        (rec__foo__value__int_field (us_split_fields1 b)))))))
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

(declare-const foo__value__kind__first__bit Int)

(declare-const foo__value__kind__last__bit Int)

(declare-const foo__value__kind__position Int)

;; foo__value__kind__first__bit_axiom
  (assert (<= 0 foo__value__kind__first__bit))

;; foo__value__kind__last__bit_axiom
  (assert (< foo__value__kind__first__bit foo__value__kind__last__bit))

;; foo__value__kind__position_axiom
  (assert (<= 0 foo__value__kind__position))

(declare-const foo__value__int_field__first__bit Int)

(declare-const foo__value__int_field__last__bit Int)

(declare-const foo__value__int_field__position Int)

;; foo__value__int_field__first__bit_axiom
  (assert (<= 0 foo__value__int_field__first__bit))

;; foo__value__int_field__last__bit_axiom
  (assert
  (< foo__value__int_field__first__bit foo__value__int_field__last__bit))

;; foo__value__int_field__position_axiom
  (assert (<= 0 foo__value__int_field__position))

(declare-const foo__value__bool_field__first__bit Int)

(declare-const foo__value__bool_field__last__bit Int)

(declare-const foo__value__bool_field__position Int)

;; foo__value__bool_field__first__bit_axiom
  (assert (<= 0 foo__value__bool_field__first__bit))

;; foo__value__bool_field__last__bit_axiom
  (assert
  (< foo__value__bool_field__first__bit foo__value__bool_field__last__bit))

;; foo__value__bool_field__position_axiom
  (assert (<= 0 foo__value__bool_field__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content us_rep)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) us_rep (t1b__content
                                                                    a))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const foo__value__kind__first__bit1 Int)

(declare-const foo__value__kind__last__bit1 Int)

(declare-const foo__value__kind__position1 Int)

;; foo__value__kind__first__bit_axiom
  (assert (<= 0 foo__value__kind__first__bit1))

;; foo__value__kind__last__bit_axiom
  (assert (< foo__value__kind__first__bit1 foo__value__kind__last__bit1))

;; foo__value__kind__position_axiom
  (assert (<= 0 foo__value__kind__position1))

(declare-const foo__value__bool_field__first__bit1 Int)

(declare-const foo__value__bool_field__last__bit1 Int)

(declare-const foo__value__bool_field__position1 Int)

;; foo__value__bool_field__first__bit_axiom
  (assert (<= 0 foo__value__bool_field__first__bit1))

;; foo__value__bool_field__last__bit_axiom
  (assert
  (< foo__value__bool_field__first__bit1 foo__value__bool_field__last__bit1))

;; foo__value__bool_field__position_axiom
  (assert (<= 0 foo__value__bool_field__position1))

(declare-const foo__value__int_field__first__bit1 Int)

(declare-const foo__value__int_field__last__bit1 Int)

(declare-const foo__value__int_field__position1 Int)

;; foo__value__int_field__first__bit_axiom
  (assert (<= 0 foo__value__int_field__first__bit1))

;; foo__value__int_field__last__bit_axiom
  (assert
  (< foo__value__int_field__first__bit1 foo__value__int_field__last__bit1))

;; foo__value__int_field__position_axiom
  (assert (<= 0 foo__value__int_field__position1))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((t2b__ref 0))
(((t2b__refqtmk (t2b__content us_rep)))))
(define-fun t2b__ref_t2b__content__projection ((a t2b__ref)) us_rep (t2b__content
                                                                    a))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const foo__value__kind__first__bit2 Int)

(declare-const foo__value__kind__last__bit2 Int)

(declare-const foo__value__kind__position2 Int)

;; foo__value__kind__first__bit_axiom
  (assert (<= 0 foo__value__kind__first__bit2))

;; foo__value__kind__last__bit_axiom
  (assert (< foo__value__kind__first__bit2 foo__value__kind__last__bit2))

;; foo__value__kind__position_axiom
  (assert (<= 0 foo__value__kind__position2))

(declare-const foo__value__bool_field__first__bit2 Int)

(declare-const foo__value__bool_field__last__bit2 Int)

(declare-const foo__value__bool_field__position2 Int)

;; foo__value__bool_field__first__bit_axiom
  (assert (<= 0 foo__value__bool_field__first__bit2))

;; foo__value__bool_field__last__bit_axiom
  (assert
  (< foo__value__bool_field__first__bit2 foo__value__bool_field__last__bit2))

;; foo__value__bool_field__position_axiom
  (assert (<= 0 foo__value__bool_field__position2))

(declare-const foo__value__int_field__first__bit2 Int)

(declare-const foo__value__int_field__last__bit2 Int)

(declare-const foo__value__int_field__position2 Int)

;; foo__value__int_field__first__bit_axiom
  (assert (<= 0 foo__value__int_field__first__bit2))

;; foo__value__int_field__last__bit_axiom
  (assert
  (< foo__value__int_field__first__bit2 foo__value__int_field__last__bit2))

;; foo__value__int_field__position_axiom
  (assert (<= 0 foo__value__int_field__position2))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((t3b__ref 0))
(((t3b__refqtmk (t3b__content us_rep)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) us_rep (t3b__content
                                                                    a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__foo__record_a__x us_rep)(rec__foo__record_a__y us_rep)(rec__foo__record_a__z us_rep)))))
(define-fun us_split_fields_rec__foo__record_a__x__projection ((a us_split_fields2)) us_rep 
  (rec__foo__record_a__x a))

(define-fun us_split_fields_rec__foo__record_a__y__projection ((a us_split_fields2)) us_rep 
  (rec__foo__record_a__y a))

(define-fun us_split_fields_rec__foo__record_a__z__projection ((a us_split_fields2)) us_rep 
  (rec__foo__record_a__z a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (and
                         (= (bool_eq
                            (rec__foo__record_a__x (us_split_fields3 a))
                            (rec__foo__record_a__x (us_split_fields3 b))) true)
                         (= (bool_eq
                            (rec__foo__record_a__y (us_split_fields3 a))
                            (rec__foo__record_a__y (us_split_fields3 b))) true))
                         (= (bool_eq
                            (rec__foo__record_a__z (us_split_fields3 a))
                            (rec__foo__record_a__z (us_split_fields3 b))) true))
                    true false))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const foo__record_a__x__first__bit Int)

(declare-const foo__record_a__x__last__bit Int)

(declare-const foo__record_a__x__position Int)

;; foo__record_a__x__first__bit_axiom
  (assert (<= 0 foo__record_a__x__first__bit))

;; foo__record_a__x__last__bit_axiom
  (assert (< foo__record_a__x__first__bit foo__record_a__x__last__bit))

;; foo__record_a__x__position_axiom
  (assert (<= 0 foo__record_a__x__position))

(declare-const foo__record_a__y__first__bit Int)

(declare-const foo__record_a__y__last__bit Int)

(declare-const foo__record_a__y__position Int)

;; foo__record_a__y__first__bit_axiom
  (assert (<= 0 foo__record_a__y__first__bit))

;; foo__record_a__y__last__bit_axiom
  (assert (< foo__record_a__y__first__bit foo__record_a__y__last__bit))

;; foo__record_a__y__position_axiom
  (assert (<= 0 foo__record_a__y__position))

(declare-const foo__record_a__z__first__bit Int)

(declare-const foo__record_a__z__last__bit Int)

(declare-const foo__record_a__z__position Int)

;; foo__record_a__z__first__bit_axiom
  (assert (<= 0 foo__record_a__z__first__bit))

;; foo__record_a__z__last__bit_axiom
  (assert (< foo__record_a__z__first__bit foo__record_a__z__last__bit))

;; foo__record_a__z__position_axiom
  (assert (<= 0 foo__record_a__z__position))

(declare-fun user_eq5 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ((record_a__ref 0))
(((record_a__refqtmk (record_a__content us_rep1)))))
(define-fun record_a__ref_record_a__content__projection ((a record_a__ref)) us_rep1 
  (record_a__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun in_range3 ((rec__foo__value__kind1 Int)
  (a us_split_discrs)) Bool (= rec__foo__value__kind1 (to_rep1
                                                      (rec__foo__value__kind
                                                      a))))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-const foo__value__kind__first__bit3 Int)

(declare-const foo__value__kind__last__bit3 Int)

(declare-const foo__value__kind__position3 Int)

;; foo__value__kind__first__bit_axiom
  (assert (<= 0 foo__value__kind__first__bit3))

;; foo__value__kind__last__bit_axiom
  (assert (< foo__value__kind__first__bit3 foo__value__kind__last__bit3))

;; foo__value__kind__position_axiom
  (assert (<= 0 foo__value__kind__position3))

(declare-const foo__value__bool_field__first__bit3 Int)

(declare-const foo__value__bool_field__last__bit3 Int)

(declare-const foo__value__bool_field__position3 Int)

;; foo__value__bool_field__first__bit_axiom
  (assert (<= 0 foo__value__bool_field__first__bit3))

;; foo__value__bool_field__last__bit_axiom
  (assert
  (< foo__value__bool_field__first__bit3 foo__value__bool_field__last__bit3))

;; foo__value__bool_field__position_axiom
  (assert (<= 0 foo__value__bool_field__position3))

(declare-const foo__value__int_field__first__bit3 Int)

(declare-const foo__value__int_field__last__bit3 Int)

(declare-const foo__value__int_field__position3 Int)

;; foo__value__int_field__first__bit_axiom
  (assert (<= 0 foo__value__int_field__first__bit3))

;; foo__value__int_field__last__bit_axiom
  (assert
  (< foo__value__int_field__first__bit3 foo__value__int_field__last__bit3))

;; foo__value__int_field__position_axiom
  (assert (<= 0 foo__value__int_field__position3))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ((value__ref 0))
(((value__refqtmk (value__content us_rep)))))
(define-fun value__ref_value__content__projection ((a value__ref)) us_rep 
  (value__content a))

(define-fun dynamic_invariant ((temp___expr_176 us_rep1)
  (temp___is_init_172 Bool) (temp___skip_constant_173 Bool)
  (temp___do_toplevel_174 Bool)
  (temp___do_typ_inv_175 Bool)) Bool (and
                                     (and (in_range3 1
                                     (us_split_discrs1
                                     (rec__foo__record_a__x
                                     (us_split_fields3 temp___expr_176))))
                                     (in_range3 2
                                     (us_split_discrs1
                                     (rec__foo__record_a__y
                                     (us_split_fields3 temp___expr_176)))))
                                     (in_range3 0
                                     (us_split_discrs1
                                     (rec__foo__record_a__z
                                     (us_split_fields3 temp___expr_176))))))

(define-fun default_initial_assumption ((temp___expr_180 us_rep1)
  (temp___skip_top_level_181 Bool)) Bool (and
                                         (and
                                         (= (to_rep1
                                            (rec__foo__value__kind
                                            (us_split_discrs1
                                            (rec__foo__record_a__x
                                            (us_split_fields3
                                            temp___expr_180))))) 1)
                                         (= (to_rep1
                                            (rec__foo__value__kind
                                            (us_split_discrs1
                                            (rec__foo__record_a__y
                                            (us_split_fields3
                                            temp___expr_180))))) 2))
                                         (= (to_rep1
                                            (rec__foo__value__kind
                                            (us_split_discrs1
                                            (rec__foo__record_a__z
                                            (us_split_fields3
                                            temp___expr_180))))) 0)))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_158 Int)
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool)
  (temp___do_typ_inv_157 Bool)) Bool (=>
                                     (or (= temp___is_init_154 true)
                                     (<= 0 2)) (in_range2 temp___expr_158)))

(define-fun default_initial_assumption1 ((temp___expr_167 us_rep)
  (temp___skip_top_level_168 Bool)) Bool (= (to_rep1
                                            (rec__foo__value__kind
                                            (us_split_discrs1
                                            temp___expr_167))) 0))

(assert
;; defqtvc
 ;; File "foo.adb", line 27, characters 0-0
  (not
  (forall ((v__split_fields us_split_fields2))
  (=> (dynamic_invariant (us_repqtmk1 v__split_fields) true false true true)
  (foo__value__int_field__pred (rec__foo__record_a__y v__split_fields))))))
(check-sat)
(exit)
