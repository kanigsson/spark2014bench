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
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite32 ((x Float32)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral32 ((x Float32)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
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

(declare-fun pow2 (Int) Int)

(define-fun is_plus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float32)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float32)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

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

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content Float32)))))
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

(declare-sort float__ 0)

(declare-fun user_eq2 (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE3 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Float32)

(declare-const dummy2 float__)

(declare-datatypes ((float____ref 0))
(((float____refqtmk (float____content float__)))))
(define-fun float____ref_float____content__projection ((a float____ref)) float__ 
  (float____content a))

(declare-fun to_rep2 (float__) Float32)

(declare-fun of_rep2 (Float32) float__)

;; inversion_axiom
  (assert
  (forall ((x float__))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x float__))
  (! (fp.isFinite32 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Float32))
  (! (=> (fp.isFinite32 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                                  (of_rep2 x))) )))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun div1 (Int Int) Int)

(declare-fun mod1 (Int Int) Int)

;; Div_mod
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (= x (+ (* y (div1 x y)) (mod1 x y))))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div1 x y)) (<= (div1 x y) x)))))

;; Mod_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0))
  (and (< (- (abs1 y)) (mod1 x y)) (< (mod1 x y) (abs1 y))))))

;; Div_sign_pos
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< 0 y)) (<= 0 (div1 x y)))))

;; Div_sign_neg
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= x 0) (< 0 y)) (<= (div1 x y) 0))))

;; Mod_sign_pos
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (not (= y 0))) (<= 0 (mod1 x y)))))

;; Mod_sign_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= x 0) (not (= y 0))) (<= (mod1 x y) 0))))

;; Rounds_toward_zero
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (<= (abs1 (* (div1 x y) y)) (abs1 x)))))

;; Div_1
  (assert (forall ((x Int)) (= (div1 x 1) x)))

;; Mod_1
  (assert (forall ((x Int)) (= (mod1 x 1) 0)))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div1 x y) 0))))

;; Mod_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (mod1 x y) x))))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (div1 (+ (* x y) z) x) (+ y (div1 z x)))) :pattern ((div1
                                                            (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (mod1 (+ (* x y) z) x) (mod1 z x))) :pattern ((mod1 (+ (* x y) z) x)) )))

;; Div_unique
  (assert
  (forall ((x Int) (y Int) (q Int))
  (=> (< 0 y) (=> (and (<= (* q y) x) (< x (+ (* q y) y))) (= (div x y) q)))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div x y)) (<= (div x y) x)))))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div x y) 0))))

;; Div_inf_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (< 0 x) (<= x y)) (= (div (- x) y) (- 1)))))

;; Mod_0
  (assert (forall ((y Int)) (=> (not (= y 0)) (= (mod 0 y) 0))))

;; Div_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div 1 y) 0))))

;; Div_minus1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div (- 1) y) (- 1)))))

;; Mod_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (mod 1 y) 1))))

;; Mod_minus1_left
  (assert
  (forall ((y Int))
  (! (=> (< 1 y) (= (mod (- 1) y) (- y 1))) :pattern ((mod (- 1) y)) )))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (div (+ (* x y) z) x) (+ y (div z x)))) :pattern ((div (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (mod (+ (* x y) z) x) (mod z x))) :pattern ((mod (+ (* x y) z) x)) )))

(define-fun mod2 ((x Int)
  (y Int)) Int (ite (< 0 y) (mod x y) (+ (mod x y) y)))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-fun prop (Int) Bool)

(declare-fun prop__function_guard (Bool Int) Bool)

;; prop__post_axiom
  (assert true)

;; prop__def_axiom
  (assert
  (forall ((x Int))
  (! (= (= (prop x) true) (not (= (mod2 10 x) 0))) :pattern ((prop x)) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__pred__r__d positive)))))
(define-fun us_split_discrs_rec__pred__r__d__projection ((a us_split_discrs)) positive 
  (rec__pred__r__d a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__pred__r__c1 integer)(rec__pred__r__c2 float__)(rec__pred__r__c3 Bool)))))
