;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
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

(declare-sort float__ 0)

(declare-fun user_eq1 (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float32)

(declare-const dummy1 float__)

(declare-datatypes ((float____ref 0))
(((float____refqtmk (float____content float__)))))
(define-fun float____ref_float____content__projection ((a float____ref)) float__ 
  (float____content a))

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

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                             (of_rep1 x))) )))

(declare-sort enum 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (enum enum) Bool)

(declare-const dummy2 enum)

(declare-datatypes ((enum__ref 0))
(((enum__refqtmk (enum__content enum)))))
(define-fun enum__ref_enum__content__projection ((a enum__ref)) enum 
  (enum__content a))

(declare-fun to_rep2 (enum) Int)

(declare-fun of_rep2 (Int) enum)

;; inversion_axiom
  (assert
  (forall ((x enum)) (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x enum)) (! (in_range1 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__types__r__i enum)))))
(define-fun us_split_discrs_rec__types__r__i__projection ((a us_split_discrs)) enum 
  (rec__types__r__i a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__types__r__x integer)(rec__types__r__y float__)))))
(define-fun us_split_fields_rec__types__r__x__projection ((a us_split_fields)) integer 
  (rec__types__r__x a))

(define-fun us_split_fields_rec__types__r__y__projection ((a us_split_fields)) float__ 
  (rec__types__r__y a))

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

(define-fun types__r__x__pred ((a us_rep)) Bool (= (to_rep2
                                                   (rec__types__r__i
                                                   (us_split_discrs1 a))) 0))

(define-fun types__r__y__pred ((a us_rep)) Bool (= (to_rep2
                                                   (rec__types__r__i
                                                   (us_split_discrs1 a))) 1))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep2 (rec__types__r__i (us_split_discrs1 a))) 
                        (to_rep2 (rec__types__r__i (us_split_discrs1 b))))
                        (and
                        (=> (types__r__x__pred a)
                        (= (to_rep1 (rec__types__r__x (us_split_fields1 a))) 
                        (to_rep1 (rec__types__r__x (us_split_fields1 b)))))
                        (=> (types__r__y__pred a)
                        (fp.eq (to_rep
                               (rec__types__r__y (us_split_fields1 a))) 
                        (to_rep (rec__types__r__y (us_split_fields1 b)))))))
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

(declare-const types__r__i__first__bit Int)

(declare-const types__r__i__last__bit Int)

(declare-const types__r__i__position Int)

;; types__r__i__first__bit_axiom
  (assert (<= 0 types__r__i__first__bit))

;; types__r__i__last__bit_axiom
  (assert (< types__r__i__first__bit types__r__i__last__bit))

;; types__r__i__position_axiom
  (assert (<= 0 types__r__i__position))

(declare-const types__r__x__first__bit Int)

(declare-const types__r__x__last__bit Int)

(declare-const types__r__x__position Int)

;; types__r__x__first__bit_axiom
  (assert (<= 0 types__r__x__first__bit))

;; types__r__x__last__bit_axiom
  (assert (< types__r__x__first__bit types__r__x__last__bit))

;; types__r__x__position_axiom
  (assert (<= 0 types__r__x__position))

(declare-const types__r__y__first__bit Int)

(declare-const types__r__y__last__bit Int)

(declare-const types__r__y__position Int)

;; types__r__y__first__bit_axiom
  (assert (<= 0 types__r__y__first__bit))

;; types__r__y__last__bit_axiom
  (assert (< types__r__y__first__bit types__r__y__last__bit))

