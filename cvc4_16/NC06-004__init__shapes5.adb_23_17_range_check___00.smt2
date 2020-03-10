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
(define-fun fp.isFinite64 ((x Float64)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral64 ((x Float64)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
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

(define-fun is_plus_infinity ((x Float64)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float64)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float64)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float64)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

(declare-const max_int Int)

(define-fun in_int_range ((i Int)) Bool (and (<= (- max_int) i)
                                        (<= i max_int)))

(define-fun in_safe_int_range ((i Int)) Bool (and (<= (- 9007199254740992) i)
                                             (<= i 9007199254740992)))

(define-fun same_sign ((x Float64)
  (y Float64)) Bool (or (and (fp.isPositive x) (fp.isPositive y))
                    (and (fp.isNegative x) (fp.isNegative y))))

(define-fun diff_sign ((x Float64)
  (y Float64)) Bool (or (and (fp.isPositive x) (fp.isNegative y))
                    (and (fp.isNegative x) (fp.isPositive y))))

(define-fun product_sign ((z Float64) (x Float64)
  (y Float64)) Bool (and (=> (same_sign x y) (fp.isPositive z))
                    (=> (diff_sign x y) (fp.isNegative z))))

(define-fun sqr ((x Real)) Real (* x x))

(declare-fun sqrt1 (Real) Real)

(define-fun same_sign_real ((x Float64)
  (r Real)) Bool (or (and (fp.isPositive x) (< 0.0 r))
                 (and (fp.isNegative x) (< r 0.0))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content Float64)))))
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

(declare-const x Float64)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const y Float64)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const radius Float64)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort coordinate_type 0)

