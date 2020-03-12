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
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite32 ((x Float32)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral32 ((x Float32)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
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

(declare-fun pow2 (Int) Int)

(define-fun is_plus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float32)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float32)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

(declare-fun of_int (RoundingMode Int) Float32)

(declare-const max_int Int)

(define-fun in_int_range ((i Int)) Bool (and (<= (- max_int) i)
                                        (<= i max_int)))

(define-fun in_safe_int_range ((i Int)) Bool (and (<= (- 16777216) i)
                                             (<= i 16777216)))

(define-fun same_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isPositive y))
                    (and (fp.isNegative x) (fp.isNegative y))))

(define-fun diff_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isNegative y))
                    (and (fp.isNegative x) (fp.isPositive y))))

(define-fun product_sign ((z Float32) (x Float32)
  (y Float32)) Bool (and (=> (same_sign x y) (fp.isPositive z))
                    (=> (diff_sign x y) (fp.isNegative z))))

(define-fun sqr ((x Real)) Real (* x x))

(declare-fun sqrt1 (Real) Real)

(define-fun same_sign_real ((x Float32)
  (r Real)) Bool (or (and (fp.isPositive x) (< 0.0 r))
                 (and (fp.isNegative x) (< r 0.0))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content Float32)))))
(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort float__ 0)

(declare-fun user_eq (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float32)

(declare-const dummy float__)

(declare-datatypes ()
((float____ref (float____refqtmk (float____content float__)))))
(define-fun float____ref_float____content__projection ((a float____ref)) float__ 
  (float____content a))

(define-fun dynamic_invariant ((temp___expr_60 Float32)
  (temp___is_init_56 Bool) (temp___skip_constant_57 Bool)
  (temp___do_toplevel_58 Bool)
  (temp___do_typ_inv_59 Bool)) Bool (=>
                                    (or (= temp___is_init_56 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                    (fp.isFinite32 temp___expr_60)))

(declare-fun to_rep (float__) Float32)

(declare-fun of_rep (Float32) float__)

;; inversion_axiom
  (assert
  (forall ((x float__)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x float__))
  (! (fp.isFinite32 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Float32))
  (! (=> (fp.isFinite32 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                                (of_rep x))) )))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__math__stationary_3_phase_vector__a float__)(rec__math__stationary_3_phase_vector__b float__)(rec__math__stationary_3_phase_vector__c float__)))))
(define-fun us_split_fields_rec__math__stationary_3_phase_vector__a__projection ((a us_split_fields)) float__ 
  (rec__math__stationary_3_phase_vector__a a))

(define-fun us_split_fields_rec__math__stationary_3_phase_vector__b__projection ((a us_split_fields)) float__ 
  (rec__math__stationary_3_phase_vector__b a))

(define-fun us_split_fields_rec__math__stationary_3_phase_vector__c__projection ((a us_split_fields)) float__ 
  (rec__math__stationary_3_phase_vector__c a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (fp.eq (to_rep
                               (rec__math__stationary_3_phase_vector__a
                               (us_split_fields1 a))) (to_rep
                                                      (rec__math__stationary_3_phase_vector__a
                                                      (us_split_fields1 b))))
                        (fp.eq (to_rep
                               (rec__math__stationary_3_phase_vector__b
                               (us_split_fields1 a))) (to_rep
                                                      (rec__math__stationary_3_phase_vector__b
                                                      (us_split_fields1 b)))))
                        (fp.eq (to_rep
                               (rec__math__stationary_3_phase_vector__c
                               (us_split_fields1 a))) (to_rep
                                                      (rec__math__stationary_3_phase_vector__c
                                                      (us_split_fields1 b)))))
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

(declare-const math__stationary_3_phase_vector__a__first__bit Int)

(declare-const math__stationary_3_phase_vector__a__last__bit Int)

(declare-const math__stationary_3_phase_vector__a__position Int)

;; math__stationary_3_phase_vector__a__first__bit_axiom
  (assert (<= 0 math__stationary_3_phase_vector__a__first__bit))

;; math__stationary_3_phase_vector__a__last__bit_axiom
  (assert
  (< math__stationary_3_phase_vector__a__first__bit math__stationary_3_phase_vector__a__last__bit))

