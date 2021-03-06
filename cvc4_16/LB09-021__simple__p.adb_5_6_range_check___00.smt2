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

(declare-sort enum 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (enum enum) Bool)

(declare-const dummy enum)

(declare-datatypes ((enum__ref 0))
(((enum__refqtmk (enum__content enum)))))
(define-fun enum__ref_enum__content__projection ((a enum__ref)) enum 
  (enum__content a))

(declare-fun to_rep (enum) Int)

(declare-fun of_rep (Int) enum)

;; inversion_axiom
  (assert
  (forall ((x enum)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x enum)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

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

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

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

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__p__s__d enum)))))
(define-fun us_split_discrs_rec__p__s__d__projection ((a us_split_discrs)) enum 
  (rec__p__s__d a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__p__s__bool_field Bool)(rec__p__s__int_field integer)))))
(define-fun us_split_fields_rec__p__s__bool_field__projection ((a us_split_fields)) Bool 
  (rec__p__s__bool_field a))

(define-fun us_split_fields_rec__p__s__int_field__projection ((a us_split_fields)) integer 
  (rec__p__s__int_field a))

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

(define-fun p__s__bool_field__pred ((a us_rep)) Bool (= (to_rep
                                                        (rec__p__s__d
                                                        (us_split_discrs1 a))) 0))

(define-fun p__s__int_field__pred ((a us_rep)) Bool (= (to_rep
                                                       (rec__p__s__d
                                                       (us_split_discrs1 a))) 1))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep (rec__p__s__d (us_split_discrs1 a))) 
                        (to_rep (rec__p__s__d (us_split_discrs1 b))))
                        (and
                        (=> (p__s__bool_field__pred a)
                        (= (ite (rec__p__s__bool_field (us_split_fields1 a)) 1 0) (ite 
                        (rec__p__s__bool_field (us_split_fields1 b)) 1 0)))
                        (=> (p__s__int_field__pred a)
                        (= (to_rep1
                           (rec__p__s__int_field (us_split_fields1 a))) 
                        (to_rep1 (rec__p__s__int_field (us_split_fields1 b)))))))
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

(declare-const p__s__d__first__bit Int)

(declare-const p__s__d__last__bit Int)

(declare-const p__s__d__position Int)

;; p__s__d__first__bit_axiom
  (assert (<= 0 p__s__d__first__bit))

;; p__s__d__last__bit_axiom
  (assert (< p__s__d__first__bit p__s__d__last__bit))

;; p__s__d__position_axiom
  (assert (<= 0 p__s__d__position))

(declare-const p__s__bool_field__first__bit Int)

(declare-const p__s__bool_field__last__bit Int)

(declare-const p__s__bool_field__position Int)

;; p__s__bool_field__first__bit_axiom
  (assert (<= 0 p__s__bool_field__first__bit))

;; p__s__bool_field__last__bit_axiom
  (assert (< p__s__bool_field__first__bit p__s__bool_field__last__bit))

;; p__s__bool_field__position_axiom
  (assert (<= 0 p__s__bool_field__position))

(declare-const p__s__int_field__first__bit Int)

(declare-const p__s__int_field__last__bit Int)

(declare-const p__s__int_field__position Int)

;; p__s__int_field__first__bit_axiom
  (assert (<= 0 p__s__int_field__first__bit))

;; p__s__int_field__last__bit_axiom
  (assert (< p__s__int_field__first__bit p__s__int_field__last__bit))

;; p__s__int_field__position_axiom
  (assert (<= 0 p__s__int_field__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((t1s__ref 0))
(((t1s__refqtmk (t1s__content us_rep)))))
(define-fun t1s__ref_t1s__content__projection ((a t1s__ref)) us_rep (t1s__content
                                                                    a))

(declare-datatypes ((us_split_discrs2 0))
(((us_split_discrsqtmk1 (rec__p__t__z enum)))))
(define-fun us_split_discrs_rec__p__t__z__projection ((a us_split_discrs2)) enum 
  (rec__p__t__z a))

(declare-datatypes ((us_split_discrs__ref1 0))
(((us_split_discrs__refqtmk1 (us_split_discrs__content1 us_split_discrs2)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref1)) us_split_discrs2 
  (us_split_discrs__content1 a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__p__t__field us_rep)))))
