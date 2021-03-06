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

(declare-sort discriminant_type 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (discriminant_type discriminant_type) Bool)

(declare-const dummy1 discriminant_type)

(declare-datatypes ((discriminant_type__ref 0))
(((discriminant_type__refqtmk (discriminant_type__content discriminant_type)))))
(define-fun discriminant_type__ref_discriminant_type__content__projection ((a discriminant_type__ref)) discriminant_type 
  (discriminant_type__content a))

(declare-fun to_rep1 (discriminant_type) Int)

(declare-fun of_rep1 (Int) discriminant_type)

;; inversion_axiom
  (assert
  (forall ((x discriminant_type))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x discriminant_type)) (! (in_range1
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__main__variant_type__discr discriminant_type)))))
(define-fun us_split_discrs_rec__main__variant_type__discr__projection ((a us_split_discrs)) discriminant_type 
  (rec__main__variant_type__discr a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__main__variant_type__common integer)(rec__main__variant_type__b_only integer)))))
(define-fun us_split_fields_rec__main__variant_type__common__projection ((a us_split_fields)) integer 
  (rec__main__variant_type__common a))

(define-fun us_split_fields_rec__main__variant_type__b_only__projection ((a us_split_fields)) integer 
  (rec__main__variant_type__b_only a))

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

(define-fun main__variant_type__b_only__pred ((a us_rep)) Bool (= (to_rep1
                                                                  (rec__main__variant_type__discr
                                                                  (us_split_discrs1
                                                                  a))) 1))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1
                           (rec__main__variant_type__discr
                           (us_split_discrs1 a))) (to_rep1
                                                  (rec__main__variant_type__discr
                                                  (us_split_discrs1 b))))
                        (and
                        (= (to_rep
                           (rec__main__variant_type__common
                           (us_split_fields1 a))) (to_rep
                                                  (rec__main__variant_type__common
                                                  (us_split_fields1 b))))
                        (=> (main__variant_type__b_only__pred a)
                        (= (to_rep
                           (rec__main__variant_type__b_only
                           (us_split_fields1 a))) (to_rep
                                                  (rec__main__variant_type__b_only
                                                  (us_split_fields1 b)))))))
                   true false))