(define-fun in_range2 ((x1 Float64)) Bool (and (fp.isFinite64 x1)
                                          (and
                                          (fp.leq (fp.neg (fp #b0 #b10000000101 #b1001000000000000000000000000000000000000000000000000)) x1)
                                          (fp.leq x1 (fp #b0 #b10000000101 #b1001000000000000000000000000000000000000000000000000)))))

(declare-fun user_eq1 (coordinate_type coordinate_type) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Float64)

(declare-const dummy1 coordinate_type)

(declare-datatypes ((coordinate_type__ref 0))
(((coordinate_type__refqtmk (coordinate_type__content coordinate_type)))))
(define-fun coordinate_type__ref_coordinate_type__content__projection ((a coordinate_type__ref)) coordinate_type 
  (coordinate_type__content a))

(declare-fun to_rep (coordinate_type) Float64)

(declare-fun of_rep (Float64) coordinate_type)

;; inversion_axiom
  (assert
  (forall ((x1 coordinate_type))
  (! (= (of_rep (to_rep x1)) x1) :pattern ((to_rep x1)) )))

;; range_axiom
  (assert
  (forall ((x1 coordinate_type)) (! (in_range2
  (to_rep x1)) :pattern ((to_rep x1)) )))

;; coerce_axiom
  (assert
  (forall ((x1 Float64))
  (! (=> (in_range2 x1) (= (to_rep (of_rep x1)) x1)) :pattern ((to_rep
                                                               (of_rep x1))) )))

(declare-sort radius_type 0)

(define-fun in_range3 ((x1 Float64)) Bool (and (fp.isFinite64 x1)
                                          (and
                                          (fp.leq (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000) x1)
                                          (fp.leq x1 (fp #b0 #b10000000010 #b0100000000000000000000000000000000000000000000000000)))))

(declare-fun user_eq2 (radius_type radius_type) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE3 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Float64)

(declare-const dummy2 radius_type)

(declare-datatypes ((radius_type__ref 0))
(((radius_type__refqtmk (radius_type__content radius_type)))))
(define-fun radius_type__ref_radius_type__content__projection ((a radius_type__ref)) radius_type 
  (radius_type__content a))

(declare-fun to_rep1 (radius_type) Float64)

(declare-fun of_rep1 (Float64) radius_type)

;; inversion_axiom
  (assert
  (forall ((x1 radius_type))
  (! (= (of_rep1 (to_rep1 x1)) x1) :pattern ((to_rep1 x1)) )))

;; range_axiom
  (assert
  (forall ((x1 radius_type)) (! (in_range3
  (to_rep1 x1)) :pattern ((to_rep1 x1)) )))

;; coerce_axiom
  (assert
  (forall ((x1 Float64))
  (! (=> (in_range3 x1) (= (to_rep1 (of_rep1 x1)) x1)) :pattern ((to_rep1
                                                                 (of_rep1 x1))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__shapes5__circle__center_x coordinate_type)(rec__shapes5__circle__center_y coordinate_type)(rec__shapes5__circle__radius radius_type)))))
(define-fun us_split_fields_rec__shapes5__circle__center_x__projection ((a us_split_fields)) coordinate_type 
  (rec__shapes5__circle__center_x a))

(define-fun us_split_fields_rec__shapes5__circle__center_y__projection ((a us_split_fields)) coordinate_type 
  (rec__shapes5__circle__center_y a))

(define-fun us_split_fields_rec__shapes5__circle__radius__projection ((a us_split_fields)) radius_type 
  (rec__shapes5__circle__radius a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (fp.eq (to_rep
                               (rec__shapes5__circle__center_x
                               (us_split_fields1 a))) (to_rep
                                                      (rec__shapes5__circle__center_x
                                                      (us_split_fields1 b))))
                        (fp.eq (to_rep
                               (rec__shapes5__circle__center_y
                               (us_split_fields1 a))) (to_rep
                                                      (rec__shapes5__circle__center_y
                                                      (us_split_fields1 b)))))
                        (fp.eq (to_rep1
                               (rec__shapes5__circle__radius
                               (us_split_fields1 a))) (to_rep1
                                                      (rec__shapes5__circle__radius
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

(declare-const shapes5__circle__center_x__first__bit Int)

(declare-const shapes5__circle__center_x__last__bit Int)

(declare-const shapes5__circle__center_x__position Int)

;; shapes5__circle__center_x__first__bit_axiom
  (assert (<= 0 shapes5__circle__center_x__first__bit))

;; shapes5__circle__center_x__last__bit_axiom
  (assert
  (< shapes5__circle__center_x__first__bit shapes5__circle__center_x__last__bit))

;; shapes5__circle__center_x__position_axiom
  (assert (<= 0 shapes5__circle__center_x__position))

(declare-const shapes5__circle__center_y__first__bit Int)

(declare-const shapes5__circle__center_y__last__bit Int)

(declare-const shapes5__circle__center_y__position Int)

;; shapes5__circle__center_y__first__bit_axiom
  (assert (<= 0 shapes5__circle__center_y__first__bit))

;; shapes5__circle__center_y__last__bit_axiom
  (assert
  (< shapes5__circle__center_y__first__bit shapes5__circle__center_y__last__bit))

;; shapes5__circle__center_y__position_axiom
  (assert (<= 0 shapes5__circle__center_y__position))

(declare-const shapes5__circle__radius__first__bit Int)

(declare-const shapes5__circle__radius__last__bit Int)

(declare-const shapes5__circle__radius__position Int)

;; shapes5__circle__radius__first__bit_axiom
  (assert (<= 0 shapes5__circle__radius__first__bit))

;; shapes5__circle__radius__last__bit_axiom
  (assert
  (< shapes5__circle__radius__first__bit shapes5__circle__radius__last__bit))

;; shapes5__circle__radius__position_axiom
  (assert (<= 0 shapes5__circle__radius__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((circle__ref 0))
(((circle__refqtmk (circle__content us_rep)))))
(define-fun circle__ref_circle__content__projection ((a circle__ref)) us_rep 
  (circle__content a))

(declare-fun in_bounds (us_rep Int) Bool)

(declare-fun in_bounds__function_guard (Bool us_rep Int) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

;; in_bounds__post_axiom
  (assert true)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_invariant1 ((temp___expr_161 Float64)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (fp.leq (fp.neg (fp #b0 #b10000000101 #b1001000000000000000000000000000000000000000000000000)) (fp #b0 #b10000000101 #b1001000000000000000000000000000000000000000000000000)))
                                     (in_range2 temp___expr_161)))

(define-fun dynamic_invariant2 ((temp___expr_168 Float64)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (or (= temp___is_init_164 true)
                                     (fp.leq (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000) (fp #b0 #b10000000010 #b0100000000000000000000000000000000000000000000000000)))
                                     (in_range3 temp___expr_168)))

(assert
;; defqtvc
 ;; File "shapes5.ads", line 10, characters 0-0
  (not
  (forall ((wild_man Int) (r Float64) (spark__branch Bool) (r1 Float64)
  (spark__branch1 Bool))
  (=> (dynamic_invariant1 x true false true true)
  (=> (dynamic_invariant1 y true false true true)
  (=> (dynamic_invariant2 radius true false true true)
  (=> (dynamic_invariant wild_man true false true true)
  (=> (= r radius)
  (=> (dynamic_invariant2 r true false true true)
  (=>
  (= spark__branch (ite (fp.leq (fp.sub RNE (fp #b0 #b10000000101 #b1001000000000000000000000000000000000000000000000000) 
                   x) r) true false))
  (=>
  (ite (= spark__branch true)
  (let ((o (fp.sub RNE (fp #b0 #b10000000101 #b1001000000000000000000000000000000000000000000000000) 
  x))) (and (fp.isFinite64 o) (= r1 o))) (= r1 r))
  (=>
  (= spark__branch1 (ite (fp.leq (fp.sub RNE x (fp.neg (fp #b0 #b10000000101 #b1001000000000000000000000000000000000000000000000000))) r1)
                    true false))
  (=> (= spark__branch1 true) (in_range3
  (fp.sub RNE x (fp.neg (fp #b0 #b10000000101 #b1001000000000000000000000000000000000000000000000000)))))))))))))))))
(check-sat)
(exit)