;; math__stationary_3_phase_vector__a__position_axiom
  (assert (<= 0 math__stationary_3_phase_vector__a__position))

(declare-const math__stationary_3_phase_vector__b__first__bit Int)

(declare-const math__stationary_3_phase_vector__b__last__bit Int)

(declare-const math__stationary_3_phase_vector__b__position Int)

;; math__stationary_3_phase_vector__b__first__bit_axiom
  (assert (<= 0 math__stationary_3_phase_vector__b__first__bit))

;; math__stationary_3_phase_vector__b__last__bit_axiom
  (assert
  (< math__stationary_3_phase_vector__b__first__bit math__stationary_3_phase_vector__b__last__bit))

;; math__stationary_3_phase_vector__b__position_axiom
  (assert (<= 0 math__stationary_3_phase_vector__b__position))

(declare-const math__stationary_3_phase_vector__c__first__bit Int)

(declare-const math__stationary_3_phase_vector__c__last__bit Int)

(declare-const math__stationary_3_phase_vector__c__position Int)

;; math__stationary_3_phase_vector__c__first__bit_axiom
  (assert (<= 0 math__stationary_3_phase_vector__c__first__bit))

;; math__stationary_3_phase_vector__c__last__bit_axiom
  (assert
  (< math__stationary_3_phase_vector__c__first__bit math__stationary_3_phase_vector__c__last__bit))

;; math__stationary_3_phase_vector__c__position_axiom
  (assert (<= 0 math__stationary_3_phase_vector__c__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ()
((stationary_3_phase_vector__ref
 (stationary_3_phase_vector__refqtmk
 (stationary_3_phase_vector__content us_rep)))))
(define-fun stationary_3_phase_vector__ref_stationary_3_phase_vector__content__projection ((a stationary_3_phase_vector__ref)) us_rep 
  (stationary_3_phase_vector__content a))

(declare-const input us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1
 (rec__math__stationary_2_phase_vector__alfa float__)(rec__math__stationary_2_phase_vector__beta float__)))))
(define-fun us_split_fields_rec__math__stationary_2_phase_vector__alfa__projection ((a us_split_fields2)) float__ 
  (rec__math__stationary_2_phase_vector__alfa a))