(define-fun in_range2 ((rec__main__variant_type__discr1 Int)
  (a us_split_discrs)) Bool (= rec__main__variant_type__discr1 (to_rep1
                                                               (rec__main__variant_type__discr
                                                               a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const main__variant_type__discr__first__bit Int)

(declare-const main__variant_type__discr__last__bit Int)

(declare-const main__variant_type__discr__position Int)

;; main__variant_type__discr__first__bit_axiom
  (assert (<= 0 main__variant_type__discr__first__bit))

;; main__variant_type__discr__last__bit_axiom
  (assert
  (< main__variant_type__discr__first__bit main__variant_type__discr__last__bit))

;; main__variant_type__discr__position_axiom
  (assert (<= 0 main__variant_type__discr__position))

(declare-const main__variant_type__common__first__bit Int)

(declare-const main__variant_type__common__last__bit Int)

(declare-const main__variant_type__common__position Int)

;; main__variant_type__common__first__bit_axiom
  (assert (<= 0 main__variant_type__common__first__bit))

;; main__variant_type__common__last__bit_axiom
  (assert
  (< main__variant_type__common__first__bit main__variant_type__common__last__bit))

;; main__variant_type__common__position_axiom
  (assert (<= 0 main__variant_type__common__position))

(declare-const main__variant_type__b_only__first__bit Int)

(declare-const main__variant_type__b_only__last__bit Int)

(declare-const main__variant_type__b_only__position Int)

;; main__variant_type__b_only__first__bit_axiom
  (assert (<= 0 main__variant_type__b_only__first__bit))

;; main__variant_type__b_only__last__bit_axiom
  (assert
  (< main__variant_type__b_only__first__bit main__variant_type__b_only__last__bit))

;; main__variant_type__b_only__position_axiom
  (assert (<= 0 main__variant_type__b_only__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((variant_type__ref 0))
(((variant_type__refqtmk (variant_type__content us_rep)))))
(define-fun variant_type__ref_variant_type__content__projection ((a variant_type__ref)) us_rep 
  (variant_type__content a))

(declare-const u0__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption ((temp___expr_188 us_rep)
  (temp___skip_top_level_189 Bool)) Bool (= (to_rep1
                                            (rec__main__variant_type__discr
                                            (us_split_discrs1
                                            temp___expr_188))) 0))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const main__variant_type__discr__first__bit1 Int)

(declare-const main__variant_type__discr__last__bit1 Int)

(declare-const main__variant_type__discr__position1 Int)

;; main__variant_type__discr__first__bit_axiom
  (assert (<= 0 main__variant_type__discr__first__bit1))

;; main__variant_type__discr__last__bit_axiom
  (assert
  (< main__variant_type__discr__first__bit1 main__variant_type__discr__last__bit1))

;; main__variant_type__discr__position_axiom
  (assert (<= 0 main__variant_type__discr__position1))

(declare-const main__variant_type__b_only__first__bit1 Int)

(declare-const main__variant_type__b_only__last__bit1 Int)

(declare-const main__variant_type__b_only__position1 Int)

;; main__variant_type__b_only__first__bit_axiom
  (assert (<= 0 main__variant_type__b_only__first__bit1))

;; main__variant_type__b_only__last__bit_axiom
  (assert
  (< main__variant_type__b_only__first__bit1 main__variant_type__b_only__last__bit1))

;; main__variant_type__b_only__position_axiom
  (assert (<= 0 main__variant_type__b_only__position1))

(declare-const main__variant_type__common__first__bit1 Int)

(declare-const main__variant_type__common__last__bit1 Int)

(declare-const main__variant_type__common__position1 Int)

;; main__variant_type__common__first__bit_axiom
  (assert (<= 0 main__variant_type__common__first__bit1))

;; main__variant_type__common__last__bit_axiom
  (assert
  (< main__variant_type__common__first__bit1 main__variant_type__common__last__bit1))

;; main__variant_type__common__position_axiom
  (assert (<= 0 main__variant_type__common__position1))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((tu1S__ref 0))
(((tu1S__refqtmk (tu1S__content us_rep)))))
(define-fun tu1S__ref_tu1S__content__projection ((a tu1S__ref)) us_rep 
  (tu1S__content a))

(declare-const u1__split_discrs us_split_discrs)

(declare-const u1__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant ((temp___expr_197 us_rep)
  (temp___is_init_193 Bool) (temp___skip_constant_194 Bool)
  (temp___do_toplevel_195 Bool)
  (temp___do_typ_inv_196 Bool)) Bool (=>
                                     (not (= temp___skip_constant_194 true))
                                     (in_range2 0
                                     (us_split_discrs1 temp___expr_197))))

(define-fun default_initial_assumption1 ((temp___expr_199 us_rep)
  (temp___skip_top_level_200 Bool)) Bool (= (to_rep1
                                            (rec__main__variant_type__discr
                                            (us_split_discrs1
                                            temp___expr_199))) 0))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const main__variant_type__discr__first__bit2 Int)

(declare-const main__variant_type__discr__last__bit2 Int)

(declare-const main__variant_type__discr__position2 Int)

;; main__variant_type__discr__first__bit_axiom
  (assert (<= 0 main__variant_type__discr__first__bit2))

;; main__variant_type__discr__last__bit_axiom
  (assert
  (< main__variant_type__discr__first__bit2 main__variant_type__discr__last__bit2))

;; main__variant_type__discr__position_axiom
  (assert (<= 0 main__variant_type__discr__position2))

(declare-const main__variant_type__common__first__bit2 Int)

(declare-const main__variant_type__common__last__bit2 Int)

(declare-const main__variant_type__common__position2 Int)

;; main__variant_type__common__first__bit_axiom
  (assert (<= 0 main__variant_type__common__first__bit2))

;; main__variant_type__common__last__bit_axiom
  (assert
  (< main__variant_type__common__first__bit2 main__variant_type__common__last__bit2))

;; main__variant_type__common__position_axiom
  (assert (<= 0 main__variant_type__common__position2))

(declare-const main__variant_type__b_only__first__bit2 Int)

(declare-const main__variant_type__b_only__last__bit2 Int)

(declare-const main__variant_type__b_only__position2 Int)

;; main__variant_type__b_only__first__bit_axiom
  (assert (<= 0 main__variant_type__b_only__first__bit2))

;; main__variant_type__b_only__last__bit_axiom
  (assert
  (< main__variant_type__b_only__first__bit2 main__variant_type__b_only__last__bit2))

;; main__variant_type__b_only__position_axiom
  (assert (<= 0 main__variant_type__b_only__position2))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((tu2S__ref 0))
(((tu2S__refqtmk (tu2S__content us_rep)))))
(define-fun tu2S__ref_tu2S__content__projection ((a tu2S__ref)) us_rep 
  (tu2S__content a))

(declare-const u2__split_discrs us_split_discrs)

(declare-const u2__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant1 ((temp___expr_208 us_rep)
  (temp___is_init_204 Bool) (temp___skip_constant_205 Bool)
  (temp___do_toplevel_206 Bool)
  (temp___do_typ_inv_207 Bool)) Bool (=>
                                     (not (= temp___skip_constant_205 true))
                                     (in_range2 1
                                     (us_split_discrs1 temp___expr_208))))

(define-fun default_initial_assumption2 ((temp___expr_210 us_rep)
  (temp___skip_top_level_211 Bool)) Bool (= (to_rep1
                                            (rec__main__variant_type__discr
                                            (us_split_discrs1
                                            temp___expr_210))) 1))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const main__variant_type__discr__first__bit3 Int)

