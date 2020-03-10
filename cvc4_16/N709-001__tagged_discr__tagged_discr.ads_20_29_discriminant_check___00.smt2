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

(declare-sort float__ 0)

(declare-fun user_eq1 (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Float32)

(declare-const dummy1 float__)

(declare-datatypes ((float____ref 0))
(((float____refqtmk (float____content float__)))))
(define-fun float____ref_float____content__projection ((a float____ref)) float__ 
  (float____content a))

(declare-fun to_rep1 (float__) Float32)

(declare-fun of_rep1 (Float32) float__)

;; inversion_axiom
  (assert
  (forall ((x float__))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x float__))
  (! (fp.isFinite32 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Float32))
  (! (=> (fp.isFinite32 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                                  (of_rep1 x))) )))

(declare-sort e 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (e e) Bool)

(declare-const dummy2 e)

(declare-datatypes ((e__ref 0))
(((e__refqtmk (e__content e)))))
(define-fun e__ref_e__content__projection ((a e__ref)) e (e__content a))

(declare-fun to_rep2 (e) Int)

(declare-fun of_rep2 (Int) e)

;; inversion_axiom
  (assert
  (forall ((x e)) (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x e)) (! (in_range2 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__tagged_discr__t__discr e)))))
(define-fun us_split_discrs_rec__tagged_discr__t__discr__projection ((a us_split_discrs)) e 
  (rec__tagged_discr__t__discr a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__tagged_discr__t__z Bool)(rec__tagged_discr__t__x integer)(rec__tagged_discr__t__y float__)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__tagged_discr__t__z__projection ((a us_split_fields)) Bool 
  (rec__tagged_discr__t__z a))

(define-fun us_split_fields_rec__tagged_discr__t__x__projection ((a us_split_fields)) integer 
  (rec__tagged_discr__t__x a))

(define-fun us_split_fields_rec__tagged_discr__t__y__projection ((a us_split_fields)) float__ 
  (rec__tagged_discr__t__y a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun tagged_discr__t__x__pred ((a us_rep)) Bool (or
                                                       (= (to_rep2
                                                          (rec__tagged_discr__t__discr
                                                          (us_split_discrs1
                                                          a))) 0)
                                                       (= (to_rep2
                                                          (rec__tagged_discr__t__discr
                                                          (us_split_discrs1
                                                          a))) 2)))

(define-fun tagged_discr__t__y__pred ((a us_rep)) Bool (not
                                                       (or
                                                       (= (to_rep2
                                                          (rec__tagged_discr__t__discr
                                                          (us_split_discrs1
                                                          a))) 0)
                                                       (= (to_rep2
                                                          (rec__tagged_discr__t__discr
                                                          (us_split_discrs1
                                                          a))) 2))))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep2
                           (rec__tagged_discr__t__discr (us_split_discrs1 a))) 
                        (to_rep2
                        (rec__tagged_discr__t__discr (us_split_discrs1 b))))
                        (and
                        (and
                        (= (ite (rec__tagged_discr__t__z
                                (us_split_fields1 a)) 1 0) (ite (rec__tagged_discr__t__z
                                                                (us_split_fields1
                                                                b)) 1 0))
                        (=> (tagged_discr__t__x__pred a)
                        (= (to_rep
                           (rec__tagged_discr__t__x (us_split_fields1 a))) 
                        (to_rep
                        (rec__tagged_discr__t__x (us_split_fields1 b))))))
                        (=> (tagged_discr__t__y__pred a)
                        (fp.eq (to_rep1
                               (rec__tagged_discr__t__y (us_split_fields1 a))) 
                        (to_rep1
                        (rec__tagged_discr__t__y (us_split_fields1 b)))))))
                   true false))

(declare-fun us_dispatch_eq (us_rep us_rep) Bool)

(declare-const us_tag Int)

(define-fun in_range3 ((rec__tagged_discr__t__discr1 Int)
  (a us_split_discrs)) Bool (= rec__tagged_discr__t__discr1 (to_rep2
                                                            (rec__tagged_discr__t__discr
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

(declare-const tagged_discr__t__discr__first__bit Int)

(declare-const tagged_discr__t__discr__last__bit Int)

(declare-const tagged_discr__t__discr__position Int)

;; tagged_discr__t__discr__first__bit_axiom
  (assert (<= 0 tagged_discr__t__discr__first__bit))

;; tagged_discr__t__discr__last__bit_axiom
  (assert
  (< tagged_discr__t__discr__first__bit tagged_discr__t__discr__last__bit))

;; tagged_discr__t__discr__position_axiom
  (assert (<= 0 tagged_discr__t__discr__position))

(declare-const tagged_discr__t__z__first__bit Int)

(declare-const tagged_discr__t__z__last__bit Int)

(declare-const tagged_discr__t__z__position Int)

;; tagged_discr__t__z__first__bit_axiom
  (assert (<= 0 tagged_discr__t__z__first__bit))

;; tagged_discr__t__z__last__bit_axiom
  (assert (< tagged_discr__t__z__first__bit tagged_discr__t__z__last__bit))

;; tagged_discr__t__z__position_axiom
  (assert (<= 0 tagged_discr__t__z__position))

(declare-const tagged_discr__t__x__first__bit Int)

(declare-const tagged_discr__t__x__last__bit Int)

(declare-const tagged_discr__t__x__position Int)

;; tagged_discr__t__x__first__bit_axiom
  (assert (<= 0 tagged_discr__t__x__first__bit))

;; tagged_discr__t__x__last__bit_axiom
  (assert (< tagged_discr__t__x__first__bit tagged_discr__t__x__last__bit))

;; tagged_discr__t__x__position_axiom
  (assert (<= 0 tagged_discr__t__x__position))

(declare-const tagged_discr__t__y__first__bit Int)

(declare-const tagged_discr__t__y__last__bit Int)

(declare-const tagged_discr__t__y__position Int)

;; tagged_discr__t__y__first__bit_axiom
  (assert (<= 0 tagged_discr__t__y__first__bit))

;; tagged_discr__t__y__last__bit_axiom
  (assert (< tagged_discr__t__y__first__bit tagged_discr__t__y__last__bit))

;; tagged_discr__t__y__position_axiom
  (assert (<= 0 tagged_discr__t__y__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((t__ref1 0))
(((t__refqtmk1 (t__content1 us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref1)) us_rep (t__content1
                                                               a))

(declare-const v us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant1 ((temp___expr_60 Float32)
  (temp___is_init_56 Bool) (temp___skip_constant_57 Bool)
  (temp___do_toplevel_58 Bool)
  (temp___do_typ_inv_59 Bool)) Bool (=>
                                    (or (= temp___is_init_56 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                    (fp.isFinite32 temp___expr_60)))

(define-fun dynamic_invariant2 ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= 0 3)) (in_range2 temp___expr_161)))

(assert
;; defqtvc
 ;; File "tagged_discr.ads", line 16, characters 0-0
  (not
  (forall ((o Int) (o1 Int))
  (=>
  (= (ite (rec__tagged_discr__t__z (us_split_fields1 v)) 1 0) (ite (distinct 0 0) 1 0))
  (=> (= (to_rep2 (rec__tagged_discr__t__discr (us_split_discrs1 v))) o)
  (=> (= (to_rep2 (rec__tagged_discr__t__discr (us_split_discrs1 v))) o1)
  (=> (not (= (or (ite (= o1 0) true false) (ite (= o 2) true false)) true))
  (tagged_discr__t__y__pred v))))))))
(check-sat)
(exit)