(define-fun us_split_fields_rec__math__stationary_2_phase_vector__beta__projection ((a us_split_fields2)) float__ 
  (rec__math__stationary_2_phase_vector__beta a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep1 (us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (fp.eq (to_rep
                                (rec__math__stationary_2_phase_vector__alfa
                                (us_split_fields3 a))) (to_rep
                                                       (rec__math__stationary_2_phase_vector__alfa
                                                       (us_split_fields3 b))))
                         (fp.eq (to_rep
                                (rec__math__stationary_2_phase_vector__beta
                                (us_split_fields3 a))) (to_rep
                                                       (rec__math__stationary_2_phase_vector__beta
                                                       (us_split_fields3 b)))))
                    true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const math__stationary_2_phase_vector__alfa__first__bit Int)

(declare-const math__stationary_2_phase_vector__alfa__last__bit Int)

(declare-const math__stationary_2_phase_vector__alfa__position Int)

;; math__stationary_2_phase_vector__alfa__first__bit_axiom
  (assert (<= 0 math__stationary_2_phase_vector__alfa__first__bit))

;; math__stationary_2_phase_vector__alfa__last__bit_axiom
  (assert
  (< math__stationary_2_phase_vector__alfa__first__bit math__stationary_2_phase_vector__alfa__last__bit))

;; math__stationary_2_phase_vector__alfa__position_axiom
  (assert (<= 0 math__stationary_2_phase_vector__alfa__position))

(declare-const math__stationary_2_phase_vector__beta__first__bit Int)

(declare-const math__stationary_2_phase_vector__beta__last__bit Int)

(declare-const math__stationary_2_phase_vector__beta__position Int)

;; math__stationary_2_phase_vector__beta__first__bit_axiom
  (assert (<= 0 math__stationary_2_phase_vector__beta__first__bit))

;; math__stationary_2_phase_vector__beta__last__bit_axiom
  (assert
  (< math__stationary_2_phase_vector__beta__first__bit math__stationary_2_phase_vector__beta__last__bit))

;; math__stationary_2_phase_vector__beta__position_axiom
  (assert (<= 0 math__stationary_2_phase_vector__beta__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ()
((stationary_2_phase_vector__ref
 (stationary_2_phase_vector__refqtmk
 (stationary_2_phase_vector__content us_rep1)))))
(define-fun stationary_2_phase_vector__ref_stationary_2_phase_vector__content__projection ((a stationary_2_phase_vector__ref)) us_rep1 
  (stationary_2_phase_vector__content a))

(declare-const i2s us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const two_thirds Float32)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const one_third Float32)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const one_div_by_square_root_of_3 Float32)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const a1 Float32)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const a2 Float32)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const a3 Float32)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const b1 Float32)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const b2 Float32)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(define-fun dynamic_invariant1 ((temp___expr_160 us_rep)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=> (= temp___do_toplevel_158 true)
                                     (and
                                     (and
                                     (fp.lt (fp.abs (to_rep
                                                    (rec__math__stationary_3_phase_vector__a
                                                    (us_split_fields1
                                                    temp___expr_160)))) (fp #b0 #b10000010 #b00000110011001100110011))
                                     (fp.lt (fp.abs (to_rep
                                                    (rec__math__stationary_3_phase_vector__b
                                                    (us_split_fields1
                                                    temp___expr_160)))) (fp #b0 #b10000010 #b00000110011001100110011)))
                                     (fp.lt (fp.abs (to_rep
                                                    (rec__math__stationary_3_phase_vector__c
                                                    (us_split_fields1
                                                    temp___expr_160)))) (fp #b0 #b10000010 #b00000110011001100110011)))))

(define-fun default_initial_assumption ((temp___expr_162 us_rep)
  (temp___skip_top_level_163 Bool)) Bool (and
                                         (and
                                         (= (to_rep
                                            (rec__math__stationary_3_phase_vector__a
                                            (us_split_fields1
                                            temp___expr_162))) (fp #b0 #b00000000 #b00000000000000000000000))
                                         (= (to_rep
                                            (rec__math__stationary_3_phase_vector__b
                                            (us_split_fields1
                                            temp___expr_162))) (fp #b0 #b00000000 #b00000000000000000000000)))
                                         (= (to_rep
                                            (rec__math__stationary_3_phase_vector__c
                                            (us_split_fields1
                                            temp___expr_162))) (fp #b0 #b00000000 #b00000000000000000000000))))

(define-fun dynamic_predicate ((temp___164 us_rep)) Bool (and
                                                         (and
                                                         (fp.lt (fp.abs 
                                                         (to_rep
                                                         (rec__math__stationary_3_phase_vector__a
                                                         (us_split_fields1
                                                         temp___164)))) (fp #b0 #b10000010 #b00000110011001100110011))
                                                         (fp.lt (fp.abs 
                                                         (to_rep
                                                         (rec__math__stationary_3_phase_vector__b
                                                         (us_split_fields1
                                                         temp___164)))) (fp #b0 #b10000010 #b00000110011001100110011)))
                                                         (fp.lt (fp.abs 
                                                         (to_rep
                                                         (rec__math__stationary_3_phase_vector__c
                                                         (us_split_fields1
                                                         temp___164)))) (fp #b0 #b10000010 #b00000110011001100110011))))

;; two_thirds__def_axiom
  (assert (= two_thirds (fp #b0 #b01111110 #b01010101010101010101011)))

;; one_third__def_axiom
  (assert (= one_third (fp #b0 #b01111101 #b01010101010101010101011)))

;; one_div_by_square_root_of_3__def_axiom
  (assert
  (= one_div_by_square_root_of_3 (fp #b0 #b01111110 #b00100111100110100110110)))

;; a1__def_axiom
  (assert
  (= a1 (fp.mul RNE two_thirds (to_rep
                               (rec__math__stationary_3_phase_vector__a
                               (us_split_fields1 input))))))

;; a2__def_axiom
  (assert
  (= a2 (fp.mul RNE one_third (to_rep
                              (rec__math__stationary_3_phase_vector__b
                              (us_split_fields1 input))))))

;; a3__def_axiom
  (assert
  (= a3 (fp.mul RNE one_third (to_rep
                              (rec__math__stationary_3_phase_vector__c
                              (us_split_fields1 input))))))

;; b1__def_axiom
  (assert
  (= b1 (fp.mul RNE one_div_by_square_root_of_3 (to_rep
                                                (rec__math__stationary_3_phase_vector__b
                                                (us_split_fields1 input))))))

;; b2__def_axiom
  (assert
  (= b2 (fp.mul RNE one_div_by_square_root_of_3 (to_rep
                                                (rec__math__stationary_3_phase_vector__c
                                                (us_split_fields1 input))))))

(define-fun default_initial_assumption1 ((temp___expr_171 us_rep1)
  (temp___skip_top_level_172 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__math__stationary_2_phase_vector__alfa
                                            (us_split_fields3
                                            temp___expr_171))) (fp #b0 #b00000000 #b00000000000000000000000))
                                         (= (to_rep
                                            (rec__math__stationary_2_phase_vector__beta
                                            (us_split_fields3
                                            temp___expr_171))) (fp #b0 #b00000000 #b00000000000000000000000))))

;; Assume
  (assert (dynamic_invariant two_thirds true false true true))

;; Assume
  (assert (= (fp #b0 #b01111110 #b01010101010101010101011) two_thirds))

;; Assume
  (assert (dynamic_invariant one_third true false true true))

;; Assume
  (assert (= (fp #b0 #b01111101 #b01010101010101010101011) one_third))

;; Assume
  (assert (dynamic_invariant one_div_by_square_root_of_3 true false true
  true))

;; Assume
  (assert
  (= (fp #b0 #b01111110 #b00100111100110100110110) one_div_by_square_root_of_3))

;; Assume
  (assert (dynamic_invariant1 i2s true false true true))

;; Assume
  (assert (dynamic_invariant1 i2s true false true true))

;; Assume
  (assert (dynamic_invariant1 input true false true true))

;; Assume
  (assert
  (and
  (and
  (fp.lt (fp.abs (to_rep
                 (rec__math__stationary_3_phase_vector__a
                 (us_split_fields1 input)))) (fp #b0 #b10000010 #b00000110011001100110011))
  (fp.lt (fp.abs (to_rep
                 (rec__math__stationary_3_phase_vector__b
                 (us_split_fields1 input)))) (fp #b0 #b10000010 #b00000110011001100110011)))
  (fp.lt (fp.abs (to_rep
                 (rec__math__stationary_3_phase_vector__c
                 (us_split_fields1 input)))) (fp #b0 #b10000010 #b00000110011001100110011))))

(declare-const o Float32)

;; Ensures
  (assert
  (= (to_rep
     (rec__math__stationary_3_phase_vector__a (us_split_fields1 input))) 
  o))

;; Assume
  (assert (= (fp.mul RNE two_thirds o) a1))

;; Assume
  (assert (dynamic_invariant a1 true false true true))

(declare-const o1 Float32)

;; Ensures
  (assert
  (= (to_rep
     (rec__math__stationary_3_phase_vector__b (us_split_fields1 input))) 
  o1))

;; Assume
  (assert (= (fp.mul RNE one_third o1) a2))

;; Assume
  (assert (dynamic_invariant a2 true false true true))

(declare-const o2 Float32)

;; Ensures
  (assert
  (= (to_rep
     (rec__math__stationary_3_phase_vector__c (us_split_fields1 input))) 
  o2))

;; Assume
  (assert (= (fp.mul RNE one_third o2) a3))

;; Assume
  (assert (dynamic_invariant a3 true false true true))

;; Assert
  (assert (fp.leq (fp.abs a1) (fp #b0 #b10000001 #b01011101110111011101111)))

;; Assert
  (assert (fp.leq (fp.abs a2) (fp #b0 #b10000000 #b01011101110111011101111)))

(assert
;; defqtvc
 ;; File "math.ads", line 18, characters 0-0
  (not (fp.leq (fp.abs a3) (fp #b0 #b10000000 #b01011101110111011101111))))
(check-sat)