(declare-const main__variant_type__discr__last__bit3 Int)

(declare-const main__variant_type__discr__position3 Int)

;; main__variant_type__discr__first__bit_axiom
  (assert (<= 0 main__variant_type__discr__first__bit3))

;; main__variant_type__discr__last__bit_axiom
  (assert
  (< main__variant_type__discr__first__bit3 main__variant_type__discr__last__bit3))

;; main__variant_type__discr__position_axiom
  (assert (<= 0 main__variant_type__discr__position3))

(declare-const main__variant_type__b_only__first__bit3 Int)

(declare-const main__variant_type__b_only__last__bit3 Int)

(declare-const main__variant_type__b_only__position3 Int)

;; main__variant_type__b_only__first__bit_axiom
  (assert (<= 0 main__variant_type__b_only__first__bit3))

;; main__variant_type__b_only__last__bit_axiom
  (assert
  (< main__variant_type__b_only__first__bit3 main__variant_type__b_only__last__bit3))

;; main__variant_type__b_only__position_axiom
  (assert (<= 0 main__variant_type__b_only__position3))

(declare-const main__variant_type__common__first__bit3 Int)

(declare-const main__variant_type__common__last__bit3 Int)

(declare-const main__variant_type__common__position3 Int)

;; main__variant_type__common__first__bit_axiom
  (assert (<= 0 main__variant_type__common__first__bit3))

;; main__variant_type__common__last__bit_axiom
  (assert
  (< main__variant_type__common__first__bit3 main__variant_type__common__last__bit3))

;; main__variant_type__common__position_axiom
  (assert (<= 0 main__variant_type__common__position3))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content us_rep)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) us_rep (t1b__content
                                                                    a))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-const main__variant_type__discr__first__bit4 Int)

(declare-const main__variant_type__discr__last__bit4 Int)

(declare-const main__variant_type__discr__position4 Int)

;; main__variant_type__discr__first__bit_axiom
  (assert (<= 0 main__variant_type__discr__first__bit4))

;; main__variant_type__discr__last__bit_axiom
  (assert
  (< main__variant_type__discr__first__bit4 main__variant_type__discr__last__bit4))

;; main__variant_type__discr__position_axiom
  (assert (<= 0 main__variant_type__discr__position4))

(declare-const main__variant_type__common__first__bit4 Int)

(declare-const main__variant_type__common__last__bit4 Int)

(declare-const main__variant_type__common__position4 Int)

;; main__variant_type__common__first__bit_axiom
  (assert (<= 0 main__variant_type__common__first__bit4))

;; main__variant_type__common__last__bit_axiom
  (assert
  (< main__variant_type__common__first__bit4 main__variant_type__common__last__bit4))

;; main__variant_type__common__position_axiom
  (assert (<= 0 main__variant_type__common__position4))

(declare-const main__variant_type__b_only__first__bit4 Int)

(declare-const main__variant_type__b_only__last__bit4 Int)

(declare-const main__variant_type__b_only__position4 Int)

;; main__variant_type__b_only__first__bit_axiom
  (assert (<= 0 main__variant_type__b_only__first__bit4))

;; main__variant_type__b_only__last__bit_axiom
  (assert
  (< main__variant_type__b_only__first__bit4 main__variant_type__b_only__last__bit4))

;; main__variant_type__b_only__position_axiom
  (assert (<= 0 main__variant_type__b_only__position4))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ((t2b__ref 0))
(((t2b__refqtmk (t2b__content us_rep)))))
(define-fun t2b__ref_t2b__content__projection ((a t2b__ref)) us_rep (t2b__content
                                                                    a))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant3 ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (<= 0 1)) (in_range1 temp___expr_179)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

(assert
;; defqtvc
 ;; File "main.adb", line 5, characters 0-0
  (not
  (forall ((u0__split_fields us_split_fields)
  (u0__split_discrs discriminant_type) (o discriminant_type))
  (=> (= u0__attr__constrained false)
  (=> (default_initial_assumption
  (us_repqtmk (us_split_discrsqtmk u0__split_discrs) u0__split_fields) false)
  (=> (in_range1 0)
  (=> (= (to_rep1 o) 0)
  (let ((temp___221 (us_repqtmk (us_split_discrsqtmk o)
                    (us_split_fieldsqtmk rliteral dummy))))
  (forall ((u1__split_fields us_split_fields))
  (=> (= u1__split_fields (us_split_fields1 temp___221))
  (=> (= u1__split_discrs (us_split_discrs1 temp___221))
  (=> (= u1__attr__constrained true)
  (=> (dynamic_invariant (us_repqtmk u1__split_discrs u1__split_fields) true
  false true true) (in_range1 1))))))))))))))
(check-sat)
(exit)