(define-fun us_split_fields_rec__pred__r__c1__projection ((a us_split_fields)) integer 
  (rec__pred__r__c1 a))

(define-fun us_split_fields_rec__pred__r__c2__projection ((a us_split_fields)) float__ 
  (rec__pred__r__c2 a))

(define-fun us_split_fields_rec__pred__r__c3__projection ((a us_split_fields)) Bool 
  (rec__pred__r__c3 a))

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

(define-fun pred__r__c1__pred ((a us_rep)) Bool (= (to_rep1
                                                   (rec__pred__r__d
                                                   (us_split_discrs1 a))) 1))

(define-fun pred__r__c2__pred ((a us_rep)) Bool (= (to_rep1
                                                   (rec__pred__r__d
                                                   (us_split_discrs1 a))) 2))

(define-fun pred__r__c3__pred ((a us_rep)) Bool (and
                                                (not
                                                (= (to_rep1
                                                   (rec__pred__r__d
                                                   (us_split_discrs1 a))) 1))
                                                (not
                                                (= (to_rep1
                                                   (rec__pred__r__d
                                                   (us_split_discrs1 a))) 2))))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1 (rec__pred__r__d (us_split_discrs1 a))) 
                        (to_rep1 (rec__pred__r__d (us_split_discrs1 b))))
                        (and
                        (and
                        (=> (pred__r__c1__pred a)
                        (= (to_rep (rec__pred__r__c1 (us_split_fields1 a))) 
                        (to_rep (rec__pred__r__c1 (us_split_fields1 b)))))
                        (=> (pred__r__c2__pred a)
                        (fp.eq (to_rep2
                               (rec__pred__r__c2 (us_split_fields1 a))) 
                        (to_rep2 (rec__pred__r__c2 (us_split_fields1 b))))))
                        (=> (pred__r__c3__pred a)
                        (= (ite (rec__pred__r__c3 (us_split_fields1 a)) 1 0) (ite 
                        (rec__pred__r__c3 (us_split_fields1 b)) 1 0)))))
                   true false))

