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

(declare-sort long_integer 0)

(declare-fun long_integerqtint (long_integer) Int)

;; long_integer'axiom
  (assert
  (forall ((i long_integer))
  (and (<= (- 9223372036854775808) (long_integerqtint i))
  (<= (long_integerqtint i) 9223372036854775807))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                     (<= x 9223372036854775807)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (long_integer long_integer) Bool)

(declare-const dummy long_integer)

(declare-datatypes ((long_integer__ref 0))
(((long_integer__refqtmk (long_integer__content long_integer)))))
(define-fun long_integer__ref_long_integer__content__projection ((a long_integer__ref)) long_integer 
  (long_integer__content a))

(declare-sort long_float 0)

(declare-fun user_eq1 (long_float long_float) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Float64)

(declare-const dummy1 long_float)

(declare-datatypes ((long_float__ref 0))
(((long_float__refqtmk (long_float__content long_float)))))
(define-fun long_float__ref_long_float__content__projection ((a long_float__ref)) long_float 
  (long_float__content a))

(define-fun dynamic_invariant ((temp___expr_67 Float64)
  (temp___is_init_63 Bool) (temp___skip_constant_64 Bool)
  (temp___do_toplevel_65 Bool)
  (temp___do_typ_inv_66 Bool)) Bool (=>
                                    (or (= temp___is_init_63 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)) (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)))
                                    (fp.isFinite64 temp___expr_67)))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort tindexS 0)

(declare-fun tindexSqtint (tindexS) Int)

;; tindexS'axiom
  (assert
  (forall ((i tindexS))
  (and (<= 1 (tindexSqtint i)) (<= (tindexSqtint i) 9223372036854775807))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x)
                                     (<= x 9223372036854775807)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (tindexS tindexS) Bool)

(declare-const dummy2 tindexS)

(declare-datatypes ((tindexS__ref 0))
(((tindexS__refqtmk (tindexS__content tindexS)))))
(define-fun tindexS__ref_tindexS__content__projection ((a tindexS__ref)) tindexS 
  (tindexS__content a))

(define-fun dynamic_invariant1 ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (<= 1 9223372036854775807)) (in_range2
                                     temp___expr_159)))

(declare-sort tindex_floatS 0)

(define-fun in_range3 ((x Float64)) Bool (and (fp.isFinite64 x)
                                         (and
                                         (fp.leq (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000) x)
                                         (fp.leq x (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)))))

(declare-fun user_eq3 (tindex_floatS tindex_floatS) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE4 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Float64)

(declare-const dummy3 tindex_floatS)

(declare-datatypes ((tindex_floatS__ref 0))
(((tindex_floatS__refqtmk (tindex_floatS__content tindex_floatS)))))
(define-fun tindex_floatS__ref_tindex_floatS__content__projection ((a tindex_floatS__ref)) tindex_floatS 
  (tindex_floatS__content a))

(define-fun dynamic_invariant2 ((temp___expr_166 Float64)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (fp.leq (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000) (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)))
                                     (in_range3 temp___expr_166)))

(define-fun dynamic_invariant3 ((temp___expr_25 Int) (temp___is_init_21 Bool)
  (temp___skip_constant_22 Bool) (temp___do_toplevel_23 Bool)
  (temp___do_typ_inv_24 Bool)) Bool (=>
                                    (or (= temp___is_init_21 true)
                                    (<= (- 9223372036854775808) 9223372036854775807))
                                    (in_range1 temp___expr_25)))

(assert
;; defqtvc
 ;; File "pi_euler_2.adb", line 2, characters 0-0
  (not
  (forall ((index Int) (pi1 Float64) (erreur Float64) (index_float Float64)
  (erreur1 Float64) (index1 Int) (pi2 Float64) (erreur2 Float64)
  (index_float1 Float64))
  (=> (dynamic_invariant1 index false false true true)
  (=> (dynamic_invariant pi1 false false true true)
  (=> (dynamic_invariant erreur false false true true)
  (=> (dynamic_invariant2 index_float false false true true)
  (=>
  (= erreur1 (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000))
  (=>
  (not
  (fp.lt erreur1 (fp #b0 #b01111100111 #b0101011110011000111011100010001100001000110000111010)))
  (=>
  (fp.leq (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000) index_float1)
  (=>
  (= (and (ite (and
               (and
               (and (dynamic_invariant pi2 false true true true)
               (dynamic_invariant erreur2 false true true true))
               (dynamic_invariant2 index_float1 false true true true))
               (dynamic_invariant1 index1 false true true true))
          true false) (ite (not
                           (fp.lt erreur2 (fp #b0 #b01111100111 #b0101011110011000111011100010001100001000110000111010)))
                      true false)) true)
  (=>
  (fp.leq (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000) index_float1)
  (not (fp.isZero index_float1))))))))))))))
(check-sat)
(exit)