(define-fun us_split_fields_rec__p__t__field__projection ((a us_split_fields2)) us_rep 
  (rec__p__t__field a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs3 us_split_discrs2)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs2 
  (us_split_discrs3 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep (rec__p__t__z (us_split_discrs3 a))) 
                         (to_rep (rec__p__t__z (us_split_discrs3 b))))
                         (= (bool_eq (rec__p__t__field (us_split_fields3 a))
                            (rec__p__t__field (us_split_fields3 b))) true))
                    true false))

(define-fun in_range3 ((rec__p__t__z1 Int)
  (a us_split_discrs2)) Bool (= rec__p__t__z1 (to_rep (rec__p__t__z a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const p__t__z__first__bit Int)

(declare-const p__t__z__last__bit Int)

(declare-const p__t__z__position Int)

;; p__t__z__first__bit_axiom
  (assert (<= 0 p__t__z__first__bit))

;; p__t__z__last__bit_axiom
  (assert (< p__t__z__first__bit p__t__z__last__bit))

;; p__t__z__position_axiom
  (assert (<= 0 p__t__z__position))

(declare-const p__t__field__first__bit Int)

(declare-const p__t__field__last__bit Int)

(declare-const p__t__field__position Int)

;; p__t__field__first__bit_axiom
  (assert (<= 0 p__t__field__first__bit))

;; p__t__field__last__bit_axiom
  (assert (< p__t__field__first__bit p__t__field__last__bit))

;; p__t__field__position_axiom
  (assert (<= 0 p__t__field__position))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep1)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep1 (t__content a))

(declare-const v__split_discrs us_split_discrs2)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun in_range4 ((rec__p__s__d1 Int)
  (a us_split_discrs)) Bool (= rec__p__s__d1 (to_rep (rec__p__s__d a))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const p__s__d__first__bit1 Int)

(declare-const p__s__d__last__bit1 Int)

(declare-const p__s__d__position1 Int)

;; p__s__d__first__bit_axiom
  (assert (<= 0 p__s__d__first__bit1))

;; p__s__d__last__bit_axiom
  (assert (< p__s__d__first__bit1 p__s__d__last__bit1))

;; p__s__d__position_axiom
  (assert (<= 0 p__s__d__position1))

(declare-const p__s__bool_field__first__bit1 Int)

(declare-const p__s__bool_field__last__bit1 Int)

(declare-const p__s__bool_field__position1 Int)

;; p__s__bool_field__first__bit_axiom
  (assert (<= 0 p__s__bool_field__first__bit1))

;; p__s__bool_field__last__bit_axiom
  (assert (< p__s__bool_field__first__bit1 p__s__bool_field__last__bit1))

;; p__s__bool_field__position_axiom
  (assert (<= 0 p__s__bool_field__position1))

(declare-const p__s__int_field__first__bit1 Int)

(declare-const p__s__int_field__last__bit1 Int)

(declare-const p__s__int_field__position1 Int)

;; p__s__int_field__first__bit_axiom
  (assert (<= 0 p__s__int_field__first__bit1))

;; p__s__int_field__last__bit_axiom
  (assert (< p__s__int_field__first__bit1 p__s__int_field__last__bit1))

;; p__s__int_field__position_axiom
  (assert (<= 0 p__s__int_field__position1))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((s__ref 0))
(((s__refqtmk (s__content us_rep)))))
(define-fun s__ref_s__content__projection ((a s__ref)) us_rep (s__content a))

(define-fun dynamic_invariant ((temp___expr_171 us_rep1)
  (temp___is_init_167 Bool) (temp___skip_constant_168 Bool)
  (temp___do_toplevel_169 Bool) (temp___do_typ_inv_170 Bool)) Bool (in_range4
  (to_rep (rec__p__t__z (us_split_discrs3 temp___expr_171)))
  (us_split_discrs1 (rec__p__t__field (us_split_fields3 temp___expr_171)))))

(declare-const r2b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_158 Int)
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool)
  (temp___do_typ_inv_157 Bool)) Bool (=>
                                     (or (= temp___is_init_154 true)
                                     (<= 0 1)) (in_range1 temp___expr_158)))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

(assert
;; defqtvc
 ;; File "p.ads", line 18, characters 0-0
  (not
  (forall ((v__split_fields us_rep) (p__p__R2b__assume Int))
  (=> (dynamic_invariant
  (us_repqtmk1 v__split_discrs (us_split_fieldsqtmk1 v__split_fields)) true
  false true true)
  (=> (= (to_rep (rec__p__t__z v__split_discrs)) p__p__R2b__assume)
  (=> (= p__p__R2b__assume r2b)
  (=> (dynamic_invariant1 r2b true false true true) (in_range1 r2b))))))))
(check-sat)
(exit)
