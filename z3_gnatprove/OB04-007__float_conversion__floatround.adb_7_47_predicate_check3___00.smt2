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

(declare-const x Float32)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort t1 0)

(define-fun in_range1 ((x1 Float32)) Bool (and (fp.isFinite32 x1)
                                          (and
                                          (fp.leq (fp.neg (fp #b0 #b10000010 #b01000000000000000000000)) x1)
                                          (fp.leq x1 (fp #b0 #b10000010 #b01000000000000000000000)))))

(declare-fun user_eq (t1 t1) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float32)

(declare-const dummy t1)

(declare-datatypes () ((t1__ref (t1__refqtmk (t1__content t1)))))
(define-fun t1__ref_t1__content__projection ((a t1__ref)) t1 (t1__content a))

(define-fun dynamic_invariant ((temp___expr_181 Float32)
  (temp___is_init_177 Bool) (temp___skip_constant_178 Bool)
  (temp___do_toplevel_179 Bool)
  (temp___do_typ_inv_180 Bool)) Bool (=>
                                     (or (= temp___is_init_177 true)
                                     (fp.leq (fp.neg (fp #b0 #b10000010 #b01000000000000000000000)) (fp #b0 #b10000010 #b01000000000000000000000)))
                                     (in_range1 temp___expr_181)))

(declare-sort t2 0)

(define-fun in_range2 ((x1 Float32)) Bool (and (fp.isFinite32 x1)
                                          (and
                                          (fp.leq (fp.neg (fp #b0 #b10000010 #b01000000000000000000000)) x1)
                                          (fp.leq x1 (fp #b0 #b10000010 #b01000000000000000000000)))))

(declare-fun user_eq1 (t2 t2) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Float32)

(declare-const dummy1 t2)

(declare-datatypes () ((t2__ref (t2__refqtmk (t2__content t2)))))
(define-fun t2__ref_t2__content__projection ((a t2__ref)) t2 (t2__content a))

(define-fun dynamic_invariant1 ((temp___expr_188 Float32)
  (temp___is_init_184 Bool) (temp___skip_constant_185 Bool)
  (temp___do_toplevel_186 Bool)
  (temp___do_typ_inv_187 Bool)) Bool (and
                                     (=>
                                     (or (= temp___is_init_184 true)
                                     (fp.leq (fp.neg (fp #b0 #b10000010 #b01000000000000000000000)) (fp #b0 #b10000010 #b01000000000000000000000)))
                                     (in_range2 temp___expr_188))
                                     (=> (= temp___do_toplevel_186 true)
                                     (=> (= temp___is_init_184 true)
                                     (and
                                     (fp.leq (fp.neg (fp #b0 #b01111111 #b00000000000000000000000)) temp___expr_188)
                                     (fp.leq temp___expr_188 (fp #b0 #b01111111 #b00000000000000000000000)))))))

(define-fun dynamic_predicate ((temp___192 Float32)) Bool (and
                                                          (fp.leq (fp.neg (fp #b0 #b01111111 #b00000000000000000000000)) temp___192)
                                                          (fp.leq temp___192 (fp #b0 #b01111111 #b00000000000000000000000))))

;; Assume
  (assert (dynamic_invariant x true false true true))

;; Assume
  (assert
  (and (in_range2 x)
  (let ((temp___199 x))
  (and
  (fp.leq (fp.neg (fp #b0 #b01111111 #b00000000000000000000000)) temp___199)
  (fp.leq temp___199 (fp #b0 #b01111111 #b00000000000000000000000))))))

(define-fun temp___197 () Float32 x)

(assert
;; defqtvc
 ;; File "floatround.adb", line 7, characters 0-0
  (not
  (fp.leq (fp.neg (fp #b0 #b01111111 #b00000000000000000000000)) temp___197)))
(check-sat)

(exit)