(define-fun in_range3 ((rec__pred__r__d1 Int)
  (a us_split_discrs)) Bool (= rec__pred__r__d1 (to_rep1 (rec__pred__r__d a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const pred__r__d__first__bit Int)

(declare-const pred__r__d__last__bit Int)

(declare-const pred__r__d__position Int)

;; pred__r__d__first__bit_axiom
  (assert (<= 0 pred__r__d__first__bit))

;; pred__r__d__last__bit_axiom
  (assert (< pred__r__d__first__bit pred__r__d__last__bit))

;; pred__r__d__position_axiom
  (assert (<= 0 pred__r__d__position))

(declare-const pred__r__c1__first__bit Int)

(declare-const pred__r__c1__last__bit Int)

(declare-const pred__r__c1__position Int)

;; pred__r__c1__first__bit_axiom
  (assert (<= 0 pred__r__c1__first__bit))

;; pred__r__c1__last__bit_axiom
  (assert (< pred__r__c1__first__bit pred__r__c1__last__bit))

;; pred__r__c1__position_axiom
  (assert (<= 0 pred__r__c1__position))

(declare-const pred__r__c2__first__bit Int)

(declare-const pred__r__c2__last__bit Int)

(declare-const pred__r__c2__position Int)

;; pred__r__c2__first__bit_axiom
  (assert (<= 0 pred__r__c2__first__bit))

;; pred__r__c2__last__bit_axiom
  (assert (< pred__r__c2__first__bit pred__r__c2__last__bit))

;; pred__r__c2__position_axiom
  (assert (<= 0 pred__r__c2__position))

(declare-const pred__r__c3__first__bit Int)

(declare-const pred__r__c3__last__bit Int)

(declare-const pred__r__c3__position Int)

;; pred__r__c3__first__bit_axiom
  (assert (<= 0 pred__r__c3__first__bit))

;; pred__r__c3__last__bit_axiom
  (assert (< pred__r__c3__first__bit pred__r__c3__last__bit))

;; pred__r__c3__position_axiom
  (assert (<= 0 pred__r__c3__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((r__ref 0))
(((r__refqtmk (r__content us_rep)))))
(define-fun r__ref_r__content__projection ((a r__ref)) us_rep (r__content a))

(declare-const i13b us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

;; temp___result_188'def
  (assert
  (forall ((temp___187 us_rep)) (prop__function_guard
  (prop (to_rep1 (rec__pred__r__d (us_split_discrs1 temp___187))))
  (to_rep1 (rec__pred__r__d (us_split_discrs1 temp___187))))))

(define-fun dynamic_invariant1 ((temp___expr_186 us_rep)
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (=> (= temp___do_toplevel_184 true)
                                     (=> (= temp___is_init_182 true)
                                     (and
                                     (= (prop
                                        (to_rep1
                                        (rec__pred__r__d
                                        (us_split_discrs1 temp___expr_186)))) true)
                                     (ite (= (to_rep1
                                             (rec__pred__r__d
                                             (us_split_discrs1
                                             temp___expr_186))) 1)
                                     (not
                                     (= (to_rep
                                        (rec__pred__r__c1
                                        (us_split_fields1 temp___expr_186))) 0))
                                     (ite (= (to_rep1
                                             (rec__pred__r__d
                                             (us_split_discrs1
                                             temp___expr_186))) 2)
                                     (not (fp.eq (to_rep2
                                                 (rec__pred__r__c2
                                                 (us_split_fields1
                                                 temp___expr_186))) (fp #b0 #b00000000 #b00000000000000000000000)))
                                     (not
                                     (= (rec__pred__r__c3
                                        (us_split_fields1 temp___expr_186)) (distinct 0 0)))))))))

;; temp___result_192'def
  (assert
  (forall ((temp___191 us_rep)) (prop__function_guard
  (prop (to_rep1 (rec__pred__r__d (us_split_discrs1 temp___191))))
  (to_rep1 (rec__pred__r__d (us_split_discrs1 temp___191))))))

(define-fun dynamic_predicate ((temp___190 us_rep)) Bool (and
                                                         (= (prop
                                                            (to_rep1
                                                            (rec__pred__r__d
                                                            (us_split_discrs1
                                                            temp___190)))) true)
                                                         (ite (= (to_rep1
                                                                 (rec__pred__r__d
                                                                 (us_split_discrs1
                                                                 temp___190))) 1)
                                                         (not
                                                         (= (to_rep
                                                            (rec__pred__r__c1
                                                            (us_split_fields1
                                                            temp___190))) 0))
                                                         (ite (= (to_rep1
                                                                 (rec__pred__r__d
                                                                 (us_split_discrs1
                                                                 temp___190))) 2)
                                                         (not (fp.eq 
                                                         (to_rep2
                                                         (rec__pred__r__c2
                                                         (us_split_fields1
                                                         temp___190))) (fp #b0 #b00000000 #b00000000000000000000000)))
                                                         (not
                                                         (= (rec__pred__r__c3
                                                            (us_split_fields1
                                                            temp___190)) (distinct 0 0)))))))

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(define-fun dynamic_invariant3 ((temp___expr_60 Float32)
  (temp___is_init_56 Bool) (temp___skip_constant_57 Bool)
  (temp___do_toplevel_58 Bool)
  (temp___do_typ_inv_59 Bool)) Bool (=>
                                    (or (= temp___is_init_56 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                    (fp.isFinite32 temp___expr_60)))

(assert
;; defqtvc
 ;; File "pred.adb", line 16, characters 0-0
  (not
  (forall ((o Int))
  (=> (dynamic_invariant1 i13b true false false true)
  (=> (= (to_rep1 (rec__pred__r__d (us_split_discrs1 i13b))) o)
  (let ((o1 (prop o)))
  (=>
  (and (prop__function_guard o1 o) (= (= o1 true) (not (= (mod2 10 o) 0))))
  (=> (= o1 true)
  (forall ((o2 Int))
  (=> (= (to_rep1 (rec__pred__r__d (us_split_discrs1 i13b))) o2)
  (not (= o2 1))))))))))))
(check-sat)
(exit)