;; types__r__y__position_axiom
  (assert (<= 0 types__r__y__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((r__ref 0))
(((r__refqtmk (r__content us_rep)))))
(define-fun r__ref_r__content__projection ((a r__ref)) us_rep (r__content a))

(declare-const x__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun in_range2 ((rec__types__r__i1 Int)
  (a us_rep)) Bool (= rec__types__r__i1 (to_rep2
                                        (rec__types__r__i
                                        (us_split_discrs1 a)))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const types__r__i__first__bit1 Int)

(declare-const types__r__i__last__bit1 Int)

(declare-const types__r__i__position1 Int)

;; types__r__i__first__bit_axiom
  (assert (<= 0 types__r__i__first__bit1))

;; types__r__i__last__bit_axiom
  (assert (< types__r__i__first__bit1 types__r__i__last__bit1))

;; types__r__i__position_axiom
  (assert (<= 0 types__r__i__position1))

(declare-const types__r__y__first__bit1 Int)

(declare-const types__r__y__last__bit1 Int)

(declare-const types__r__y__position1 Int)

;; types__r__y__first__bit_axiom
  (assert (<= 0 types__r__y__first__bit1))

;; types__r__y__last__bit_axiom
  (assert (< types__r__y__first__bit1 types__r__y__last__bit1))

;; types__r__y__position_axiom
  (assert (<= 0 types__r__y__position1))

(declare-const types__r__x__first__bit1 Int)

(declare-const types__r__x__last__bit1 Int)

(declare-const types__r__x__position1 Int)

;; types__r__x__first__bit_axiom
  (assert (<= 0 types__r__x__first__bit1))

;; types__r__x__last__bit_axiom
  (assert (< types__r__x__first__bit1 types__r__x__last__bit1))

;; types__r__x__position_axiom
  (assert (<= 0 types__r__x__position1))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content us_rep)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) us_rep (t1b__content
                                                                    a))

(define-fun in_range3 ((rec__types__r__i1 Int)
  (a us_rep)) Bool (= rec__types__r__i1 (to_rep2
                                        (rec__types__r__i
                                        (us_split_discrs1 a)))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const types__r__i__first__bit2 Int)

(declare-const types__r__i__last__bit2 Int)

(declare-const types__r__i__position2 Int)

;; types__r__i__first__bit_axiom
  (assert (<= 0 types__r__i__first__bit2))

;; types__r__i__last__bit_axiom
  (assert (< types__r__i__first__bit2 types__r__i__last__bit2))

;; types__r__i__position_axiom
  (assert (<= 0 types__r__i__position2))

(declare-const types__r__x__first__bit2 Int)

(declare-const types__r__x__last__bit2 Int)

(declare-const types__r__x__position2 Int)

;; types__r__x__first__bit_axiom
  (assert (<= 0 types__r__x__first__bit2))

;; types__r__x__last__bit_axiom
  (assert (< types__r__x__first__bit2 types__r__x__last__bit2))

;; types__r__x__position_axiom
  (assert (<= 0 types__r__x__position2))

(declare-const types__r__y__first__bit2 Int)

(declare-const types__r__y__last__bit2 Int)

(declare-const types__r__y__position2 Int)

;; types__r__y__first__bit_axiom
  (assert (<= 0 types__r__y__first__bit2))

;; types__r__y__last__bit_axiom
  (assert (< types__r__y__first__bit2 types__r__y__last__bit2))

;; types__r__y__position_axiom
  (assert (<= 0 types__r__y__position2))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((t2b__ref 0))
(((t2b__refqtmk (t2b__content us_rep)))))
(define-fun t2b__ref_t2b__content__projection ((a t2b__ref)) us_rep (t2b__content
                                                                    a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant1 ((temp___expr_60 Float32)
  (temp___is_init_56 Bool) (temp___skip_constant_57 Bool)
  (temp___do_toplevel_58 Bool)
  (temp___do_typ_inv_59 Bool)) Bool (=>
                                    (or (= temp___is_init_56 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                    (fp.isFinite32 temp___expr_60)))

(define-fun dynamic_invariant2 ((temp___expr_158 Int)
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool)
  (temp___do_typ_inv_157 Bool)) Bool (=>
                                     (or (= temp___is_init_154 true)
                                     (<= 0 1)) (in_range1 temp___expr_158)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 1))

(assert
;; defqtvc
 ;; File "p.ads", line 3, characters 0-0
  (not
  (forall ((o enum) (x__split_fields us_split_fields) (o1 float__) (o2 enum))
  (=> (= (to_rep2 o) 0)
  (=> (= x__split_fields (us_split_fieldsqtmk rliteral dummy1))
  (=> (= x__split_discrs (us_split_discrsqtmk o))
  (=> (= (to_rep o1) (fp #b0 #b10000000 #b00000000000000000000000))
  (=> (= (to_rep2 o2) 1) (= o2 (rec__types__r__i x__split_discrs))))))))))
(check-sat)